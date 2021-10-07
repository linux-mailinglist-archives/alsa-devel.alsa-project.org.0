Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6784258F3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 19:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61900165E;
	Thu,  7 Oct 2021 19:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61900165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633626544;
	bh=n2p7GDckSBovzPeefaCTLpe7Tk9R74LbdVVpdvDaZI8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VeA+cW47ol6so1X1qGNWiFSr7LvmpvXU7aphiQuyvzR54SAj1zf9DPnEXn+AZgs1e
	 92AVaxQ6kK3qKcKkyxmdeCj0Y7TVaThJHui8W4SOyqGU67SjJ7ghfEASba84gqsohX
	 rZ7qWTvMg/fk3yzrcYKQDIfZzF6Yvlx9hcsTRKaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA355F8028B;
	Thu,  7 Oct 2021 19:07:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5F72F8027D; Thu,  7 Oct 2021 19:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7A11F800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 19:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7A11F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="mhEcw4PI"
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225084153"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="225084153"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 10:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="439610672"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 07 Oct 2021 10:05:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 10:05:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 10:05:51 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 10:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PC1O0eF6EFXsQVh0DDIZPQFrqi0FsO415q38GNhQus7op+8S5QK2uCSJ+iGKfX1LvmQjvyYbULv1AK90DlW+8hDrJi8A2HTYPh9NKEhf3yBtdkLUY1r9hLQAsqZ9VRKrGK7PZFNHYLDKGFdkFt/AUG1ZBso8yGlYQxyXtPozhshs/n1iUsGU13pEu3cLQOkX9f6z0YoyQlLB/7ftSKWU4z0Qh3rjvebxfQoN6MqY/Y9agqzOzt9xCS/nIhqNd1L01ixQcolhZ/lkeQLY2PN/hhL3OhiSBFIURCAiyCvjS/ubWiYHrDVlZpUUpmC2swURWlOqePNqut1bk4n+FlY+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vISxBCPVLnm3Xwiw7NaT3dcEfYOA0FyRUQZP9eGnAw=;
 b=ERgJwGW24+Bdj+0Jut7sA2LlOiTX5KUWSkZdjQ+YwGxoqR6cluZAlAUYLmyuI0+Q0bN50ri8gkLMJvtjFcBmRqOZKhz5OsscEsN7R6VHZcm3bZbT4SXfExuat/yd9Dl7vMxeGhhq2bwFWUy0xuGq/TNfzMW6w51o0Tht91TNDu5s8XX/SghHBcZF1kbK2O03+1MrQhsgLzST/IFRD3OJwjSNy8vos1g4ZYRtP28du262eAtUE/bPHpDnTjXTPgfKF+4nj4Z+2WBBbruA2wB2p4cBNcYcV5f0rQKOaAEmxRiF9suFcptABlb8xqf1zpKQE3EnVumNSC6N7WVVS02N3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vISxBCPVLnm3Xwiw7NaT3dcEfYOA0FyRUQZP9eGnAw=;
 b=mhEcw4PIgMoGU2chhj7sYjbWm0SOLUJO0jrUdWVlgl6f9UAjRDbJIr66e4nWJlW0obMKPrdXtmTVxttvXUPqYH98UtLJPN9QYKgS7Wihd4M4AC2asRQ806mOfaiLEAymDPcOptblU+IPsXEdgheGnpfuT9tsYvqgzOES967Wvlg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN7PR11MB2625.namprd11.prod.outlook.com (2603:10b6:406:b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 7 Oct
 2021 17:05:49 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 17:05:49 +0000
Subject: Re: [PATCH v2 1/3] ASoC: soc-acpi: add comp_ids field for machine
 driver matching
To: Brent Lu <brent.lu@intel.com>, <alsa-devel@alsa-project.org>
References: <20211007133516.1464655-1-brent.lu@intel.com>
 <20211007133516.1464655-2-brent.lu@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7e6cf92f-b889-aed9-b13a-615d4d5f9b93@intel.com>
Date: Thu, 7 Oct 2021 19:05:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20211007133516.1464655-2-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0205.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::30) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.109.202) by
 DU2PR04CA0205.eurprd04.prod.outlook.com (2603:10a6:10:28d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 17:05:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae614808-1c82-400a-0309-08d989b4b58e
X-MS-TrafficTypeDiagnostic: BN7PR11MB2625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR11MB26255A39B82601E342D2294FE3B19@BN7PR11MB2625.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0jJ04O0wQAJuCdz4OIJTSgcEi3m8ybIH82OlQVPPlVU3e5NWaxdNjNvm79aRu923Uq6yXbHtvNwykRFzgPAvtIJdI/dD2TdnPij0RmhCxNQpgTB0AZfWu8AH9aeqkyvMvVbi7PNXEGkiroVZL9PH4OnbYUle2lOsJw3yj5jcCiZ73xZKcZ5aaiDRsS/qsIMQNCK1hdoh27A0eFbkzUrkVbyu8p7pC5zu8ho9fAV/Fgnq7VW8gytvtQth2Fhu5CAHlIZDjU/D6Z9KmsIVK0r6JTyjx0n9Hl02KoJTaLeAcceDXRjmKSRh1UftbIcSfTYaCkgV7F+doydHJXNQU1kcv6Y7WV08/20oWUdKcsmFidIntwwjg59Z4ex5AOarht5JHCRdD4gN8H/nAezJFFHRWFLcO0pxj43EFLcm/JNKFsjGp9nx9F36v0igbnRCIWirLbDGdRBMOBjHd4B8PP3EU8W7LxyQk0YySTcbio9Fe6ChBvKogHU2HhQc1iO13SvFWKZ+GtFzKaf4sUWHUGKzk1tZYdmZ58SL4lnd42o7E8Mu0gdP+8izTi+/EDrm6989MV4qfaGOiAx2r5AmYlrVPPTbU/PIvjjmcqcuJ8+Iyvs6xPeHGFStB6AtwbaSI8odPXUBaQVUNDjdIuD5nuxt2ybijzxdql+tT58yFMznWnG/ri19+9Pux666XFMfG6V6dQjguUJNEAWdiKnLzwA54S4gnTtDHrR9+wGda2Viyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(6666004)(66556008)(66476007)(4326008)(16576012)(26005)(31686004)(2616005)(956004)(44832011)(36756003)(2906002)(8676002)(54906003)(316002)(53546011)(31696002)(5660300002)(8936002)(86362001)(7416002)(38100700002)(6486002)(508600001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEpQK05GVE1Fa3Qva2pLVG9mVDZHK3ROemtva2Ntek9mcFk1cDZUUHV0aVJY?=
 =?utf-8?B?OHpBZVozMnBzQ2RpL2NReVBscWRBYXN2MzV0KzJEbmxFMGdzRHYwRnlhNGdR?=
 =?utf-8?B?SzZyc0FjWkFnSjVtQ2ZhN2RiQk5LekIxWDFkK2ppYmRmNE5sbU1ZNGR5Zzhv?=
 =?utf-8?B?U2MzRUo4QkRrMEMzNEh3YzRnT2N2WGcyK0czVERNbS9KVXFZeG5SWWhUaklQ?=
 =?utf-8?B?TTRWZU5iWEdySC9wZlRMeXVTVTBKaHEwdGZVeVFQVTcvRlhFZjVTK0JpNUl6?=
 =?utf-8?B?Q2I5Z3FITnFrbmZKR21UQWY4VUgzWFYwVk9Vb243YkJRU0ZzM0FUYU9hMTkw?=
 =?utf-8?B?a04vc2RFSXY4TjJGS2hsZG8zTEpTcEpvU2tjYStHRVh1LzZ5VWk5SGJPSkgv?=
 =?utf-8?B?KzBIYVRpcDFaTlFYandrV2habWt4N3BBYVlsM2pBY2xnWGdlcHFhSUwrZU0z?=
 =?utf-8?B?Z1lrL0FML1c4ZFIxR0hFVUFzRlUyRzFFUXlKYklYNFFKQ3Fyd2pZL21GMjh0?=
 =?utf-8?B?c1dIYW5HbUlKcE9Da3Q0TzZkS1lqS0V1N1ZmNTRqMGN5VTBSc2RTbi8xaUQw?=
 =?utf-8?B?UXhXRkR4elFrUDNYd0tBSEpVQjNjR0RtODV4WnhteDhmamxjdUNjSkRON0xx?=
 =?utf-8?B?MDRWcTlCVUtFUnlrbTdSMzdhRFpIU3dmbkJQYlFpYzNNNEJtRVo1dHJCcXgr?=
 =?utf-8?B?QkJoMXpwVG9qZTh6a3Z1SGFwcEdPZENuQ25CSEhqVm84MVN1YVZ4TUVXTHIw?=
 =?utf-8?B?bVRGVGhLTGpsOEJhb095Y1ppWEVZSWxNTFpvSnNBTG5PUjljRDRVOEovYXNk?=
 =?utf-8?B?K0s0WXhRZDlRazZGcEJielVLdUtTQ3Rpc1oxTFVYTzdtQ1pyWGhvODZLa0pK?=
 =?utf-8?B?S1AvNFNpYUxSajJWR1JKd1YvMWI4Q09ic09TS0xmMTd5TUNsSThSZkhtU3Z6?=
 =?utf-8?B?ekExT1p5TnBoUVpMUmFsL3JQVjRJdTJ4Smd1K1BucktiVlV4RWY1ZFA4eS8r?=
 =?utf-8?B?eWtDalMzdVlJM0tSWEU2UE4wK01SaDV4RmMvNUp4dVZjS0ZwcUIvT3BoeTk2?=
 =?utf-8?B?bVEyWDdUQmRLdWg0S2tNV0gxNitnT2dhNUhBYVk1NE9XTExOb21UcHl2bDhT?=
 =?utf-8?B?YWI5ZXEvQkVTYnZMR0dJZzQ1NDRlMFAzOUltUWVocTZjZ09RL3hJNkVMeFla?=
 =?utf-8?B?SnJpdG9Pd3VrQkNZZW1uS253b3lQdVUzRVNKWGF0WVUrSXNxQ0dpTmI0a0N3?=
 =?utf-8?B?MkZxazJMdlZFeHRNd2hQUXZFOXN4N2NLUkN3NXBxck94VTFuMzBjU3pFemdI?=
 =?utf-8?B?VnY5OFcvTkNZeTJ0Z1NaaGhXZHF6cXhsdjlqSmhWYmFkSDZiTVUyM3ZJUWN3?=
 =?utf-8?B?eFV6SHdRNzczN1E1ekVwRkJta3ZuMHV6TTluZE9KRE5sWGJjUmJVMC9XUUVP?=
 =?utf-8?B?ODRudDdTOGdMRjYxWW9GWmI3Sml5cjMrMTR1QzNWYlRkdXdHL05TTWNFeGVk?=
 =?utf-8?B?MVhIeThzcmFrRmVZTWtWR2NsSGZZRnZ5eEJSNnR5cWVaT0M1VHgzRXVCcnVl?=
 =?utf-8?B?TE8yRWEzSmVuTTFsTzVEUkUwajRIMzVmMklyVW53SWxTbXZwSWVUWkJic1Vt?=
 =?utf-8?B?OWdHeldHSFVZS3VHYkhSaEZ0SnJXNWd6ajJ3SWdFS2FDZmFSS2ZjVTREZXBX?=
 =?utf-8?B?OXoreGt6dFBOM2dGVjNPZDgxMUcvTlJ3M3FvNVIyek9XcHBPNVhLUHlRZy8z?=
 =?utf-8?Q?o2NtTn3oDf+iEOmpml4K1IJpKjdLAXfO+XUrVeP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae614808-1c82-400a-0309-08d989b4b58e
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:05:48.6315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaL2zJFLAce6SMEEam8rKCyQXOs6B4vgcVwBvXCrGkq9rUqbog9HU4IKihbhfN6BsGW/V4TIq9whJEnO9vm3M3khuJdRY/2ZDfGJeOSNEx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2625
X-OriginatorOrg: intel.com
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rander Wang <rander.wang@intel.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>, Bard
 Liao <bard.liao@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>, Curtis
 Malainey <cujomalainey@chromium.org>, Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

On 2021-10-07 3:35 PM, Brent Lu wrote:

...

>   
> +static bool snd_soc_acpi_id_present(struct snd_soc_acpi_mach *machine)
> +{
> +	struct snd_soc_acpi_codecs *comp_ids = machine->comp_ids;
> +	int i;
> +
> +	if (machine->id[0]) {
> +		if (acpi_dev_present(machine->id, NULL, -1))
> +			return true;
> +	}
> +
> +	if (comp_ids) {
> +		for (i = 0; i < comp_ids->num_codecs; i++) {
> +			if (acpi_dev_present(comp_ids->codecs[i], NULL, -1))
> +				return true;
> +		}
> +	}
> +
> +	return false;
> +}

In cover letter you mention:
"- can use 'comp_ids' field alone to enumerate driver"

which leads me to an opinion that field 'id' should be removed, 
entirely. With 'comp_ids' added, 'id' is basically rendered 
optional/redundant.

> +
>   struct snd_soc_acpi_mach *
>   snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
>   {
>   	struct snd_soc_acpi_mach *mach;
>   	struct snd_soc_acpi_mach *mach_alt;
>   
> -	for (mach = machines; mach->id[0]; mach++) {
> -		if (acpi_dev_present(mach->id, NULL, -1)) {
> +	for (mach = machines; mach->id[0] || mach->comp_ids; mach++) {

Such loops are hard to maintain i.e. 'comp_ids' acts here like a flex 
array that follows 'id'. Removal of 'id' field and streamlining code to 
only use 'comp_ids' should make this loop more intuitive.

> +		if (snd_soc_acpi_id_present(mach)) {
>   			if (mach->machine_quirk) {
>   				mach_alt = mach->machine_quirk(mach);
>   				if (!mach_alt)
> 
