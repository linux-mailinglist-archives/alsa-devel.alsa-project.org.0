Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A6F1EBBCF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 14:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A65C1663;
	Tue,  2 Jun 2020 14:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A65C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591101427;
	bh=YFtZdp6NOQCS7RkTYMK0pM2EZ8UFUFLd0vHr5Ojuvb4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaEvMygdIF4842zeuxF7JesQxGMxBjWkLPIZn7f/riqfvQG2Wlk9lFqMIzQ7ZYKoJ
	 oSm2jDQkP6Fj/un4HhX4NdHl3lqS0lcBkAJH2PTW/SYsTbCGCwXSsJxmc1e7hL83xJ
	 nvPuzTCugGwqY9oEKtbN8gb6p0nqEuaoKrs1C3dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49104F8013D;
	Tue,  2 Jun 2020 14:35:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D59D7F8026F; Tue,  2 Jun 2020 14:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1E09F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 14:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E09F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="L+XxKof5"
IronPort-SDR: 8GyxCZ5N9oOHbKdDi7MSbaQieaO+84VncBdrfXcTRhpj0JJ2aGVY12v1NpOZX69uq3YXAFCSuL
 hHGjG0zFyC9w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 05:35:13 -0700
IronPort-SDR: prXGOa+oW3ZWRZtz4hSVK+rbFWQV3qmm81bGfBpHZIWnyIlkvPiJWkDwmRvKQXFGFGYQXW0tFS
 u4NawPqOvX/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,464,1583222400"; d="scan'208";a="258301061"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2020 05:35:13 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 2 Jun 2020 05:35:13 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.55) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 2 Jun 2020 05:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hz3Ee3NjGpjOxg3tO/xL/oVRIb8xsVXF1kl28+8qCuoSvUpAxHmS/gGZRxwHlhJZhitBxcRc35uHTZ5/2g/k4TWxUJlAiFQwiedKQfMS0E1vQG1mbXm/23lc4XKSBbuzGqDlyyZjsay2NfQCb/LWntPlqLHS4PSh2NRY+s1GGHN+4/PmyJxTpWHX4pGw476ABTr9pw7AZbzaw4DEZ1cA0AeMBd/Z5H0+mZ1bPmQiFXXIh1E2lYjSN+yO0EA29qzQ0Zrx2IvZeLs2AYxzDR8aMeNISPJnBWN7GYYjNpi98Lc1ShG3NJZtDiDNXUqYE6NWPWQF+V97kX4xeqHeCAtdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFtZdp6NOQCS7RkTYMK0pM2EZ8UFUFLd0vHr5Ojuvb4=;
 b=ECPbSuQ44+1frc7Z7X6yT07vmP68lpQXDkoFWFMe+c2LHS7uCJwZzoDqjccKBdHQzI9UDoWiRkQqOkd8BF3fPbMl8Xy4BSUEOrKlzp/Ldo9/9acoKA54u6yLqnGRJVWY4K7ivpL5iXSyIApt7F89HhdNdpgNMp4bkHiAjcPU20TQxh9NJpAX5qcghKcwhclvFbas5nuCRWWT500xLbWtJykBwxupY5IV72OKc2Wenr03gi7FH01f+bzoxyB3N9cR/E8JPICcy0Q2x5Q5fhJPoNyjDGC1cGAjC81mH/vtum3JlwAcmR8b4de9NYdo2RshKtCW5RqvqxOFl6t3L+myBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFtZdp6NOQCS7RkTYMK0pM2EZ8UFUFLd0vHr5Ojuvb4=;
 b=L+XxKof5Zx56U/4ecPjumzPPM+4gYtgPBU19FxnfUZvABrJleIItxd3grfWCFNo8dHawqm3wyqpq+/xYflhMA2btJ3pT4xGNGw1GSA88JfrkRciOpid9Mj6XNoFiEx0fkYbv3XKCvgdriayOdHHcT1sHGZzneX/soMsRN9SaqcY=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB1570.namprd11.prod.outlook.com (2603:10b6:405:a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Tue, 2 Jun
 2020 12:35:10 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855%12]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 12:35:10 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: RE: [PATCH v3 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Thread-Topic: [PATCH v3 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Thread-Index: AQHWOFvzZe/7aq5TI0mGS/Mnrj4Na6jFQ7WA
Date: Tue, 2 Jun 2020 12:35:09 +0000
Message-ID: <BN6PR11MB19538F40B31CEB04C6AAF3CADA8B0@BN6PR11MB1953.namprd11.prod.outlook.com>
References: <1591005201-31704-1-git-send-email-jee.heng.sia@intel.com>
 <f3808e0a-e924-5b4a-5d83-0de139553651@intel.com>
In-Reply-To: <f3808e0a-e924-5b4a-5d83-0de139553651@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59ee7bff-3c15-4fe5-3e42-08d806f163bd
x-ms-traffictypediagnostic: BN6PR11MB1570:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB1570BF999E5297CE29AE9523DA8B0@BN6PR11MB1570.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sifq2gt/NLUqq1Y/q5xwIivvXoXgy1oGk2VFpHR7Lx5qdGaLnmPdx08CB9K2NFd/OyPL64ukANuKTuGhwmi+QsYhZYGNUcqHN96HJuhYOmGI70p4S2OreMnGnb7IdMssrsNFNLKUcGyE76SManmqoM6dXXXW27DN2Xgd2Zkeiee3wjSrMXIqBobPGtbH+T9eFf5PxSHUPeipUw25wPknDNfoJIgg1AUJZip1+S6LqwCuiP3eLcFWTIraQFfXcK4WaaqUJribwEkB1X7WaqrI8dTJttTTsmQexJhpq0N1CIZgcSLhihCN3zfJY9Uti7raWHPGMx7zBhXhHW/iC9FwSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(396003)(366004)(39860400002)(136003)(26005)(316002)(9686003)(55016002)(66946007)(52536014)(54906003)(186003)(66446008)(64756008)(66556008)(66476007)(6862004)(76116006)(5660300002)(71200400001)(478600001)(4326008)(53546011)(6506007)(86362001)(33656002)(8936002)(2906002)(8676002)(83380400001)(6636002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: is5QWhcVl2ZwuluTgLJqSJM1Rbc+AEBDvcr9cIXI23m1+keipZ4amj4kuQpvQeZ2OzB1t2jv7Hz2BEXRvP6FLUuJxUGjIit2sv/Rwp+f7Wo6Y8nemQ6cNO8tz8f2FbQ630LCE2suvOvVlNMkGGhpIKJJV0+On/nZUpDu8PjR0L/qnGM0i7KQEm3z7ZP6wmCo1Dz0ahn2+mL+9aKSvbNiwl8JW88ubwXP06N6gEfQOnZoML+lF1SXloFjfXeZaqdWuQsGkRWNUEJBWZptWDq3Pe8kE9tZQHQnsAcn0v8dCyQt1/Mf7cfwy6db1Xe+ZCGykU2TBUWWdLTZTNKmAMuPQV5+c4zBS9Eq+fSIrwMonW1j4VN4lrwvDg264ShP0pNAAHjdiBFvnfyrwAekL9apEFnnTxjYmLeLKvMKRoycV66EHHNiBdmlhtxihyPEyK0LjEbZf/NwdodMtTtvTZrYNGLYY7mupHtp/53OaOgrBx7ufGJfHDuet/Z0DDVWdFOk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ee7bff-3c15-4fe5-3e42-08d806f163bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 12:35:10.0507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1rdsENZDvMj1oOiMAypzU8dH7+HTn2nsrbtJccRqWMHhiRdLDQ8OIde3jFDM7Dtd4bSCOlrO9d4fOZwJpQUWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1570
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSb2pld3NraSwgQ2V6YXJ5IDxj
ZXphcnkucm9qZXdza2lAaW50ZWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIEp1bmUgMiwgMjAyMCA1
OjMxIEFNDQpUbzogU2lhLCBKZWUgSGVuZyA8amVlLmhlbmcuc2lhQGludGVsLmNvbT4NCkNjOiBh
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxpYW0uci5naXJkd29vZEBsaW51eC5pbnRlbC5j
b207IGJyb29uaWVAa2VybmVsLm9yZzsgdGl3YWlAc3VzZS5jb207IHBpZXJyZS1sb3Vpcy5ib3Nz
YXJ0QGxpbnV4LmludGVsLmNvbTsgU2hldmNoZW5rbywgQW5kcml5IDxhbmRyaXkuc2hldmNoZW5r
b0BpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvM10gQVNvQzogSW50ZWw6IEFk
ZCBLZWVtQmF5IEFTb0MgcGxhdGZvcm0gZHJpdmVyDQoNCk9uIDIwMjAtMDYtMDEgMTE6NTMgQU0s
IFNpYSBKZWUgSGVuZyB3cm90ZToNCj4gVGhlIGJlbG93IHNlcmllcyBvZiBwYXRjaGVzIHN1cHBv
cnQgdGhlIEtlZW1CYXkgQVNvQyBwbGF0Zm9ybSBkcml2ZXIuDQo+IFRoZSBwbGF0Zm9ybSBkcml2
ZXIgaW5pdGlhbGl6ZSB0aGUgaTJzIHRvIGNhcHR1cmUgYW5kIHBsYXliYWNrIHRoZSBwY20gDQo+
IGRhdGEgb24gdGhlIEFSTS4gVGhlIGkycyBpcyBydW5uaW5nIGluIHBvbGxpbmcgbW9kZS4NCj4g
DQo+IFRoZXJlIGlzIG5vIERTUCBpbiB0aGUgS2VlbUJheSBTb0MuIFVzZXJzIGFyZSByZWx5IG9u
IHRoZSBHc3RyZWFtZXIgDQo+IHBsdWdpbiB0byBwZXJmb3JtIEF1ZGlvIHByZXByb2Nlc3Npbmcu
DQo+IA0KPiBBdWRpbyBncmFwaCBjYXJkIGlzIHVzZWQgdG8gY29ubmVjdCB0aGUgcGxhdGZvcm0g
ZHJpdmVyIHdpdGggdGhlDQo+IHRsdjMyMGFpYzMyMDQgY29kZWMuDQo+IA0KPiBDaGFuZ2UgSGlz
dG9yeToNCj4gdjM6DQo+IC0gQWRqdXN0ZWQgaGVhZGVyIGZvcm1hdC4NCj4gLSBVc2UgQXVkaW8g
Z3JhcGggY2FyZCBpbnN0ZWFkIG9mIGN1c3RvbSBzb3VuZCBjYXJkLg0KPiAtIFVzZSBpZi1lbHNl
IGluc3RlYWQgb2YgY29uZGl0aW9uYWwgb3BlcmF0b3IuDQo+IC0gRW5hYmxlZCAuc2V0X2ZtdCB0
byBjb25maWd1cmUgbWFzdGVyIGNsb2NrLg0KPiANCj4gdjI6DQo+IC0gQ29ycmVjdGVkIEkyUyBu
YW1pbmcgZm9yIERUIGJpbmRpbmcuDQo+IA0KPiB2MToNCj4gLSBJbml0aWFsIHZlcnNpb24uDQo+
IA0KPiBTaWEgSmVlIEhlbmcgKDMpOg0KPiAgICBBU29DOiBJbnRlbDogQWRkIEtlZW1CYXkgcGxh
dGZvcm0gZHJpdmVyDQo+ICAgIEFTb0M6IEludGVsOiBBZGQgbWFrZWZpbGVzIGFuZCBrY29uZmln
IGNoYW5nZXMgZm9yIEtlZW1CYXkNCj4gICAgZHQtYmluZGluZ3M6IHNvdW5kOiBBZGQgZG9jdW1l
bnRhdGlvbiBmb3IgS2VlbUJheSBpMnMNCj4gDQoNCkFzIHRoZXNlIHNlcmllcyBoYXMgYmVlbiBn
aXZlbiBwbGVudHkgb2YgY29tbWVudHMgaW50ZXJuYWxseSBmcm9tIEFuZHksIFBpZXJyZSBhbmQg
bWUsIEknZCBiZSBiZXN0IHRvIGhhdmUgYWxsIHJldmlld2VycyBDQydlZCBoZXJlLg0KWz4+XSAg
Tm90ZWQuDQpDemFyZWsNCg==
