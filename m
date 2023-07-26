Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E04E762B4A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 08:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD3C86F;
	Wed, 26 Jul 2023 08:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD3C86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690352395;
	bh=R7EU344W1umB9+dJrtIlb0bv61JrXH+EInMMXxPC9pA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rffFvzSOZ+TVyWPRf2xUxJMDNFCCIVz2R1Ydt+7E49lrRyxDFZFfrC1ESRvnVjns2
	 XV7ZQRprjVpPjDTkwkBmg9PoO2dsDddEgTxRhJYUaFAvH1OOVvyIcGZ2y8IETGAiXN
	 RFWpZO+VEJI7wUe44diJip1Mbkz4i3dlup8i2Prw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EF59F8055C; Wed, 26 Jul 2023 08:18:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8026F80579;
	Wed, 26 Jul 2023 08:18:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A5B0F8019B; Wed, 26 Jul 2023 08:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0096BF800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 08:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0096BF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SQt+zXcC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690352209; x=1721888209;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R7EU344W1umB9+dJrtIlb0bv61JrXH+EInMMXxPC9pA=;
  b=SQt+zXcC1IuOcuQKO2vt4jnc3ZWA/uIM0KLjQuXcAbE9E7DfGnluyc7q
   wVCWFD39FYiumMJIhsFw8aoEmi1sFV3K9ye4LFCgqHsdCY/xCZqJ/vmnY
   +/tYzBvIx/IsAp/KqqgoNEEnIA2RqIzyiw4mxX9ybuipKGvdCUHdg/n8e
   dN95FqapkyC8QDZP9W+tZFWsHFsJPrn3gf9UQag5DIp1PCbEpi0ImDv+m
   GUU/YJt+2/Bms9GDP53slayl6AYf45mX7T8O5eTbDTnlv9Gbl61I7a2v3
   rQCoqZ3QuFhF35Z+el2kW44tH7zOy/x+mW9lPd3rPRsBc/t/hKhrf58Sv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366813742"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="366813742"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 23:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="796423802"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200";
   d="scan'208";a="796423802"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2023 23:16:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 23:16:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 23:16:43 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 23:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhLFccOn81VqambNna0E+7jvl1oCA/gFMeEesQn2scBuoHNyZhdOPJQEcTiXQz/vqgptN8YQx3M8b8mihEqWMxElLJ4Jlo0tn0BmYnCWjvIlFMcYvXaauK5mm93ybRmnBPlZnzT/xiMJZosi6fLISdKQQbdyeGcnZarVIi8Ly4ON4VC9roPib1Wga73Lgf8nsktGUNShjCT9MgjOU3sMmvIZQFXSnH7kQRvcqU1uHnx9NRFcms6ku9UXsNKEA+Hfh2eHmmcOyctV/Uc8UehR5uLQ0uPFS5nEoKVhrQOQmf6uZvwaKh5mPX5oc14to64+MxRc94pY4w5GEcEHr8ipRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eAwYiI8w/6YwQs8EjCip+sTfTNr7r1XCHeHjUqJXvQ=;
 b=hc5w9tD6peMlwihZ4U52erZK6PmbBbMSbT7vn+A9dIwfcJOH1DXanZhbQ6VrmN0lpKooag1A3yJtUHgnQCBvMA/fneROxwsSFpX1QvA2h9heDfcsqMpU5aj+GvKdaGyeB2zkm1520B6IJXv76RpHwEwquIJ703oWZMf0v3ftfNBNE12eenpG7Z6aGb6ETZBw21HCripmfMo6vUke93rOAQc8ctB6uh8g75W1VzstGYbKB1FRcZGdsMJNEuvozeLofmdKuEH2EedQmuz3yl/Vup/MWinXAoENl1U9MH/47QO4MHeTt8bDSzau4erq9BsSAi93QOs/iq9/UnKlZkm4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Wed, 26 Jul
 2023 06:16:41 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 06:16:41 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhi, Yong"
	<yong.zhi@intel.com>, Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	"Bhat, Uday M" <uday.m.bhat@intel.com>, Terry Cheong <htcheong@chromium.org>,
	"Chiang, Mac" <mac.chiang@intel.com>, "R, Dharageswari"
	<dharageswari.r@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Thread-Topic: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Thread-Index: AQHZuqoaXCiyShA7oEmUALJNRLZwbK/Ip3CAgAAMRwCAABEQ8IAABnIAgALQmIA=
Date: Wed, 26 Jul 2023 06:16:41 +0000
Message-ID: 
 <CY5PR11MB6257F604AFC69AEE6AF025599700A@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <dc6de509-6984-1434-b53f-9600e8bc7c49@linux.intel.com>
 <ZL5Jzod5NBETv9Dp@smile.fi.intel.com>
 <CY5PR11MB62579D3B679BB437017529D79702A@CY5PR11MB6257.namprd11.prod.outlook.com>
 <ZL5dhosg28uIpcFd@smile.fi.intel.com>
In-Reply-To: <ZL5dhosg28uIpcFd@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|LV2PR11MB5973:EE_
x-ms-office365-filtering-correlation-id: 920c7602-6802-49af-f625-08db8d9fe09f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m76CJFguEhBRiS5g9EbZ15Z9Z2kybvfLDMk6/QPZ66GwRD4Q67T50Lz26Gelz+MexzG/LG1/X9+0JiWR6osF4BBnMGiutUn0NUwBFcYLNzsZDp4RhF/WQTyN5ChRXy4RPaRo+zVseZvtTrY8gqdvMqN523eRFL5wt3datTnat3Lpcc26DlQTgHqTse6FcP2iKQKjnHWLYA01d35OtQuDzPeGbvIme0r9E8NJ27SYqHbAKJZi+aW+nufNIRHIj2PRlzv5lmX0ULDk5/w7UcBMQXOeNxZ7lGcH9ZaaE0McAD2D60BmZPFVcxADuLBaxY5NTDripV3DLfHNvkghVWk1PJ+md0hm5kAqW70lwjRiWc4lznPlXdU1ScLRuYeW2CkypGS9THiu2J8jwxEiNB1o/kpL1BBV5s1x/n6xnzMROibckg5wUc5d3WCFsGTk5222RIU/GDmNbZ/eGcKKSIVkBEGibIb3J3DsOm8yS1Y/yEX0ugVEiNO2nFZlV+u61VE9KXjP4WDg3QNO8TmadyhMKY0GyPE8zz637iJb9qW/zwIYeachS5vNy0CP4l5/plNKl/QqgeVK9h91NEddgBYQZOdaEvH3vd5SWWcxVMlTbgf7dMF5dITfoSV7AZJRxNYo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199021)(7696005)(478600001)(9686003)(71200400001)(54906003)(38070700005)(86362001)(186003)(33656002)(55016003)(4744005)(2906002)(6506007)(26005)(82960400001)(38100700002)(6916009)(66946007)(4326008)(8936002)(52536014)(66446008)(8676002)(76116006)(64756008)(122000001)(66556008)(7416002)(41300700001)(66476007)(316002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vv9qSDdD+rGkBOs9dYjjYR8aW+4vpLljCb1767u/1owItru0z4haOFRGazGv?=
 =?us-ascii?Q?py87raFaWFvWU7qBC3tjcJscv/UEEcPzgwRDhSeb0SHV2PWnnA8Uu1fvddTz?=
 =?us-ascii?Q?wK6UXazhrP1CuOYmtfzLl8KHQDpEIa1/YQlygLJnE2AnJF5MgtPbnhI77Ud8?=
 =?us-ascii?Q?/b+SP+lSPs9RKu5+tKJDQ9RQ7tU8Gi8tSMPP6ppYZn2BZMDutVa2V2+8APlP?=
 =?us-ascii?Q?mjIg/acKZK+6J7NuASu5lrHThNVqX6aP/unT/0mkgwGvHIAWAXd6BgLYWhyi?=
 =?us-ascii?Q?eRcTg+VOwOv5xQfwj3LAj6hc6WnxKhiZ3g4gjB/1oMLPEQMkXFIXKrEcZ6E0?=
 =?us-ascii?Q?7yEw83P95rY0KVvdklKrh8oTxNDyYnkGzMB/hcNupxi1hFbJEQQOPVQHTAzn?=
 =?us-ascii?Q?c3XzXr6pATpoEWz6evXpJflTL0fw5ioxXnjOyciPh2DXWtdl7MUVqjvboJHE?=
 =?us-ascii?Q?Wzo9h3XxpU+HZ+tuX+oyePHvofHCgUfCy71rlr7N1WDkcd04ddC2OP5KJTmm?=
 =?us-ascii?Q?LYeZJ4RPkdDj6dd9nDS78L0NPM9OVmfScXmHAo02RLokF6c8mbzQ/4RDegPx?=
 =?us-ascii?Q?zQsFHefpviYkWtZOz8UvqU76Mg69ayacxn/pg3VTlisM4Ajj4XJ8KbUVB+Cx?=
 =?us-ascii?Q?5bPXQWX66Lv5pjNF9a1iKNyobwjFEaUYF2o4zuiRViVy0O+1y8jfatbDhFMT?=
 =?us-ascii?Q?MMg3lolPBARkoTB1JQUq1NeroiU0Zb42jCvzS7AxB6lpzVqo+UZ9FufvUv6k?=
 =?us-ascii?Q?7e+ZzaZqf439OIZ+5z8K+qLPjGTkjQgbAbWHdANoQD3O6tOZGkiwiGMeBt/t?=
 =?us-ascii?Q?mDveEjjd4xVZlIBMqzSUVK6d353L42/toosZGqZ4pwwVIQJNVQRJN9T0J3f+?=
 =?us-ascii?Q?WG3PTDEjVUGIexXaZbPoFjjxNEGwAekt0CKNf/YK1zuLGqNpliqdc7EGq9NV?=
 =?us-ascii?Q?vkoupodIzDUv2gUOY7qtcQc/dduaR5uSgMbLfXlKXyzDg+4uKCl2K9F1t+6M?=
 =?us-ascii?Q?6a2/4+WdT+goa7171VhtqyP2H0eI3v26IY8IQ5JEBw7YMBUdfKgKNgVmYfHz?=
 =?us-ascii?Q?MhvGy4zWK/xu49mPhHyc6akES/QJdcDagMCX3ASbDeYpKMWb6z1oYC18UW6w?=
 =?us-ascii?Q?1cnL1c0HlNzzRLNBcJTGnLcXjogEknAW9tB2mA8RXKYed0By1+YXO4Pw/YbB?=
 =?us-ascii?Q?6GUedLk6VHHwVqohXDzdf7ZdwC+hTkVvVMfVgPlEHGoRX2rfFYoJsq0gjkt5?=
 =?us-ascii?Q?pHEHoPK9qlfjcQ3dnXcy1Ti3byEwL6w7aIeIfC0tn+3E735wHXjSFa4LTBjW?=
 =?us-ascii?Q?qPkGc6/LDzQ0NpzwzPpet10jzwXnQvxYMX9/+uot+mkEfPjyDTglotIburfT?=
 =?us-ascii?Q?d01RUWea4Rp6O1/XmvfQ1vcGuLrfa0/U5/+/JfIvPVSqtReztAVrCgSLBQwe?=
 =?us-ascii?Q?t/5YAbisJFdwidkuqqy4uAjpRZ8LTxvHF2VSURBMNBQK6QH2HREyotspIvuQ?=
 =?us-ascii?Q?gPCRZ2WxMf0dBWbeHkyY+aQ2PhrW1zq1qerTJMsueiiuOvWQ7UW1kOvrde94?=
 =?us-ascii?Q?k+J0xEiXhvuqo9eQyLs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 920c7602-6802-49af-f625-08db8d9fe09f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 06:16:41.0735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tNDdEEGft4D2HQLuOMDCzITtFTbsPDjGHOQ+QvYt5Mw8fgbE38lonyUWugYtiYYyYZ4xKTpspiVxYnTaOWL++Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
X-OriginatorOrg: intel.com
Message-ID-Hash: U5H4WZSPFK3RNCGC7KXDIRNNF4AYIHTI
X-Message-ID-Hash: U5H4WZSPFK3RNCGC7KXDIRNNF4AYIHTI
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5H4WZSPFK3RNCGC7KXDIRNNF4AYIHTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>=20
> size_t here or at least unsigned int is more correct.
>=20
> > 	for_each_acpi_dev_match(adev, hid, NULL, -1)
> > 		dev_num++;
> >
> > 	return dev_num;
> > }
>=20
> Otherwise, yes, that's what I have in mind.
>=20
> > Will test it in next few days.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

Thanks for the review. I've modified the v2 patch accordingly.

Regards,
Brent

