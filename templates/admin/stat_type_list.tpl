{if $USER_CONFIG_APPLICATION_MODE=='FRAME'}{include file="header_no_menu.tpl"}{else if $USER_CONFIG_APPLICATION_MODE=='HTML'}{include file="header_w_menu.tpl"}{/if}

{literal}
    <script language="JavaScript" type="text/javascript">
        $(document).ready(function () {
            $('#btnAdd').bind('click', function () {
                addObject()
            });
            $('#btnExport').bind('click', function () {
                exportObject()
            });
            $('#btnSetupTableColumn').bind('click', function () {
                setupTableColumn()
            });

            autocomplete("#mu_name", {url: 'edit.php',
                on: 'building',
                method: 'fetch_municipality',
                pr_id: $('#pr_id').val(),
                limit: 20,
                minLength: 1
            });
            autocomplete("#fr_name", {url: 'edit.php',
                on: 'building',
                method: 'fetch_fraction',
                mu_id: $('#mu_id').val(),
                used_by: 'building',
                limit: 40,
                minLength: 1
            });
            autocomplete("#st_name", {url: 'edit.php',
                on: 'building',
                method: 'getStreetList',
                mu_id: $('#mu_id').val(),
                used_by: 'building',
                limit: 40,
                minLength: 1
            });
        });
    </script>
{/literal}

<form name="filterform" id="filterform" method="get" action="list.php">
    <input type="hidden" name="is_filter" id="is_filter" value="T" />
    <input type="hidden" name="on" id="on" value="{$object_name}">
    <input type="hidden" name="act" id="act" value="{$object_action}">
    <input type="hidden" name="pg" value="1">
    {foreach from=$vars key=key item=val}
        <input type="hidden" name="{$key}" id="{$key}" value="{$val}" />
    {/foreach}

    <div class="function_list">
        {if $USER_CAN_ADD_STAT_TYPE}
            <input type="button" name="btnAdd" id="btnAdd" value="{t}Nuovo{/t}" style="height:25px;width:70px;" />
        {/if}
    </div>
    {if $USER_CAN_MOD_SETUP_TABLE_COLUMN}
        {* non spostare *}
        <div class="function_list">
            <button name="btnSetupTableColumn" id="btnSetupTableColumn" type="button" style="height:25px;width:25px;padding:0px;" title="{t}Configura elenco{/t}">
                <span class="ui-icon ui-icon-gear"></span>
            </button>
        </div>
    {/if}

    <h3 id="page_title">{$page_title} - {t}Totale{/t}: {$tot_record}</h3>

    <fieldset class="filter">
        <legend>{t}Filtro{/t}</legend>
        <div class="filter_fields">

            <div>
                <span>{t}Categoria{/t}:</span>
                <select name="st_parent_id" style="width:180px;">
                    <option value="">{t}-- Selezionare --{/t}</option>
                    {html_options options=$flt.st_parent_id_values selected=$flt.st_parent_id}
                </select>

            </div>
            <div>
                <span>{t}Nome{/t}:</span>
                <input type="text" name="st_name" id="st_name" value="{$flt.st_name}" style="width:180px;">
            </div>
            <div>
                <input type="submit" name="btnFilter" id="btnFilter" value="{t}Filtra{/t}" onclick="applyFilter();" style="width:80px;" />
                <input type="button" name="btnCancel" id="btnCancel" value="{t}Annulla{/t}" onclick="cancelFilter();" style="width:80px;" />
            </div>
        </div>
    </fieldset>
</form>

<form name="tblform" id="tblform" method="get" action="list.php">
    <input type="hidden" name="on" id="on_table" value="{$object_name}">
    <input type="hidden" name="act" id="act_table" value="{$object_action}">
    {$html_table}
    {$html_table_legend}
    {$html_navigation}
</form>

{if $USER_CONFIG_APPLICATION_MODE=='FRAME'}{include file="footer_no_menu.tpl"}{else if $USER_CONFIG_APPLICATION_MODE=='HTML'}{include file="footer_w_menu.tpl"}{/if}