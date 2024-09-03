Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2896A1F6
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 17:18:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C668DE;
	Tue,  3 Sep 2024 17:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C668DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725376703;
	bh=gA79svbUL60kpKVxjbd31g8Kxlxb0r6DkfkVLV0llh4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rS3uvJ0pl+BfQAcOq4nI0YKJo+uI8cgg7L72nQtOkfHMtNUebIXe/nNsuk9Z19GQE
	 KLObg5qlFog45eCK/vdYxN/mDsNl2MdwxNGRUZTrGwkwX9k84RuH2vHvjk68PHUDR8
	 U8Mi1gkldm6f80+SFA3flF2eZ/U9ipgodGSLuWx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 193E1F804FC; Tue,  3 Sep 2024 17:17:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3F0BF8016C;
	Tue,  3 Sep 2024 17:17:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48BB8F80199; Tue,  3 Sep 2024 17:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EDBCF800E9
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 17:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDBCF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QOm9iv39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725376670; x=1756912670;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gA79svbUL60kpKVxjbd31g8Kxlxb0r6DkfkVLV0llh4=;
  b=QOm9iv39uUYyx5dcBBIcpwVZcVazauc5NAe59rUVY4npJybnCXFKk4TZ
   sFNGKYdGOneKIzb75dpIbKUf8rr14i9fueYzVo5LsrT87g4R6NXewScw4
   cQ6BS4eBMZfXn0GPpSLtmvrxV4FuQpyFKWf+Qxc6ilXDJeC2xB6D04e8Y
   WWQF6R2fPFGHGiBjMpTsMjb6VN6C5WY1Xv1P3gauw0BJfryqaiZcmLwAv
   IY9XT8Lw1y5IZTMdcm1HZT1phtm/aNAYiGdRQadLrn+5paB88SLklCnLL
   1YDi6iGM/jjj8TEd3ZQiP2QaYhf+FBKYNxPt9kI9Qb6iD3M6q4mRchYTI
   w==;
X-CSE-ConnectionGUID: zNxkOLk3Qw6dNoAEu9qsUQ==
X-CSE-MsgGUID: Xw/0yjNmSQi6L996gKxjrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35138769"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600";
   d="scan'208";a="35138769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 08:17:44 -0700
X-CSE-ConnectionGUID: 7ZFeiSCKSTCC83WhGA2DcA==
X-CSE-MsgGUID: 1ta4tnS8SF+8FCnA1KUnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600";
   d="scan'208";a="69741485"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 08:17:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 08:17:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 08:17:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 08:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUthKMRUoboD6HEbOyPpnXZyp2X+SnuJtpLpbJF2zGYs/fvqtOm/bHAZ9ncUAJkrcLNMcc8luo5v3wc3+uZa0LeCcu4KgsMLayQ26uLJsC3NpoDiBV14bI2/YngySI1istiXpwAQU7fMQ9dsU/wJCqkGKzEMVodFOlYol1IjzomWgOiPhUE9q0hpZ/J4VG6agUtHSN2QZsjnMhY7cTluk/eaytBoivlAvftA0/8Tnvdf2s/qNc1sRGE+fHAg3t/HTyDK2WMgPcNjO+mbQ/Hh1pVKqMo5jHtzT+F6gqOROF0nEPmljONFk+BrKgZ7D5RjXJvlJcDnZhpz/PjMP7vOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA79svbUL60kpKVxjbd31g8Kxlxb0r6DkfkVLV0llh4=;
 b=E/5U255n9vEUbwaCTsoYQP6Ph3AZYQ/5Gr1aey8CeSSCzSudxvDJH319ItbDdcX5lzn98URMMKwz7nUrg3eQxcUfh/fi9fqgdKu9GyXkGOyCef9a+rfxqrGge1JhRUqDupADpZAVxFoZ8sAR+A3VwNPPSludyX5FemSJIDfxV4jW/qlC+eQk5ngX9OUI/cV6khYA90Rq7XpYz6/Ac8Oc7BXJTDePwFAAkTbRlqnwc3ugnhIpWZXVuquOESmhLDtdvDKhZZ5jbzRX5W2iioYeWLogmbYjsB38elIGugFKuy0QstIrhIsyIvoB1Ic/DtLIiZUujH/seRCB7p2xE4x8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DS7PR11MB7739.namprd11.prod.outlook.com (2603:10b6:8:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 15:17:39 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 15:17:39 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Liao, Bard"
	<yung-chuan.liao@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: "Kale, Sanyog R" <sanyog.r.kale@intel.com>, Shreyas NC
	<shreyas.nc@intel.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
Thread-Topic: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
Thread-Index: AQHa/dPIv+IuF9PHKU+qr1Y/gjKPvrJGA+0AgAAiMHA=
Date: Tue, 3 Sep 2024 15:17:39 +0000
Message-ID: 
 <SJ2PR11MB84242BC3EAED16BEE6B46F85FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
 <ZqngD56bXkx6vGma@matsya>
 <b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com>
 <f5110f23-6d73-45b5-87a3-380bb70b9ac8@linaro.org>
In-Reply-To: <f5110f23-6d73-45b5-87a3-380bb70b9ac8@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DS7PR11MB7739:EE_
x-ms-office365-filtering-correlation-id: c496a633-7226-4fdb-ed82-08dccc2b8c8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QmgwRXMrWjNBNDZRTFNLR29tVnBzbmZLWnp3dkszSkhYVkFqQmM3UnhMZ2ZO?=
 =?utf-8?B?a2FZR1MvcXVya3FXNi9DZk5RQmxodU9CRWQ3T0xCSWI2TE1XMEkwcUN6MUJz?=
 =?utf-8?B?d1U4Z2RYY0xJR2pjeWJxTFNoejIxOW9OK2Fja0pEZ3lrOG00Q0czbFB4eWNX?=
 =?utf-8?B?bGhmTHpSVHlveFVXTU95ZVl6SStUMURWbDZBY3ZvTnFmWENJTDNRaUFuanZU?=
 =?utf-8?B?NE9ucjVReThNSm5KeWcvaWFjQklTY1F1bFVldE9YZVU5cVovM3pqTHBSVXhC?=
 =?utf-8?B?SmxDQXY1S0EyU1UraDF2a3BMcFV0QXJrVjNvUnVZcDhhNkcyZlZWMUpzWWE5?=
 =?utf-8?B?cGQwVFVvRlBWdFlsRzZaQmZEWG5PeUtCZDhEYjd2TGVxOUtCa09uS1krSTZa?=
 =?utf-8?B?UDJkejdlVkc4MERYMnh6cmltZnp5a0hxUCtES3FhQWxHNjZFSHJvaVFOcGRn?=
 =?utf-8?B?cXdFOVNva3MzRDdGNXJzeXN4NjlyVldYRVk2U3FvTWE0Mm5SRDZra3VPZEdz?=
 =?utf-8?B?MWxIcmJFWkYvbjNJSExFNTlyR05pTnZ4aHFVSExDbTZ3WGNOd1ByVG9mUytB?=
 =?utf-8?B?V0h0bXk2dUs3YXFObnhicHhYQWVhYXV0NkJzZm1vWXcrUlN5bzIzS2NLcElD?=
 =?utf-8?B?R2lUNFF0MzlhRXVWRmJKemdadkgvWUR4d2tHZmtCbDl4YTJJQXVHQWhYYmJq?=
 =?utf-8?B?TEdaaVZ1S0VQd1k3aXVZc1pKQkZnd09GZWF3QW5MT25nNVRKMWpydmVyQWJH?=
 =?utf-8?B?OUJjNU5YMUtLanZIb0lTUXJnWEoxcHVmdDFtOEdBam5xbnk1THNDZnJhNmxk?=
 =?utf-8?B?TnNrOWYyVTVmUzFyck5ldjlsWWlBVVkwYkFjWVYyUUlrK2wweER3M09UbEdT?=
 =?utf-8?B?MmE5aWZveWt3NWp3UWtCb2dyNnpseTZlYnRuc2E1UEEwVjRObk8rdVcvV0xH?=
 =?utf-8?B?aHlKQXF6bVN0Tnp5eGtqZFVlbGw3V3UwRFQyV2FPT0lMbDAxNUhKaXRPT1hR?=
 =?utf-8?B?MVZvMzZ0SGk4ZEw4M3d0RFBOUkxqVkxSN2wxQlg0YkErdEI5V2drUUFWak9R?=
 =?utf-8?B?Z1phWWt1YlVTYkhGeWpFZ2M4SStPOG1ZL01oRWV2N216bFY4QW5ZTDZPUnpI?=
 =?utf-8?B?ODhORE5kcVRKUTRIRkFmN1ZpWG5OelMzZ0t2N21pdUFOOGlRbkV6TTA4VjJu?=
 =?utf-8?B?ZmQ5L24yZmdrS24yUE1YajArU1l1N3g3QVpoWDJMUnIyL2xxS1luTmttRVBS?=
 =?utf-8?B?VG5hRTAzNTBDeGNDbUVLb3NyaFVxNktwQjBiUStZUHArMi9kOUVKem94UWRk?=
 =?utf-8?B?MUVTMXg2bFEzcDBRTHhwQjUxSHJlU25id2JZTGRKNldJWnFzRkZLeEh1MktO?=
 =?utf-8?B?Y1hlS01DTUs1c08vbUNtS0lKV2ozQkJrUEp2NU5FZVMvTzc2K0NlbC9zZDVV?=
 =?utf-8?B?M1ZLazg3OWRMY1VDQXBzUlpIVUhGb1hVemMxRHFKUllYb1FHZ0hFRmFNWCtV?=
 =?utf-8?B?ZFB1RStMUmF2TmlqdGwrRUpsMmxFb2N3aUxqVTQrNzhsVE9Td1pDdUxUWDRE?=
 =?utf-8?B?YWZPRWRVOTNLb1NGeCtOeHhsLzRPckM2S3VMZnlMVTV1UmUzSmRwQXpMZGVh?=
 =?utf-8?B?QnRDQkdsczdHbWZoYVd0SnhqU09UZDcxYktVbDVvRGVBYndIM3dMalhnTjYv?=
 =?utf-8?B?ZUlOVCsxZGk1WWF6YUJHWC9hbk40Y1hNSUVGTmdyLzVyRkR6UFhxSWwxQTBK?=
 =?utf-8?B?UzhqSkQ4eWdTc2o3ak56Q1V6V2EwQTNzNnJqaWJWWE5pVDE2b3hMM0ZUSTVx?=
 =?utf-8?B?TGRHTG9ZOXFQTFRpTEQ0citUV1ppN2JuUlRMVjRaK21HMTI2WHMxTnVyYkZt?=
 =?utf-8?B?UXUzNHJrSFRZVmgwTWRwUEwvY1c5UVdzSGdMdkJqelVwOFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z2I2T2RDMlZXemRXTmMvM3FnOVVyMStsS1ZLMXovcy8vREVNQm9iK3oyamF5?=
 =?utf-8?B?MVFoVFcxWU56OU52UUVmM0VaeGVITmdqam1KNjE1eWdZdHpTbVc0bW9QYVFG?=
 =?utf-8?B?Q1MwNVVpc1o4R2gvdm5mZDlabTNzbHo5RHFtREgzMkdPTEtwVHJ5ci9ONUI1?=
 =?utf-8?B?Ym84QndPb1J5RHBRWFlid0JmeElMZWhWbkVsMDFmSnJpYWNCNTA1WHF2Rm1R?=
 =?utf-8?B?K3A3WWJ5dXdXM21HazdqRnY3aE1OR3d0OERMUFpQVlIwdVBaYXdKcE4rQ0tp?=
 =?utf-8?B?VUhwd04xTFQzdVRiaG5YVmNyWGdOdmpqb09ETnJKNlFrd0JNbTFlM1N3aVp3?=
 =?utf-8?B?eHBGRW0wT0FvamFNK2daQ2M1amdPdlZ1UnFBakNDeFF2R0g5T2lGeDZiWEhZ?=
 =?utf-8?B?bVlHNUlJWmQxVUFDWXNsbnRaMVRxdW5JUURWeGlwSTV3WlpJNUtNb2ptdDRv?=
 =?utf-8?B?a0lFY0lINmV0eHYxQVhpU3dzeWVjQWo1RlBqRjlnVTh4ckhnVm1ZeGs4T1hC?=
 =?utf-8?B?LzhtRW5tdDZOcmQ0T1pxVkkyTWYrREFNNEJ2bXZCQ3RzYm5FTmNidzdJNVJq?=
 =?utf-8?B?OCt0VGVkUmFabXFwY1Y3K01wTnkvUFFiV2RwdW9raTVBVGQyK2plc29xcS83?=
 =?utf-8?B?Vk5maXhvT1p5VlRPdFVvdzRSWnoyR1ZzS0M0Wnp6OTRJVTNHQ04zdVN1UUd1?=
 =?utf-8?B?NUJ1aWIyRzRMbDJOL3lYaWV0UFU2U1dEQzNobkZwenpTb1grOGI4OUpkckdE?=
 =?utf-8?B?eG1uM29RUGZoRXVJYU9adk5ia3RJKzR1TzFSVC9IQ1QxdGo5MnNQTENRT0to?=
 =?utf-8?B?bTYyOWhtMVE4Zk5aLzJKRGFESDUxR3hTYWYydWtUdnFDaUZjSlVaMWNsVUVZ?=
 =?utf-8?B?MHFxN2hNU2ZPUC9HS2dHVDd5RDB4QVpDU28vdkxYeVZESk5URzRSRzJ6ZGs2?=
 =?utf-8?B?QkhaZ3hKS0hFSHpEZ2tGWUQza2pJVTJjM1UzY2ZTbEJkWUVxT2FjaXp4ZWVD?=
 =?utf-8?B?QmtqMC9nWnNPZ0VuSFFkOW4xaWVoV0hxdEtwTUdHNXl2WWhXUnpubmgwNnVC?=
 =?utf-8?B?eWNoM3RnUzlzR2w3Q2xEUjQveUI0akpiK1ZOZUNSTFVhdHg3UlAxRndGT1Mw?=
 =?utf-8?B?aWI2UW5EdDJuODdjVkdKaUV2bDVJMlY3dld3NW1NeXM4N3JYWlVWc3ExTkFW?=
 =?utf-8?B?Y3loUk1XelRWNXFKMkk0OVRHSzVSSHhQYjJkUGxGSUtvU2N3STNOZDZYOXEz?=
 =?utf-8?B?aDhiTzBZMjEzL1o2dkh1Z1BzZkNpNTlYUXpIMlh2VEtFSndoSjl1VWZmZ1Q3?=
 =?utf-8?B?Q1ZGSUpWVFcyaFJhZkE5MVBpeVpBTUZwZktzYkp4bWZ3Y3Zuejc0UGJ0a0dv?=
 =?utf-8?B?bUJXKzFHL1k1YVhCa2RuNTR2YUtLSnBKcVRBenpIZ2JjQWE4UnNSWmVIWnh4?=
 =?utf-8?B?VU9GcXRlMFFJZC9uZEQ3NGF0OGpTT2NYdEVqaUp2Q2FBdEtoMXJSWTJvd3lV?=
 =?utf-8?B?VkYydUZzNE4wR2JrQ3NEZDgyTDBMNEd3cktzdlRDVnRzQk9paGFQUXVZby90?=
 =?utf-8?B?d1JZNUZNckk5WUtORklveEJ4dk5nenNMR29lUFdiSHEraDlvUFVGbUpJb2RL?=
 =?utf-8?B?QnRqM1QrbklVc0NZbitiM0ZXTkhLZFMweDV1Y3lmY1hmdk5PRlV3Lzh6SFJZ?=
 =?utf-8?B?LzBWeFVKQVN5bUFMWGVlMzd0ZEpMQzJSMzhKVGp2L0ZSKy9KTm56YWJaOXRj?=
 =?utf-8?B?QXQxSXorZHFCdC9rU2Y2b2VaRTBxc1pFS1JpUS9CY2FWK0lFYkFlN3NYeTlv?=
 =?utf-8?B?VW5kb3V1NVpYOTNIQVVsdE5ZMklabVZjcEx1R0hZK2Q5Q1BZRkdRV2RoemIx?=
 =?utf-8?B?VDFYRktpQ3hhNGhNYXBTaHhpSFlidjZ6Vy9yN2E3b3BicVkzK3pTZUVqYVZa?=
 =?utf-8?B?SnlMYWpNbUZpTVdYSzRaOXpuOGxQUUZJSHhzY2VGNldOVXk1NlR0azdscFJw?=
 =?utf-8?B?cjlVR3lkZWxackNWR25RWWhIMzFkVG4vVXg3RzhPMnM3SVNydHY1WktqQW9K?=
 =?utf-8?B?NlQrKzM5a1lRMGtJblE5MzU5dVNFYUVOcVQ2Qkptd0hNQ3VGT2hUbFhpTHc4?=
 =?utf-8?Q?JUug=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c496a633-7226-4fdb-ed82-08dccc2b8c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 15:17:39.3406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4+Uxy+ebB/+xChhh1V1bDhr1nCvL6NUfV/XKAdpVYwM+HxiSDsEUmNH2ULENINga3xGGTj4N0zFqQBpesm/Jiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7739
X-OriginatorOrg: intel.com
Message-ID-Hash: T4OIIA4W3577CWQAYO5GV3QYISKP5W63
X-Message-ID-Hash: T4OIIA4W3577CWQAYO5GV3QYISKP5W63
X-MailFrom: bard.liao@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4OIIA4W3577CWQAYO5GV3QYISKP5W63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRl
bWJlciAzLCAyMDI0IDg6NTAgUE0NCj4gVG86IExpYW8sIEJhcmQgPHl1bmctY2h1YW4ubGlhb0Bs
aW51eC5pbnRlbC5jb20+OyBWaW5vZCBLb3VsDQo+IDx2a291bEBrZXJuZWwub3JnPjsgUGllcnJl
LUxvdWlzIEJvc3NhcnQgPHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+
DQo+IENjOiBLYWxlLCBTYW55b2cgUiA8c2FueW9nLnIua2FsZUBpbnRlbC5jb20+OyBTaHJleWFz
IE5DDQo+IDxzaHJleWFzLm5jQGludGVsLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc7IExpYW8sIEJhcmQNCj4gPGJhcmQubGlhb0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHNvdW5kd2lyZTogc3RyZWFtOiBmaXggcHJvZ3JhbW1pbmcgc2xhdmUgcG9ydHMgZm9y
IG5vbi0NCj4gY29udGlub3VzIHBvcnQgbWFwcw0KPiANCj4gT24gMDMvMDkvMjAyNCAwOTozNCwg
TGlhbywgQmFyZCB3cm90ZToNCj4gPg0KPiA+IE9uIDcvMzEvMjAyNCAyOjU2IFBNLCBWaW5vZCBL
b3VsIHdyb3RlOg0KPiA+PiBPbiAyOS0wNy0yNCwgMTY6MjUsIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0
IHdyb3RlOg0KPiA+Pj4NCj4gPj4+IE9uIDcvMjkvMjQgMTY6MDEsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+ID4+Pj4gVHdvIGJpdG1hc2tzIGluICdzdHJ1Y3Qgc2R3X3NsYXZlX3Byb3An
IC0gJ3NvdXJjZV9wb3J0cycgYW5kDQo+ID4+Pj4gJ3NpbmtfcG9ydHMnIC0gZGVmaW5lIHdoaWNo
IHBvcnRzIHRvIHByb2dyYW0gaW4NCj4gPj4+PiBzZHdfcHJvZ3JhbV9zbGF2ZV9wb3J0X3BhcmFt
cygpLiAgVGhlIG1hc2tzIGFyZSB1c2VkIHRvIGdldCB0aGUNCj4gPj4+PiBhcHByb3ByaWF0ZSBk
YXRhIHBvcnQgcHJvcGVydGllcyAoJ3N0cnVjdCBzZHdfZ2V0X3NsYXZlX2Rwbl9wcm9wJykNCj4g
ZnJvbQ0KPiA+Pj4+IGFuIGFycmF5Lg0KPiA+Pj4+DQo+ID4+Pj4gQml0bWFza3MgY2FuIGJlIG5v
bi1jb250aW51b3VzIG9yIGNhbiBzdGFydCBmcm9tIGluZGV4IGRpZmZlcmVudCB0aGFuIDAsDQo+
ID4+Pj4gdGh1cyB3aGVuIGxvb2tpbmcgZm9yIG1hdGNoaW5nIHBvcnQgcHJvcGVydHkgZm9yIGdp
dmVuIHBvcnQsIHdlIG11c3QNCj4gPj4+PiBpdGVyYXRlIG92ZXIgbWFzayBiaXRzLCBub3QgZnJv
bSAwIHVwIHRvIG51bWJlciBvZiBwb3J0cy4NCj4gPj4+Pg0KPiA+Pj4+IFRoaXMgZml4ZXMgYWxs
b2NhdGlvbiBhbmQgcHJvZ3JhbW1pbmcgc2xhdmUgcG9ydHMsIHdoZW4gYSBzb3VyY2Ugb3Igc2lu
aw0KPiA+Pj4+IG1hc2tzIHN0YXJ0IGZyb20gZnVydGhlciBpbmRleC4NCj4gPj4+Pg0KPiA+Pj4+
IEZpeGVzOiBmODEwMWM3NGFhNTQgKCJzb3VuZHdpcmU6IEFkZCBNYXN0ZXIgYW5kIFNsYXZlIHBv
cnQNCj4gcHJvZ3JhbW1pbmciKQ0KPiA+Pj4+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4N
Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+PiBUaGlzIGlzIGEgdmFsaWQgY2hhbmdlIHRvIG9wdGlt
aXplIGhvdyB0aGUgcG9ydCBhcmUgYWNjZXNzZWQuDQo+ID4+Pg0KPiA+Pj4gQnV0IHRoZSBjb21t
aXQgbWVzc2FnZSBpcyBub3QgY29tcGxldGVseSBjbGVhciwgdGhlIGFsbG9jYXRpb24gaW4NCj4g
Pj4+IG1pcGlfZGlzY28uYyBpcyBub3QgbW9kaWZpZWQgYW5kIEkgZG9uJ3QgdGhpbmsgdGhlcmUn
cyBhbnl0aGluZyB0aGF0DQo+ID4+PiB3b3VsZCBjcmFzaC4gSWYgdGhlcmUgYXJlIG5vbi1jb250
aWd1b3VzIHBvcnRzLCB3ZSB3aWxsIHN0aWxsIGFsbG9jYXRlDQo+ID4+PiBzcGFjZSB0aGF0IHdp
bGwgbm90IGJlIGluaXRpYWxpemVkL3VzZWQuDQo+ID4+Pg0KPiA+Pj4gCS8qIEFsbG9jYXRlIG1l
bW9yeSBmb3Igc2V0IGJpdHMgaW4gcG9ydCBsaXN0cyAqLw0KPiA+Pj4gCW52YWwgPSBod2VpZ2h0
MzIocHJvcC0+c291cmNlX3BvcnRzKTsNCj4gPj4+IAlwcm9wLT5zcmNfZHBuX3Byb3AgPSBkZXZt
X2tjYWxsb2MoJnNsYXZlLT5kZXYsIG52YWwsDQo+ID4+PiAJCQkJCSAgc2l6ZW9mKCpwcm9wLT5z
cmNfZHBuX3Byb3ApLA0KPiA+Pj4gCQkJCQkgIEdGUF9LRVJORUwpOw0KPiA+Pj4gCWlmICghcHJv
cC0+c3JjX2Rwbl9wcm9wKQ0KPiA+Pj4gCQlyZXR1cm4gLUVOT01FTTsNCj4gPj4+DQo+ID4+PiAJ
LyogUmVhZCBkcG4gcHJvcGVydGllcyBmb3Igc291cmNlIHBvcnQocykgKi8NCj4gPj4+IAlzZHdf
c2xhdmVfcmVhZF9kcG4oc2xhdmUsIHByb3AtPnNyY19kcG5fcHJvcCwgbnZhbCwNCj4gPj4+IAkJ
CSAgIHByb3AtPnNvdXJjZV9wb3J0cywgInNvdXJjZSIpOw0KPiA+Pj4NCj4gPj4+IElPVywgdGhp
cyBpcyBhIHZhbGlkIGNoYW5nZSwgYnV0IGl0J3MgYW4gb3B0aW1pemF0aW9uLCBub3QgYSBmaXgg
aW4gdGhlDQo+ID4+PiB1c3VhbCBzZW5zZSBvZiAna2VybmVsIG9vcHMgb3RoZXJ3aXNlJy4NCj4g
Pj4+DQo+ID4+PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nPw0KPiA+Pj4NCj4gPj4+IEJUVywgdGhl
IG5vdGlvbiBvZiBEUG4gaXMgdGhhdCBuID4gMC4gRFAwIGlzIGEgc3BlY2lhbCBjYXNlIHdpdGgN
Cj4gPj4+IGRpZmZlcmVudCBwcm9wZXJ0aWVzLCBCSVQoMCkgY2Fubm90IGJlIHNldCBmb3IgZWl0
aGVyIG9mIHRoZSBzaW5rL3NvdXJjZQ0KPiA+Pj4gcG9ydCBiaXRtYXNrLg0KPiA+PiBUaGUgZml4
IHNlZW1zIHJpZ2h0IHRvIG1lLCB3ZSBjYW5ub3QgaGF2ZSBhc3N1bXB0aW9uIHRoYXQgcG9ydHMg
YXJlDQo+ID4+IGNvbnRhZ2lvdXMsIHNvIHdlIG5lZWQgdG8gaXRlcmF0ZSBvdmVyIGFsbCB2YWxp
ZCBwb3J0cyBhbmQgbm90IHRvIE4NCj4gPj4gcG9ydHMgd2hpY2ggY29kZSBkb2VzIG5vdyENCj4g
Pg0KPiA+DQo+ID4gU29ycnkgdG8ganVtcCBpbiBhZnRlciB0aGUgY29tbWl0IHdhcyBhcHBsaWVk
LiBCdXQsIGl0IGJyZWFrcyBteSB0ZXN0Lg0KPiA+DQo+ID4gVGhlIHBvaW50IGlzIHRoYXQgZHBu
X3Byb3BbaV0ubnVtIHdoZXJlIHRoZSBpIGlzIHRoZSBhcnJheSBpbmRleCwgYW5kDQo+ID4NCj4g
PiBudW0gaXMgdGhlIHBvcnQgbnVtYmVyLiBTbywgYGZvciAoaSA9IDA7IGkgPCBudW1fcG9ydHM7
IGkrKylgIHdpbGwgaXRlcmF0ZQ0KPiANCj4gUGxlYXNlIGZpeCB5b3VyIGVtYWlsIGNsaWVudCBz
byBpdCB3aWxsIHdyaXRlIHByb3BlciBwYXJhZ3JhcGhzLg0KPiBJbnNlcnRpbmcgYmxhbmsgbGlu
ZXMgYWZ0ZXIgZWFjaCBzZW50ZW5jZSByZWR1Y2VzIHRoZSByZWFkYWJpbGl0eS4NCj4gDQo+ID4N
Cj4gPiBvdmVyIGFsbCB2YWxpZCBwb3J0cy4NCj4gPg0KPiA+IFdlIGNhbiBzZWUgaW4gYmVsb3cg
ZHJpdmVycy9zb3VuZHdpcmUvbWlwaV9kaXNjby5jDQo+ID4NCj4gPiAgwqDCoMKgwqDCoMKgwqAg
bnZhbCA9IGh3ZWlnaHQzMihwcm9wLT5zaW5rX3BvcnRzKTsNCj4gPg0KPiA+ICDCoMKgwqDCoMKg
wqDCoCBwcm9wLT5zaW5rX2Rwbl9wcm9wID0gZGV2bV9rY2FsbG9jKCZzbGF2ZS0+ZGV2LCBudmFs
LA0KPiA+DQo+ID4gc2l6ZW9mKCpwcm9wLT5zaW5rX2Rwbl9wcm9wKSwNCj4gPg0KPiA+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7DQo+ID4NCj4gPiBBbmQgc2R3X3Ns
YXZlX3JlYWRfZHBuKCkgc2V0IGRhdGEgcG9ydCBwcm9wZXJ0aWVzIG9uZSBieSBvbmUuDQo+ID4N
Cj4gPiBgZm9yX2VhY2hfc2V0X2JpdChpLCAmbWFzaywgMzIpYCB3aWxsIGJyZWFrIHRoZSBzeXN0
ZW0gd2hlbiBwb3J0IG51bWJlcnMNCj4gDQo+IFRoZSBlbnRpcmUgcG9pbnQgb2YgdGhlIGNvbW1p
dCBpcyB0byBmaXggaXQgZm9yIG5vbi1jb250aW51b3VzIG1hc2tzLg0KPiBBbmQgSSB0ZXN0ZWQg
aXQgd2l0aCBub24tY29udGludW91cyBtYXNrcy4NCj4gDQo+ID4NCj4gPiBhcmUgbm90IGNvbnRp
bnVvdXMuIEZvciBleGFtcGxlLCBhIGNvZGVjIGhhcyBzb3VyY2UgcG9ydCBudW1iZXIgPSAxIGFu
ZCAzLA0KPiANCj4gV2hpY2ggY29kZWM/IENhbiB5b3UgZ2l2ZSBhIGxpbmsgdG8gZXhhY3QgbGlu
ZSBpbiAqVVBTVFJFQU0qIGtlcm5lbC4NCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL3NvdW5kL3NvYy9jb2Rl
Y3MvcnQ3MjItc2RjYS1zZHcuYyNuMjE3DQpwcm9wLT5zb3VyY2VfcG9ydHMgPSBCSVQoNikgfCBC
SVQoMik7IC8qIEJJVE1BUDogMDEwMDAxMDAgKi8NCnByb3AtPnNpbmtfcG9ydHMgPSBCSVQoMykg
fCBCSVQoMSk7IC8qIEJJVE1BUDogIDAwMDAxMDEwICovCQ0KDQo+IA0KPiA+DQo+ID4gdGhlbiBk
cG5fcHJvcFswXS5udW0gPSAxIGFuZCBkcG5fcHJvcFsxXS5udW0gPSAzLiBBbmQgd2UgbmVlZCB0
byBnbw0KPiA+DQo+ID4gdGhyb3V0aCBkcG5fcHJvcFswXSBhbmQgZHBuX3Byb3BbMV0gaW5zdGVh
ZCBvZiBkcG5fcHJvcFsxXSBhbmQNCj4gZHBuX3Byb3BbM10uDQo+ID4NCj4gDQo+IFdoYXQgYXJl
IHRoZSBzb3VyY2Ugb3Igc2luayBwb3J0cyBpbiB5b3VyIGNhc2U/IE1heWJlIHlvdSBqdXN0IGdl
bmVyYXRlDQo+IHdyb25nIG1hc2s/DQoNCkkgY2hlY2tlZCBteSBtYXNrIGlzIDB4YSB3aGVuIEkg
ZG8gYXBsYXkgYW5kIGl0IG1hdGNoZXMgdGhlIHNpbmtfcG9ydHMgb2YNCnRoZSBydDcyMiBjb2Rl
Yy4NCg0KPiANCj4gSXQncyBub3Qgb25seSBteSBwYXRjaCB3aGljaCB1c2VzIGZvcl9lYWNoX3Nl
dF9iaXQoKS4gc3lzZnNfc2xhdmVfZHBuDQo+IGRvZXMgdGhlIHNhbWUuDQoNCldoYXQgc3lzZnNf
c2xhdmVfZHBuIGRvZXMgaXMgDQogICAgICAgIGkgPSAwOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgDQogICAgICAgIGZvcl9lYWNoX3NldF9iaXQoYml0LCAmbWFzaywgMzIpIHsNCiAgICAgICAg
ICAgICAgICBpZiAoYml0ID09IE4pIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBz
cHJpbnRmKGJ1ZiwgZm9ybWF0X3N0cmluZywNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRwbltpXS5maWVsZCk7DQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAg
ICAgIGkrKzsNCiAgICAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICANCkl0IHVzZXMgYSB2
YXJpYWJsZSAiaSIgdG8gcmVwcmVzZW50IHRoZSBhcnJheSBpbmRleCBvZiBkcG5baV0uDQpCdXQs
IGl0IGlzIGZvcl9lYWNoX3NldF9iaXQoaSwgJm1hc2ssIDMyKSBpbiB5b3VyIHBhdGNoIGFuZCB0
aGUgdmFyaWFibGUgImkiDQp3aGljaCByZXByZXNlbnRzIGVhY2ggYml0IG9mIHRoZSBtYXNrIGlz
IHVzZWQgYXMgdGhlIGluZGV4IG9mIGRwbl9wcm9wW2ldLg0KDQpBZ2FpbiwgdGhlIHBvaW50IGlz
IHRoYXQgdGhlIGJpdHMgb2YgbWFzayBpcyBub3QgdGhlIGluZGV4IG9mIHRoZSBkcG5fcHJvcFtd
DQphcnJheS4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
