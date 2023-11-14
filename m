Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B997EAAFB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 08:41:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25600208;
	Tue, 14 Nov 2023 08:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25600208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699947668;
	bh=OEPR9751uKO36MM+udzuBLbnayoFMHGkCvWK54RpX5g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ruBs3k/JTnOxIEqFPgq4GYLHIbF2A6Kht5S7VUZD4VSTfWGfXkpDL/SPztOvR6umg
	 YyzcEcAwRb2ijsqz1CwpjH5/dBf3guNTohTCBzWI+Yfxe/QBI1ChBrG1DiQi4Ob4Cx
	 oIcG8y1Y9CZ8QNYNozUukje2MSPdQCHtO7f+QsOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96824F80166; Tue, 14 Nov 2023 08:40:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A66F8016E;
	Tue, 14 Nov 2023 08:40:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4925CF801D5; Tue, 14 Nov 2023 08:37:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 062DBF80152
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 08:36:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 062DBF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ckBVCluv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699947418; x=1731483418;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OEPR9751uKO36MM+udzuBLbnayoFMHGkCvWK54RpX5g=;
  b=ckBVCluvEoXzTvolOnLYBUOr4W26m9gg9AROik89NkQFZnrzpmW+e1v1
   wHNrDktumQP+pSlGGbpUuoCw3Za/w648goY9nm9onxQSDxvpSCJvfXP21
   GSz6ZC/4pujPIEAQZBbHsclz4hop6y96apYn0zZMVu+w4eqWeU7W7Ckh0
   RA0GWweFtBqmJjq+pLP7K61fHToGJCVYzYFuDOEWDp8uZjyhdMNPIr10D
   ttA2OpjCwYYtOxw4UExlmx2eeg22Ak+lBYFr1nuP/bTH71lJobZYXDxfO
   NPrWgrADMz4g94b27Mon9bIdYa9mHEx5SGQPmJccWyO8cUvqc9JmoPV6Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380999805"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200";
   d="scan'208";a="380999805"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 23:36:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908267646"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200";
   d="scan'208";a="908267646"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 23:36:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 23:36:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 23:36:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 23:36:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kysbjdHkfJwnrdfeyn4tboomgkKSQJPX0D9byB5rHy05ajiqzL0L/JJTTjYJEthoqLcA24PK7OMkzkYuRRc0mswoXn1M8KmCyQHcqbK9Xeo+pfGRn02BZe/tXUTUF7zVtuIm9SJyvHBr94i0jUujFnoIPNzy0jhaazoNZb20SUx/3S44Usp0MzCZut6MfNVCSLRcYUi48fLRtEFqgwMc3zYG57+rI7/WvCEcoeP8fd8Dw/q7MLxRZC5gdn024XsiC6TtHVFQQjxUjD+R007zhvpvEtDMe+8SZJWlfGIe4loZ9Xy+8aOx5rFeKi15uxEfY0kRH1Nf+lEC9cn2FSDJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEPR9751uKO36MM+udzuBLbnayoFMHGkCvWK54RpX5g=;
 b=c2XNPtu/z8Wu26FzuMbv4PGeaKuIyiGik47XR6Vkx/ySGBr0/CkVekJ8hs0ZnCcnxutRMlstYdYUvPKNA1KK3Z4iN/CwGZJdZkTiH+MsAz424AA1I+Cx7tCrZ++JEX0UPtd5uMOz/SozYXNuGkXap1F0Mbphwqqv+OEobYsDZMJ8quGnCqAMCn07gbGcXB4Sc9NgZWP5NVHlONGyLo08ISqOjB2MLlOFoz95XYqMKpyqJ0MOLy7yIj3MREEF+A/3l4F400I3MRC4DANoTuS/2Dfu2qqotdxTywkqMHeOksahfb62ehO5O9GUO4Fbf+t1TQ/4FpIaxBJYSiCnGrIbrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7)
 by CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 07:36:48 +0000
Received: from PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::f1bc:bba4:107e:6960]) by PH0PR11MB5832.namprd11.prod.outlook.com
 ([fe80::f1bc:bba4:107e:6960%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 07:36:48 +0000
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
	"liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>
Subject: RE: [RESEND,v3] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Thread-Topic: [RESEND,v3] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Thread-Index: AQHaFivK8h/AvyXLckSKcMoy1VGzyLB4UmAAgAEWWeA=
Date: Tue, 14 Nov 2023 07:36:47 +0000
Message-ID: 
 <PH0PR11MB583241044F28FC112AD51A1E84B2A@PH0PR11MB5832.namprd11.prod.outlook.com>
References: <20231113115907.18539-1-mac.chiang@intel.com>
 <5d08a0a9-cb3a-4e8f-ba9b-1e2437502b04@linux.intel.com>
In-Reply-To: <5d08a0a9-cb3a-4e8f-ba9b-1e2437502b04@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5832:EE_|CO1PR11MB5059:EE_
x-ms-office365-filtering-correlation-id: bb9203ee-5ef9-4b69-5c46-08dbe4e4758d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4kq9CrSKkHNhIWaOc3ep3xlhBybrpH28bkqbJegs5QgNhZ9aTua4pFhXYgB26VUh6GDV6QlH0ugqumd2pRgzGatQVC1zffx/pr+ZlA0+y/vyzS/UgYTt64va47Scj+cQyEPbQ1Bv49NleyeGr7A2P0Vyo7Uy4X7m1gIwOBTeyP6lA0htzzp8dR3Iwe31jI8XwJxUBUJ47sC0p7pCewoFLlpheGIDgB7nTRqXP5kjpcWtbvZvbzg4udqOFILB6MnQdrEPAoRIczBQ9qTvhdZEeFzcyIzX9H2tyZ5TVewCogI4lF+5hBHfDOElIUO4Vm2fktLvzJmSxuh4eCv8xldtxZBPYa0L+b5muNVDwek7ZMSPpOtCdKnb2gdQS/ny7BDxP4RYcvgPe05YUAABlECnHE9YtnwigM+Q+4BWAXOl5Q5g702qXkDhnznAAehLI//p1mzAScXAatOM/pW8XqtR5MW2yYHNsvzEkkCF+IBqPNuTxsT0NyArmZBjMv5rp8Qq9wdNbk2jhCOM57bVU1kRXNA34xk6/q/OaF4DgpvlIpKyL9B6m8jOmKWf5XF7ov1SXT+x8nuXrcKerEn+24hNkV15Jz/Zlwy5sp0mr3ECVwsrRuG1xDDfnd0551Gl/SwF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5832.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(33656002)(122000001)(41300700001)(83380400001)(38070700009)(53546011)(5660300002)(86362001)(6506007)(4326008)(7696005)(7416002)(38100700002)(8936002)(8676002)(52536014)(76116006)(316002)(66946007)(110136005)(66476007)(64756008)(66556008)(54906003)(82960400001)(66446008)(55016003)(9686003)(26005)(478600001)(2906002)(966005)(71200400001)(11716005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eXZqUWZCWDUzdVRkcUtuWFNkb2U3TWVFUERNcVd2aFEzSWd0R2JjeW1SOXZ0?=
 =?utf-8?B?LzNJa29TYjJuMXIwTG9WZXdOc3N1anVLTVV0a29PWTlYa3kwQlVraFpnUGtE?=
 =?utf-8?B?Z1QwS1NvMnpnc0Y3SEY5Z2NxNmdWRnViVEZ3N0FZUDJQYlBwM1RieU9oLzBh?=
 =?utf-8?B?QXdOSjhRZ1o5MGR0V0syUlVoVmw0OWNnYnZRU1Q3enc2QTg2cjhIK1ZVMzQ4?=
 =?utf-8?B?VHBUYVFUcUtuVXlndXNzYm9rNzdVd1hIa0lIaER4a2pSYXJMVURkWFUxRlJI?=
 =?utf-8?B?U1M2ai9wM1JLbmlFVGFhbmsyT3VJeUtPZlpNYTYwRGoySyt2Rk0yVkJSTDM3?=
 =?utf-8?B?ZGZ0a05kTExlOXVmaFpOZlNObkZ6a0Fyci9iZFlXalVwR1pudnp1bVI2TWMw?=
 =?utf-8?B?S0dFQ0lxeCtBR2NmWVFJakZ1SWl5cXU5WEg3SzFMQ3JUeXNTMm1hbE9iSGFM?=
 =?utf-8?B?Zy9wQ2NWQnVMMThQQ0o4djJPNndiM05oVXJTeGhyRTdVWHBObWNpZGV6VGlY?=
 =?utf-8?B?ZTVTbzRHVURtKzg3ZWtrRTJZYi9NdFVJZjl5b0Rmb2dyWk5rTGpJd2ZMREJO?=
 =?utf-8?B?czErOExUeGo4K1VjK2gzY3lESzhQRVNZaC9JZTM1Nk9aa2p6UGYvR3lHUlNw?=
 =?utf-8?B?UjNybUprQkpvbG5FQ2VLcWh3WG91T2MrcVRRdytzZ2o2OWFrRW84anYxZGs2?=
 =?utf-8?B?azVNUkMzdVVhT09BeW1IbnB6dTJCRmsrdHQ1K1h1dFp5NS93M2gycUN2WXRH?=
 =?utf-8?B?MTliMHNkcGVLdDQwR3ZQcEVGM0NtT3ljZXN4N0ZNSm80UWN4aTlhTGNMcE10?=
 =?utf-8?B?ZkE3WEIzYVJpM0JnZ05JWGszQUdBbUZlRzVQbXZ5Y2k0TTB3cUpJeERXcjhJ?=
 =?utf-8?B?N3FXZTRiV2htRXNJRlg2OUtST05WWnNSMzFlbU40bkJiR28rS2w1Wm41UUpr?=
 =?utf-8?B?UFdsb0RiWHBUaHlyeEVUZ3g3cGEzS0NrRG5mUTkrM29vTmJYa21xeTdCb3pS?=
 =?utf-8?B?QWZGSGtuamJmVzFSWDBuakYwVlhBV0FHenVaM1Q2S1ZZcnA0b2FFU0pQdExB?=
 =?utf-8?B?QVRYd2pMV0lIalBKMzBCRWNIemJCdzEwUmxsTkdpT1dmbVovejQ4Nk5mdDJk?=
 =?utf-8?B?M1FKenVIZ0VkKzVCUFFFWkRtTjExSnduSDF3ZTVLRkNkNXVBdm5jKytTVmgy?=
 =?utf-8?B?dXBJM2tObFFzSE1DNTBBNkJNU1N2bTlDS21VaXU4WXNEMFovVEtNMVlZVmZI?=
 =?utf-8?B?QUI1NUxjTitMeEZuN2xwdTBQdlg5VEhRWHgyY1hJUDF2aVhoRVJURnJvNDNk?=
 =?utf-8?B?eERxRVJuenNuejlJK1ZwUmNKSmowVWkrOUMvNjY2ZUthL09vby93NjJvbmtG?=
 =?utf-8?B?N0l5UWYwVnJPRlhEdW1pYWl4RURYeVVxbXJQK003NGRhaGw1RWYzdkJ6dGlG?=
 =?utf-8?B?MzF3WDBXZWUrTjlsa0JWbldoZG1XeTBKUzNyUnJ0eDM2ZERPa2piazd2T1E5?=
 =?utf-8?B?MTRQMWdEMHZjVzJoNVpYRjRxTTFmdXA0NENGWmwzRkZXOFkzVU5CZ2w4R2hr?=
 =?utf-8?B?ZEJLd3hlQ1BncXV0UC93WUE0ZlBUb0l3NU8xK0g4Z0IrOE9MNGF4eEFsUEh5?=
 =?utf-8?B?WHVqMTY3eTVmdWxVOWtzc2NlSG55UTAwR3oyMWFnMzVtWk83TEUxWVprdldN?=
 =?utf-8?B?MWIxb1ZXci8wbFRUdWdaWjJENzRTeHVROGE4a1M4UGxWdjkrYSt2cWJFNktj?=
 =?utf-8?B?dUpzaVZ6TnRacWhSY3VkQ0xNeFhpNmZxU2g2ZGRta3pVSEtUb0M3VVJQWC9w?=
 =?utf-8?B?eFh3ZzhWUE9IdXZIWCtsa1VWQm5UZng1OVhqZlRjZnJ2QnZKU1dDWWpwMVkx?=
 =?utf-8?B?Y0YxWE9iODlaL24xZnVTQ3hVaWZuZERudkZHZzRjNWxhR0d6amdCcUFWc3da?=
 =?utf-8?B?bFNONGRGdGs0UnpNZ0dXdG5pV0pSUCtwM1pKTkwxUlRsYTVPc0EvMTg3RkVQ?=
 =?utf-8?B?VFJjVUZGNENGcDJVbGV5bHZURmNkZTEyZVd3WlV5TnJWdUFVcmc5UVZiREFF?=
 =?utf-8?B?QzZybTV4dWJndDdDSkdrdEt4MG4yMzVxZW9kZ2gxRG01N1hLVHV5ZG5tMmVG?=
 =?utf-8?Q?ILTiaEw+iNm2SwzG0mrFTStaH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5832.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb9203ee-5ef9-4b69-5c46-08dbe4e4758d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 07:36:47.8390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 mbSd2HoPPnLZXz2dzFch1ODO0PTVlD1hE2w8gEzv65bKXroLqiSLJwJf+zSEx1xp0XAfGZO6pMdJPqnwRyYB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
X-OriginatorOrg: intel.com
Message-ID-Hash: V2XEPBLBKYG262PLPQ2TQGXD42H47DMT
X-Message-ID-Hash: V2XEPBLBKYG262PLPQ2TQGXD42H47DMT
X-MailFrom: mac.chiang@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2XEPBLBKYG262PLPQ2TQGXD42H47DMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBOb3ZlbWJlciAxMywgMjAyMyAxMDo0MSBQTQ0KPiBUbzogQ2hpYW5nLCBNYWMgPG1hYy5j
aGlhbmdAaW50ZWwuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IENjOiBSb2pl
d3NraSwgQ2V6YXJ5IDxjZXphcnkucm9qZXdza2lAaW50ZWwuY29tPjsNCj4gbGlhbS5yLmdpcmR3
b29kQGxpbnV4LmludGVsLmNvbTsgcGV0ZXIudWpmYWx1c2lAbGludXguaW50ZWwuY29tOyB5dW5n
LQ0KPiBjaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbTsgcmFuamFuaS5zcmlkaGFyYW5AbGludXgu
aW50ZWwuY29tOw0KPiBrYWkudmVobWFuZW5AbGludXguaW50ZWwuY29tOyBicm9vbmllQGtlcm5l
bC5vcmc7IHBlcmV4QHBlcmV4LmN6Ow0KPiB0aXdhaUBzdXNlLmNvbQ0KPiBTdWJqZWN0OiBSZTog
W1JFU0VORCx2M10gQVNvQzogSW50ZWw6IHNvZl9ydDU2ODI6IGFkZCBtdGxfcnQ1NjUwIHN1cHBv
cnQNCj4gDQo+IA0KPiANCj4gT24gMTEvMTMvMjMgMDU6NTksIE1hYyBDaGlhbmcgd3JvdGU6DQo+
ID4gUlQ1NjUwIGlzIEkyUyBjb2RlYyBpbnRlZ3JhdGVkIHdpdGggSFAgYW5kIFNQSy4NCj4gPiBU
aGUgSFcgYm9hcmQgY29ubmVjdHMgU29DIEkyUyB0byBSVDU2NTAgY29kZWMgYXMgYmVsb3c6DQo+
ID4NCj4gPiBJMlMwOiBBTEM1NjUwIGFpZjEgZm9yIFNwZWFrZXINCj4gPiBJMlMyOiBBTEM1NjUw
IGFpZjIgZm9yIEhlYWRwaG9uZQ0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEJhcmQgTGlhbyA8eXVu
Zy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYWMgQ2hp
YW5nIDxtYWMuY2hpYW5nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiBIaSBQaWVycmUsIEkgcmVz
ZW5kIHRoZSBwYXRjaCBmb3IgeW91ciByZXZpZXcgYW5kIGNjIG1haW50YWluZXJzLiBUaGFua3Mu
DQo+ID4gUGljayB1cCBmb3IgQ2hyb21lIE1UTCBwcm9qZWN0cyBzdXBwb3J0Lg0KPiANCj4gVGhl
IGNvZGUgd2FzIHN1Ym1pdHRlZCBhcw0KPiBodHRwczovL2dpdGh1Yi5jb20vdGhlc29mcHJvamVj
dC9saW51eC9wdWxsLzQ2NjEsIGFwcHJvdmVkIGFuZCBtZXJnZWQgaW4NCj4gdGhlIHRvcGljL3Nv
Zi1kZXYgYnJhbmNoLiBCeSBzdWJtaXR0aW5nIHRoZSBzYW1lIGNvZGUgbXVsdGlwbGUgdGltZXMg
dXNpbmcNCj4gdHdvIGRpZmZlcmVudCBwYXRocywgeW91IGFyZSBqdXN0IGFkZGluZyBtb3JlIGNv
bmZ1c2lvbiBhbmQgbm9pc2UgZm9yIHdoYXQNCj4gc2hvdWxkIGJlIGEgc3RyYWlnaHRmb3J3YXJk
IHByb2Nlc3Mgb24gYSBtaW5vciBjaGFuZ2UuDQo+IA0KPiBNb3ZpbmcgZm9yd2FyZCwgcGxlYXNl
IHBpY2sgb25lIG9mOg0KPiBhKSBzdWJtaXQgdG8gYWxzYS1kZXZlbA0KPiBiKSBzdWJtaXQgdG8g
dGhlIFNPRiBHaXRIdWIgYW5kIGxldCBTT0YgbWFpbnRhaW5lcnMgdXBzdHJlYW0uDQpUaGFua3Mg
Zm9yIHJlbWluZGluZywgUGllcnJlLiBTdXJlLCBuZXh0IHRpbWUgSSB3aWxsIGZvbGxvdyB0aGUg
bWlub3IgY2hhbmdlIHByb2Nlc3MuDQo+IFRoYW5rIHlvdS4NCj4gDQo+IEFja2VkLWJ5OiBQaWVy
cmUtTG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0K
PiANCj4gPg0KPiA+IENoYW5nZXMgdjM6DQo+ID4gICAtIG1pc3NpbmcgUmV2aWV3ZWQtYnksIGFk
ZCBpdC4NCj4gPiAtLS0NCj4gPg0KPiA+ICBzb3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9ydDU2
ODIuYyAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrDQo+ID4gIHNvdW5kL3NvYy9pbnRlbC9j
b21tb24vc29jLWFjcGktaW50ZWwtbXRsLW1hdGNoLmMgfCAxMiArKysrKysrKysrKysNCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2ludGVsL2JvYXJkcy9zb2ZfcnQ1NjgyLmMNCj4gPiBiL3NvdW5kL3NvYy9pbnRl
bC9ib2FyZHMvc29mX3J0NTY4Mi5jDQo+ID4gaW5kZXggMDZhZDE1YWY0NmRlLi45NzIzNDc5ZjQz
ZGEgMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9zb2ZfcnQ1NjgyLmMN
Cj4gPiArKysgYi9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL3NvZl9ydDU2ODIuYw0KPiA+IEBAIC0x
MTQ3LDYgKzExNDcsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQN
Cj4gYm9hcmRfaWRzW10gPSB7DQo+ID4gIAkJCQkJU09GX1JUNTY4Ml9TU1BfQU1QKDApIHwNCj4g
PiAgCQkJCQlTT0ZfUlQ1NjgyX05VTV9IRE1JREVWKDMpKSwNCj4gPiAgCX0sDQo+ID4gKwl7DQo+
ID4gKwkJLm5hbWUgPSAibXRsX3J0NTY1MCIsDQo+ID4gKwkJLmRyaXZlcl9kYXRhID0gKGtlcm5l
bF91bG9uZ190KShTT0ZfUlQ1NjgyX01DTEtfRU4gfA0KPiA+ICsJCQkJCVNPRl9SVDU2ODJfU1NQ
X0NPREVDKDIpIHwNCj4gPiArCQkJCQlTT0ZfUlQ1NjgyX1NTUF9BTVAoMCkgfA0KPiA+ICsJCQkJ
CVNPRl9SVDU2ODJfTlVNX0hETUlERVYoMykgfA0KPiA+ICsJCQkJCVNPRl9CVF9PRkZMT0FEX1NT
UCgxKSB8DQo+ID4gKwkJCQkJU09GX1NTUF9CVF9PRkZMT0FEX1BSRVNFTlQpLA0KPiA+ICsJfSwN
Cj4gPiAgCXsgfQ0KPiA+ICB9Ow0KPiA+ICBNT0RVTEVfREVWSUNFX1RBQkxFKHBsYXRmb3JtLCBi
b2FyZF9pZHMpOyBkaWZmIC0tZ2l0DQo+ID4gYS9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1h
Y3BpLWludGVsLW10bC1tYXRjaC5jDQo+ID4gYi9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NvYy1h
Y3BpLWludGVsLW10bC1tYXRjaC5jDQo+ID4gaW5kZXggMzAxYjgxNDJkNTU0Li5hZjQyMjRiZmY3
MTggMTAwNjQ0DQo+ID4gLS0tIGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRl
bC1tdGwtbWF0Y2guYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc29jLWFjcGkt
aW50ZWwtbXRsLW1hdGNoLmMNCj4gPiBAQCAtNDAsNiArNDAsMTEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzbmRfc29jX2FjcGlfY29kZWNzDQo+IG10bF9sdDY5MTFfaGRtaSA9IHsNCj4gPiAgCS5j
b2RlY3MgPSB7IklOVEMxMEIwIn0NCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNuZF9zb2NfYWNwaV9jb2RlY3MgbXRsX3J0NTY1MF9hbXAgPSB7DQo+ID4gKwkubnVtX2Nv
ZGVjcyA9IDEsDQo+ID4gKwkuY29kZWNzID0geyIxMEVDNTY1MCJ9DQo+ID4gK307DQo+ID4gKw0K
PiA+ICBzdHJ1Y3Qgc25kX3NvY19hY3BpX21hY2ggc25kX3NvY19hY3BpX2ludGVsX210bF9tYWNo
aW5lc1tdID0gew0KPiA+ICAJew0KPiA+ICAJCS5jb21wX2lkcyA9ICZtdGxfcnQ1NjgyX3J0NTY4
MnNfaHAsIEBAIC03Nyw2ICs4MiwxMyBAQA0KPiBzdHJ1Y3QNCj4gPiBzbmRfc29jX2FjcGlfbWFj
aCBzbmRfc29jX2FjcGlfaW50ZWxfbXRsX21hY2hpbmVzW10gPSB7DQo+ID4NCj4gCVNORF9TT0Nf
QUNQSV9UUExHX0lOVEVMX1NTUF9NU0IgfA0KPiA+DQo+IAlTTkRfU09DX0FDUElfVFBMR19JTlRF
TF9ETUlDX05VTUJFUiwNCj4gPiAgCX0sDQo+ID4gKwl7DQo+ID4gKwkJLmlkID0gIjEwRUM1NjUw
IiwNCj4gPiArCQkuZHJ2X25hbWUgPSAibXRsX3J0NTY1MCIsDQo+ID4gKwkJLm1hY2hpbmVfcXVp
cmsgPSBzbmRfc29jX2FjcGlfY29kZWNfbGlzdCwNCj4gPiArCQkucXVpcmtfZGF0YSA9ICZtdGxf
cnQ1NjUwX2FtcCwNCj4gPiArCQkuc29mX3RwbGdfZmlsZW5hbWUgPSAic29mLW10bC1ydDU2NTAu
dHBsZyIsDQo+ID4gKwl9LA0KPiA+ICAJLyogcGxhY2UgYW1wLW9ubHkgYm9hcmRzIGluIHRoZSBl
bmQgb2YgdGFibGUgKi8NCj4gPiAgCXsNCj4gPiAgCQkuaWQgPSAiSU5UQzEwQjAiLA0K
