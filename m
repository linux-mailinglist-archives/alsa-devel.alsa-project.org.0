Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4CE635543
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 10:18:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0A571640;
	Wed, 23 Nov 2022 10:17:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0A571640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669195081;
	bh=gsVWwypga4XgaPTAdgWwFzHJHMJCalawFr1G1+NRVeg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVXoomJ10Q0uAJAvv0RoL8OpDMPqIw0vyrnjL7Cbmzgv6XWRAVoyz5lNbfuvk5B5i
	 xNBYEES0Uf8LBmpVjHuW7/7EmR6iIaPtiL6NICKrw7OEcuDo4FOr8ByjX2dGpUsUvo
	 +4tipdxVbgX6CLqqwgVGmxhKbkGEDvcLlB7dgHTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 744B0F80149;
	Wed, 23 Nov 2022 10:17:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD099F8025D; Wed, 23 Nov 2022 10:17:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AFA5F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 10:16:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AFA5F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="l+jTRFrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669195017; x=1700731017;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gsVWwypga4XgaPTAdgWwFzHJHMJCalawFr1G1+NRVeg=;
 b=l+jTRFrlLTyL/JHn4hLJGgT3zqNksYSMCTSBwqQlYfPKSlo1MSz4L/uE
 ThMq3+ZiIUQH+KwltblBIH7/bq0zzCq2Tj4+6HqOIGccuDa/Cce8t0sry
 dYiylDAX+nx2jCKXOcroNuo/FFCvpVf2JiBo+1yAPxSz3fF4d/A7EZAah
 aOQhLulp8Eyex2ZTXYgqJN7zBpo07axgtibcwy27ejQ1Qz3vB2VB1wPfq
 AytfyJ+t6s9wO3QpcnAKRGf7yUhpJG8Aei2rpVdXxUxWAOoioj9ao8Wg/
 ikXT5mYOvqp2x4AjU92YVqflOrfJQoBkOYNlP0bhwy5efpSJ8iHcaspW7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294410788"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="294410788"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 01:16:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641726326"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="641726326"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2022 01:16:51 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 01:16:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 23 Nov 2022 01:16:51 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 23 Nov 2022 01:16:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdYPTYizQe0GdUBwKZY19dUY3ndzjdPibSDcSznHi+Q70kpUZZh3JpP27uXnh/Sz+Nw0bF7DnvpR1ViKfsoglapAoSwxZCiUoiEcefT3DqzvNhb7ZeKh5yROVy4Dz1OqonGoHmYpXvPaBW05yx2AoNX/UWgAUgovbBJUkTz6Y49Dj+LFMN8dXODt3CVu/JnFi5dDwhhD/Z0EkhfRCm02Y9M2dGi/QWcCc0O7dDh+6I4hMXp82EyqsFjxm/WEiTii7LjTe1+r59Ua3g56s3jacdUwiuEO6enTJbLI1O9R3SYhs+gxH4e8MPF74O5f3UlTVLDBJDZ6+uuSzQFGVEcs7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWDOuxbi7+n/OvdmbtSnnmpB08EA6ep/FRyhke2THkI=;
 b=mvAjT4nbMkrBO0cyMapFX9oCsTYR/sRLdg1nq4OeLQ6/iSQd427A0ULyw0WwYUZFd4TDBjlJvTMXkiOLu7TizCV17psiwAm8L/yNNuR8W5z+CXMvHXD6s6iLpHxR58v1aBVBnk1ldqFNtl7NoKbibJLUla4oi2ERxvuxEf2+HKivi49hfxW3S7RdYMDKVA0ar7WNuXU2C/g1+QsXV8LURXxiHoMyJXqWGoB5ZCf1IS/KuQ4CiyjUU59sNNKEqsTHVXkNBXML0FS5LW1Aqxdl8YdTvTx1PUOZKox87KmS+F0H8B2ZOkT1x/Y8ZB9nM7LAa5dMtO3kZmC/4L8JnGtg/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB7129.namprd11.prod.outlook.com (2603:10b6:806:29d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Wed, 23 Nov
 2022 09:16:49 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7%5]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:16:49 +0000
Message-ID: <07fdc7fb-2a1a-ac70-e0c5-ba9b2fca6464@intel.com>
Date: Wed, 23 Nov 2022 10:16:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] ASoC: soc-pcm: Add NULL check in BE reparenting
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <1669098673-29703-1-git-send-email-quic_srivasam@quicinc.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <1669098673-29703-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA1PR11MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6e019c-84af-49a3-8698-08dacd3372a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3CSzEXnpC2dMcz3MPqrazW3Y7HIp2ix2+ESbLBDK8qdODLBclpJ7QO74+qehF2gi2CB+favDBwBOn//IiK1vNnBqobNtUOLBuaQLa4vlnxwo2WgGGGlQq7R6hPGJby6E+v4OoR+OmDIRxURuP6sWAhWii5VNwNLXwaUuNx9NzP6WPNYtaa9vHtUAQ22UWSn2g5d0U9Pdfszs2wfBQFwYbMs0SaY8ryGdmo7VplbYihCyT9n8bwpbA8kQ9fC/L2xf2QSWOnCpBClTpUmuML5mGw8ZY4StrGRCwvcQBZPf3uKQD74WqbCWamwThv/OLqzTnvHyQATBUBI2AHM9MmqptckhflqnClxJzfUZYi+l6A8q9l5qIaZZbUxvFLxsswkVB8je86R/GD66m0I6fYYQhIRkhByjqivhU6Hd9zNoRdrSFAX1WGkbTJm411rGFwoxgUs8nXc0/VmKcA/1umLolCh8JsWn3yNiGr7hdchMjHrHWYrtYpiryD2hdG4B41I1/+aUwwHYLhQHTlxD62pyFndZHMWmftHegEOnR1u9WVG+bjcrnvKWXmfPtHpb1O9zaIRi1/z5h8lkm3IawiTE85OtWfabatOvteI3P+8VeG0IitXAOgJAtpmkie/eSIrDth2NAjIdrrRjdfov6QkwtMrH+luakgpSGV3lIvJrtOceYodtlq+UCilfBFg/wCjCgKWRhCm8TauKJq7gpJDu4HlCutdWMFUzP2RoGbpEqio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199015)(66556008)(4001150100001)(8936002)(5660300002)(8676002)(7416002)(44832011)(4326008)(41300700001)(316002)(31686004)(6916009)(86362001)(478600001)(6506007)(6666004)(36756003)(2906002)(26005)(83380400001)(66946007)(66476007)(186003)(6486002)(2616005)(6512007)(31696002)(82960400001)(38100700002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFR1YmZvY0RXVkplK21hRkQrTjlSa09TZS9lejJzZmdYQUxPVDNORWNqR2Qr?=
 =?utf-8?B?QVB1OTVRM09iclJFaU5Pc0FzeXVnQ3RUWmozMTh2dC9Sd0tyN2lQQ3ZXRVd1?=
 =?utf-8?B?V0Rib1lxMXZPV0piNzhoN1RNMGs3cGFEZG9MMC9XZWJteXkxeWdkNFN6MFlJ?=
 =?utf-8?B?SFRyVkJraVk5OTBVUmY5MXN3Sm5rcHgyZWVKeEVkQTc4OEFtWWloYWpRYnp4?=
 =?utf-8?B?cHhWR1laN3FsZjNIbjlOTVQ5cFBjNUxiSHc4OGVSTnEvWi9pUzd3Zk1rUGxM?=
 =?utf-8?B?ZkNhZWxTVVp5dkQvRGhKbWFzZkppKytiQVNnblBHSVhyYS9jdXZ0Q1F5bXpB?=
 =?utf-8?B?YjV4Tm5BSUx5WDJGeld6MytjSTVaU2ZRa3lGbzJTQTFYQXFQUml3S0RLK3Yx?=
 =?utf-8?B?YUhaMXhEMVZyVzR3a3VyckZwME55R2JLNXdRQ1BLQzNBSmp0RzcySmtva0tQ?=
 =?utf-8?B?eGlIczZaTFFDL1A0VDNvSHJjeWd3NkorazZwVjBEazErYTU5ZzlpcGlOMjJx?=
 =?utf-8?B?TkpEYnN2dGlLaUhHWDNaZko4ajAzSFVsN29lQlIyclR6cVYxTzV3Q25adG9G?=
 =?utf-8?B?R0Fnak56OTF3WWRka2Nlc0pMRWpUUCtFV3F3cmJzSUVVOTU2MS8rNkhYN3Fa?=
 =?utf-8?B?T1BEa3g1MVZBaktmV3NNSS9wK01MU29yYXZCTGVYZmdaWHg3Y2Y0TFZ4Z3No?=
 =?utf-8?B?UDNPRGV3ZUhkSGx0RlNwbzB3anVWMW1kaTl5akthdkVlWG1iR3NuMmdtY3JB?=
 =?utf-8?B?NGdJeU9pY0hzMFZzaXVML3hEN1JTQXRYYk1Hd0p5Z1dCUUhMQnp2K2RHOHVG?=
 =?utf-8?B?Y0h1aUJ0Sk56NXNvUUVkOC9maDkwYiswZmc2Zm5QRkRMa1Y3MWtVUk5tSkZU?=
 =?utf-8?B?amhkTmNWWVJhUzNBQ2FEMUhaQmtNMmZIR1Vkd2JOQkRkZVVNZWRielZRdTA5?=
 =?utf-8?B?TWtkc1JDMmFFUGVLMzN6Vi83d2xSNEsyejArajh4a1Q0RDg2VlZ4Zk82SWtG?=
 =?utf-8?B?WG0xYnA5Vnp5aWZMdXdnVkxQSm9WRlZkaGREdDJ2S0FYUzdYa25xOGJzOGpi?=
 =?utf-8?B?Sm16U1B3bkxocVhWaWNaQXJQUDdINGpteHhjQUdmTDJGTURMalJLL0gzM1ZN?=
 =?utf-8?B?WXN5bS9lQk8vZEQrdG1vZG4rSCt6aVN5bUU3YXZITzNDR25xM24zN3NMTG9z?=
 =?utf-8?B?VDhDLy9OMUhsWXN2VUhEakdDcHRuZGFoSTNBY2tJYjRocS9VVE1JWE9pdUxa?=
 =?utf-8?B?aUJlT2lTQmNsMDVaSkRHNmV6dzE4V2VRWGJ5d05UWlhHZG5kd2lKMWFsVTAw?=
 =?utf-8?B?dktMRkIxL1RjUWlzdyt2Z2NGcTdJbDJrUVFvdE95K1VSbTJVdkQvU1Y4VSs5?=
 =?utf-8?B?cjNUTTArelNQZlpvaXJvVERmM0J4cklQWkRWZVg2TFNyMWgrV3hhU1ZnanBS?=
 =?utf-8?B?b0MvSlkvcFV4WGJieW5zd2MydGNuaXRXL2hCV1dRMjY3djF6ZFc1UWVDcjFx?=
 =?utf-8?B?djNuaHN0R05Pb253dm9EMVl5Q3BGSkFMUi84NlRKei9UZjFhcnBKUHpDdStI?=
 =?utf-8?B?cDV1YUsrWFlXRVNMVVQ0VjJnWWFiSGxqYkhTS1MrcWdhTWpZRTBSLzVld1dX?=
 =?utf-8?B?d0J3Rm93WE9TVXNhVUlzT1NWR2Jqb3JIOUhNazZIUS9IMFdPYkxCUFc4anJY?=
 =?utf-8?B?bUpodEdIaHUrd2V0N3JLNWVtTXFGZ2V1VFhobVJVbUdydTRMZEtDQ203UG5I?=
 =?utf-8?B?S3E2UFZxUnF5KzR3cDQzWXdPSFpGNHgzMzloZC9VRThiNlRJSTNLMEZZakRB?=
 =?utf-8?B?MWdEcTI5RGlqQjBMMmVzZ3c2MkZGNGFQN040SEovRGtBS1FzL3E0K2JiWTFE?=
 =?utf-8?B?Qk4vQWgvWW1RUmtMcG1YRThNU0ZoR05ZdjNUVmNwdXZFVEVsZUJGMHFUSHRy?=
 =?utf-8?B?UDQ0N2tvWkVmVUZnY3RNQklrSEczQXg4aGF5QVpoejRhd1hoNTYxQ3JISWpQ?=
 =?utf-8?B?NHJpQzgvZ2FUMFU5a1VNNzhjaURqTFROV05uVk40MnZsT2dQcWl4VVBkbGho?=
 =?utf-8?B?WDlJRFJPRTlxa05OR3dKNU5rcVQ4WmlORjF3Q1pkWDh3ejl5bGdGWTlFV2lP?=
 =?utf-8?B?RE1VOEhtbVcxR254d2ErNWdSVVUyekh0dUdlZ3dvTGFTd3pUcWpsQWExK1ZT?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6e019c-84af-49a3-8698-08dacd3372a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:16:49.0362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upa9BG+1tMKb7TTKNGZaD13uUTLcxiCtzb/+lp12IDcuVSlJ4ULODu2n71xqbyBIvi+Va3N2JUtrLCanFkP7ZU7cNIPKSScEStqiYdRWfUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7129
X-OriginatorOrg: intel.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

On 2022-11-22 7:31 AM, Srinivasa Rao Mandadapu wrote:
> Add NULL check in dpcm_be_reparent API, to handle
> kernel NULL pointer dereference error.
> The issue occurred in fuzzing test.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Changes Since V1:
>      -- Update commit title.
> 
>   sound/soc/soc-pcm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 493f003..a7810c7 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1247,6 +1247,8 @@ static void dpcm_be_reparent(struct snd_soc_pcm_runtime *fe,
>   		return;
>   
>   	be_substream = snd_soc_dpcm_get_substream(be, stream);
> +	if (!be_substream)
> +		return;
>   
>   	for_each_dpcm_fe(be, stream, dpcm) {
>   		if (dpcm->fe == fe)

The explanation provided is hardly satisfactory. The reason I asked, is 
that be_substream should never be null by the time we get to 
dpcm_be_reparent(). There is a number of invocations of 
snd_soc_dpcm_get_substream() within sound/soc/*.c and yet most of them 
are not checked - as they do not need to be.

I believe that the problem may lie elsewhere and this patch just covered 
things up.


Regards,
Czarek
