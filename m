Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B554E9821
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 15:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97F9017C8;
	Mon, 28 Mar 2022 15:27:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97F9017C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648474105;
	bh=kQQis/cNzz2+eQP7tpYN4WDexoD4KHVJHL4kT0Pjc+0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUq07J8rGLBGUKA/oH1MyZnb+bi7TcCE/Fq5ApCSNcUkROL+fs/Y3KSKI6F9AO0WT
	 MIt1duvT4LoecH+Ov9MqZZ995LcIXvzYHBYd/rtDAKgdsNuQN++KHYSn6J9ekXbfjV
	 +saPLhCGZlMtEM/I7c9NYKsOA4iYw6wOiQxFGFxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 108A9F800CB;
	Mon, 28 Mar 2022 15:27:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B0DFF8024C; Mon, 28 Mar 2022 15:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 613C1F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 15:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 613C1F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="M+VJnZqn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgOmeIxTg1/D13IXlChuvFdfBUGl8CT42qALnr2kRoy6orZnUX4aGOw9uyRXRUmMeKcLoYqxLbK/7rFjiWZ7hocVOrYgb4MffXplok2i7eeaXR2mYoO87y+r3H57/FJ4ZVxn8U3GCsFQU5FN/4UzUg0cKOoKO4jRGROAyj04PPYzcXg0c2L8nsDTJfkKEgzELJ5oJqtZ3SwV4xSmfMhutPpuNqlu1YsLqAM2167jnoXGm4wslGmKxojDRxAjONmH96EcXCcSw6LvhaJyGJclQ86Fi8m6JhA3mxNup+EIIrnywI1sNSXeA5O62YgG0ypgI2j62quvccpVcb+EJHWlIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQ0FnCujltdqFzfl281e7BFOLCOKwMTjpjUimjgNRi4=;
 b=jQuAlMAJfKbDERwUUaMBlZx/7CHuzu2DUnfkD2OFAeddQWxbTWLo23KNUzsPzDIMecJp8KaaRDTJNb+RdvpqkYGP8WSrUpvpPfGN+WBM5CeMzt2iWrjV6ivO5qSRH7Yt85iKzuwhj1uZMNAjJSshwSMj4rKuYHojcOK+vmedlC+Q/6nYZvBLJMK0XXY6bEz3Yw6yRB5wXYTVYGq+hMoojr5q2DGOW8ep3fmAJf/NrnaNbEi1NX7CCMT+INaxz6rOwyfOc34cCED0gClonhMISgmgmzlOZeIr6cn52k7fdO4VkRb/5XphQ7yVzJkZVXX99rZyZCtY0qUmA41bJdTwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQ0FnCujltdqFzfl281e7BFOLCOKwMTjpjUimjgNRi4=;
 b=M+VJnZqnuRiicMX+Vm0mOuinh3ZL/AqQbKeKqHF/ShbpK4sfYwBuKbnYXaJ9chTnMaLonMgS9MZdl8O3aB3+Um5U37kctD6nAV4HDTPNtmZDurghEm0UKpJ5W3DGFFQXhS3myJyH5pGYurdUUE1ooH6Kh9lSXYnjkf6DIDYc8Un6bXr6FuCHQuR2434HtqJ77A/T1KBb4RXpq/ZzkfuKMJ70iJHIGIV0nIBCwFlv7lyeI/NqNaO3LIAqtS3jIFLKBH9xB8d0ZtLeUiAESdX288zAc+JxDwT4l6DM8HXrpuz4+lAxed2P8q74a7Cq0+QrkfRvq6C1l17pb1HrZTfs2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY4PR12MB1576.namprd12.prod.outlook.com (2603:10b6:910:10::9)
 by BN6PR12MB1729.namprd12.prod.outlook.com (2603:10b6:404:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 13:27:06 +0000
Received: from CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::a185:161d:ce15:3e07]) by CY4PR12MB1576.namprd12.prod.outlook.com
 ([fe80::a185:161d:ce15:3e07%9]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 13:27:06 +0000
Message-ID: <82671dd1-d885-5f2d-9532-2e17528ea51e@nvidia.com>
Date: Mon, 28 Mar 2022 18:56:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v2 1/6] ASoC: dt-bindings: Convert rt5659 bindings to
 YAML schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <1648448050-15237-1-git-send-email-spujar@nvidia.com>
 <1648448050-15237-2-git-send-email-spujar@nvidia.com>
 <1648471865.814225.2153575.nullmailer@robh.at.kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1648471865.814225.2153575.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::24) To CY4PR12MB1576.namprd12.prod.outlook.com
 (2603:10b6:910:10::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ada4f1ed-75a2-44ef-85de-08da10bea6d4
X-MS-TrafficTypeDiagnostic: BN6PR12MB1729:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1729664A3A4F145B094714C3A71D9@BN6PR12MB1729.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +PeVyYAmk5wxECpZyImYh2Zz2WJhRYa8ygvylaYkdQAkOfwi/g0rUZqQFWROc9rqICMYzbRuFM1mjXz9DsoMm27WtBUIXQMPMoOWUPo2HZc2wrkTms82aT6HF572k4iZdz/coktZ24kKUm6lPGqoAFJRFAncUwi9oh2vyplNQK3yFXJR00VBirpmQHxLMlek3+MSogg1EGxNkYaDopj7NVe+8PHBRXhC/nTbXOeBqX/NtrvcQpyfsaDBludB0E3tbrTHixkFqqFS9tPqekinDh0mgnj8ljtPxQmdia0FodAhB0AyGxY3kNYPT4cZjRifYuv4EdWtAUDX0skA1W7ymwPemSinCDQNKpdzfJJ4kgY/Jqn8ARAacoC3oGk5wZ7zRcUv3Ueeixb/IcmgzJfIhp8Iy2ubPXbX2Ol/L/wucgkIqRB1eZ0smDkM7deSEs48WIrVZqjmpFQTj7MRmBHLAWhZP0hw4y2tFJijupbsGELnn0ptSvc0mJSFAN27dPTxTOkmNfqZhkyr+z1L7gTbERL4YZUzBGZ1PGOZNNMsqFLMnIRgWzAEk+Q6MENHbazMWZv0Wk7dOwKVmKND4FCjL6gNq8udUTJMB85o2eOGMdBgqMZoZEkxfTczre3H+DJWRK76nUame71rgDK7tWBnMFrrcChFP/OzIIF6vEVc9Vb0+3Ei2nY2qP5vqjzG8YCoDG31JowZS5PeMevFaYj6NJzvar7876XgXwph51/qL/yL7QKQQQ7OVhrhWqjjnT9jdSNAeW2cUlUgSGRdj3e1A8mDHZUnjXKCrIwgiBb4U/eI+O+U9RDnVlp1RRmqooHo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1576.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(508600001)(186003)(26005)(966005)(6486002)(36756003)(2616005)(6916009)(6506007)(31686004)(316002)(8676002)(53546011)(66556008)(66476007)(5660300002)(7416002)(4326008)(38100700002)(66946007)(2906002)(83380400001)(6512007)(86362001)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdVNW92UWgzditwOE5seE5KdXY1a2gyeFBYZWRyd1NoWHI3WjZUYlZvbity?=
 =?utf-8?B?emRRNEp6TEJpRzhoYVlXcEM2OFhrcUNDNUx0NmtqTGF1UzlRcVNVMEJ4VTVE?=
 =?utf-8?B?bS9KT01oNUpJdTlEQXZyem9tTlZ3TklLNjAvMnJ4VkxMVUViR1JJZmdWRGVV?=
 =?utf-8?B?TUVuL013SFIvM2tlT1hha1B5bDBONVl2RlJtYmlobUlVNVVzcXN5dzBrNEpN?=
 =?utf-8?B?VWRhWTBySlBTSkdnSENtY3g5Z2pRUURsVGYrdzVHYXZzdmxqa09HT1NXN0pL?=
 =?utf-8?B?YmtaZVJsVjYvOUNBaFdHUkNsQmF5T2hYSzRhemkyeU5RamVSRmc5Wlh6T2lu?=
 =?utf-8?B?UlQzcmEyWDJIT3Y2ajltU2lLZ1ovSWFXY1NEUjhLMlFrTk5Cbkl4TitScHhF?=
 =?utf-8?B?QkNrcktwSFlKS2pka3hsWjI1b0w5UFZSWXdSTEp5enlUV1lXN3pxbUdYRG5I?=
 =?utf-8?B?SXVRdjc3M1NaQTFmRTJoSE56UWFBZWVGSGFTKzd4WmEwdVE1WFlheHZ2UTVN?=
 =?utf-8?B?M3Z0ZVB6NDVLVkF4emVSY3Q0c2o2MHFYS1JJYWIxdzFzYk8xVGh5Y1B0bVNV?=
 =?utf-8?B?cmxpSnN0UytRQllPWDdZUzQzNGpla3RZWVc5MVZxZmVJdXgzWEJrbTFIcWVt?=
 =?utf-8?B?aW4xeGNFL0VxYzVCaTNoNUlGNkhVeXhRaWdaZ0pDNGQ2U2lCRTBFaUkxWE56?=
 =?utf-8?B?TzVWRG9oSnpJVS9ZejBoY0FuYXVSMklrMkg5alJxVEJpRG94MFBNSEkwZ0xB?=
 =?utf-8?B?V05ERkVZd0xkOWhPUmpyR00wdndjdW9rMlA1YmZVdEtjdWxSelZFRHhWbVdV?=
 =?utf-8?B?Qkx2UFNRWUVPNkhZVkZBQy9UczFPQkVhOGx4SE44N1FPQ2YzZ29iQ25lQnQy?=
 =?utf-8?B?OWZFNWlQM2pZY2R2NzBDcERjYXo5TUVmVHk1M2JONjFqS2ordHYrTGhoSzA5?=
 =?utf-8?B?MWp5V0pvZmRqdTM3azJmUEwvMFFXdGhkUkhMMllYTS95SSsvTnIrdGdzSWJh?=
 =?utf-8?B?SmdFUklzbk1iT1c2dEFwY0wzOTF2UWVhTXJTU0VoVXNhSHpycm1jWmgwZWJj?=
 =?utf-8?B?NWNocTFHRElFTjJYeEhjakliMWJ1N1VtT25NM2NsMHphZzZsTnprTVJEcWNG?=
 =?utf-8?B?UnBaWlRKKzJBS0M2WnBsSlVBTWVZTndmTHZpSHBrUmpRWjJXTW9OdTAzd0Ro?=
 =?utf-8?B?ZVdCcWxUQUdNMm5GQ0MyczEwR1d0b0hrZTFqU1owVFNyNDhFS2RwV1J2ZW5p?=
 =?utf-8?B?MGdiT0M2ZktycmNqY1JXMU5JenNRNGdwYzlTZ1B1Ym51TDJRdHcraWdkcktt?=
 =?utf-8?B?VU5saEhsKzVmSWRORzhrK2UxTXNpYWFtTTVvNVI5c0ttdDJXdlJiemJidFFK?=
 =?utf-8?B?Uno0RTA5bGdrcVpvSXBvTTBBdnpNYmtYUjdCRVpCZVJGR09USkI1RTlNTDZJ?=
 =?utf-8?B?dE82UXc3QVdCeU8rMWlPcEdOSmg2U1NUeVRRamtpcmJDVld1K3pXNXVGcEs5?=
 =?utf-8?B?SWZ6aS9kbFdYd1JNVnpmOEVBR0F2YVpqVEJvTlZlOXplNEVaTG1lSVEzK2Rn?=
 =?utf-8?B?VVc4R0R6eHJ2MkJQMnZIYkt2d2FpTU9XMEVEckNmaG0raU9vVXZnNlBOOTho?=
 =?utf-8?B?aTFhZkhUN2d4SGhpWDZhYm9ZbDhKNE01L1hLRmdUVGJVZzF1QWhjZjM3N3Q3?=
 =?utf-8?B?c0pJYnlFZU9XYllyNGZoUU1sMUxpaUQrOFNrYmNYMU9TVDB0blZUTVI5ZWJ3?=
 =?utf-8?B?RGRIUXZUdUZ4TVJ0dGU3VEE2Q2R3T0RoK3pZdUxrRlhidXJSa2x5K3M1VEtQ?=
 =?utf-8?B?R3RiMEZxclZRdzNUWjNnMzlRRlNuUSszMkRPNzdrT0FPQ0Zod0lyK1ljK05y?=
 =?utf-8?B?VnlkY3ZOWGxzWlVVMkpjVktWL1BteWdySlNHYlkvdzhtcjhaaE1rZFRCak5p?=
 =?utf-8?B?eTRWOE5sdjJIRkpHZG16WnVXZ0xyaTlyek9DUllWaEFNYytYV2VhSTJSSUow?=
 =?utf-8?B?Y05PYmNBUUZyOG95U3h4Skp5dEVtUmNHMWRSTmF5N0VRSEl6MzE2K2d3QzV5?=
 =?utf-8?B?ajh4S3hHbXVDTW1aV1lyajlOOEc1TGhQWWtyVllXUEdhOXp2RGRsS0lVQ09o?=
 =?utf-8?B?VjlEMk5DZERQV3J3NGczZCtaMjZSU2tPelVLVTc3a0xnay9PZHB1bXE5QjF5?=
 =?utf-8?B?cUZ1c2VoRE4wZ244YnpjT1VVampodldJTm1DRUdjRStyMno4RzBqMTl5UUVu?=
 =?utf-8?B?SUdBSFg0aDB5ZUVneXZISkJWbnJrQTh2b0d1NWR0bk9TT21iNlA5VUhVOWF3?=
 =?utf-8?B?QWFnS2UvUVVlYW9SbkRlbGtZTkxUK3dlUzQ0cndzVTl0Z2YwdjdFZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada4f1ed-75a2-44ef-85de-08da10bea6d4
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1576.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 13:27:05.9653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulq/qEWCvQ96aeA4jfc45apmY2OqDlKTF54g3gN8+VXO8PPWf28hdASe37w+2ldWUvW1OgIL+puVIbGnhqdbnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1729
Cc: oder_chiou@realtek.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 jonathanh@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, krzk+dt@kernel.org,
 peter.ujfalusi@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 28-03-2022 18:21, Rob Herring wrote:
> On Mon, 28 Mar 2022 11:44:05 +0530, Sameer Pujar wrote:
>> Convert rt5659.txt DT binding to YAML schema. This binding is applicable
>> to rt5658 and rt5659 audio CODECs.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> Cc: Oder Chiou <oder_chiou@realtek.com>
>> ---
>>   .../devicetree/bindings/sound/realtek,rt5659.yaml  | 112 +++++++++++++++++++++
>>   Documentation/devicetree/bindings/sound/rt5659.txt |  89 ----------------
>>   2 files changed, 112 insertions(+), 89 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5659.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/sound/rt5659.txt
>>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1610026
>
>
> audio-codec@1a: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>          arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dt.yaml

The port/ports binding is not added in 'patch v2 1/6'. I will fix this 
in next revision by squashing 'patch v2 1/6' and 'patch v2 2/6'. Thanks.

