{**
 * plugins/generic/citationStyleLanguage/templates/citation-styles/ris.tpl
 *
 * Copyright (c) 2017-2020 Simon Fraser University
 * Copyright (c) 2017-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Citation output for the .ris downloadable format
 *
 * @uses $citationData stdClass Compiled citation data
 * @uses $citationStyle string Name of the citation style being compiled.
 *}
{assign var="containerTitle" value="container-title"}
{assign var="collectionTitle" value="collection-title"}
{assign var="collectionEditor" value="collection-editor"}
{assign var="publisherPlace" value="publisher-place"}
TY  - {$citationData->risType}
{foreach from=$citationData->author item="author"}
AU  - {$author->family}, {$author->given}
{/foreach}
{foreach from=$citationData->$collectionEditor item="editor"}
A2  - {$editor->family}, {$editor->given}
{/foreach}
{foreach from=$citationData->translator item="translator"}
A4  - {$translator->family}, {$translator->given}
{/foreach}
{foreach from=$citationData->editor item="editor"}
ED  - {$editor->family}, {$editor->given}
{/foreach}
TI  - {$citationData->title}
{if $citationData->$containerTitle}
T2  - {trim( $citationData->$containerTitle ) }
{/if}
{if $citationData->$collectionTitle}
T3  - {trim( $citationData->$collectionTitle ) }
{/if}
{if $citationData->volume}
M1  - {$citationData->volume}
{/if}
PP  - {$citationData->$publisherPlace}
PB  - {$citationData->publisher}
PY  - {$citationData->issued->raw|date_format:"%Y"}
{foreach from=$citationData->languages item="language"}
LA  - {$language}
{/foreach}
{foreach from=$citationData->serialNumber item="serialNumber"}
SN  - {$serialNumber}
{/foreach}
{foreach from=$citationData->keywords item="keyword"}
KW  - {$keyword}
{/foreach}
DO  - {$citationData->DOI}
{if $citationData->DOI}
UR  - https://doi.org/{$citationData->DOI}
{else}
UR  - {$citationData->URL}
{/if}
ER  -
