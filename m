Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CECCDB51236
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Sep 2025 11:13:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22CB60200;
	Wed, 10 Sep 2025 11:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22CB60200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757495598;
	bh=Qpybq1hyz0Cx2C8uIId/rGLnKRQM977v8/DeXj5H08M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MP23I4Vqr9BTB/K/oixhTtM+4UMShlFuqTJEzUlkgz4D2JhGaX8svsQh3w8RnPn+y
	 BIFeYkyXwTvae7+JNOthiH9Y2OOn7625AFGFtw0ZeSitpzHibYXAOQDR76eqQIxIew
	 1RkNLNYllqUVXcblb+u0YBwY1HU1w9lyvOQJo3/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EE08F805D5; Wed, 10 Sep 2025 11:12:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F8D0F805C1;
	Wed, 10 Sep 2025 11:12:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9390F8042F; Wed, 10 Sep 2025 11:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B127AF801F7
	for <alsa-devel@alsa-project.org>; Wed, 10 Sep 2025 11:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B127AF801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UuXWtbHy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757495506; x=1789031506;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qpybq1hyz0Cx2C8uIId/rGLnKRQM977v8/DeXj5H08M=;
  b=UuXWtbHy93JBUAPuUdiSNWfBXQ6KsCmqFz6d5WaDTrpUOq1Xn/HYqgLt
   pngxn/6JXZOXDXruYsKhvUT1FJAuoKbR6ZxPphjVVGhZozEwyOIR0+51D
   BxAMss7FOvQRHA03jeoPsasJP7L0wVR5HWF8rLgU8QC6flBbyg4i7Wm1B
   RBiUPvT3d2VatknVNKTDoVKyBbCiou5cI8/fMZH4VLOlNu0m/qQxGa1sR
   phwoj1UTeiq34URwbxe6CBdH57Bka7llGaB80Iv5qV+LOp2fWssDRphVD
   MyJz1Nx7NCpOWU85IExiK0wklGwC8DlKkGYVlDtEJxVYOGpIJMJKRgjyf
   Q==;
X-CSE-ConnectionGUID: wIgMK7NQQ7Kr9n2/RsVdew==
X-CSE-MsgGUID: L/B1s+epQwCArO52WoylQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71213376"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800";
   d="scan'208";a="71213376"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:11:40 -0700
X-CSE-ConnectionGUID: IQ70Go6CRZ2ICuULGjwJVQ==
X-CSE-MsgGUID: 1h2RIONdRjubrH4jlyK9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800";
   d="scan'208";a="210460371"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 02:11:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 02:11:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 02:11:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 02:11:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMVoHMQ+55OAFXal7WpNpu7U3MT25/veg42KhnGvfTo9pKimpGlWhuXqe6HQ5qkiuenUwjECxeRWHt+uzm0Spk2mvBrA7yJPnqrokLolKDAD2L1GihUp6lSD94knE8jqX7AlDWFCPG18jSl1ZPesnd0nDjUKuLkB71gcdK0IWd1Lz2CSdFyQjLpFSZQGDKgfYKiIRtAGAmi/BzpxU3fX21+gBllKRG8q8FC/fvD5zu/dKixqf3/8KMzts2C/mVTrb8Cj2vCmL0A86t4ytZj5Z0cJtRQ8hfXnalRAm0pp1SRwwKXaPceguuhviHvCY0jtaJ9IMLj4tnL01RyPXXp9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae9PmnUJv5jUEnVmGosfCPpfaVUcg2TnxDGZRPtbLkc=;
 b=V4IB7XIQo6e0KbLmYS619VKMpO9tDOX511Y2ERR/JDVs9XQJlrhieYmDabMB26VAS7Jrt/o+oenPq2npPqS+Fpx2/mWvaU+Uvt/a+EevebVO5anC8ZBXCw/foGQKLh1bXt9uMlliFA+/2aMkNm+K/DxH6nqlwTZ386edknayDWK3Q5kUFmjs+HZHDesCfw16fBXoZLVw9tMJxPc5EGqqzk+KGHHFpCTLfPp/EviTZTbSrnYj1kNPxpf/Z9ZoqlEdMjgAkQ12fr5CjRAzErvX9W9GrXiID47seFAch/BgK2D3Nu9Hl+FA6+rGuxtS/wtQoXxxwBm/w+hLnNLY8IAICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:11:25 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:11:25 +0000
Message-ID: <0f631a47-d487-4770-a046-af2c33ad670a@intel.com>
Date: Wed, 10 Sep 2025 11:11:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix incorrect retrival of acp_chip_info
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<alsa-devel@alsa-project.org>
References: <20250909061959.2881158-1-venkataprasad.potturu@amd.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250909061959.2881158-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 327e1dfb-9c1d-418c-d7c9-08ddf04a0465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?K1I5YzhNa1FmVkQzVVNTZk5SWHgxZHplRlkrS3FHa1NXNWRKVW1ZMVA2Kzly?=
 =?utf-8?B?WmJnVUNqZUt3Q0g2dUNBM3RNSTJpZ1R1bVhrcS9xQ2ZPQzZiN00weUpsdTJl?=
 =?utf-8?B?dXYrejJHZUpaTHFHd0VlbEczNGpLNFhMYUVpQjd1SGs0R29DR3ZPNWFrQ1I4?=
 =?utf-8?B?S3l4SzFUVVFjaDJUL2gzNjhtaFA3NTc3SWpHLzYrZUhOcENZZlgxM2FlOFZh?=
 =?utf-8?B?cFB4cHpzbDYzYU1kdlZkbko4bDJiaTY4UnQrT1ZUcjNmUU1md0JZaEkvMjYy?=
 =?utf-8?B?bHV3THZqajh4cFM3QjdhK3lqdElTNHNPV3ptcC90ZGxzWG5FU0kvbTFHcDBM?=
 =?utf-8?B?cUFYeU5UN04wZmdQU2wreWMxYjU1Vk1oeTVvenRUc3htNnZNekkxYVIvaVI1?=
 =?utf-8?B?Z3dHZ0pVOGJ2NS93U1Vtc0NJcmRHM0Z1Mi9MY1NpSEdvdVZKM3JDeXFoalk3?=
 =?utf-8?B?b0NPbXFWY1FSQVNMYjYya0xsZEZUa2hVMmxlRFZ5TkFoenRNQ3dwMXdNVzJl?=
 =?utf-8?B?OU1NQTh6RGFDcTNFN29KZGNmN2EzaktoaUVISjlhSVJ2eGR4YU9aUWVjRENx?=
 =?utf-8?B?R0Nac0I5MFN5Tko4N0pTQWlZdHdzemN1ZFlXazFMVU1GQ3dBWnZxaHYxbTk1?=
 =?utf-8?B?RHRpNXVkVG9GVEVDeHFtT1luMXdFNlVnTlJLMTZpbldIak12STZPemwzRWFB?=
 =?utf-8?B?cElsQVYrdzhYMm9CU04yc2E5ZWltbSt1MmR1UmVMa1c5cTRPbEJKWjYrS01L?=
 =?utf-8?B?MXBWVmZKeG1naThtYXU0UEdpOTlSb1B2cUJIWEpjTDRubU5xMkI4S1ZDYzhT?=
 =?utf-8?B?Rml4emFYUU5reDVhSURuajJiNk8xOU1oZUxUcTgrT29QbGZ0R3B0c2p6SDlO?=
 =?utf-8?B?L01WUE14NEt6RFFHU25rN0p1akcvcThrVGpoRThiZWEyZHI1V3pqa0o5OFR6?=
 =?utf-8?B?ZHJiZUttWlpSamdNeldMQ3VYK3Y5MjlHclhHM280cmFMcXB2eENpT1BjMFVa?=
 =?utf-8?B?NTVWSFFTK2poSWZNajdab2RnVFZSTFJ4dnh0YnJneGdlSEdqb2w4WmtWdnRa?=
 =?utf-8?B?L0x3dEE3UURYakNtekRRQ2Z1NEZQVlkwaGFaWVNPTDg0VkZqS0RJeWx1bnpD?=
 =?utf-8?B?WGo0Mm9nWlp6aE5tSFRXaEhNcm9sZ2tVYUlkamFZK3ZUd3dyVGZYOWI2OHNK?=
 =?utf-8?B?dS9iczYyYUZjOVpHWEE5Z0lKcFhQVVM0T2l5VWNTdW5tR1ZDOXdCVVN0cVhq?=
 =?utf-8?B?dWZhb0Z2T0JHYVY4YU03akM0M1FtZmExY0Q2QnV2WmlGbm1aYVhwRGFGOEpH?=
 =?utf-8?B?STAzeDdNRis1UmpXUFpVUE51OEU5bTFqaW1rcDl5MVQvejFqUWc1QU5IeGRq?=
 =?utf-8?B?KzJxa2s4NXlMdWlENUVoRnJtL01MRUNlSEEzL1hSamFQWHhSWFJjdnA1WmhQ?=
 =?utf-8?B?RmlrOEVEaHl1RGRnKy9palhjcDNPcnhTNy83YjFOVkd5TWlzSElCRVJxU2hE?=
 =?utf-8?B?Qk1LdVZ3MEYyZVFoMit0Tm5acjh0bWtPRzkvV3JXUE1GSndLamtqNlZKdERO?=
 =?utf-8?B?bzVmaGtTNkhsaHZ3d2lCaXlJTll3MEI3cGVsa2hjK3hYd1AwRnh2NG42TTlF?=
 =?utf-8?B?RTNWNThLYlVwaDVaQkUwOGZYNEZaRVNSR3FFWFBQNkNQVzl3VUIrRG8rMHBi?=
 =?utf-8?B?YUUxVm5ZVXpEMkJ5MWNZbjB0T3pEQ2w3YnNIMUZaSUR6U283Y2FGQml1V2Js?=
 =?utf-8?B?bmJrUjhnRnJkWTN4NVlWWUZZWWdtWEhXbXdkM2tKcHhnbjBjOUtBaUNPZDlX?=
 =?utf-8?B?OW1IWXAxY2RETUNXUEE4OGVvakU3T2R1N0dwUDkzT3BHc3RDZ0t1d2s4OEhM?=
 =?utf-8?B?cUl3Q2hla2UrbmJheC9UVkV0c0VFelpoanZjQ3dudU1nSFcyTlRxRCt5bHFR?=
 =?utf-8?Q?ywXXswKf+YM=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?RGp1ckdBQnI2a1NhQzBacFZ0MVc2VU9lRXBGVHlnbysxRjFMWFl5UlhFMDBy?=
 =?utf-8?B?NnZwaWtaRFJGNnJnWDg5aU93UzJvS3pWQ2w2QkNYenlHcDZHZDR1VjJzV3ds?=
 =?utf-8?B?NzB2TlRvaFZlQlc3SFUwbStiMzB5ZzE4SkVmT0xQQjdRM1RFYUlNdGpaM0Nr?=
 =?utf-8?B?Yk1Xc3k5bW8wLzljMTF6S2NKQjlSVG1YZDlZSXZJWmpZVVM0NEw4VUxVbThl?=
 =?utf-8?B?clhrRWNDQ0dUblRCcFRqS2c2elFnN3AzWm4vM2ZJRDQ1SjIvSEdWR1dMM003?=
 =?utf-8?B?akVKcjZmTnJkaXpqcFRmR0I0VE1IVGkrb0tieEVPbVlTOXVvTTFzVTNsS2ZW?=
 =?utf-8?B?TzVjRzNNLzNUYmZmbytWRldWWERhRG9kQzVwTm5YSzZBRGRhS1BCNmlrWUdD?=
 =?utf-8?B?NytBREprazFoeVN4VUV3RWRvVVNia0xpVU10cEtkOWpyTlU5elpIWEpaSlc2?=
 =?utf-8?B?VDJNR0pnZ0ZKMENDTnk2UVFwa2FUL0dzWmtTZUxwb1F5UHpBQTlmWGRCUTJq?=
 =?utf-8?B?bm9Dc1lVRGlxWjdQTTMwWUNtUGQwODNEWE5qOXhRN284a216QnpzQjFEZys5?=
 =?utf-8?B?cnlOL0s3L2M2elZaSkt4QXo4U0xZSUt2TSs1M21EektvY1pSV2VmRXhDQ2tM?=
 =?utf-8?B?N0lUQ2Q5NkN1OFpyWlBEY2l1QThrTHhNSTZOcHQxM0ZveStaV1dnTjBLZmg1?=
 =?utf-8?B?U0pvVC9FVlEyTDRXbHpnWDcvcXJZSlpNVDNpMkx3N2N1c251QmdrcldrbEtG?=
 =?utf-8?B?ZFNiYUg2aHBNbU16ekN5R2xCVHBVR2d6YjBScVdFZEhlQnRyd2srY1V5QUtx?=
 =?utf-8?B?RmN5M2VRT25YYzFGUEN4MzB1anBxR2pPZG9GZ05ZN3BlVVNONWdIRExvZ0ha?=
 =?utf-8?B?Y1c4bFBBczVVWWpMZ292UWxvT1FCTXVqYU4zaStRS2pEVnRtTGE5blNhTThH?=
 =?utf-8?B?eUhnZjdLZytHeFlBNTVoT1YzalNyWVl0RTdCaTBZRlFWQndoTlNCRE1md1Ji?=
 =?utf-8?B?anJFN1RUM3UzYTRTVlpnTnprREdkRXFKTkVFWHhQTUo4WW5rVjhNRk9jSEtB?=
 =?utf-8?B?ai9MV2VWbzhXaVlIYytqSStKcm1qdU56aXEyelBOYlNJSU5DSFcwTDhYcTVq?=
 =?utf-8?B?M1Fnc3JiRDA1VjFIekNmM2VjSkxqQzM1UmZmN1ZFcU1XMFE0K3lhbG9kRU1J?=
 =?utf-8?B?UHZnWXpHZ2VNT0EzNjY5bUVSZFd0QzA1N0RxYVY0RGV5S2xnRS9pUVpDTGVq?=
 =?utf-8?B?UzlyY1E2UHlmOE9aN1JIcDh2ekRNVnQ1dE5ibVdrWmVDTGxFOE5pR0VRRUhQ?=
 =?utf-8?B?UW1kbUJMRGpkYjAyUU1Nb1NVYTRQMHZZMHU4ci9sM1h0TGZ2SjFvdjRqQW1o?=
 =?utf-8?B?U3Z0ZVF2eEJ6eUZubGhaenBVZlRtaW95ajRiS29hZElidWZLNTFoNmFnQUt6?=
 =?utf-8?B?T0VodjkyWnpIWG9pWlpwb05SeUdaZUIyLzZ2d0tkakZHMUROMVNkTXhaNzNH?=
 =?utf-8?B?UE54Y0FiejJrSnRPbHZqTzBRR0p6dHFiR3B0eUdheUpvaEVieHhZR0g2d0Qw?=
 =?utf-8?B?eEFHVmt6K2FzY0s0cGpSTkF3N05OM3puZHJDZ2ZvdGVFQTRKMFdDK3B5OVd2?=
 =?utf-8?B?NHV1b3VjNk51d0ZncDJ0V0ZLdnlSUDlWZWVyYTlsZnN6aHpwTUtsS2psaCs5?=
 =?utf-8?B?TVBSWE8renRQT1EyVGkzcDhscDJwcWpKSklSRm9aZzRzK1hBcnQ4T0svQzJZ?=
 =?utf-8?B?dUFwaFRCdTJtZUtZZHNwSGYvaHJmd28zb0FRVjJSNERBbTg5dUtQMzdaT0Zn?=
 =?utf-8?B?bThpb2dsYkhqbGdkN1lxbGpReEpXK1hzc3c3dUx2TFVYa1NOa3diV2xVRmlp?=
 =?utf-8?B?MmwzL1h3ZFFZKzV2YktadFBBQUJiMUtJVGtTMVltdlFsS3BLL3BYc20waHRQ?=
 =?utf-8?B?U09aaHlyVCtjdTFSMmVwN1NJUUFmVi9ZaVFFNGFta1BXWWNsNG5nRjVDTWZl?=
 =?utf-8?B?Rk9vNUE2aUxBTTZKNjk3bDRUMDMxN3pEd2dKRFkwbmp3NUE4NUhRWGxWeFNp?=
 =?utf-8?B?clMvRGFGbFdjeVBXc29FRFhRZFZqU1d5VmRLOXVOV2tlYjd3aTl3TG9wTURU?=
 =?utf-8?B?cXNBc3BuMmxoZjZTS1Q1c2xmWUhFSWdtUjVLR3drUit1V3A1QmVOakYzRzBw?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 327e1dfb-9c1d-418c-d7c9-08ddf04a0465
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 09:11:24.9921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P5lD/A8iSCcUVnHHygPo/zkWFHguC0gM3yXFjeKga2s+zFbzU7ZxU+iq76jjBU3msPpwd8fc9xQkmvV2M4zqnXQHHDZwibdbhy/H+OO81Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
X-OriginatorOrg: intel.com
Message-ID-Hash: X7OAWADFRRW24MLXGAQ7ZXNUUPDP5ZQ4
X-Message-ID-Hash: X7OAWADFRRW24MLXGAQ7ZXNUUPDP5ZQ4
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7OAWADFRRW24MLXGAQ7ZXNUUPDP5ZQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-09-09 8:19 AM, Venkata Prasad Potturu wrote:
> Use dev_get_drvdata(dev->parent) instead of dev_get_platdata(dev)
> to correctly get acp_chip_info members in acp I2S driver.
> This resolves issues where some members were zero due to incorrect
> data access.

Hi,

'some members were zero' meaning null-ptr-deref? If so, please reword to 
make it more explicit.

Given the history of this file, mainly Commit 6d9b64156d84 ("ASoC: amd: 
acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot") it's kind of 
surprising that the issue is addressed in staggered fashion. Why was 
set_tdm_slot() fixed separately?

> Fixes: e3933683b25e ("ASoC: amd: acp: Remove redundant acp_dev_data structure")
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

No newline between the tags, please.

> ---
>   sound/soc/amd/acp/acp-i2s.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
> index 617690362ad7..4ba0a66981ea 100644
> --- a/sound/soc/amd/acp/acp-i2s.c
> +++ b/sound/soc/amd/acp/acp-i2s.c
> @@ -73,7 +73,7 @@ static int acp_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>   			   unsigned int fmt)
>   {
>   	struct device *dev = cpu_dai->component->dev;
> -	struct acp_chip_info *chip = dev_get_platdata(dev);
> +	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
>   	int mode;
>   
>   	mode = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
> @@ -199,7 +199,7 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
>   	u32 reg_val, fmt_reg, tdm_fmt;
>   	u32 lrclk_div_val, bclk_div_val;
>   
> -	chip = dev_get_platdata(dev);
> +	chip = dev_get_drvdata(dev->parent);
>   	rsrc = chip->rsrc;
>   
>   	/* These values are as per Hardware Spec */
> @@ -386,7 +386,7 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
>   {
>   	struct acp_stream *stream = substream->runtime->private_data;
>   	struct device *dev = dai->component->dev;
> -	struct acp_chip_info *chip = dev_get_platdata(dev);
> +	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
>   	struct acp_resource *rsrc = chip->rsrc;
>   	u32 val, period_bytes, reg_val, ier_val, water_val, buf_size, buf_reg;
>   
> @@ -516,14 +516,13 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
>   static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>   {
>   	struct device *dev = dai->component->dev;
> -	struct acp_chip_info *chip = dev_get_platdata(dev);
> +	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
>   	struct acp_resource *rsrc = chip->rsrc;
>   	struct acp_stream *stream = substream->runtime->private_data;
>   	u32 reg_dma_size = 0, reg_fifo_size = 0, reg_fifo_addr = 0;
>   	u32 phy_addr = 0, acp_fifo_addr = 0, ext_int_ctrl;
>   	unsigned int dir = substream->stream;
>   
> -	chip = dev_get_platdata(dev);
>   	switch (dai->driver->id) {
>   	case I2S_SP_INSTANCE:
>   		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
> @@ -632,7 +631,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
>   {
>   	struct acp_stream *stream = substream->runtime->private_data;
>   	struct device *dev = dai->component->dev;
> -	struct acp_chip_info *chip = dev_get_platdata(dev);
> +	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
>   	struct acp_resource *rsrc = chip->rsrc;
>   	unsigned int dir = substream->stream;
>   	unsigned int irq_bit = 0;

