Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436ACB28AB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Dec 2025 10:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537BC601FE;
	Wed, 10 Dec 2025 10:24:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537BC601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765358678;
	bh=s8odwf5aSh7lXPwrjJJOCl02LudyzuXuMLaBjv6mRRM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DA3SEHychz2OwPWYgkNL3cNJXuEyOajUKauNkP6X9Zf03CYHQreX//gjBRA/ehjEc
	 Vhrs90RsuCtVrXdbn3DGe00FDf/KDhnQavWmuq9QhgWEPT/azAvuUIUZtslZRrHFJd
	 P/9ulF3EEQ3pJN45rZ83no7iRXE8ZQJJGltq9J4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06C4DF805C2; Wed, 10 Dec 2025 10:24:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A57F804CF;
	Wed, 10 Dec 2025 10:24:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DDF1F804CF; Wed, 10 Dec 2025 10:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9434F80088
	for <alsa-devel@alsa-project.org>; Wed, 10 Dec 2025 10:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9434F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VhbjB6dX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765358559; x=1796894559;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s8odwf5aSh7lXPwrjJJOCl02LudyzuXuMLaBjv6mRRM=;
  b=VhbjB6dXGR2i75lOmWW29y3qSYD5YJQ3JWFWCCsXSpYiRYeUTORU3MTT
   yol9KPn/i9eUu4V39BIBTGNdyprClQs2hb9ygIYHngh0L2171JIZO9qNU
   SrI4Ye5tQtO7Y6NiE5OYwHW8dIim3+8XBWK2UlBzeSfQp/egeKHB1MOfb
   MB9fuWDqj97MSrLMM7a6G+e3AEm3A6e0isj3CiKAj2KmZHbtcgKi7323b
   PSQdJ75pnXPYNFqh+RcdQ06b0LGLhmnk4TYSah3uMQipFkB7SCUUJA5bQ
   Plkxj+L8a5wIFIp41s3blNd/udKy/mc3bQuoMfa9VfoHZD/TA7fTE4APl
   A==;
X-CSE-ConnectionGUID: 2zBxjhZUSQqmjmVHxlUuWw==
X-CSE-MsgGUID: QDEYbpnhT0SFsy4lcPkjUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67499181"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800";
   d="scan'208";a="67499181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:22:35 -0800
X-CSE-ConnectionGUID: CLWI56B+Tfuetm0o6vumMw==
X-CSE-MsgGUID: wQdsyUqsSM2zL+Et9Bkc4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800";
   d="scan'208";a="196378979"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:22:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 01:22:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 01:22:33 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 01:22:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mlx4Fgw1MQsykOZxZe5MYYyA9EONK/wO3eBVWuyp3Efet7BLXCBWpnFbGTX8BEs+jGV0vbpwrrE3e0DNzotUpziQ/XkI3/lqi0VeWQDyrUkO2Rhtdz260lZYyw0HOcx8ntS5J/7ZDzSCZrvtalfQ0jh7ZUvOxMzbpkFtNZ1F2VTMBi4UyN+XeGNFxMwFIiouoU9QY0oyUGx++UQLfcIU8SQD/UL0XrzMy92KLWJggL60ddadVJ6KXzo4rX37NAaEPqLZxQgfkJSfXhAF74FWHIUBh1HriVvroOmR6XyeRB1ivb2bNSxOceo8F25QtRaqeCq6lpyxUocGZzXqw1AqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PSvv7VXsSyeBT9TZUOtcfE8Fwv6YAofBQ8HfadMQwI=;
 b=X645Sbkk01hUvWP1A8o9Mbp4OabAJk1k2ZQTYPqf9KhHKEwNbo/nTfyKb/lYrE2lfdkoUc3ljnp4VxoT0V8SOnP/wzzFObTdnFsKa6XOhQCF21gRWa7Q4X9hXUQnR2Yjtft+zYtyFSitebAllstPYBkNHzGWdTliZWIPlE0ZldMpryc6tR7A5m1bDiX68Ws7poh+JW35lqL5Gf2sv6HpIBtAiQ+753N0WeD5IKd6Y30vvUiL5qqiN7Jor2YxekA4lc4fEjwnzyXEVf0jaY+hvtgOWZYQCUkJOtA9fSeGjKpIA0hZbUbGVCEGbE/Ot1vJCmL0bU0W3afyMaWncC/psg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 09:22:30 +0000
Received: from SJ0PR11MB8294.namprd11.prod.outlook.com
 ([fe80::fa7:318:6d3f:3c4f]) by SJ0PR11MB8294.namprd11.prod.outlook.com
 ([fe80::fa7:318:6d3f:3c4f%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 09:22:30 +0000
Message-ID: <3e54d411-7e3e-4048-9542-4d40c1d6b7e6@intel.com>
Date: Wed, 10 Dec 2025 10:22:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
CC: "perex@perex.cz" <perex@perex.cz>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "Flove(HsinFu)" <flove@realtek.com>,
	=?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>, Jack Yu
	<jack.yu@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
 <1392db4b-968c-4458-bdf0-de6aedc29fc6@intel.com>
 <e0b61db5cef74c78a0e0b21ebb7e101d@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <e0b61db5cef74c78a0e0b21ebb7e101d@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0060.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::49) To SJ0PR11MB8294.namprd11.prod.outlook.com
 (2603:10b6:a03:478::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB8294:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e390e38-024f-4147-a0a6-08de37cda488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?NWwwV2EzRVFXM3MzeHAvaElEZGlCcTRRREpOL3M2ODJMTHFYR2FEUW5jSDBW?=
 =?utf-8?B?S3oxN0ExVDhieG1OVlc0dmlCRXNEbzdkVFhnbkFpQkFwUHNYZlowUmdIUGQw?=
 =?utf-8?B?RkdIN3Q1SGZRcXBYRG1tWTVMREdhc2poaHJPdnNwc21YQjFmVUpwRHZEVmt6?=
 =?utf-8?B?RThQczdHb1h3aTFGeE9jNTUvV2lpRVhmb3E4Ui9qMTc0Uzk4SEJiaWM2UmJS?=
 =?utf-8?B?T1VnSUowcCt4a1RRcFpzL1lPQnRtRUpCcC9DWjBsS1JKUUE0NGNsZENsS2dC?=
 =?utf-8?B?WmRsbzFGWnFXSnFveW81WVZWRkI1ZGgxWUEvbFo2cWF0eHVYblE2cDhZRE1n?=
 =?utf-8?B?WHh0RnFzOTA4bXFob0hib1FmbG80SnZOTjI1bjJZZDlVT0xOWjl5ZFBGdnJV?=
 =?utf-8?B?M050dWJCUVY3K3ZXd0hQUXl1a211amt4ckNPdldPQkVreFlOcXFUQ2lSbXBx?=
 =?utf-8?B?K2EyaVpuZFdhZE53U0QveDNtazQxNkhmd3NRMCs5eWx0WW1RZFROV2xyajAy?=
 =?utf-8?B?SzRJMGs0Nm41RklHeVQwODV3YUdmUG84dVpObjNlMENhMmh5SGc0THFaZHNJ?=
 =?utf-8?B?VHlISDUyaGdDY2tkcENrTjUzZVd0K0YwSWpVWG1FbHkyUCt2QU9sZ21hdmd3?=
 =?utf-8?B?Tmg0cUl4ZS9aczhmTVkwM2NyL0NZUDEydXltZEMrU1NvaUorNStDTWZKOG0v?=
 =?utf-8?B?ekJXUWxjTllLcVNIVGwwbVczVElnQy9iWlhuQWpadWk2K2ZQU1dJUkRJRTFv?=
 =?utf-8?B?TW9SM1hWbEk1OGQyZTZTNEJkQkRsZzZCR0pGazNkekRZOW1SOHdDeHBCU3JR?=
 =?utf-8?B?dmxBTlBHYklCTWMzR1hHd2ZRN3pyTzFGRjlGS1Bjd2pNblR5d2pvTWd6TWVH?=
 =?utf-8?B?aUJtMzRPaHV1Z09nWU13WlgyZlJNS1NibmdaSkFWclFDVk1KVlZVMEZLbmVU?=
 =?utf-8?B?dWxxUHgzZWxRVmtLNVV4M0IxYnNmNFR5THJwSjFyZHR1eTU5OGltYW5lcjRU?=
 =?utf-8?B?S01MRE5qQnZ3VzhEV0ZqZVU3a0w5VCtXSCtSdkFmU256VTdlSXN1bnUxUlU3?=
 =?utf-8?B?M1R0dTVVeHluaFk3SEREcElWTDVlcEhPVlRyM2NCbDlYMW9LTDdURGNDRTV2?=
 =?utf-8?B?dUVNZDExQWVLbW5HM0p4TksrcnVsK0kwZXA3Z21BSzJMcWpXSTkrTExJelgy?=
 =?utf-8?B?U0Y1OXl4TThvUmVLampIY0lOMWVPU1AyT1ZkcGhYT29OajEzNjkxTWVQaVl0?=
 =?utf-8?B?cXJTZWxEZng2T0d5c1VETTdBMEQvZ3V3OFk5LythdUh2MXdMNW10VllYa3A1?=
 =?utf-8?B?WXBidW9CRVVqZ2RMNGZuQmQ1S3lib2hQc0RDRzlkMjZzMkh4bkJKdXJ2R016?=
 =?utf-8?B?RlQ2NW1wMXNwRkxDek56QzZvT0ZkMnJEREJUY1dlWmhPZE5OQVc1SWFvNnFk?=
 =?utf-8?B?K1VWWUwxNmk5RUxpTkZ1ME1TWU14V0pFall2eGgvWFNQNS93TE5hVEZONnJn?=
 =?utf-8?B?cEs1NzBRMG5xZmpsdnd1K3hUTWV6MlE3R0dvam11c09RS3JrNXFKOWdQbmdp?=
 =?utf-8?B?cEtiYTczYXk0SlZoUFBYaTBPU1pqNXRYNHQxRlRiSUFrRG43OHZSRnRISkhF?=
 =?utf-8?B?US9ocXlWOVF5Wkh0WVV4azBmRUZHWkxJTnlqc2lVWUR6TGcvR2lVaXhaSk5r?=
 =?utf-8?B?T0lqV3RvZWhzSFdrdmVFM0Jsa1Y3SENYOUVFYnFGTTFnQXlKMjlPQStzQW5n?=
 =?utf-8?B?Vk9iWmpvekdId2hDcGNXU3BNNDFTelduKzRkR3IxaUcreWlnbDA1TTErT3U3?=
 =?utf-8?B?RWo4MlZmVXNjcTV5QnQ3UHFSTys3aHJkUDBzMVhtN1Z2aGJhOVkvemhLWUpi?=
 =?utf-8?B?MVllUTBjeW1Yb2puaDJBM2tmajZRc1hRQjB0M0g5SWhNdUl6WVYrL1dXZFRD?=
 =?utf-8?Q?jDjcQzYt/xKRsjYZD7BWC5UzTrPlgJxS?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB8294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?MkM3Z2lzRmtTK0t4alhBN0hSSURrY3dZNHFhL0VXZlJ1NDBORDF3YmVqYTRW?=
 =?utf-8?B?a1gwZWwzbkZxa3FvR1dNNG1QT09hbDFiSkNmMWRlc3ZwRllGSU9DWEpMWE5Z?=
 =?utf-8?B?eUtpTjNwVUhIMlZOdXU3TEJMTmJVYmRXZ0R1T0NtYUdJLzRvck51YVZYTzdM?=
 =?utf-8?B?SDBEdFp5T1ROMGxXd2ptNmtndmIxNkQwOGtFQnRIbWF1V3pHNS9MQkpoTUdL?=
 =?utf-8?B?VldqSmdiZjkwdTY4SVFHK2lMK0R3VnJvOGxqaHhvUThZU1dwcWNOUHpCUmpT?=
 =?utf-8?B?UHVUcXJlZzVVeDR5S0ovTzczbm1KbnNodVNFOFlTTElxcXgxMXJ1eGpnWUVi?=
 =?utf-8?B?VWRyMmNJK3VLYkVVQzg3QkxJWXUzVkRVY1ltdisyQ1BnNUtEK3FmaDdEd0xL?=
 =?utf-8?B?UURISVUvRlZUZ3FmT1loTUJRKzI3eDNucFhWMG1pVllMbGZnYVBvTk15YnB6?=
 =?utf-8?B?VHA4U3NMT2IxVmhTQ05zLzVBL3dhb2lhQ3EzSnUwcHhJTzYrRUVaRDh6dUMx?=
 =?utf-8?B?K3FmSGxsM3B4amVOajkvMjk1NjNVbzFvNDE2WUhYQ3RsTFFFdVlGTTJqcWlV?=
 =?utf-8?B?a0ZZOWZEK0JpNDk4aGkxaWRGdmVVdnYxRnlVWm1qbUZiLzlxWXhBekZnREVW?=
 =?utf-8?B?Tk5iRlAzK1lnOEtRWDdjNUcwbUdYWm9WRXhOZis4a1crcjRaK2trV3RSZDM2?=
 =?utf-8?B?K0RRNW9WWEZsVERXeG56clZnNTZ4TGFBU2QxMU50RUJSeHJkcUROZVlrejVZ?=
 =?utf-8?B?SmF5TVVEb0JUVGkxQWk5RmpXWWsva3JrRmVZakZwdHJ3TXRoZEpXQThSZmlQ?=
 =?utf-8?B?citxZ3UyaUpTdEYwVDhSVmM5SmFFZXZDMjVTQ09mUjNTenM5QlplSVRLRStI?=
 =?utf-8?B?K0ZEVFdYSGtqM25GWnFMc25UNUQzSjFsUUI3K1M3NVhCMHhrTzRMUUZzZW1j?=
 =?utf-8?B?dDNqSnVnSXFsTmZxYkVXcHExT1IzZ0IwWURSbHdUYU5iUHFDek01MnNvUDVD?=
 =?utf-8?B?ZE9qaW1VeUxkczVFbDcxd1dtS1VXV1JaaXpIa2tqTlRNRzBhU0k4bDk0YUZ5?=
 =?utf-8?B?d000eWhDT1g5OHQ1ZmZsTlJSR3hQVytZM0Y0Yi92ZWJlOEhrSmo3Nm1vcEF0?=
 =?utf-8?B?MjFKanFvRHJyamUwWGhNZ3ZsQTV6Ky9NZEM2bVNhNWFmVEV5ZEZxU1NzTHhP?=
 =?utf-8?B?UzdVSXU0SkpTcC85OGw2SWdKbnVySmd3NkcvNDU4ZFhnWTdockwwTlNNdVZx?=
 =?utf-8?B?SXk5RVpkdFJSajEvN2JuK0M2ZmVYTFJzNkgwd1dRQXR0Ulo3Rk4yUEEyQndK?=
 =?utf-8?B?Wk1pTk9ZS2ZETldXZmZ4N0hFemV2VkM2VkFpckZEd3RXRGg5Y0djZURpTFBp?=
 =?utf-8?B?M0t3a2NJLzhYZzkyOFpvUkNhRmlmMUZOT2xXVkMwcGlKekVDZFZVOE9zWE1R?=
 =?utf-8?B?eTFFdXRzdnJJKzJhWHI0bFQxUmR5NlhXTWNvRE9XY1JkTm5zTklmS2dCMUd3?=
 =?utf-8?B?TGJpN0ZVY0U1cHZRTW9meXNVSi83QzU1dlBaRXlwTThzeXJ3K0NwdWNoeVV0?=
 =?utf-8?B?eCtXVkFLYkZCL0tEclRiNnpTcGhmNWJUUVROc0h4ZjZoUEp6Nmx2ZTFLVFNu?=
 =?utf-8?B?YW51NURsVWFVOWVtd0tIL2Iwc3pHWHlwR0VENTk0RnFUaWRibHljTWlwTjBt?=
 =?utf-8?B?QVlMdlpwQ2NGam8weUlibS9HUnZkUHp2aFJETnBDb3o3VmFkMk1FRkVNN0VF?=
 =?utf-8?B?WnRTWXFWNUhHdmV4QTViTlB3bXRwaExKbkpBTUFXOU5zSVBGRXBvbXN2Umtr?=
 =?utf-8?B?WWx1QWJYVFFyYURpRHlDYllxV2dNeUFPTUpteW9TZmdySkE0UHFNYnY4bnJL?=
 =?utf-8?B?eUdUcUZ3dUhEUStadVdzT1Blb1VpUkxJaFo4bTZkeDYrQ0NRNjczcHB2S3Bp?=
 =?utf-8?B?SUw0aVpVZTk3S3pnV1p4VEhhdkpXWUN1czhiMFNmanU1UkFRU3V0VGpER2Zx?=
 =?utf-8?B?T2N0RnJ2ZTBLbHlOckliRTVGRitrQ1NUb284eUZsZEozUDdHeTNoUTR1dklu?=
 =?utf-8?B?cHFyZ3dkYy8xR05wUlRUQkNhOGkxMCt1WkdrcGJ6QW9aTTZjamRHN2JPOS9F?=
 =?utf-8?B?SGtaVW1IeVFTRVpqZmhxMFBzNUl2a3BNV0gxa1pVUnBSd3JBbk1tZFpldGVr?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e390e38-024f-4147-a0a6-08de37cda488
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB8294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:22:30.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iwGpXjaOTeweSlR3yhaMiuBOh5MudAsT0/cUZNdAZKqOn2ZKrs5fKGZbpgFsMN5S3hw5QPhmrEoZGKy8gtqIMY1sgV3iCWXumoSOGrkJMqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
X-OriginatorOrg: intel.com
Message-ID-Hash: 5PF52273M7LHSKOJAS2E43Z2WD5V7TXA
X-Message-ID-Hash: 5PF52273M7LHSKOJAS2E43Z2WD5V7TXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PF52273M7LHSKOJAS2E43Z2WD5V7TXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-12-09 6:35 AM, Oder Chiou wrote:
>> -----Original Message-----
>> From: Cezary Rojewski <cezary.rojewski@intel.com>
>> Sent: Tuesday, December 9, 2025 4:06 AM
>> To: Oder Chiou <oder_chiou@realtek.com>
>> Cc: perex@perex.cz; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
>> alsa-devel@alsa-project.org; Flove(HsinFu) <flove@realtek.com>; Shuming [范
>> 書銘] <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.com>; Derek [方德
>> 義] <derek.fang@realtek.com>; broonie@kernel.org; lgirdwood@gmail.com;
>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org
>> Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the
>> ALC5575

...

>>> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
>>> +static void rt5575_fw_load_by_spi(const struct firmware *fw, void *context)
>>
>> So, rt5575_spi_burst_write(), a wrapper for spi_write(), is exported to
>> be available outside of the rt5575-spi module while its only user,
>> rt5575_fw_load_by_spi(), which performs no I2C-specific tasks, is found
>> with the common, rt5575.c file?
> 
> There are few I2C r/w in rt5575_fw_load_by_spi().

It's all abstracted away by regmap.

> 
> But the SPI load firmware function can move to rt5575-spi.c.
> The rt5575_spi_fw_load() will do all firmware load related works, and it
> will return request_firmware_xxx() result.
> The rt5575_fw_load_by_spi() will be implement as following, and it will put
> into the bottom of rt5575_i2c_probe().

Did you try my suggestions, compiled them and tested before following 
up? The above looks like an evasion-tactic.

> 
> rt5575_fw_load_by_spi()
> {
> 	...
> 
> 	regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
> 	regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
> 	regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
> 
> 	ret = rt5575_spi_fw_load();
> 	if (ret) {
> 		dev_err(dev, "Load firmware failure: %d\n", ret);
> 		return ENODEV;
> 	}
> 
> 	regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
> 	regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
> 
> 	regmap_read_poll_timeout();
> 	if (ret) {
> 		dev_err(dev, "Run firmware failure: %d\n", ret);
> 		return ENODEV;
> 	}
> 
> 	...
> }
> 
>> We can do better.  There are couple options here, one of them consists of:
>>
>> 1) privatize rt5575_spi_burst_write()
>> 2) make rt5575_fw_load_by_spi() public
>> 3) change rt5575_fw_load_by_spi() from void to int and return
>> request_firmware_xxx() result
>> 4) reword to rt5575_spi_fw_load() to match its friends
>>
>> In regard to 1), have a #if-else preproc added to rt5575.h that governs
>> the implementation of said function.  If xxx_RT5575_SPI is disabled, let
>> is be a stub that returns 0.
>>
>> In regard to 2), please do not ignore failures from firmware loading,
>> that's a recurring point in this review and keeps being ignored.  No,
>> async-firmware loading in not the answer why potential errors are left
>> unhandled.
>>
>> Another option, perhaps a better one is to have both
>> rt5575_spi_burst_write() and rt5575_spi_fw_load() privatized and move
>> the firmware-loading to the SPI-device probe.  See my comments targeting
>> rt5575_probe().
>>
>>> +{
>>> +     struct rt5575_priv *rt5575 = context;
>>> +     struct i2c_client *i2c = rt5575->i2c;
>>
>> The whole reason this function needs i2c_client is ->dev retrieval.
>> Let's simplify by listing 'struct device *dev' as an argument instead.
>> With that, your function's argument list is also more explicit.
>>
>>> +     const struct firmware *firmware;
>>> +     static const char * const fw_path[] = {
>>> +             "realtek/rt5575/rt5575_fw2.bin",
>>> +             "realtek/rt5575/rt5575_fw3.bin",
>>> +             "realtek/rt5575/rt5575_fw4.bin"
>>> +     };
>>> +     static const u32 fw_addr[] = { 0x5f600000, 0x5f7fe000, 0x5f7ff000 };
>>> +     int i, ret;
>>> +
>>> +     regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
>>> +     regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
>>> +     regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
>>> +
>>> +     rt5575_spi_burst_write(0x5f400000, fw->data, fw->size);
>>> +     release_firmware(fw);
>>> +
>>> +     for (i = 0; i < ARRAY_SIZE(fw_addr); i++) {
>>> +             ret = request_firmware(&firmware, fw_path[i], &i2c->dev);
>>> +             if (!ret) {
>>> +                     rt5575_spi_burst_write(fw_addr[i],
>> firmware->data, firmware->size);
>>> +                     release_firmware(firmware);
>>> +             } else {
>>> +                     dev_err(&i2c->dev, "Request firmware failure:
>> %d\n", ret);
>>> +                     return;
>>> +             }
>>> +     }
>>> +
>>> +     regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
>>> +
>>> +     regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
>>> +
>>> +     regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT,
>> ret, !ret, 100000, 10000000);
>>> +
>>> +     if (ret)
>>> +             dev_err(&i2c->dev, "Run firmware failure: %d\n", ret);
>>> +}
>>> +#endif

...

>>> +static int rt5575_probe(struct snd_soc_component *component)
>>> +{
>>> +     struct rt5575_priv *rt5575 =
>> snd_soc_component_get_drvdata(component);
>>> +     struct device *dev = component->dev;
>>> +
>>> +     rt5575->component = component;
>>> +
>>> +     dev_info(dev, "Private ID: %llx\n", rt5575_get_priv_id(rt5575));
>>> +
>>> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
>>> +     if (of_device_is_compatible(dev->of_node,
>> rt5575_of_match[1].compatible))
>>> +             request_firmware_nowait(THIS_MODULE,
>> FW_ACTION_UEVENT,
>>
>>
>> An ASoC card is typically a mariage of platform-component (e.g.: SoC
>> level DSP) and a codec-component (e.g.: rt5575).  If for any reason the
>> platform-component becomes unloaded, codec-component will also be.
>> When
>> the platform-component becomes available again, the
>> codec-component->probe() would be invoked again - firmware would be
>> loaded again.  Is this the desired behaviour?
>>
>> To answer that, the follow up question is:  Is the firmware-loading for
>> this particular solution, a chip -level operation or, a sound-card
>> -level operation?  Typically firmware-loading is the former.  Once
>> succeeeds, an ASoC component can be registered.  There is no reason to
>> register ASoC component, which is mainly used for PCM/streaming reasons,
>> if the preliminary setup - firmware-loading - is unsuccefull.
>>
>> Perhaps a good approach is to move the firmware loading to the
>> SPI-device's probe()!
> 
> But before the firmware-loading, I2C commands are needed. The SPI
> firmware-loading cannot be independent by I2C.

 From the design perspective, we're dealing with up to components and 
somewhat of parent (I2C) <- child (SPI) relation.

Code should make sure a child is never probed before the parent is 
operational.

1) boot I2C, init regmaps
2) boot SPI, load firmware
3) register ASoC component if 1) and 2) succeed
