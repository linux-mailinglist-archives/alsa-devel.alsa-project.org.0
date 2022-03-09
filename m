Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E664D3504
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:01:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50EBF16D4;
	Wed,  9 Mar 2022 18:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50EBF16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646845304;
	bh=QhMlGbkZ+Oyhx4nA92WTQVYnjniAhevSH6iqkCO555k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IBGS4SJX0rwDnYUOOjqUq/7XRH5pUGv6I3NtQ05tbsvFtLoOQv0/r5YrVrW9iqerb
	 /xwUG2OT1UDq+wbeM2VYPoRvsne6HFb4mKSwTRQyYnuEqM2C3rufsk+AB4YZ1l4fQ8
	 gaBP1QSkAhV5W/AanS2IuvZFoRwg1EkQUsksyRXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F5A7F80155;
	Wed,  9 Mar 2022 18:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56793F8016C; Wed,  9 Mar 2022 18:00:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 160F0F80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 160F0F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BD+9FKNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646845233; x=1678381233;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QhMlGbkZ+Oyhx4nA92WTQVYnjniAhevSH6iqkCO555k=;
 b=BD+9FKNR7M+SaxcE1cde4Q0+d5vzfaV0g1spGXFbENrhTE+9X0gvjF51
 SeMfC1BJHCANYHbf2QvGoyjn5EOUz7n73se3VRAFPwQ4P9VDvFnpR1reA
 PZOYSPCBeaeE8/mPRWJwqHFlWs89A7N+ZzsQ0TPIQaE6/UchyPu8jmDV5
 zEvxKfFDw6N9kH9IIA95MdglaZM+utOFfHKG8js+QZ1z1BZnnN+4iOgJV
 h6IROOBIXTo+MOtey5qvaOMZ8ugXognR35He62C0oUiGN8WVDXxi9kvOi
 prwLyAvV1onRCG/R5LhsNLnA95JdDViVQhcwXB04UCEWZMKszHkRh04J4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255216844"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="255216844"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 08:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="644096247"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2022 08:49:16 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 08:49:15 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 08:49:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 08:49:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 08:49:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0DMttEQU4Vax5Fo/kLnDyBtjzV3LDO1aNXoroAxMLcuXbsSGvP6XSFUDbY2cuktvvOVh968BJgftPzCTsB3CUJXgmKLzfU4+3/avcK4nDA4pWSvFufP1HUutUzFTnSnkJIbHKf5pYlR5PEkvi0o0XnFj1JgnQNEzAdaD3UPpJ6J6dM0muQu/JNxzfVagWRLMdb3u+Oj7LrEYlM8Z5IAVAldo1bGz4vpZdUEJXxreDl0cNE4rFc865ve5VSjEIdS7ztjwf4s5qDtzjNE7O+Jph6aAbui+ikQMI70lPOpFlkLNN6n33N/Zb/7VEEcimYmvMqDFJFC9yCtI1e6/axUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A392NbLhX5U4rxwRFyZe7sphhSc+x5uAc27lOZFxDHo=;
 b=BzYy5XoV/LPuuutVFDrIXHT3CGc57dh1LY6UXBYMyTefcO6awMFjbhOYQ3T3zT45dQSvUgKwV9vX4iObgMk8nsw1kGEukIEqeBqZJsz3IutEXWYYu2LQuOUlWi/K0v7rrseIL5S8kXwUEBhXQu6AG69vYxfUkItuQqAJCWayFv8LBGjhaCYX62+fpio6KLZjbSYId2LYGpeEM0RCfxuRP4E1C11+yifxax1ilmgk+dUlLnPiSb2RmPH+wx3YzqI5h/9f43Ez6x/T8pYAEBG2Lprm26FG0H3+zx8ePuWPV2HThRJwv6bMg9IsyqXOI9YLX4v7SJxrYotSeVvapKtl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MW3PR11MB4635.namprd11.prod.outlook.com
 (2603:10b6:303:2c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 16:49:13 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 16:49:13 +0000
Message-ID: <6626d04b-1ad3-457f-1f45-296cb79672fb@intel.com>
Date: Wed, 9 Mar 2022 17:49:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH 03/20] ASoC: SOF: Intel: hda: retrieve DMIC number for I2S
 boards
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
 <20220308192610.392950-4-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220308192610.392950-4-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::25) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 866cb5f1-1b6b-4926-a085-08da01ecbd7d
X-MS-TrafficTypeDiagnostic: MW3PR11MB4635:EE_
X-Microsoft-Antispam-PRVS: <MW3PR11MB46358BF868703DEC281292B0E30A9@MW3PR11MB4635.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSxhbQAcnekZAlGwS6SNFx0gL3VWEWLVH7kSfm2pFqwfzbEvv/BOe58nfMnq9fZ53PF2XKGR5SnFOH9cEJwbNZfFr6lvXcSoe3dwCV2ct3Xy3ZOoFsoGO484CBwggi9p+k/VRue88RGvP5cooum0s9axT3yyyfd2nN6MoE4tXBJsW0q+WtLOApKqSSu4lq9q4CM10GDq+zqp6CliAaWw3ahHIoQW1tPltWQeY82+cxFR9FAYz8pnkP44+L7B7zVRu0YFXDN/gY0B8WvnPOOE/CS25mGhQQ4MM7HssJYlcCGg9+PocyDO42eX9dnJCB4COw11z2uXdaYz9V20MBGSWNEtHyYI17gD3ITh5IQfjKd1A60eQW1FW0Vcs3DwSVITkHFyboEEDFA0USXZzbJUmkpPizJIbvRN0CZ/YdrArdqqf0VV2lhm68Z8twlQljKHrkJRuLpdU0B+Aj8g9NhHc+01cpwvPy+Hi+rO3fTqewYNhiUudyE3LknCgLkuLpVa5x02f9c9AFhPMFrTJ6se4SqiGyo5DJyAkiEDROSiLo/Y/6YNrg6O5aojzjdwqu7a9yJGgh/yUTBRsu9z3SOjS/IKLIxmNZZTDGc3PwzTAVcX6FXJno++rkyLyaWcQnH/mdzMBbSyAvjROlUUT1nFr48ATAfdK1RZCF7+At35cMHVkem9AREGqFVqGp4jtGyiRp6Y7xNN2FMZR6TKacajZg5Qwh5U21+vIFCk7z9Cdi4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(6506007)(6486002)(31696002)(44832011)(54906003)(53546011)(6512007)(86362001)(8936002)(2906002)(508600001)(83380400001)(66476007)(66556008)(8676002)(66946007)(5660300002)(4326008)(38100700002)(31686004)(6666004)(186003)(2616005)(316002)(26005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXljakNudkZ5d1ZENTFHcWdYSDROK2VkNkFtMDFNdi9qVFZmSVM3OFpXSXFJ?=
 =?utf-8?B?cTk3RWRKSHJtemNyRndlL1dBS1NRdGJScWIxVkZaYnVHR0pqQ1BSLy9Rdkdz?=
 =?utf-8?B?aHZiaEU2YXpUTWhHWStxYnBCV1RhWU5FR0kvWmhBUVBSY3lBMGhUWktFMENG?=
 =?utf-8?B?dmRubnp2L2hpTlVhMk5QWGczQ0xhV3FBN0xHb1FRR3NuZ3RGcGoyazZqR1NI?=
 =?utf-8?B?OG9NTVIvQnZ1OUxIVk0zMnAwUlNxSjlraWNNekFvbkpPNkxUNHhnSFAvc09C?=
 =?utf-8?B?azJUdTJoa0NPSVFRTXdrZWJNQ2pLTDliWWZCOXhUekJneDIyUlpNY1NTSmpS?=
 =?utf-8?B?VHpGa3I5NFdUd2d6aWcwdytJcEF6bElIT0xvNlF6N2tudVg4akZ4T1ZwVDU2?=
 =?utf-8?B?Z3IvaHcxN0x4bnZIZTU5enBEdEVRUmJwaEMvd2lwN2NZMVdIMklOak9KUXd2?=
 =?utf-8?B?Mk5vWDJua0IwcHNxdy9tdXNhaTV1MDl1TVRTTmRMcFR3ZHl6VXhGUVJyRkFH?=
 =?utf-8?B?MjIweVRVTy95TUYxcGx4THkzYXROald0a29hZ1pNUEw0WnFZdEE1Y3FhMjFl?=
 =?utf-8?B?N3JnTTh1MFZUeVJyZjN1N0h1dTBVS280dXpJVEFKbmdPUVBaaTIrM0JWdFcx?=
 =?utf-8?B?VHJiRy93UjdKZzVrbHFLM0NKL3NsazhTeFpLdWdpN2RIbXcra05CK1Bnc1Yv?=
 =?utf-8?B?M0ZkOXNOQk11S0NGTlNsS0l0dmJOZ2dnbXFjUHlMcjFNVTNzOFNUWVdRYzZ4?=
 =?utf-8?B?bVZ4WGNvcWNBaE1VTzdZOGZuZ3llVFlkLy9FT1ZQK3E4elNZV09CNjgvUlAw?=
 =?utf-8?B?RVpMVVZxM1UvU3VKVHJ6UjgyOVgwU2ZBaXpXcFJPajRHK09wcXg2K3pvWnBp?=
 =?utf-8?B?cnVLVk1aSWN0U0hKc3ZuWXI4RnRVb2pIcklwUUwxaUpKZTFFd1dlQzNTTXIz?=
 =?utf-8?B?S2tQamtwc3I5NVk5UXBUOHhPaXdmZkM5OTNDQUozU0o4aHB4ZG95U3dwV1Bl?=
 =?utf-8?B?TGx6VkFCU1JvZDhKVDFXK3IrR1lrRituc0d6T0lnN0ZsS2YzYVgvRHlpeXNP?=
 =?utf-8?B?aEwvTlpUME5kc1ZwTFhIUGYyajRhSFd1MDY4cWF0VmNveHlub21lVCtPdjZz?=
 =?utf-8?B?cGhLMUN3dFF3a2RVTmg2MVFTWGQvSG1KY0wrUWpnckhZaStwRFFZeGtOdGMw?=
 =?utf-8?B?N3ZuRnhmZGx2V1ArTlIrYy9idmZIWmJpdG9jenBNOFFnT1V3VmdNS3AxaTBT?=
 =?utf-8?B?RHFxUG13SXo4a2o4SUw0NFdBRWNyWm9QV1JyOTMwSmplVVRDWkJQd0NkdUlV?=
 =?utf-8?B?TTc1NTEwbUJnOGc0T1JrNlVhU1A2YkMrbDZFMmo2RGFDUktiQW1zUEllR0h6?=
 =?utf-8?B?ZmVvd20zY2ZIM2I1UndSN3RJTXlubXRTVUhndHJ2MW50K1pYcTZHMXoxVWZB?=
 =?utf-8?B?bmpybjB5bFFjOXE4NmQyV3NDZitSclhtZ1VJK0tXYWswSUhhdUptc3ZVd2gw?=
 =?utf-8?B?VjUzOVliQkR1Q0RTdzloUHkvNGhsaW5maGdpeFNQR1o4Ym4rWGU1OTROTC82?=
 =?utf-8?B?dDRxeGxTSGcrbEg2ZStITEMyWDlpY0RUeW9vd2JlMGdET1BXeDJUTzR0M1pl?=
 =?utf-8?B?SzVVMVBHenBsTCtYWG8xeWhyL2luLzI5dmpoekRxSG5BbkU5RXR2UmtGemZB?=
 =?utf-8?B?K21LcWE4M09JOWhpY09ZMG1kelZQTGtlSTZySVRZQURmMjQwWStZbkc5OEtv?=
 =?utf-8?B?ZEZkdk9vMTc0OVlkaVdsRnMxSS9yU0sxN3dheC9jaXRlSTFZR2w0STZCcTl2?=
 =?utf-8?B?WktpSlhidVUrOHB1WlllOXVOdUxDT3ZRZUlkYm9FWkg2WC9KYVNzY1RVV21u?=
 =?utf-8?B?VG9VZ0JnOFVwNGIzenl5aHJuWE5pYXd0NWVlUm1WUzFjSXFHMHMvT05admVL?=
 =?utf-8?B?dmdvYVV2WEdPbzdzUHpkZVpwb05xNEdkblZjOGQ3SnI1c25iRWdRc2ZGbWw3?=
 =?utf-8?B?QWcwWG9RYWFmMDQ0TDFhK2p3em8rVjhyd3o3MDFXdDM1VWlMSHo5R0ZjZUds?=
 =?utf-8?B?a1lWa3FwaEpkcDJ4ZWkzV3VWUmNFL20zQmU5UjFmcys1bmJkbDk0TVhSZk4w?=
 =?utf-8?B?dndrWmV2c3FFVE16OXJha2gzMVRBdVNkQ2FtTExQZW5JTFlEaWUzWDNhN25t?=
 =?utf-8?B?bjBmbzc2aVVUbEIrbDdQK2RIM1ZlYWROK1RwdnR6bE0vd0pZcmt0cjJieEpL?=
 =?utf-8?Q?fU5hMwXfGagFewbNrMSWlCEdSVqBGCnIsq5X2+FRjs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 866cb5f1-1b6b-4926-a085-08da01ecbd7d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:49:13.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGUDGFl3LJ71OQJaa/XJSyeOMP6j+av69WVuONCZsiaJ58TxMiAMoMpcdwRXNa5YpiCaZgZSBKy1u3iWmL26d3ToEnSaVXvsLwL9kuMiKFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4635
X-OriginatorOrg: intel.com
Cc: Huajun Li <huajun.li@intel.com>, tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-03-08 8:25 PM, Pierre-Louis Bossart wrote:
> We currently extract the DMIC number only for HDaudio or SoundWire
> platforms. For I2S/TDM platforms, this wasn't necessary until now, but
> with devices with ES8336 we need to find a solution to detect dmics
> more reliably than with a DMI quirk.

...

> @@ -644,24 +642,35 @@ static int hda_init(struct snd_sof_dev *sdev)
>   	return ret;
>   }
>   
> -#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
> -
> -static int check_nhlt_dmic(struct snd_sof_dev *sdev)
> +static int check_dmic_num(struct snd_sof_dev *sdev)
>   {
>   	struct nhlt_acpi_table *nhlt;
> -	int dmic_num;
> +	int dmic_num = 0;


s/int/u32? (paired with question below)

>   
>   	nhlt = intel_nhlt_init(sdev->dev);
>   	if (nhlt) {
>   		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
>   		intel_nhlt_free(nhlt);
> -		if (dmic_num >= 1 && dmic_num <= 4)
> -			return dmic_num;
>   	}
>   
> -	return 0;
> +	/* allow for module parameter override */
> +	if (dmic_num_override != -1) {
> +		dev_dbg(sdev->dev,
> +			"overriding DMICs detected in NHLT tables %d by kernel param %d\n",
> +			dmic_num, dmic_num_override);
> +		dmic_num = dmic_num_override;
> +	}
> +
> +	if (dmic_num < 0 || dmic_num > 4) {

How come dmic_num be negative?

> +		dev_dbg(sdev->dev, "invalid dmic_number %d\n", dmic_num);
> +		dmic_num = 0;
> +	}
> +
> +	return dmic_num;
>   }
