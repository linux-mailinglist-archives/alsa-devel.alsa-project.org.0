Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8D9947A8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 13:50:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2269384D;
	Tue,  8 Oct 2024 13:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2269384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728388224;
	bh=B3w2HEW6tEveI9a4PzhseKIm8juLFFVNycm4jOkMEvA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nl5MwN6ha30EMvsED/KP6U7PE1AJj4Uy8JDSE/Bql7TAgqTwGY71aS7rlhf2Lb2bq
	 D3TQf5jtgDBJxX+tw4Pe2AejTXZdpMGiWNzdfKSZ0XCO10DNKL7GoXKrNSkpjD4SDn
	 aQZ/8Si33hji1leP8pecI7Y0HmFPk9Eg9dgd1mPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1FCBF805BA; Tue,  8 Oct 2024 13:49:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7905CF80527;
	Tue,  8 Oct 2024 13:49:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8509EF80528; Tue,  8 Oct 2024 13:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 934FFF800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 13:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 934FFF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VBHzOWN7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728388181; x=1759924181;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B3w2HEW6tEveI9a4PzhseKIm8juLFFVNycm4jOkMEvA=;
  b=VBHzOWN7V2GiOXgSAOEl+5zkxDg8WFGVcJeRIE8a/Ct1Q3n54rWWe2Xo
   WKGQKVp7+ivQhGrRkRhEqsxDdei4XxQNlf7XPJiU3sedqrnTkkw8pKwzK
   K+gpGHheC3BSXCUaNf9l6m0gH56wuEFulKcZ4Qb048Ie0DH1g+yZEt9On
   BiyB4OMX0wPCgOo+ggEa+1tsHNVOVn9kwAoTuPH8MEQfo+h7eb3Nd5gMP
   bwFeXeURCw57YHtg6SPpL84kGdbI6IqZWHzJSRW4HCdO03cZ8KxkyrWKK
   DIAUtVASdMzwJkdN9KH1MAbwynBj+bHmL3lU6AGBQ7WJ8hr9xZrRHoyJb
   Q==;
X-CSE-ConnectionGUID: +75vCWC4RVGOWrFvhjYOnA==
X-CSE-MsgGUID: +PsGU7A0RMaZ48MYInb/nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38967915"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800";
   d="scan'208";a="38967915"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 04:49:19 -0700
X-CSE-ConnectionGUID: 5rlMqA0cRpCJ0e2hKcvtfQ==
X-CSE-MsgGUID: B38ZX5fwS8CvTAkTwk7Piw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800";
   d="scan'208";a="80595058"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 04:49:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 04:49:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 04:49:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 04:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5M9gX4vWzwuzWqUsa8HCVWOdzpN1OCPcGjxPGsCuvouJ4vbcWR1Drfwlj6w2I3fUmUtttNORJk4M4/ZVk22ODQVKnwlwPHh6Z34Bo3A3880uZzD6BRin05g3L0qQThVc/nScjkkoO5Zrt4AaQ6i2/B/deOG4JlCG0JBzAH/WFpaJjqYqo705FkMHpqZi6qfw7PUcDNvoSvpNo71PrchdgQczIR3TcgldeEld+/Mxnqmn0VI+aJKr92jMVbA8BirqQSCW6RZqiA5hudlQCM8FNzilYcilMFjxRRTtyBfCTX7zlrB96RSRMtyWaT5MHEzYXv/ImnZrNhl4E6tzeS6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3w2HEW6tEveI9a4PzhseKIm8juLFFVNycm4jOkMEvA=;
 b=p1BtS64dN6sB7I32iA0fYKQh30V5nYzsOCbOfC7TbPmY63+reHyJtxNxDUj1tESRF8oOcPI53FWJXZYGT802nZgI9u/lXWg/tmop1MmzowHIVyZLuJ4+r/0CEVaPhY+YhT6/G394tmbrHbK6hrKqGxZpmBnBnswhftC50wMUsNGuGSByGU+qEHvM++7Fg4BQ1NFkzMGJQ2v9J6mtf9rP989bwWtHlty5hjPd6p45DaS88cGaPZUlc/ca+lDWlhRBWXoTjqq/lHr8wV85fQdUEtxcZAwCqziHs1D1A2cCKIxIAcwQyoa5by+D/ACHtT1X95eYRS/flAzmqsf6xMvqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SJ0PR11MB5133.namprd11.prod.outlook.com (2603:10b6:a03:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 11:49:16 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::4053:18a0:f95:3b9c%6]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 11:49:15 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>, "M, Naveen" <naveen.m@intel.com>,
	"Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	=?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
	=?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH 1/2] ASoC: Intel: Add rt721-sdca support for PTL platform
Thread-Topic: [PATCH 1/2] ASoC: Intel: Add rt721-sdca support for PTL platform
Thread-Index: AdsZYBrTuHsKOMPIQSuYZeRXhOTjxwAF+XBQ
Date: Tue, 8 Oct 2024 11:49:15 +0000
Message-ID: 
 <SJ2PR11MB84240F2FD60DE0D6EEED044BFF7E2@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <cc2158ad467f45068bb3556ecb5a814d@realtek.com>
In-Reply-To: <cc2158ad467f45068bb3556ecb5a814d@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SJ0PR11MB5133:EE_
x-ms-office365-filtering-correlation-id: b8aba9fd-fe0b-42b9-b847-08dce78f3c69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?big5?B?eldtMzByRCtPOWxrcDNpYXBmbFVTTnNTRW8yWlVjMHhOMDA1aVBqdDBmTDNIU2dC?=
 =?big5?B?c1FYNWVtcXlleFdIb2Q3emNydWpETCtlUGx3UVpmUDc2bElzZFpDNmZ4OHQ4dXYz?=
 =?big5?B?R0NhN3h5YnRmTHlDTjF2T3ZjalpwYkxOOTdtekNUZWtmSnJBQzZINHBVUlA4UER0?=
 =?big5?B?eTJobkdmYzFxbXNxVGdjbVFYNkw1cVlTbkd1YmpFM29kb0lRVmZuU2ltU0gyUktj?=
 =?big5?B?aFZJcGY1Um9nV3ZNejBYaVdzVC9jS25iODNWSFV6ZkdYUTErMmI0a2l0R1dHZ3Zq?=
 =?big5?B?SGd6KzdvWDA2YWRLOVpyR0oybHhrQlRacml5Yk5BZDF5NGM2elVQNG53elRtRDlS?=
 =?big5?B?UW9BaWNhN0ZYcEtIbkRGdGNaNmdWMy94TFk5R2M5L0lWYUpvcjRpRXpiTmdNQWhV?=
 =?big5?B?ZWk1T3l6QzIxaENwT1VqWmlDOWl3cXRzdDI4bHBwaUt2L0p6a2w2VFB1N0RBemt3?=
 =?big5?B?dms0eWFyS0F1NElGcm5Bc3ppTk9ocTJsTG5PTlkxejFpb2RIQ0hUVlFlVHZwUUIx?=
 =?big5?B?NGxQL3Y0cVRYazRrdmpGR3o0dnJMaE4xaHhYVjdKSk1uQmY0SGZ0Q3FuUk92VTBD?=
 =?big5?B?SW40cWNXeHpLSzg5VlhaQmk3QlVIeW15aGFlMnVmM21SbFJyenI2ZjlWUFlIU0x3?=
 =?big5?B?NHJ6ejN0Vm81SmcwUjFGamNlNmxNSmRxcGlsbnBDdTRpN3ZSWUFBWmpVNG5hVGUy?=
 =?big5?B?S1FoeHpPdjdKemlZaFdBaGFYT0JBQW9HODl6V3IxR2lWYWVRc0hvQ28vZTR1QjNV?=
 =?big5?B?VlBoU3JqQ0YxWjVBMm5naEJPd01yZFRWR3pLVlhjaXIrQTQ2c0haVVIvbXAwSzBt?=
 =?big5?B?U2E1WXRmcFNMNm45d0V6b0E1RkxTT1BYbTlqVUtNVk50cXU3VzhUUnV6TVh6S2d2?=
 =?big5?B?NEE3NkV2YXBnZFF3YU9Lc01LVERyei9DUXVoOXgzU0VrY3c4QzNiMDFlbzczaUNE?=
 =?big5?B?SnZrekx3Qk5wdkk3RGhUY0RIcGVZWmFyZHdYZzl2dlZiVDBJdVVac3ZwTi8zdkJx?=
 =?big5?B?N0U3NS9SRlk5R2J3TytwNkIxeWkxL2YxVmJXVDMyRFpIbUtiQ1g0dlIybGFNU2tw?=
 =?big5?B?Qjh4clJFTzhYRWxPVXB1WkZjY2RZeU1nV3hpRmdEbVZXSlNtWUs0YzNPRnB0NnZB?=
 =?big5?B?dU5SMTY5bzUxeXZjdVUvaDBaQkZBQXRqa1BCOS9BT21Pc2tjODdLdnJlYVF4dml6?=
 =?big5?B?Y1BrM3dwaG9zY3JEMS9lYXR5QzVweDl6NnVQRVArZjMzZE03Vld6alN5d3UyTmJI?=
 =?big5?B?c21zZVFOYlRNUHdaNWdYUWNMenlsT2ZKSWdzYlNidjVld0UySW5RK0R1cGtHQk9E?=
 =?big5?B?S1d3cmNCS2lIRndMcThBVFllNWdPWG54TVZCWjA4NUEyY0orbE1Ob1NValBUQlBl?=
 =?big5?B?ZldLY1R5RktuUkJEN2JFeW5BMTVtaXVIajZleUM1SlZ2V25kdkIzRUZLSWV0dE0v?=
 =?big5?B?WFk2dEoram1CeExBQTVvK21PK094Y3lGbkkvOFVBNWFOZlo5YkozQmF4eklJa1pP?=
 =?big5?B?djY0R1Q1TTQrMktacjRzWGdtcmludngvVGV1NmU0T09ucDJhcWlKUW9uZEd6TlNh?=
 =?big5?B?L054VTh2Z2I4UTJDcHJhR29zaGNNUWZwRTFhRy9UQnNJVEFhVlJFY0hROU5rTyty?=
 =?big5?B?ZmRMUTl4L01HV2kzdVladjNuSGdqUXA4N3ZZQ2MyWTlocW13Q1VnTXArVkk3U0tV?=
 =?big5?B?YzhEbk9VS3NWQnhIL1lhUmtub3BsZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?big5?B?b2ZlMDR3VmovcThHTWFwUCtjRFBJM0c0aEMvcjM5WnlNUFNUREtCZ1ZtYUxyUVBK?=
 =?big5?B?d1p0UXY0UjM4K2J6WTV2dEdoeVZiSGJIc2VFNjFjbHZ2NTdxcDdkc3h1S01yMnhM?=
 =?big5?B?YTFHdmdIUFBXYUc2ZEdtbEY0WDlxaTg2d2Z6SnVyV1hDSjkvTStWZmUzYWsxcXNv?=
 =?big5?B?UXBPSkFDZDE5NmpzUkIxU2RWN29TWGFsYUowTGZ2dC9iR3phVkdZVkErUkRvVHFH?=
 =?big5?B?VnM0RENndUIwWG5NRGVlbnNFanVHSjY2RWw4eHBNcjMwc1BIdmlzMUw4SU8yQjYv?=
 =?big5?B?TU9CM251K0N6Sk40R2ZleWVKU2hPYUlxYUQ5SWJaYTJISmV0d2JicnpBUGZKZ3ND?=
 =?big5?B?MnEyZ1ZiTXl6akgvcUJrUkMzVWM3LytLTUlad1NzcTVYWWpqTTBqNDE3SXFIWTNF?=
 =?big5?B?VjBjcTRhNldIbzhGMnlpUm5QZnF3WnpxTkhrbEdYdE1SNVNCYmdEU09WN0EzT0tk?=
 =?big5?B?TGw4d1lsZzUxSmpnV2haNUhRZXc5Uk1NbkgwZzAwZTd3M0tPdmNWaTF5QVJwc3dX?=
 =?big5?B?UmY2NkJTSENlZlJiZUtGVFJKWndSMWdXcktYYU4rdkJhQnNqT2x5dnh3SFoxV0ww?=
 =?big5?B?Q09iZ2VsalVDdnU1N2EvZmp4QmpEZkJETnpYcDZwRWQyZGlzUm4yTG11WmFFV1Y2?=
 =?big5?B?Mk0zS3hKdXFRcUtTT091dEw5ekxBS2hmeG8wNXY4QS9lUEhwK08ydTlyVjNuaWYx?=
 =?big5?B?QlJTWkhiVlRaRjRrakNXWWVCbWpETWNTQmxBRTlZcklkanZtRDBiT3V2QnBiYm9p?=
 =?big5?B?Ung3TkJpdUE5WGhnZW93R0h6V1piMlRtYUVJVUcrNmxLNFJYaVZuVGhJWnJTdk1i?=
 =?big5?B?TVFBMjVyZWdzald5WktQS1J5QldpTnI1aVNjVVk4bzMxV1IxSjJkbERwcjRQNElv?=
 =?big5?B?Y0orM3pqeU9PWEI1R3NtRGp1SDlQQmxqcmRhYkI1c1dZTDVLOEdBaXBPU2MwbUlX?=
 =?big5?B?a2xOaklXN3RLNVBFWVpxYWh3RkhtcHdmVXJPdFNKbWF2Umd5cGNFUFEyWkd2R25r?=
 =?big5?B?R3UxTHl3V09ZVTlZY1B2T3VLZUpIcXlVRjA5eWdaTlFhcEtBczBNdDVQL2d3RlhM?=
 =?big5?B?K1M2YzBsQXpzVDI1cStuaFZzQ2o2UkNvdjU3TEFDZkYybWpjdDZ0Zy9Cb2lnK21Q?=
 =?big5?B?VEtPUTNhVzE5eGZBNDl0bFA0U04zQ3lYR1cyOVZDa3F4TkxmS0lmWjNxLzBRdjZF?=
 =?big5?B?MjJzWHBraHkvUGxyVFR4eXBKZFI4RC9iN0RRbzNQUmlTazE3eXNLcEtXd3QxQXpw?=
 =?big5?B?MFVvM0NpcmJML0xaZlo0OTJJdS9kRUxjbVRTZkVvc1ZpVFhXSE9JNGpJWlRBMkdi?=
 =?big5?B?QXFmaVJTYzR4aWtnUkRwdUFmRmZoMEZQWjdUalVNYlplTkJjN1FWNU5sU1VkL1U3?=
 =?big5?B?cmNobTliT0w4YUxWQ043bFE1d1hoazdCQkkzanFGNUxSNTR3MWt3WGtpTVhwcUlK?=
 =?big5?B?STlJSVhoV1Vtcjg3RHhnbUFHNWwzNXVycnhNRnQvZEoya2F4UGRzZjlEUzhBd0Jz?=
 =?big5?B?MkRmNm9MNGhuSU9nemNlQk04R1dVRzg2aUIzNkd5bGMyQ3hPQkxDQ0h0RTlBT0xX?=
 =?big5?B?M3N3M1h6MG9QZU5PaWVCenVZSmIzWXN3bWNNaUYxNnBDVWs2SG1peG1QZ3pTaUdn?=
 =?big5?B?U1lCT0FRZUw3YzNTSXJiZnlZR2tpTWgwYWUzNFA3cFNKcDNzcUtLcTFyWGVDd2Vn?=
 =?big5?B?NjBHMXR4NVVUSncvM0FvL25hTXN1bWNqaEEzQVg3d1d5N0FsT01VUXM3THR1cVFU?=
 =?big5?B?NkpXbkp0RXFGUlpSWFgrTW14Z1JtUmhzbTVHNS9mUHlGaFhWcEpmR2c4YVVhZHJn?=
 =?big5?B?Zksyd0ZBYWFVbDZpd3lSdmhVUlNWQVVVU3FzOVF4dE42T1hLazhoak1Ya2xxVkI0?=
 =?big5?B?NHU5RHdFSzQvS2gvdjJlV01vQzBxdnpMeWg2ekVkTndwWllvdm44K1RWWnZ2eW1X?=
 =?big5?Q?J+XHpBx8uXTrhtU7X0hQMwakItRNu3wpWxXthLDHYAg=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8aba9fd-fe0b-42b9-b847-08dce78f3c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 11:49:15.9517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ub1MJvEUW7iIYu8WODyH7ezOhQgnGpNcLhUNLVXGvb1pzloGWxsUXDpzWmmLBT2vE/vmXsF9jIJyc9YtH2HfHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5133
X-OriginatorOrg: intel.com
Message-ID-Hash: CSVMDJPYSJE4SR2HI2TSOTDNL22FYLAC
X-Message-ID-Hash: CSVMDJPYSJE4SR2HI2TSOTDNL22FYLAC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSVMDJPYSJE4SR2HI2TSOTDNL22FYLAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFjayBZdSA8amFjay55
dUByZWFsdGVrLmNvbT4NCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciA4LCAyMDI0IDQ6NTggUE0N
Cj4gVG86IGJyb29uaWVAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdtYWlsLmNvbQ0KPiBDYzogYWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsYXJzQG1ldGFmb28uZGU7IExpYW8sIEJhcmQNCj4g
PGJhcmQubGlhb0BpbnRlbC5jb20+OyBNLCBOYXZlZW4gPG5hdmVlbi5tQGludGVsLmNvbT47IEZs
b3ZlKEhzaW5GdSkNCj4gPGZsb3ZlQHJlYWx0ZWsuY29tPjsgT2RlciBDaGlvdSA8b2Rlcl9jaGlv
dUByZWFsdGVrLmNvbT47IFNodW1pbmcgW61TrtENCj4gu8pdIDxzaHVtaW5nZkByZWFsdGVrLmNv
bT47IERlcmVrIFuk6Lx3uHFdIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPjsNCj4gSmFjayBZdSA8
amFjay55dUByZWFsdGVrLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDEvMl0gQVNvQzogSW50ZWw6
IEFkZCBydDcyMS1zZGNhIHN1cHBvcnQgZm9yIFBUTCBwbGF0Zm9ybQ0KPiANCj4gQWRkIHJ0NzIx
LXNkY2Egc3VwcG9ydCBmb3IgUFRMIHBsYXRmb3JtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFj
ayBZdSA8amFjay55dUByZWFsdGVrLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEJhcmQgTGlhbyA8eXVu
Zy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9pbnRl
bC9ib2FyZHMvS2NvbmZpZyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9LY29uZmlnDQo+IGIv
c291bmQvc29jL2ludGVsL2JvYXJkcy9LY29uZmlnDQo+IGluZGV4IGNjMTBhZTU4YjBjNy4uOWI4
MGIxOWJiOGQwIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL0tjb25maWcN
Cj4gKysrIGIvc291bmQvc29jL2ludGVsL2JvYXJkcy9LY29uZmlnDQo+IEBAIC01MTksNiArNTE5
LDcgQEAgY29uZmlnIFNORF9TT0NfSU5URUxfU09VTkRXSVJFX1NPRl9NQUNIDQo+ICBzZWxlY3Qg
U05EX1NPQ19SVDcxMl9TRENBX0RNSUNfU0RXDQo+ICBzZWxlY3QgU05EX1NPQ19SVDcxNV9TRFcN
Cj4gIHNlbGVjdCBTTkRfU09DX1JUNzE1X1NEQ0FfU0RXDQo+ICtzZWxlY3QgU05EX1NPQ19SVDcy
MV9TRENBX1NEVw0KPiAgc2VsZWN0IFNORF9TT0NfUlQ3MjJfU0RDQV9TRFcNCj4gIHNlbGVjdCBT
TkRfU09DX1JUMTMwOF9TRFcNCj4gIHNlbGVjdCBTTkRfU09DX1JUMTMwOA0KPiAtLQ0KPiAyLjM0
LjENCj4gDQoNCg==
