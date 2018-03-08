# Ranking Analysis

The Ranking Anaylsis highlights SIDs for displacement to provide an Overall Sort Ranking. The Ranking Anaylsis has been split into specific parameters to ensure that SIDs with high coverage and limited utilization will be highlighted for displacement.

The data is being ranked according to 7 parameters - Analytics, Basic Package, Coverage, Daily Usage, Excel, IB, Mail and Total Hits, and corresponding weighting filters can be used for prioritization. The rank for each parameter will be multiplied by the weightings applied and added together to create a Total Score. The Total Score is then sorted in ascending order to provide an Overall Sort Ranking for each SID.

### Ranking Analysis Summary
The “% of Users to Target for Displacement” filter is defaulted to 10%, this can be ammended to customer specification. This is used when determining the number of SIDs reported in the “Number of Displacement Candidates” element and the “Top 10 Cost Centers with Displacement Candidates”. The Top 25 Displacement Candidates are also shown. You can explore the data in more detail by clicking into a visualization.


<table width = "400">
<tr>
<th colspan="3"><font size="5">Ranking Sort Criteria</font></th>
</tr>
<tr>
<td style="width: 200px;"><h4>Analytics</h4></td>
<td>* Analytics Hits Ascending</td>
<td style="width: 300px;">This ensures that SIDs that have low counts of Analytics hits, will be ranked lower and therefore more likely a candidate for displacement.</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Basic Package</h4></td>
<td>* % Basic Package Descending</td>
<td style="width: 300px;">This would determine that a SID that has a high Basic Package % would have the lowest ranking and a higher displacement potential.</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Coverage</h4></td>
<td>* % Coverage Descending</td>
<td style="width: 300px;">Highlights SIDs with a high coverage for displacement, as coverage is an important measure in determining the credibility of the data.</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Daily Usage</h4></td>
<td> Days Used Ascending  <p>
 Total Hits Per Day Ascending </td>
<td style="width: 300px;">Allows SIDs with the same days’ used value but a difference in the hits per day, to have a different ranking. SIDs with fewer days used and less usage on those days are highlighted for displacement.</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Excel</h4></td>
<td>* Excel Hits Ascending</td>
<td style="width: 300px;">This would ensure that SIDs that have a low number of Excel hits, would be the lowest ranked SIDs and thus more likely a candidate for displacement.</td>
</tr>
<tr>
<td style="width: 200px;"><h4>IB</h4></td>
<td>* IB Hits Ascending</td>
<td style="width: 300px;">SIDs with low IB hits will be ranked lower and therefore highlighted for displacement.</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Mail</h4></td>
<td>* Mail Hits Ascending</td>
<td style="width: 300px;">Low figures for Mail sent and received will ensure SIDs will be more likely to be a candidate for displacement.</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Total Hits</h4></td>
<td>* Total Hits Excluding Excel and Quotelist Ascending</td>
<td style="width: 300px;">SIDs with overall low hits excluding Excel and Quotelist are highlighted for displacement as they will be ranked lower than those with a high number of hits.</td>
</tr>
</table>






<table width = "400">
<tr>
<th colspan="3"><font size="5">Weightings</font></th>
</tr>
<tr>
<th colspan="3">The weightings below are the default values that are recommended, however, you can customize the weightings being applied to your data set to make it more specific for your requirements. If there are any parameters that you wish not to be applied to determine the final Total Score you can set their weighting to 0.</th>
</tr>
<tr>
<td style="width: 200px;"><h4>Analytics</h4></td>
<td>1</td>
<td style="width: 300px;">Medium impact</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Basic Package</h4></td>
<td>1</td>
<td style="width: 300px;">Medium impact</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Coverage</h4></td>
<td>100</td>
<td style="width: 300px;">To maximize the impact of Coverage on Total Score</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Daily Usage</h4></td>
<td>0.5</td>
<td style="width: 300px;">Lowest impact on Total Score</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Excel</h4></td>
<td>1</td>
<td style="width: 300px;">Medium impact</td>
</tr>
<tr>
<td style="width: 200px;"><h4>IB</h4></td>
<td>2</td>
<td style="width: 300px;">Highest impact on Total Score</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Mail</h4></td>
<td>2</td>
<td style="width: 300px;">Highest impact on Total Score</td>
</tr>
<tr>
<td style="width: 200px;"><h4>Total Hits</h4></td>
<td>1</td>
<td style="width: 300px;">Medium impact</td>
</tr>
</table>


<i>*Note - Daily Usage has the lowest weighting as this includes all usage and does not specify the type of data being acccessed. A user may have low usage but using their terminal to access Bloomberg specific functions* </i>

*Note - IB and Mail have a higher impact on the Overall Total Score as these functions are using the sticky or value added Bloomberg functionality that will not necessarily be available through an alternative vendor.*

*Note - The Coverage Weighting filter is defaulted to 100 to provide a higher level of variance betweeen the different coverage figures, as the coverage score is being taken into account in the Overall Rank. We want to ensure that SIDs with a higher coverage are primarily highlighted for investigation as they will have the most reliable data. Failure to provide an acceptable level of variance in the coverage figures may cause the overall rank to become artificially skewed.*


*Note - Click on the Vela Logo to return to the Main Menu*
