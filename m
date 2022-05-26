Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 108D253507A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 16:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2BC16D3;
	Thu, 26 May 2022 16:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2BC16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653574742;
	bh=6wEOSYA0aPkzmXv9IB+tn6pzwRqizri52AZ0MraPKMs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tIVw87tnPis3IJyq8hMswLZGwl44c33gpHKTrm6GiX2W6YHu5mjnqUdipdx7RIEjK
	 JZQ9nRKiQs6VzUZuzzG4ZgijSPXenpy3pNnc0U3uJw6l2zXjS3oEwGmK4uUBnRlfFG
	 BgC/mBgt2g2msA4dK0jBIdoEnhZw2aHZVEfET6lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD09F80171;
	Thu, 26 May 2022 16:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84E83F800D0; Thu, 26 May 2022 16:18:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 644E3F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 16:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 644E3F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fDk85h6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653574681; x=1685110681;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6wEOSYA0aPkzmXv9IB+tn6pzwRqizri52AZ0MraPKMs=;
 b=fDk85h6PO5fw7RIT5K2eeu8a4nVgMAcyN6PouOnk+KXtpVb3pq/9Kdkv
 aOS7rjoht5Yoc+iaj+8UxSHS6j9YgPxbBQgq0xqc4qhzevz+MjyV3utS/
 h1PYT8U31wqz/8xH5oSSKC7LyWHWwTiaSkhQs7w1/rGCGsY8tWOgu5i8U
 U2q/ip0lMXPpA/AzoVkDUI23bFGpOtirn8iUqmfiXIYxeXD+QeF5cG/4x
 InImehT71NlQ2Ii6uNe4mfn0OzNTHVgP1FTFLvDGJvS2V66ZSO3iona+j
 BHvFHTIZOlycp7VY7NKBn0wwvABpClDNMC0s9JJA4+UjsNK/cGFbk04X8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="273894425"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="273894425"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 07:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="630933471"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 26 May 2022 07:17:57 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 26 May 2022 07:17:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 26 May 2022 07:17:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 26 May 2022 07:17:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 26 May 2022 07:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CseyIHf1SvVlwFM1zmoxLAKmMVsMnqAhgfoQbRHm/QMBRUsZvVlX6wEwsDNu8Ex6g0l956awH9+6ICC/jshM7pYdUa2KLsWgeA+1Elsd6XcxR5p+Po3eRxCQMZIXxHtW8V+ZYLuhYoD80BLbFLDQ7SqoMbag0Mh4fiipcvFSoreoqpXBDwIlhjftD4oIgUhwFfZ01lADp4k24ize1t8Ib24/9hS1efHzD3+vpYEFxsi5WdA7OT8GdQRPf7F5Uf70AmKCNxaPE/QkG6o40IMN64rB5h8l27VTpcRLVuOW61voB0tO5k/C2kn14Am+WLx9lMjMYlQ2SjLJ07PEXPfQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xY3q2Ow028lVCDiTrcfTPM5mPbjihl+KlhyQG2wsWGM=;
 b=gcPwBYGI4J4n9VpfHAXXQO0Jlrwsxa/ttUrp7oUaWYweAIVc86bqXNl/1OA01bWfDlRqA6yFFiLHXZ/tbSIr1rPFEqL82sTXAczBh0L2F+6fyRJDxl0iGJ/L3k0UZb6ygAzqy7YB0rXqwqd8X9tBgvE+hOjTAunM5kEPUQUCQ5l1DhSEU+Vf1zswi6QM2hLA+vCYnfnxy+0RaYhMy7uxRtcjCctYJQvttA/5gfxj0Ok5SEvJMofO1J8BOEd+WP1NC4eYVkB4ZmJz6w7NbTYJFhrr9JRKHf9TWQExpHJ+my+VvA3vhMbFhBxauZAP2T1D2ovPbf8FPpzlgZKtBETfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 14:17:54 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 14:17:54 +0000
Message-ID: <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
Date: Thu, 26 May 2022 16:17:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: About Cleanup ASoC
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0155.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::22) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b9b6977-6e47-49bb-b7bb-08da3f228636
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6225:EE_
X-Microsoft-Antispam-PRVS: <SJ1PR11MB62252ACA7B375B6D85638827E3D99@SJ1PR11MB6225.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKG+gGG9PPeLxLfLLsFPgPqO558WaVXYCZJt4hnPWqlNXaL+GDiTJ0A+id5AD6A0cevXELCTDfY6wZuqH0XZAAU8d4qrnQ6mwSlfK+JB+DhmzwO9u2FonUSdxmY9eCnOaoOxDMwOJ3SbOMQlG7zibcsUmBLUTxWF/02lMEanUk1qnsuNIIaSEE7e34KawowoR7F7RFw1ghdU0sO8+ff9KpEkPfjwJsAxSxDOJ6ZHBForaTToxshZBX02f3SenzlqB+iVdr+NzcH6sOGRyiGzNMraFH4FJiu7skvgMVUeLvPtNR39/BxObiD2QDeEA105nYwZW/6pMfSvObhGeT6H3dedhuocr/lMD3PKJj7RqjJQvUNBo1EfI6/qEdxYyS2W85KUP7HYkT7BHI8f8BbC8SvsHDXW+2Raorc2UJPKvzZgVtIhcuvVHIdRQKq1QljJjVWWj5mvy5hlSW4C3bHJv1WY0T7GwmfFSjLOxDaRW6CiexV563LKpvnWTjlEugp0k+pBgWHPh4PB03AlEBxAnXMcnWw6A+5d8MY6j5zWw6FlD/qTptpRyhLEbn5di6VhTHZTeZJg9vAu7ALOv7oOMJpz8EYSRY6Sw4NZ+o2bKWTaKljKwu1v1xZ17n49dDwb04bknD8JHV7zsfzk9Zb8aNHod7QYLLN5UjfdCjhL/p/kGcR9r/5B1TieWUnIgKK9oE1rZg8ZZvH6oXKyogl9KodEvWmtpcRr03ud9GmRkYXxYqCDzlQusHXiURPeBYtc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(6512007)(6506007)(186003)(5660300002)(53546011)(31686004)(2616005)(3480700007)(6666004)(316002)(44832011)(36756003)(2906002)(83380400001)(38100700002)(4326008)(82960400001)(86362001)(7116003)(54906003)(6916009)(8936002)(508600001)(6486002)(66556008)(66476007)(66946007)(31696002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEFxdm1wVk1ZSWkyMDRyOEx6djRYSlVEM3BBMUxmbFJFTlNnNURJdXMvOC9x?=
 =?utf-8?B?MG04OFdGaVVmZnZ4d3A0cnlkc2N4aDN6L0l6RjVhSUxLVXh0dEZpKzJrMkdK?=
 =?utf-8?B?SjVpRWRYWnpxNlEyUjQ5QmxvWTg3cjBMYUxrQjZobFpJcysraWdxK0RtbWRX?=
 =?utf-8?B?cnFmN0JKNGl1MEcvZ2o1QUFCNXcwSW54czE0YTFrMnFhaURzM2ZCeUpkNFpF?=
 =?utf-8?B?aXl4emJFNHd5VHpTNTE0c0hzRlJMbzdTL21rOHJ1clVTajlERERxYTFFbXl1?=
 =?utf-8?B?RDIwNE9IcHdHei9CaUtvKy9oczlyMG9KOGxKVGpwbzd2TFNkVkNkZEFsejBz?=
 =?utf-8?B?Nng4M2MwcUxPMXpVVk4xRFdMTVRNNWFxZSt3L0YzUmpxdjh2a1diUWtJTFhR?=
 =?utf-8?B?aUszRDVFSW1lVmhHZXB0dG5wVnRtNWdxdkpMc3hBSHhQeHNMMUVpNUd4V1E5?=
 =?utf-8?B?TDJKRmhrRmdQUGxWMXZ4RGNibXFvZnlQKzQ2MlpOZDMrcitXYklZNWE2UDhn?=
 =?utf-8?B?d1VuMG52WWVLTGtaU2pPUnUvUUZOVmcvRUIxcUFYMmFFTTZRU2lvbHFwbjBH?=
 =?utf-8?B?MExuSEd1UUpRc3BoN2NZNHlrdHFrSXhIcUY2MmxPSGtnYWF2NWhQU1pFcVpp?=
 =?utf-8?B?T2hHbUpua2VabmdrRVhFa3E0WldSYkFhS015U21CODZBckgzaFd3UEswdFND?=
 =?utf-8?B?eVJUeDNFSUNWdWp6U1NzMWM5SWV3OHFWb1lwVHhCQVlkbFlNWlNudThTT1Qy?=
 =?utf-8?B?YjNaUHV1N3FrcEZCRXVkbElVVGwxNDFSMTA5ZHBRSnJZNzE2RHl3aE9sR2o5?=
 =?utf-8?B?dVNqdG9EMFF5cjVGTEJhdTVMNzkrT25wV0JWUDJZYWUwdlRKM2dKemhSVXBu?=
 =?utf-8?B?SmJ5bzQyRGlsM2U4bzVtR1FhWUZpcmtCWmhNRGY3dHRoNms0TjFzaXByUlND?=
 =?utf-8?B?TDM2bytORUpiNmNVUGpCbFhOOXVwOURtcWFTcllROUZQMnBzZnNhb29oVDBx?=
 =?utf-8?B?U0VGdm5RaDg3MGRwRVM3V0psUzIvREJ5QjhlRzdWZGJIVVJrK1piSTVNNnBn?=
 =?utf-8?B?THU5SWVuQllYdmpkY1poYTR3R1I4YThkaVRXZmNwNTB0anhHRDAwTWtvdDFC?=
 =?utf-8?B?NDZBT2t2ZDQyRGVmUkxtWnRIMk9jUlV0aFdGd0k3WEk0MnprdERvUUJXY3dW?=
 =?utf-8?B?WnlzNzNuOFhtMWl6VExvTmFPWEJBVTQ4cUZiaHdaRkNadnRFazNMM0dFMXNV?=
 =?utf-8?B?NWRVWW9DRERLSHhCS29mY3BhTmlyZmFvYk84eW83L0t4SW83TDM1Z2ZJcXRV?=
 =?utf-8?B?TU9YWUtUdy93TmVKK2NaQWN1eUtFNEdZbGZNazYrTWFqSjZJdU9lSTA2TnFC?=
 =?utf-8?B?aXBROEV5NndFZDE2akp5UStSbHVPdnUwOUhzdjIybll2bXJWNDJEeFh5RkJj?=
 =?utf-8?B?cmZrVjlLN25ydy95VUpPNkZ4L1U0b25lblN3d0Q5a0h4NXM5NWpBRmNjM0ow?=
 =?utf-8?B?dmh3WTRBU1RVNzhaVnp3ZG9sclpGQ3JYbFBYQnZOdU42VGpFZy94SFV4Kzgr?=
 =?utf-8?B?Ym1rNDc2b3BTTVdWSFAxZXRGQnRCR05YVzZsb2NDa0gxWm9hdEUvbVVYaEU1?=
 =?utf-8?B?MTJBTDllMmpWbTZKM2FmOXNCMmhHWE0zSGVCN3l5N0JEMndVajdWcml0dUUv?=
 =?utf-8?B?ZEc2dU9PNmk0dG9wWWdBRk0rQWtaOG5nN0w5bHR1VHAwWUVrQ3NiQjdDV0Zt?=
 =?utf-8?B?Zmlxd3hlaWdJb1U4NUIxTUZ2enRoaUhNYTRKdEo4MHp4VmIrT055eGhuckZ0?=
 =?utf-8?B?c295MkRzWlMvSEZSeUlUZnhnM3BYcVo2WlMwQXJzV3FHNGttdXM3NlpNMEtk?=
 =?utf-8?B?Zko0U0d4VjI0eDk2TklsWloyaFNaMTYrcDFRNFJhTUJxWTNFbDFvMm5uSFJy?=
 =?utf-8?B?TExxK1FQNEZDZGxEaGNBMUJrQWdCa2dwR0prMEZ5TVdPdVB5aS9YWWhCZEQy?=
 =?utf-8?B?aGc3TTkwMTVZZXN3T01Pdkd4ZDAxRy80UG50UzlTbiszNXkySzZtbTR4eHdN?=
 =?utf-8?B?a2dXTW0wOWNBL3dKS1JjOEdpb0d0QmZtdlkzUGNqbDJCYUFhSW9IdEpZc2lX?=
 =?utf-8?B?RFl2TFZNczM3T3hCWXpKeEhwcElreTFjWnB4UURmRGttWFhBRTBjZTZNb1lF?=
 =?utf-8?B?RUZ0ZURKRWNiTGVDSWViTEdkR2Zvc2UwbldCZXdFdGZwOWFrL1A5WUNLNnNz?=
 =?utf-8?B?QXhkQ0t4amxaaS9IcmhXa1Z5Y3Y3czVZcnNqN0JXSm5tWXQvZkFCc1YrRjJh?=
 =?utf-8?B?NGpBQnA2SXdOSGxwY3VaOVV3UElseEcrQmlEYWZMNzh4RVkwdTlqVkpVZkRk?=
 =?utf-8?Q?FpTJTyHMjVApsABE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9b6977-6e47-49bb-b7bb-08da3f228636
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 14:17:54.0454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckXVYNjMQVsLlVNRffr7Y2y5yOvYW5yXkuifLo8OKKyMVxkcnbx0hUzZmmcjIBtsX1wNN0acXrJQOhj0yVD1BWXKL6EzNJFUpEafTDA2X/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
X-OriginatorOrg: intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2022-05-26 3:48 PM, Pierre-Louis Bossart wrote:
> On 5/26/22 04:57, Amadeusz Sławiński wrote:
>> Well, this sounds like what we did in avs, namely we split cards
>> separately based on endpoint. Main driver decides what endpoints to
>> expose, based on ACPI detection and ACPI match rules, see [1]. For
>> example in our model it is possible to have 2 separate i2s codecs
>> connected and each having its own card. From avs driver we expose
>> snd_soc_dai_driver with 2 streams (playback and capture), see [2] and
>> then tell machine driver to just connect them to codec [3] - look for
>> "SSP%d Pin", "ssp%d Tx" and "ssp%d Rx". Connections between "ssp%d
>> Tx"/"ssp%d Rx" and userspace FE are handled by topology in our case, but
>> should be easy to expose without it, if you don't use topologies.
> 
> It works for ACPI because the platform driver can check if specific
> _HIDs are present or not, and decide to create different platform
> devices for different cards, with resources split in different
> components. In other words, there is no strict boundary between platform
> and machine driver, the platform has all the information needed.
> 
> I don't know if it's feasible in a Device Tree environment: the DT blob
> exposes the machine device, which uses *references* to resources exposed
> by platform and codec drivers. If there were multiple machine devices
> for different cards, how would that split of resources between different
> components be done?
> 
> The current ACPI approach will also not work if we move to a generic
> machine driver for SoundWire platform, with one or more devices exposed
> in ACPI for the board-level composition. If the machine devices are NOT
> created by the platform driver, I don't see a clear solution to support
> multiple cards.


Hmm.. I don't see why SDW is a problem here. Could you elaborate? I 
could boost avs-driver to support SDW configurations if we need a POC. 
Why would machine devices not be created by the platform (e.g. PCI) driver?

Regards,
Czarek
