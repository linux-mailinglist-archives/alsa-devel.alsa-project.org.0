Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEFBA4825
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 17:54:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519E8601FA;
	Fri, 26 Sep 2025 17:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519E8601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758902082;
	bh=Z6QQrNc+/FNSP2Cc+oM82VMk45MnXqMWNBzMg3+Fv9k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BnEZY+omNzsmLvTpZpX77CDMDmf6mdxRWZ8sj1QRLJ10uwMiFKJKSXmEb152aQ/OL
	 EfqaAXE5UYTeH4zIbZeotE0Sdh8LKPQCY/E+P3Ckb7VJE5uvpj7rMrUQ2hJU336tG8
	 HvkdauiMzXdMmIPHOH8b67bkn/XQz+ltGuu1pEXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBE3CF805CB; Fri, 26 Sep 2025 17:54:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B9B9F805BA;
	Fri, 26 Sep 2025 17:54:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05067F804FC; Fri, 26 Sep 2025 17:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A56F9F800E3
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 17:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A56F9F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YxY/4VjF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758902040; x=1790438040;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Z6QQrNc+/FNSP2Cc+oM82VMk45MnXqMWNBzMg3+Fv9k=;
  b=YxY/4VjFwyLXprc+1uci9S+9box1CtpKwUkqn5cWZ28llhOu7G0bkC6T
   Gho03CCJtMPyz3r4Kd79uUvyC1ZCS/SH+M4eG9J3Gn2YhSjSb/cuTfzYy
   +hMLaf15DM4+c8HNMHHPQFm98u0Kd7BDJu+vUHon1/5c9y0TA9kUn/ehM
   SVpmQoNc8Wpd1sXWW1iwMtQfi6erzSp6TNyqJWCysEKLM0D5T5o+wXAHo
   I7alnbfFbd3Q7ioJx8CeYCuuYhPpkhuvcT5A7BEKxLSFCKLa7sQ797ZXn
   8AEQXxVjhClhGBknyLJE0QdmXfhHCKoUbp3A5uJoqGkV124HjX5baKczh
   w==;
X-CSE-ConnectionGUID: QqiITyo5RCiyBu0xpJf9uw==
X-CSE-MsgGUID: ugS5BjlFQkiD15/I3FOV2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="71922600"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800";
   d="scan'208";a="71922600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:53:55 -0700
X-CSE-ConnectionGUID: Fz8JigonQ667QaBS58ssVQ==
X-CSE-MsgGUID: CxMLEECDRiqWuvW6eYFC1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800";
   d="scan'208";a="208578877"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:53:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:53:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 08:53:53 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 08:53:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JU7j0E2oFWy/b3veWHA2F+BhPEloeSccWH8615wmsVLTo5IB8ZYSm34c80x6jpUv0Wq27U2f6JwRB7FriTKGmYQ0fLm1SwJwj0hkpSkA482bmvlR6jsysUVkTbFaJbeZqKP8zysNB1oSWr7CVN8LHjc/9yMjyLNftP9Poc6wqsk8/xcOxMb/qoZj6x6nNXmOW9kReSw8D14jHB6rhVZ5plhhK8jt1nJWTKLfPhqnzcxmh/WeIGzUjNmyKtMGNDvKFt2sP1U+imq7obhcRxNFxuDo6ndLyJNBTt+uXWdUUHo5npD5NXWYARuRpUr/ReJm7MfZ1Ohz9sXGh6qviGs07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6QQrNc+/FNSP2Cc+oM82VMk45MnXqMWNBzMg3+Fv9k=;
 b=wsLB+u5ty8YX6tcPsn8uPlSj58FMomS/gCVqfjwAtACkDZxiRhMtCjqX2/6853kpMSSQAvBFV/fpInYqoencNOkmKkz5wEfEUrpDcqxmtiyG9WyZfd/mV6xd1Av3DmDaje390eAVPIDQu3ZGO4H0OVDnKRMMeQpRLYBxznfrGVvdzR8/w24bzs3YDh0E+ENtJAkYixELLr2zegz/PRsR9zgTZk5gQ6AixKA4PodmCELvvMv4p5+/Ztwb15gzrK23ZxKBG1vSCp13Zyf95OizZw6Z1Fa0670rac5SdjQu7WhQCkbB4Isi/ABWcx1YkZfcIhrdggofgCPxcEbsJap5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7916.namprd11.prod.outlook.com (2603:10b6:610:131::15)
 by IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 15:53:51 +0000
Received: from CH3PR11MB7916.namprd11.prod.outlook.com
 ([fe80::138e:4e07:c935:53a7]) by CH3PR11MB7916.namprd11.prod.outlook.com
 ([fe80::138e:4e07:c935:53a7%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 15:53:51 +0000
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"Girdwood, Liam R" <liam.r.girdwood@intel.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: Looking for inputs on hostless playback with the DSP
Thread-Topic: Looking for inputs on hostless playback with the DSP
Thread-Index: AQHcK9RCXIUwp6Ux/U6ziX+5gUESFbSg1QEAgATO1gA=
Date: Fri, 26 Sep 2025 15:53:51 +0000
Message-ID: <4869158f77b7921d91d14684c408e7cae55379a7.camel@intel.com>
References: 
 <CH3PR11MB79166FB88C912EC164D2670AE812A@CH3PR11MB7916.namprd11.prod.outlook.com>
	 <aNKujttqDJj3T94H@finisterre.sirena.org.uk>
In-Reply-To: <aNKujttqDJj3T94H@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.0-1build2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7916:EE_|IA3PR11MB9304:EE_
x-ms-office365-filtering-correlation-id: cc46ca76-39f1-4875-6753-08ddfd14e368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Ujdyc2dwTkp1R3VrUUZsYW5XblZMaElmcFRZMFlMMXd6UkpxN05LRHhDUExy?=
 =?utf-8?B?WnNRcmVFK3V2VjRFL3pIekVScE0wa2NTdDZTOGVDem11KzJOOHdiM0JrWFN4?=
 =?utf-8?B?RlB5RU54YWVPc3lzbS9LQXY3T01JdHZiOFB1MWNDZW1SbWRzcHhyT2FmWjZY?=
 =?utf-8?B?aXFPZldGNFUrQnFHZGxNeTdPclQ0TzRSUXJKMnN5MmE4dUtmeUl1Mkw5Q09C?=
 =?utf-8?B?ZVFsK3FXWU50Qk40RjFUSDM0ay9BVDdsNWVTNWtYVDdnUEV5ZUZ6U2g0WmJR?=
 =?utf-8?B?VkF1WUIvekNkMWZmWHgzbHBzR0xvdHlvNzZKdFFDdFRNM0xZS0FRQ0F0OGVC?=
 =?utf-8?B?UXUwQll4b05LL2VVMndWaGcrSGhPL1BwdmhIK2t0NWEzRklKUk0ySHp1YVNX?=
 =?utf-8?B?NkxDNTJOVkJ1NWE4MjlIckUyWm90UUNGRkk5bmlobnBDOUFwN3VwckxVZ2pr?=
 =?utf-8?B?TStucGN4VE1lM3RScWIrVFlLUjJGM0JBajY4bTZ5YjJ5MENBOUFwT0NxRlhV?=
 =?utf-8?B?MSsxWmVrakZyZ29nRFA4RzY2R1hZa0lMTS9JWk5yVXhZR25MTWYrQjhCUmhN?=
 =?utf-8?B?aUtHemU4cm1aN0VzMkdoL1U5Mm0vMHJoeTVhMFJOdHUzek0xYTR6MFA3WW1i?=
 =?utf-8?B?TzlSb1VRSHhwS21yMkxtOXArM0FZaTZucll6dXcrcFFDdXhudVJncGF4Vkg2?=
 =?utf-8?B?UmVzV2dKR3hjaUxCTGlJZGhUaHVtRlhKOE11ZzdjVk9ZbzRQdlhSSDFpVDMy?=
 =?utf-8?B?VXF2N1I2UlFmeSt6VGdYVEV3aTlzb1h3YUxUTUFtM1FnZVozS3VNcVNpQVIx?=
 =?utf-8?B?RXJaL0t4L3lRMFFjcnJEM3lVUjRIcDhiZXc3cTFaeUYxTlBkWGo2RThZTGNB?=
 =?utf-8?B?TFhzQzk0WjlUZ3dzWTBrS2U5VVI5OXFvcU1DeU02RHdFdk5oVHNIdUVQVU0v?=
 =?utf-8?B?VkowQ1pnbVluZWNidnc0ZS9oWVlzZlovMkVGVXh1YnVVTVNPY0xsc29mYUZC?=
 =?utf-8?B?aG5PUG56SlU3WU03RlA3cldqblZQdVI1Y3JZTFMxMFNZbUE1L05EMnBvb1lx?=
 =?utf-8?B?OVk1Sy95UE9nMWk3dUx3VlBvL3dYOTN0NFVFU2tQbXp2dlNsV0sxbUFJakVz?=
 =?utf-8?B?dk5iQWxsRkxGeEtSL0d6d1hLcjJuYklxN01mdkpHd0xiRzFHZnlCVEJlVkw0?=
 =?utf-8?B?bWxDTWJLbUpZMHk5Wm5GU3FDVXJER2lxV2tRQWhCNWlJWlBJOXljRUtBcUFv?=
 =?utf-8?B?ejd0SW1QQktjV2ZreEl4QmRWZlRQUXlqTVNOSGpGRXhNWUsvbGpzQml4Z2Ri?=
 =?utf-8?B?WnZ5dWc3WVhtb3FtWWtOMnVXcWRNemtUTmR5TWdWZ3ZtaDBmYlI1eHZ1dGc3?=
 =?utf-8?B?Q3FBVHhIMG9pNXhpb0R1RXRDbUVNT1Q5SXBManVRN0d3YlhiRGJ2OTNPWnVx?=
 =?utf-8?B?WEhxSkx4endsMlBidlFQWVdFckpzWjVYUUhsQkV3ejY5SFpOVUhUSldWQXFY?=
 =?utf-8?B?UEd3aHUxZTVEcFdpNDZ3YnZycUhBaW1EZ3hyNjdXYTJhdmx1cVc5US9TOTVC?=
 =?utf-8?B?RWh4M3VlMzR1YkVpK0lrTVFrSVJudzlJR0E3TDF5S2hNSGltY2UyM0pmL05W?=
 =?utf-8?B?bnREOFdXRHliaGhHaGtvVXR1VE5Ed1R4cTZsM1lrTExYR1lMaUdvYVFQdTRH?=
 =?utf-8?B?MjcxYm9ZWlVyTUo0ckQ5eVNqVjk3ZStsOTNEeHdmTDVodTNuOGtWeUxxcmFw?=
 =?utf-8?B?NkpkWmpLanZZUnpNUm5yRjlSM2k3N1h1M2NsbFQycXFWSEZINThLTmVVRkdx?=
 =?utf-8?B?dlFzT3RuNXpxWGxHT1I0Z2d4N3RVMmtrTGJ2eFRJYzkxM2Urem4wb2ZqTmdx?=
 =?utf-8?B?Rjd5RDI1aDR4dkNpWGZKVDFoclhvMGFJd3M5M1hQKzl0Z1NNdkdPWVE1WUxO?=
 =?utf-8?B?cGJQREdCZTF1bCtSWmJQTnJ6Tll0azF4Z3R6Y2o1ZzJOSEpQRDBOcGNGRGF3?=
 =?utf-8?Q?wdLPtGjcG8DIleAqVaecOFNeYvercQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7916.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THFKOStRSVdzSVlmTHIzamlkREpnVFpydkMwVURrcjFtNXhkLzNJcThaOG1E?=
 =?utf-8?B?cnJJYmUwU0duZEJ4R0VUSnRJNnhXNUZuRkpXOGVQc1RycnlxL3FGbGZlNFBG?=
 =?utf-8?B?SFB0d205U0JEVHhlUlloamxnWXZzQTZrZFJDclF3WlFXalNLTzcveDlxWUVw?=
 =?utf-8?B?dEFMY2tSaGJXeC9BdjA0aWpSYXNydTNKSTU4Uy9LNWU1MmdlRXZGRXZ3WmlY?=
 =?utf-8?B?ZUp6VXExKzhrRGpvYVdOU0haMFlrMUo5QzI2blloYUZVS0pEV0xCdld4Qnkw?=
 =?utf-8?B?WlJxT3BHTGpKdjdJdDNOeEZTdHBQQlJMZm1BZDZXRHNBRlVEbTlaMldDTXVD?=
 =?utf-8?B?bWpNdGdJdndqUk8vcDFWbUhKWStrYnRkdkY3dldGNlIwSkJiUUdZTmhjSzhY?=
 =?utf-8?B?RDkwa3JKN0xuYzdGaWlTdTE2ckc5emN5NlNleEp4NHpiaXdzLy9hdGtGelVq?=
 =?utf-8?B?NmxFNlNOd1lYQWhpeTh3WjZodkxBRVorQXViS3R5NXQ4WHJqVkszbkp4amJy?=
 =?utf-8?B?VGppMkRLeWpId3RIaXN3dTU3TC9VdU81ZFo0K2ZFbzRublJRQVFXZ054VzB5?=
 =?utf-8?B?ZUd1THUrck5XcXlOTzZ1cWNzRlVFd2xxV2d0Q0UvSXkyVmtDMDlvU1FGYVhD?=
 =?utf-8?B?MURuaXkxOUJuYmszc2I1dXJPQUZ6eFVyNWVBaWMrek16a0JlWEtlN3ZCYVdl?=
 =?utf-8?B?YzZEYTZacElSaGhVb0NtSDJWYWtRZFowamNtRXV1d0VEc3BpRFFSQ3k1TjNj?=
 =?utf-8?B?S3k5V3pGTktBTTcrdy8raUxXemRtbmNkU0NpaHNudkI3RWJzV1pFbHJ1Zmtz?=
 =?utf-8?B?YlVNdFB5U2hLZmdLSU9nRWtDaDBnM2xuR1JIS1lzNFBUYTR0K3o1bjRLUDQv?=
 =?utf-8?B?L2VoM3JwQTZVem1SOVgyTjVwUEQvOVBOMWFUTTk2L3o2c3haT2xieTcydFdS?=
 =?utf-8?B?dXR6TTVuRjVVdHQ3MDYvK0sybC9jQ2E4czNyNWtCV3A2eHg3RW40Q1luS3Yw?=
 =?utf-8?B?bkpNMzVHWHlEeHByNEU2R2UvMVlqbTA2ZER6M0ZZeUJ6WHpLQ0QxVkNEUHFo?=
 =?utf-8?B?WDk4UUhONUtybFBoMG1BTGZLUUR3U2M4NE1pd3pndGs3Mm1pYXhxWkJ6N2dP?=
 =?utf-8?B?WXVzblZUdkpSVVdNRVg2dlpSZk4rbnh5K3lEUk91OUozU05RdEFPVmMwNEFR?=
 =?utf-8?B?YW9KcVE2bWFnL3dpOVI4MGp1R2Rzd1o1M05uMUJFR0xpeGlKOHNrdDZhT0xV?=
 =?utf-8?B?dUxxNXdmWkpOQkFNS3JzTDRjbklyZkpjcFAvRkw2a3A5Skdhbmo2TTByU05S?=
 =?utf-8?B?cjlHREFNcVZLNHoyY2k5dmRaYzllWGRkaVVaa0JONTJ1ZE9TQ1A1eGdhVlZ6?=
 =?utf-8?B?Q3ZtRnlObGRrUk5zUjVZMU5XN050bWMzNnRUL0JabWs3NVgxZ3VCQ2U4cDJr?=
 =?utf-8?B?WTZjK2VFaHJGdHhRT2FOREhoVlhtb3QwMmFUU1AyNFJoYnN0ZDcwTit0NmJ1?=
 =?utf-8?B?eUNIRXNYcnAxUVdML0J1blN5aE9CV1pxWks5aXZEWVNpbUw5OTg4Nld1aGp3?=
 =?utf-8?B?MlluaHg3TWhTbWliaWdTWENzSTlHYW5PdUZyKy9Qbm9LYW04bDlZb2FyZW53?=
 =?utf-8?B?UnhOZUpSSlJHRWZPQ29nM0I0TURIdXh6Y2N3Z3ZWSUE2TUtXQVVWM3RnR0Nh?=
 =?utf-8?B?SUN4SXhSVjFEU0YzN2VGZ2tJbThsN1luKzhhbzZYeDNmMnRsSlhvdXBHWkN6?=
 =?utf-8?B?QlNjMFRVK0plcWlkcnFiTElkL1dGN2UzQUZKRm1HQWdwd01CMHBvcDVSZTQ4?=
 =?utf-8?B?aHQ5dGRGOWJOdTAwOGpNT2VxWnFMdndya01LRHBBNVVZRVh6bWtwWDBpUmg5?=
 =?utf-8?B?VkU2YU50Q2tQV3A5ZWtJYlloM1JwU3N6TEQ5b3EySWpidHhFaTNVVlNaUmI2?=
 =?utf-8?B?S2JDcHBXUjRsYUM5ZGNaN09ISkk3eThpTzdlZjkwU3ZsR25mTHNsb0U5eTNR?=
 =?utf-8?B?VHVFd2RzUGhiRllzalEwYWhzUWlQR1JlRHVZQTFqTVBmcnVIZThNdGMzS3Qv?=
 =?utf-8?B?UCtnUzZKK1JKV09rWTBGalhtNEExTU1vNmlDcWkyOEdWSFEzRkRXSlFWbmJD?=
 =?utf-8?B?Yml5SHRuZW95b3lWWlM5R1RnYkxzZnptQUh2c1N1N1NLOGVLRU1ycGdKVE1K?=
 =?utf-8?Q?XmVF6doQYuNzomq3HkV7kG4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0997D9547BCFD94AA6E3C9C7524E7DF4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc46ca76-39f1-4875-6753-08ddfd14e368
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 15:53:51.2299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 jYK5jYQ3ChrgbZMa1PadESPEzMEW0AlaVs3mq+yDCfcNg6A23m2MjyZwMV99fmiDMnLueDiyEs5k14/PyXDzIqJmW3xg8fCQ7ZG0dITaNxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9304
X-OriginatorOrg: intel.com
Message-ID-Hash: 4YPW3NLWORD2IJ7G36WS73RVA6QKPW5K
X-Message-ID-Hash: 4YPW3NLWORD2IJ7G36WS73RVA6QKPW5K
X-MailFrom: ranjani.sridharan@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YPW3NLWORD2IJ7G36WS73RVA6QKPW5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gVHVlLCAyMDI1LTA5LTIzIGF0IDE2OjI4ICswMjAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBNb24sIFNlcCAyMiwgMjAyNSBhdCAwMzoyNzozNlBNICswMDAwLCBTcmlkaGFyYW4sIFJhbmph
bmkgd3JvdGU6DQo+IA0KPiA+IFdpdGhvdXQgYSBQQ00gZnJvbnRlbmQsIGhvdyB3b3VsZCBJIGdv
IGFib3V0IGFjdGl2YXRpbmcgdGhpcyBwYXRoDQo+ID4gaW4NCj4gPiBteSB0b3BvbG9neT8gV2hp
bGUgSSBjYW4gdGhpbmsgb2YgYWRkaW5nIGEga2NvbnRyb2wgZm9yIHRoZSB0b25lDQo+ID4gZ2Vu
ZXJhdG9yIHdpZGdldCB0byBlbmFibGUgdGhlIHBpcGVsaW5lIGluIHRoZSBEU1AsIEknbSB3b25k
ZXJpbmcNCj4gPiBob3cNCj4gPiB0byBkbyB0aGUgaHdfcGFyYW1zLCBzdGFydHVwL3NodXRkb3du
IGZvciB0aGUgYmFja2VuZCBzcGVha2VyDQo+ID4gY29kZWMuDQo+ID4gQ291bGQgeW91IHBsZWFz
ZSBoZWxwIG1lIHdpdGggc29tZSBwb2ludGVycyBvbiBob3cgdG8gZG8gdGhpcz8NCj4gDQo+IFRo
ZSB0aGluZyB3ZSBhbHdheXMgdXNlZCB0byBkbyB3YXMgaGF2ZSBhIHVzZXJzcGFjZSBwcm9jZXNz
IHRoYXQNCj4gY29uZmlndXJlZCBhIENPREVDIHRvIENPREVDIGxpbmsgYW5kIGhlbGQgaXQgb3Bl
biBidXQgbmV2ZXIgc3RhcnRlZA0KPiBhbnkNCj4gZGF0YSB0cmFuc2ZlcnMgaXRzZWxmLsKgIEkg
Z3Vlc3MgdGhlIGVxdWl2YWxlbnQgdGhpbmcgd2l0aCBEUENNIHdvdWxkDQo+IGJlDQo+IGEganVz
dCBhIG5vcm1hbCBGRSBQQ00gdGhhdCdzIG9wZW5lZCBidXQgZG9lc24ndCBoYXZlIGRhdGEgc2Vu
dCBmcm9tDQo+IHVzZXJzcGFjZT/CoA0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgTWFyay4g
SSB3YXMgdGhpbmtpbmcgYWxvbmcgdGhlIHNhbWUgbGluZXMuIEkNCndpbGwgdHJ5IHRoaXMgYXBw
cm9hY2guDQoNCj4gIEl0J3Mgbm90IGV4YWN0bHkgZWxlZ2FudCwgaXQncyBnb2luZyBiYWNrIHRv
IHRoZSB3aG9sZSB3ZQ0KPiBuZWVkIGRpZ2l0YWwgREFQTSB0aGluZy4NCkNhbiB5b3UgcGxlYXNl
IGVsYWJvcmF0ZSBtb3JlIG9uIGRpZ2l0YWwgREFQTT8gSSdkIGxpa2UgdG8gdW5kZXJzdGFuZA0K
dGhpcyBiZXR0ZXIgdG8gc2VlIGlmIHRoYXQgd291bGQgYmUgYmV0dGVyIGZvciB1cy4NCg0KVGhh
bmtzLA0KUmFuamFuaQ0KDQo=
