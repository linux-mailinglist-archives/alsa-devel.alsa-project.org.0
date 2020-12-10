Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F061B2D53B9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 07:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 771771694;
	Thu, 10 Dec 2020 07:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 771771694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607581261;
	bh=LwMYnC2hXIlDt9JNKIRVcnPFP8vQM8vj8utSQ4PtPsE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWpjXFdmFAgBaW2RHY8RvuyRsdFokUFILFosMoxSVdyofMfEbRDwlkUUwNViIC4h4
	 RmNfUsnfeUG9lPBVOE9Yuoa2i3p9A/lKetIaf8suN+ouGpaH6zGawARnA0qzwGPB9T
	 7WrKjtxWPSFmL08AoHyYvQaQw7xw0dAj4ZBIjNmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 778FAF800EF;
	Thu, 10 Dec 2020 07:19:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E60FEF8016E; Thu, 10 Dec 2020 07:19:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A852AF800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 07:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A852AF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="wA/xDRl5"
IronPort-SDR: MrEln+JrWd2M25bbUB31qMyZP3P0WfOuGliN0HnFkTeeuAvAvtXbRtBLsKE2N2kWp1PWHLPR+V
 vsbr481iYyMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="192515158"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="192515158"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:18:48 -0800
IronPort-SDR: NZthgrGGRUkFJ3xzWHczAmawQOLsFRYwAmeQh/YnP2cujDhxb9dpTryOYnpvfIvdB2IEX12z9H
 3oBEXeqcE2SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="348659466"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 09 Dec 2020 22:18:47 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Dec 2020 22:18:47 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Dec 2020 22:18:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 9 Dec 2020 22:18:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 9 Dec 2020 22:18:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0zNjj6CWtU7PuzuDEOKVFQ+n0gFAV0dN+tMB83cr0dN3q0PCw59Zc7zZs9LBwqO7CvIJv6AGd/NoY8c1iKLj+VnaQX+VCDtaLk5CuJKEj5QS+Dj8aVnpOGkyEk04jRh/swVnIZOJSuiN/6M4FYK1sHMBzgns0owurq5Pl9+OVJAIre4ADglwKUv13TZBcP5es/wpWfsM9qfXYSIZoKDM8kx7p0JQDLccSjdLrwFP/wXA7mTarzuRy87w+NYyfMQxxfX7wDDLjy7hmTZdzt4NVZEI33ovnajGruVvr//6UMWJi/TFI5zOt+61eZ8ND/otMSVbF/m2LIqPd3S/puT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwMYnC2hXIlDt9JNKIRVcnPFP8vQM8vj8utSQ4PtPsE=;
 b=MVFL2/+dVw/SVxLlLn2SX4wJwCpiNA3W1P3z05CULe9Ch/+R+iFHsuSN8sNGvkSxV65bLHp/1GBHl/JPXFDa4Rhs6KH1Q5Ot82zO/XtywyHnszydlEXAkUQvNZ/ifBES27a36jB+JEMH3MQYzZMEK2Kebw/FQaVt9hrvS/W4CHcn68m+sTNAyrtaPmOBxUUitrK38SoB4haYEGZ+8XRZ7tcjBhrDoc/iH82y2gJbUAOCQJdOoRxfq3m0K7ZdOL383KzpCr4wbG+je8566XsC2OcgQ/sfdemxLXxm7Zaf0lNq6ZFr1i4662k6PndXVJQyU1jWvqLs1OdULLFWaPjOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwMYnC2hXIlDt9JNKIRVcnPFP8vQM8vj8utSQ4PtPsE=;
 b=wA/xDRl5tEnP0Yw+HAJC4/8bigw6+JACmDv9gx0ZG50iDJFrYl2iv8rSqatWPJdjlH5arbOz8rH0Z8pNN6pDBcSKII25oOkwxzzjKVG32TEsuVtZlC9DOVXgNAvIu6Ay4FP+Q4PCgOqKOW540dkj/zw9YtXKAkPWBYdLMLsFZCY=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM5PR11MB1673.namprd11.prod.outlook.com (2603:10b6:4:c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Thu, 10 Dec 2020 06:18:46 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8941:7045:2dc8:707e]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::8941:7045:2dc8:707e%7]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 06:18:46 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [RFC] ASoC: max98373: don't access volatile registers in bias
 level off
Thread-Topic: [RFC] ASoC: max98373: don't access volatile registers in bias
 level off
Thread-Index: AQHWtwObwWrxFNByOE+NBK4BkmF7U6niZekAgA2jgbA=
Date: Thu, 10 Dec 2020 06:18:45 +0000
Message-ID: <DM6PR11MB407439429C8C348D61DE4E8AFFCB0@DM6PR11MB4074.namprd11.prod.outlook.com>
References: <20201109135543.7862-1-yung-chuan.liao@linux.intel.com>
 <160683107675.35139.2203434126118347345.b4-ty@kernel.org>
In-Reply-To: <160683107675.35139.2203434126118347345.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45b7e4d1-3e97-4128-22df-08d89cd37360
x-ms-traffictypediagnostic: DM5PR11MB1673:
x-microsoft-antispam-prvs: <DM5PR11MB1673B5E6E22FA55F625267FFFFCB0@DM5PR11MB1673.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RRAoe8L82DMblJtZEL+EAC1hlr1HJL8PT9uN1fZ0gcGSsgBw8wHzRjkVHoiu3hn18AQRvSm8jvIg1oXkKZLWHk+CeoWMqJmO5B96hnwEZGKRnOaIvLQKxCTAJpRsMdG3FLXuyM/dzAORpTuNcLBnhqZKq9I25n8kMEsFzTSekL6VYriGdTP4yazC5QmLinjQ3jJ3lIX1j2wxOl+vVTVzjL0eyXlMAgIGTDE5qXfWRu6WaAC7ruAx3sQ6DCpPgkhmocb9WefD/9eImOoP+QFFw2Y6y0ouXPDY8nYhKuxiPYjurm0NsDUuXxphd5czLfel2stdeivWr4rsX07kJPV6V7aR8jRz2xvbErjSJ97LOQapbfBeaqUNqTo1OhXztBc9gkFi0vvoFSztyA9Emds9Mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(5660300002)(66476007)(52536014)(55016002)(9686003)(8676002)(26005)(966005)(71200400001)(186003)(508600001)(8936002)(7696005)(53546011)(2906002)(86362001)(66946007)(110136005)(54906003)(4326008)(33656002)(83380400001)(6506007)(66556008)(66446008)(64756008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QUQ3eVFJeVJmeUhrWGFnL3B6MkNyd3lXY2x4TlpTQmcyYkd1RlVxWC9xSnNh?=
 =?utf-8?B?a3NMenQ5bnd6M3p3U3J5TS85Q2tkZHhuWHIzTnRHNTZPQUNhc1FUSlpmK0VI?=
 =?utf-8?B?OTRpWGNPS3YyZWdZQ3NhRzVIdzJSQlpBZTBiN3l0WWhFaVFUN0FQUXA3Yll6?=
 =?utf-8?B?YTZmdDUwMVYwL21qUjVrVnpDRFBGRjVQaSs3aE0wTkNHWnM5TFAyOVA3cFFk?=
 =?utf-8?B?ZWxKb0svMWhGMGxZdGhEVnVHQ1kyODZEM1U3bnZaR2RKS3pJMFdNUkRkU25z?=
 =?utf-8?B?bEJBeldVWFhBSWt0dmhZS2NBTmdOZjJJaU9zN1htT3dVaFR1b2lkZk0yc0dR?=
 =?utf-8?B?dWxSdTZxSnlVQVhqSWZaRlpJUTlRMlViL09rZlM5VENRU3pjYzg3N2s1OGhF?=
 =?utf-8?B?WEFwalZYalJ0T29xUlJna2g0Y3k1ZlFNbkpVRW90NXVoSk5NQnJReXFxTThy?=
 =?utf-8?B?aEZ6V2sxRzVQdDFuM3ZLVmhTb3J6d0Q2aDVtczRIWC8xMms2YnBvQUxUdEto?=
 =?utf-8?B?UFhpOFRRazVPZkxlQzBkcGh2bzQ1VU1jd2ZuZW5YejhPajdsWWVBaXpweVJt?=
 =?utf-8?B?Ri80N0ZHYVJnaWR6VVkycC81dy9sRDN1Ly95Nm00Myt6azhCQmhyV3FGRWVy?=
 =?utf-8?B?NHRINDAyTmFINHlUd2pYcUFuUWhXNlBNdVR5S0pKWXB5Q29FYTlLUW9zc3NL?=
 =?utf-8?B?SksrbzI5eWFPeExmRVNMWUswSmxrMmhWYk9jR0FRT3hrK1VmdHFiMHdZMVJh?=
 =?utf-8?B?Z25TRER6L1dWckR4dk9GRkphQTJuVzRCa2QyM2lIYkNlSHF2NzgwTEI3ak1p?=
 =?utf-8?B?VTFZbHRIa0w5b1dYOHZ2dnI1cU5wUXpZemc5c2NBcm16RVFhTzc2elZuTmNQ?=
 =?utf-8?B?SDFrZkZxRU4vd1Jib1NSZXlnSWFObWxBT1NGbVRHcDNYakxzOXJ2L3ZFNGRK?=
 =?utf-8?B?RVczcHo3ZWh3YUpPdGo1WVVENG0xd3Z5QnZsdVg5aUdwY0p1eFRoTE9sSThv?=
 =?utf-8?B?VUJ0Z0o1czQxLzM4NGlkNk9FNWFaSHhSNWVlQ09xNzd0c1NWNEg2TGNDRjRW?=
 =?utf-8?B?UVZZSEJVNUlUdVJsbUticFFKNUJYRUg0Syt6K1MrMHlldzc5VFAxV3dReFQ4?=
 =?utf-8?B?M05rVERVWDV1ZytCbTk2b0xSbXZrS2E3MTBRT0gvanZNaVpxSFYrakJvMFhB?=
 =?utf-8?B?eDZKK0k0UVVJd3BIWGtvMnNrVjllbXRoM2lTOU14b1JGQklqSW1BSXRmMjNj?=
 =?utf-8?B?UStPclpacHo2a2dnWnVHT2Fiak5ad0dMNUp4M2kwaU90OVIyenhoa2lVTnFI?=
 =?utf-8?Q?YxpwLfIbf4U+U=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b7e4d1-3e97-4128-22df-08d89cd37360
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 06:18:46.0198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfAN0CyKwsTgb4NpgVYdubGH7wQu6pYdlNvPcofxHVuRRAH1EX/3VZpkhgA6ksp/2gVU/PawSYjxvXliY8RKwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1673
X-OriginatorOrg: intel.com
Cc: "ryans.lee@maximintegrated.com" <ryans.lee@maximintegrated.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxLCAyMDIwIDk6NTgg
UE0NCj4gVG86IEJhcmQgTGlhbyA8eXVuZy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbT47IHRp
d2FpQHN1c2UuZGUNCj4gQ2M6IHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsg
dmtvdWxAa2VybmVsLm9yZzsgTGlhbywgQmFyZA0KPiA8YmFyZC5saWFvQGludGVsLmNvbT47IGth
aS52ZWhtYW5lbkBsaW51eC5pbnRlbC5jb207DQo+IHJ5YW5zLmxlZUBtYXhpbWludGVncmF0ZWQu
Y29tOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtSRkNdIEFT
b0M6IG1heDk4MzczOiBkb24ndCBhY2Nlc3Mgdm9sYXRpbGUgcmVnaXN0ZXJzIGluIGJpYXMgbGV2
ZWwNCj4gb2ZmDQo+IA0KPiBPbiBNb24sIDkgTm92IDIwMjAgMjE6NTU6NDMgKzA4MDAsIEJhcmQg
TGlhbyB3cm90ZToNCj4gPiBXZSB3aWxsIHNldCByZWdjYWNoZV9jYWNoZV9vbmx5IHRydWUgaW4g
c3VzcGVuZC4gQXMgYSByZXN1bHQsDQo+ID4gcmVnbWFwX3JlYWQgd2lsbCByZXR1cm4gZXJyb3Ig
d2hlbiB3ZSB0cnkgdG8gcmVhZCB2b2xhdGlsZSByZWdpc3RlcnMgaW4NCj4gc3VzcGVuZC4NCj4g
PiBCZXNpZGVzLCBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gcmVhZCBmZWVkYmFjayBkYXRhIHdo
ZW4gY29kZWMgaXMgbm90DQo+ID4gYWN0aXZlLiBUbyBhdm9pZCB0aGUgcmVnbWFwX3JlYWQgZXJy
b3IsIHRoaXMgcGF0Y2ggdHJ5IHRvIHJldHVybiBhDQo+ID4gZmFrZSB2YWx1ZSB3aGVuIGtjb250
cm9sIF9nZXQgaXMgY2FsbGVkIGluIHN1c3BlbmQuDQo+ID4gSG93ZXZlciwgdGhlIHF1ZXN0aW9u
IGlzIHdoYXQgaXMgdGhlICJjb3JyZWN0IiBiZWhhdmlvciB3aGVuIHdlIHRyeSB0bw0KPiA+IHJl
YWQgYSB2b2xhdGlsZSByZWdpc3RlciB3aGVuIGNhY2hlIG9ubHkgaXMgc2V0Lg0KPiA+IDEuIHJl
dHVybiBhbiBlcnJvciBjb2RlIHRvIHNpZ25hbCBjb2RlYyBpcyBub3QgYXZhaWxhYmxlIGFzIHdo
YXQgd2UNCj4gPiBoYXZlIG5vdy4NCj4gPiAyLiByZXR1cm4gYSBmYWtlIHZhbHVlIGxpa2Ugd2hh
dCB0aGlzIHBhdGNoIGRvLg0KPiA+IDMuIHdha2UtdXAgdGhlIGNvZGVjIGFuZCBhbHdheXMgcmV0
dXJuIGEgdmFsaWQgdmFsdWUuDQo+IA0KPiBBcHBsaWVkIHRvDQo+IA0KPiAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NvdW5kLmdpdCBm
b3ItbmV4dA0KPiANCj4gVGhhbmtzIQ0KPiANCj4gWzEvMV0gQVNvQzogbWF4OTgzNzM6IGRvbid0
IGFjY2VzcyB2b2xhdGlsZSByZWdpc3RlcnMgaW4gYmlhcyBsZXZlbCBvZmYNCj4gICAgICAgKG5v
IGNvbW1pdCBpbmZvKQ0KPiANCg0KSGkgTWFyaywNCg0KU29ycnkgYnV0IEkgZG9uJ3QgZmluZCB0
aGUgcGF0Y2ggb24geW91ciB0cmVlLiBJcyBpdCBhcHBsaWVkPw0KRG9lcyAibm8gY29tbWl0IGlu
Zm8iIG1lYW4gdGhlIGNvbW1pdCBkb2Vzbid0IGFwcGx5Pw0KDQpUaGFua3MsDQpCYXJkDQo=
