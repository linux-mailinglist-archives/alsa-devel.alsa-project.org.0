Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762F615BC9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 06:26:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242E51685;
	Wed,  2 Nov 2022 06:25:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242E51685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667366787;
	bh=Y+XBPv3JikTQNXXgi8BlREDevYkdrTErwU/UVk0bMg0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6iSVZQfwveQBtKXHKQBA+h3i03aCw+Fn2RNaTMyh1TRk9yV/ZlpxbVyC6ep5xqaL
	 W9NVCgkehDFngGUy1sDaa1Zc5dU2cNk1aCQGcgJN48q9ujueB2DCWJ4dB4GNNMlpKD
	 VTASesy5K+hh6ObKMJn0oqZ01HabG0T7hkT/2pQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F00F80423;
	Wed,  2 Nov 2022 06:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B59E3F8026D; Wed,  2 Nov 2022 06:25:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2044.outbound.protection.outlook.com [40.107.212.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 135ABF801D5
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 06:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 135ABF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="V8d2XWh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3aCVLHhhJONy6W8/AHBd81nfU/obHbbhymJT2u6clKSEsXwuxltZLm2+c0uUZC4+X5W8ox8+681RsDzHKVxcdVJL2SCA8WuU/cg5yn1HiglVmMOLzh5JTaPH8xwMGNS9PU+nEFF7VZ9v2RRshDySJ+iboCg9hMTeuF4TrxyiukWK6TMADirtD8MWuiJ7zit+Q6JJFAQOlvee2v7Pk6EN2S9OmVtGFUEEX522aCxKU1iWrYbY1scRFtreTubmPZFzKXNaN+jVT1jtUyzV4MnqWzAj0Xx2DjgEtlEUpO+aUpY5YDx9Vl9fV4GkLFe7KSJcbo5/QVZMsi9sWRVU2/tvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToE1UVj5o2xN7A2GxyE+P8TSZnxYMlLPhXoQBlUVRII=;
 b=lbo5UR5vEnWOBJtkefA02f+MLSDb5wcNVltmDc/oltdnS5ZyuIUDA5XADokMRrG9l8NDev6J5YcM5IovoAR+vFPKAsNIAtRLP92GhVV+Vy1y+D8Udh2hCay7Wmf0eMhxtt4iE3FcqTyIeXAGlNwZTnOs0L4z8VftlyktS3iEuxOHq4S/JK6im/nrabOKN3KxihWGkUmBac0yrVLzcGkNYiPz3+zRK7yxblh4Dnr/noSzNifW7i4gUCpedzU6792ds9CZ/p+pMChBdjnAWlPKSRVEihfnQIQxqanLSoSHn82+KzsSYH6VoAkjF7h6kzVU24jupLUXnfGjYrKQQ/f+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToE1UVj5o2xN7A2GxyE+P8TSZnxYMlLPhXoQBlUVRII=;
 b=V8d2XWh/FGXJCNh4P3/lYrewVH51XAYWUC7AjFOfGJopVdneQFewsMMrjYvIja/hE3pNNARnemvJC2xBXwhecG9Nfu8cmoHHqqbd/CEIGAFxpfeQhK/G9KJCq6/JWJLs1cW7P3dLu/4amvG0MK9oIBCTaJKNTRcmaHWmZhMkv0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM4PR12MB5389.namprd12.prod.outlook.com (2603:10b6:5:39e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 05:25:18 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::8e3d:119c:e824:2fcc]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::8e3d:119c:e824:2fcc%9]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 05:25:17 +0000
Message-ID: <ca006546-9b0c-34df-2a33-a4f10b68f815@amd.com>
Date: Wed, 2 Nov 2022 10:59:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] CHROMIUM: ASoC: amd: acp: Add tdm support for codecs in
 machine driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221028103443.30375-1-venkataprasad.potturu@amd.corp-partner.google.com>
 <Y1u1vj0K3m33wCTd@sirena.org.uk>
 <b384e012-31c5-8412-8b05-cd026c5d6a0f@amd.com>
 <Y2EttkwUvMReQcqg@sirena.org.uk>
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <Y2EttkwUvMReQcqg@sirena.org.uk>
X-ClientProxiedBy: PN3PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::15) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|DM4PR12MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e9f28d-5e0a-491b-3ae1-08dabc92a08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VZoJOQiAHcIoFyycwvqoPbv4B6O3YR2msqJaebJAWLS1s2mqgW43tByotbP7FELNzCstBHJSeNhy1MjgnR3H8l9gkPnI+lGVwdCFJLZHoUM99FaiZBa2Ea6qpLs1sdS8OGWiFHZgkADhgMipeE2svPl1dj8DhYzPt0ThjnAWf6+HMNd2VaXbHySeAaLwWkhsoR8nr/iXWm4ry4dkhaC4WNUdT3OHXR02UGiLBnSvht2flP7IbskBc2IjjoQSh9haicyBaGuYIyddIYkdlfS7ARt2NKhMZUD7OPeBOlxapBP4qc7FVKIIr9g1zHX4gFvEJTtSX01ZT5lTuRXXpK4nxzZzAn1nn4jpmADf1WPCb2vrIJm4lPqAoaxNf2wh4nsm3xQAlprDyT/LfQBzjj7E6kC3LZMnnYlR5+Ie0feipGT7+SNoswVU5CCNpPNkRXtI1y969aUutrrZrr+6KkyIl2VId/XYUQNaai39Fc01MSQyfnnOF98ozs9fj5XloSTOn0RN3FHgqMgeAmiDrRse/v426eLB0WNBtQ1BmkUYHQwSIflsGNof+W0NzBRYTjUt03unDJH1wRlIrhCcywcdMasE5EcbdtaAdy4b+4UmphBeK8vWTxxNHrlFLoNIwCC+qTuAlz+anpesQSN/zT21IqqRyP4A2mInyBTDe0FMxkhRJTcjf3+WEpIx0YAwGfJ3IXvQNFePQlhRxHdQ+fQIOv6ZLwPKDMtLMFPlVN3HWdn+UPBUdTBdu9z6Sv2rqnG9JuqswKNGOpB3VxtB8lUuXQ7RCJzF4ZWnPHqRo6BOJWs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5951.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199015)(8676002)(41300700001)(66946007)(66476007)(4326008)(66556008)(2906002)(6916009)(54906003)(6486002)(316002)(478600001)(5660300002)(8936002)(86362001)(31696002)(6506007)(33964004)(38100700002)(53546011)(6666004)(6512007)(26005)(2616005)(186003)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mnc3Z0tkYTRHTkY5NWpuWVl4VllwNVZBZEFwSXhxbUZ3Sm5xZEI4dW9ZRGJa?=
 =?utf-8?B?R0JHM0EvdnI3Rjl6S0pEeG1nNjRGMzlSU2lxcGY0dWp1UkdjZEROZ3A2SnBU?=
 =?utf-8?B?WElLRmtIQ1dLYU5LNU5DN0ZtWGpoNTJkaGVSWmFDb3BGbjVlVFlnT1YrZkM4?=
 =?utf-8?B?QTQ1NkNhK1lWTTZidWNDaWFEL2F4S0lZVmhtN29KNVd6dThCc1A3aFFaN2dJ?=
 =?utf-8?B?TjNqTS94RnRJcUlKSUxaVlpDMFRiTkVxQlVsQWRBa3VKV3cyMUlsMjZKNXkx?=
 =?utf-8?B?VE42dE8veDU0ditNUnpCTk1DTm03OFk4RzJYdXVZREhpWnlOWmYxcytlWVZ3?=
 =?utf-8?B?dWdiSlJVM0NzM3dISit6SmpDUGNPdEhpdUVKRStlY2IvZzFkQXFxNy9VbzBG?=
 =?utf-8?B?ZWtpNTFxRURjN2tsSHdXbHVxT1cxT3AwbU9WcmtKREhmTTd2bjZYenhJWHNQ?=
 =?utf-8?B?Z01HSlRjZFRVaWRxQ1BqR2VKNEVYL3YxTFhvcUR0cWN3YmtIMXZPYUZ4OW5F?=
 =?utf-8?B?QkNFckgzVDVaT0VrMHNoU3d3ZWl0UXUzb1QwaExrQmQ2RWlYMURHRkJSWHAw?=
 =?utf-8?B?Y250TEV3dUo2TkFiUjB3b0pDcGxZQk9aYUd3Z0ZISkE5NDZYZ0MrRklSQ0pv?=
 =?utf-8?B?aEVUaGZOdGtBNEdML0xLVWJRcG1GZnhFeXdpWUNKTUpUMHpMeWRpM3hSL3lP?=
 =?utf-8?B?OFpuZ0RIRVhrOVh3UDNBcGZiSTljS2RHRHZzWU9KS3lBRThJV3R2M3hYejRv?=
 =?utf-8?B?azI5Y1RLczlkN2NvN2piVDdmMVdRc2cvQ3V1S01GbUFYNWp5cWF5K2o2OTVF?=
 =?utf-8?B?bDZrUzRoVm9WT0RUbnRVM2NtVGJWUDRSRU9sc0ZBeGhpbjFrTUlHTTU5VTdD?=
 =?utf-8?B?Nm1NZThsMHdTRzF4V3JlS2pocEpUbmNSSVh1TFp5ejlpWllJM1FjZGFuZTZm?=
 =?utf-8?B?UStqKzRyUlcwb3hsZlpKYlBkTGhIcnNPZ2dpOCtSZHBkbEltYmhRNUlTYWll?=
 =?utf-8?B?SG1RQ0RvQzNkSS8zMEIrYUFoU1d1d3VqTW5CdjY0ZVZLT0NaV2hoV3oxdEJn?=
 =?utf-8?B?NHlVSnZYSllJZGN0T1FjeStxQytudTNHZG5rUy9MNEZNZ09sWlR2SGsrK0Fo?=
 =?utf-8?B?SEp3OFcwTVA1ZFk0RXdmcFZIZXFzN1NzVjVtQ2s5Q1FPS3l5VW9UeWo3WDZX?=
 =?utf-8?B?cURVTmh1aFpabWYvaE9Za0k2bWRBUFpKVEh1NndERlBRcFVQU201ejZKWFkw?=
 =?utf-8?B?TVI0eC9Ub05iSENENkRyZkt0SWZuaXU2M1pNU0EvQjlIbzRmTlV2RG9ITTdX?=
 =?utf-8?B?VHVwd2FySzVtVHlTVlZxUXhhZUFoZkJGSWNLUlJIS3l2bGozTEtta0x0RTVP?=
 =?utf-8?B?ZUhSY3A1b1dWRU1RQ0tNTXkvbGxLSHEvYTJ6NGNUaThOY0RLUkowa2VkV1gz?=
 =?utf-8?B?NlZPamlpa1BYTm1KK25PYmsvazBhUVlqNmN6cE9IaVRYM0c4b2srTi93TzBx?=
 =?utf-8?B?OFRMdEYzODRkNDUyZnhVOFlvRnNzRHlScEpNbFRGL2lGT0tSKzQrWEZkS1My?=
 =?utf-8?B?L3pzdjBXakw2bVlIaVRJNlJQVklLak95d3BYWTl6NWhmZlZJZGdpOFJhYVJt?=
 =?utf-8?B?MjhjRWN2YkxXa3ZIcnVVYXlJUUZBRXBWZ00rQnJud1hueGIrUXpFaHZnRzZa?=
 =?utf-8?B?UE9wZm1VamxRYlJXaDMzTldDMW9ySlp6ZlBJNTZLc3BDa1UyT0syeUFmUkwy?=
 =?utf-8?B?Q2pLVWdqUDZKbklMV1dsaW16c1piNFI1cW9WL2l0M21vUkw3eXQyNmY2YkhC?=
 =?utf-8?B?R2xTdFFzWmo3djUyeDU3UUd0ZWZ6aXlWR2l3YjJFNERLcHIxNTNDWG9kbmNL?=
 =?utf-8?B?QVd1UDVQejdwdVUvYTk1dmZBQkEyZnhWTjlvUmp0MXoxa3RORkhGcE9HV3Nw?=
 =?utf-8?B?S0RDRmMyYW9qU0lobjZ6SGU0SFRtb1NZVUE2QjgxVHArd2w2NnFBV2E3RmF2?=
 =?utf-8?B?V1ZqdFdpSENpYmZTYkJWbC9vYk5xZ2lMOVNHdCtNVUd6ZjlmclJQakEwQXZp?=
 =?utf-8?B?RkVza3diNnRPM0lpVW02L2RpbnRybUZrQ2dkenNpSE8xOWZIMlFlK2lIaG5w?=
 =?utf-8?Q?pAQ4XADr+uJ3RiBo3vw81DL7X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e9f28d-5e0a-491b-3ae1-08dabc92a08a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 05:25:17.8038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Gsy6hdRhVpL9vsqGEXasOYHh4MunSkFFp6HQCBFd6+RSBiPe8qYf0Mi7myeYf0c/HtNQl2CRngScBr/QiBBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5389
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.corp-partner.google.com>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

Thanks,

On 11/1/22 20:01, Mark Brown wrote:
>
> On Tue, Nov 01, 2022 at 03:15:08PM +0530, Venkata Prasad Potturu wrote:
>
>> On 10/28/22 16:28, Mark Brown wrote:
>>>> +static int tdm_mode = 0;
>>>> +module_param_named(tdm_mode, tdm_mode, int, 0444);
>>>> +MODULE_PARM_DESC(tdm_mode, "Set 1 for tdm mode, set 0 for i2s mode");
>>> Why is this a module parameter - how would a user decide to set this?
>>> Is it something that someone might want to change at runtime?
>> While inserting this module we need to pass tdm_mode variable as 0 or 1 like
>> below.
>> sudo insmod/lib/modules/$(uname
>> -r)/kernel/sound/soc/amd/acp/snd-acp-mach.ko *tdm_mode=1*
> Right, that's what the code does but why is this something that should
> be controlled in this fashion?

This machine driver is common for TDM mode and I2S mode, user can select 
TDM mode or I2S mode.

Based on tdm_mode parameter we are configuring tdm/i2s format and tdm 
slot configuration like below.

     if (tdm_mode)
         fmt = SND_SOC_DAIFMT_DSP_A;
     else
         fmt = SND_SOC_DAIFMT_I2S;

     ret = snd_soc_dai_set_fmt(cpu_dai, fmt | SND_SOC_DAIFMT_NB_NF
                    | SND_SOC_DAIFMT_CBP_CFP);

     if (tdm_mode) {
         /**
          * As codec supports slot 4 and slot 5 for playback
          * and slot 6 and slot 7 for capture.
          */
         ret = snd_soc_dai_set_tdm_slot(cpu_dai, SLOT4 | SLOT5, SLOT6 | 
SLOT7,
                            TDM_CHANNELS, BIT_WIDTH);
         if (ret && ret != -ENOTSUPP) {
             dev_err(rtd->dev, "set TDM slot err: %d\n", ret);
             return ret;
         }
     }

    if (tdm_mode) {
         /**
          * As codec supports slot 4 and slot 5 for playback and slot 6 
for capture.
          */
         ret = snd_soc_dai_set_tdm_slot(codec_dai, SLOT6, SLOT4 | SLOT5,
                            TDM_CHANNELS, BIT_WIDTH);
         if (ret < 0) {
             dev_warn(rtd->dev, "set TDM slot err:%d\n", ret);
             return ret;
         }
     }
