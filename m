Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8A1222665
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 17:02:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F6C10E;
	Thu, 16 Jul 2020 17:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F6C10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594911745;
	bh=DDjOAqfS2sWJ/GX7qzMUVfxnc0H1mZuIb1V4cv8bRFs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C9ofLvsHtzKOyu5vQZdTmU2seJ5RpxS4QCv+OPdOAf6ul9VB74wVhSAeSLR49iluX
	 ZLyi/Zg3+irHW9b7FImTFmaxaSqf6Z+lw8vzf4WfVsAZV9PHR6pQT0sdqRuW7xNhLV
	 q4r6u0db2W6wgA+uaOQwhH9rhkTzxLR3/0uBMD/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 728E7F801EC;
	Thu, 16 Jul 2020 17:00:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B905CF801EC; Thu, 16 Jul 2020 17:00:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4771CF80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 17:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4771CF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="tmCiBOcS"
IronPort-SDR: CgJcIY1Qa8N7jM+k0kNQo6CIVVy2mPpJxFPxHvXSp4rDjO0AnaVW0II9qv7FY15mHRxSLlgspU
 tf9vUcANT+Zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="167526717"
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; d="scan'208";a="167526717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 08:00:26 -0700
IronPort-SDR: 8yqHLtrdHFFDFwu1fxLZ/JFutZw7NeRTDrABxJxLM5nE4xKFab+3j/AcUlyqCgXAJZFci91cVN
 FQCx7thY1UIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; d="scan'208";a="460497708"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga005.jf.intel.com with ESMTP; 16 Jul 2020 08:00:25 -0700
Received: from fmsmsx125.amr.corp.intel.com (10.18.125.40) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 08:00:25 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX125.amr.corp.intel.com (10.18.125.40) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 08:00:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 16 Jul 2020 08:00:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQRm5pB04PmnpiY1DK2cZuhIVXnGpnMhaUFJoTBzztMYsQHpqkIlbWPleuJwv3X5JgtDqrQUZ2WKmVbVWp1ecNJpfiy6K0udtA2BHKPdspvlNV1XNQtCvlja5laQAqpAFmgbElV2vXEgdEhMjZahcLZkC47aKo5T3rfkWMlBuCVEf5/d4B4vlXOs85fYyZcBbIK/E5H/tKvEqyZqIWx1bnuKnn7chIdI0CEuFNXhfL1/I6NAzfR1uf+IMrOaTAn+ej6ySl9H9+caOtuvNaefUC4RtFwvwfe7DFKpBOwxcqsOwtq+4nIvfoQLfi2m6PWvKeHrmY3GYPZKxCGnRysDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDjOAqfS2sWJ/GX7qzMUVfxnc0H1mZuIb1V4cv8bRFs=;
 b=LbffdB/TTaY6YOXt0zO1sOkR5nFxdZU2uy5K4UVjEdaAsiAMqH9Ry1bOqJkZtR9P2EUmPis34EVxy/IMpKQiE/0qUs8z9ZLslum2dHYOANdbLoPtPRfGeV+EMYVMoprry5jT3EQSUTtZL7tbdqP8nANOk0UKlwSoQnjmdQPcMZwcpOSIVRDFPm1keuX4DOgCLb4IIJ+5KLVoEGeNVMOjeYxc2SJrljLCuLOWUsQcMMzdlnpdBDIqsceGjfe2YuFqXLoKvSZJzxmp9LVqTIOsAhDI3Jthl/DD3U4gIYQ3h4P+afPKKRLEyHFzpOlAm3WTi/xeRk+otGAukXGDwIp33A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDjOAqfS2sWJ/GX7qzMUVfxnc0H1mZuIb1V4cv8bRFs=;
 b=tmCiBOcSO+w/6grbliZL6TvFeHscKcneocI661N7hPshXWxUzCk0Iip8zs8p6+mGuxKSJsrbca6gjAKd4wE1TWOoFceyIUjJGlaVaT7ZxS7/JgPTg5XGczW+oMTBVT2BQD6y8j2wc2Z6UKWPIvBNs/Le2slzLesQ5HjNXa6lSwY=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB3191.namprd11.prod.outlook.com (2603:10b6:a03:79::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Thu, 16 Jul
 2020 15:00:23 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3174.025; Thu, 16 Jul 2020
 15:00:23 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Lukasz
 Majczak" <lma@semihalf.com>, Jie Yang <yang.jie@linux.intel.com>, "Liam
 Girdwood" <liam.r.girdwood@linux.intel.com>
Subject: RE: [PATCH v5] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Thread-Topic: [PATCH v5] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Thread-Index: AQHWVDmVeV8vwBfdakmCVbwCMxmn6Kj8Q1eAgA4W94A=
Date: Thu, 16 Jul 2020 15:00:22 +0000
Message-ID: <BY5PR11MB4307B232AF066572F8037934FD7F0@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <20200703121650.547944-1-lma@semihalf.com>
 <20200707083404.3846-1-lma@semihalf.com>
 <4cb5ea5a-60b3-7f74-0f68-e66d2f2872bf@linux.intel.com>
In-Reply-To: <4cb5ea5a-60b3-7f74-0f68-e66d2f2872bf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [24.23.139.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9331af63-ade7-4f14-1bc9-08d82998f719
x-ms-traffictypediagnostic: BYAPR11MB3191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3191BAFE60121BDCBA788D64FD7F0@BYAPR11MB3191.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TfziwmRO8zC3E5uQaZTUT/aaQfOsRv6I8RPEVJuChk1az0IhjBJm3D4xuLXcLMHpxTKdmcTA45A7Kt9S+YQTLh2krOiWkr45K8p4dwjurU+Lfj16AZybJpMBs8TVvdzs5mdtxhQDxcs3MKD5LzltuD7tCP1+GWy9cRMI9UvcGqwmlSDDgx/doO/D+tSqlyJTNngrPwYrk64eWA7h6NpwnJAPAIAKUycE6Uf3vzMb+xmWLW5I3/sE+8delM9xmMLq7UpUp54IZryw/DHswz1p8pC47zjpTAsAKEugG67dDy066lVX9t+MI3asg00BAtae3glrTGnSkAEAlTn0c0DRAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(478600001)(316002)(55016002)(7696005)(110136005)(86362001)(2906002)(7416002)(8936002)(33656002)(4326008)(54906003)(9686003)(66476007)(53546011)(83380400001)(5660300002)(52536014)(66446008)(76116006)(26005)(66556008)(64756008)(6506007)(66946007)(186003)(8676002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: U6MtQX/sLXV0/6vWwIKPJuRJ2JlRODInQmuFhfiH+bipLUMkPsz+S9jOagP/r8i2v0auRhL/+x2xN134n53bTneZ/ZJ8NwjPuX4cd/suPC/HNA+OvAKTcm4l2Oe5l7L3x2OHpuwlr/vQAjbAeI4q4s2JX6Jzk86wNKvoCGZITG7qsyQDgdH5mANjOJqC2Q4C5hbpMdl7Pj+2mXwRpJH24Ei4Gx9WcmsgNH0gKJHVUZyYeNsLPA6D5lQAGGe9S3viA6JpzIqBDIMJBWZFBl4Rsg8jQCfgC1Cgi+4Swls+7tOku2wCKLIao2vVKMfkfwo17czW5dimRRbQp+S86PyzuEltoeoxaADJpi2umEvoMMk9EJCrT4VS0PK48FO6eCgvwhaRREr/PWyBpwW1NGjGXiGLrc9F/KR/Pze8QMO1ArH4kervdrwZ01UvQXsHvBzximXXEDytQ5MGS44aRxhXw90y6w1unQTUzV2nKzj8asL8QUd/8vH/pz8SWSv9q+/n
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9331af63-ade7-4f14-1bc9-08d82998f719
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 15:00:22.7842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78G1PZ+5uL9Q7F7/js0wmVLAVyAk+ntx4fOiVJv692RuZ33IPVAJ5cWTKdphf/nVSo6iEd/P2oEG1fswpbbbGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3191
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Radoslaw
 Biernacki <rad@semihalf.com>, Ross Zwisler <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "M R, Sathya
 Prakash" <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>, "Gopal, 
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

DQo+IA0KPiANCj4gT24gNy83LzIwIDM6MzQgQU0sIEx1a2FzeiBNYWpjemFrIHdyb3RlOg0KPiA+
IEZpeCBrYWJ5bGFrZV9zc3BfZml4dXAgZnVuY3Rpb24gdG8gZGlzdGluZ3Vpc2ggY29kZWNzIERB
SXMgYnkgbmFtZXMsDQo+ID4gYXMgY3VycmVudCBhcHByb2FjaCwgbGVhZHMgdG8gY3Jhc2ggd2hp
bGUgdHJ5aW5nIHRvIGdldCBzbmRfc29jX2RwY20NCj4gPiB3aXRoDQo+ID4gY29udGFpbmVyX29m
KCkgbWFjcm8gaW4ga2FieWxha2Vfc3NwX2ZpeHVwKCkuDQo+ID4gVGhlIGNyYXNoIGNhbGwgcGF0
aCBsb29rcyBhcyBiZWxvdzoNCj4gPiBzb2NfcGNtX2h3X3BhcmFtcygpDQo+ID4gc25kX3NvY19k
YWlfaHdfcGFyYW1zKGNvZGVjX2RhaSwgc3Vic3RyZWFtLCAmY29kZWNfcGFyYW1zKTsNCj4gPiBy
dGQtPmRhaV9saW5rLT5iZV9od19wYXJhbXNfZml4dXAocnRkLCBwYXJhbXMpDQo+ID4ga2FieWxh
a2Vfc3NwX2ZpeHVwKCkNCj4gPiBJbiB0aGlzIGNhc2UsIGNvZGVjX3BhcmFtcyBpcyBqdXN0IGEg
Y29weSBvZiBhbiBpbnRlcm5hbCBzdHJ1Y3R1cmUgYW5kDQo+ID4gaXMgbm90IGVtYmVkZGVkIGlu
dG8gc3RydWN0IHNuZF9zb2NfZHBjbSB0aHVzIHdlIGNhbm5vdCB1c2UNCj4gPiBjb250YWluZXJf
b2YoKSBvbiBpdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBNYWpjemFrIDxsbWFA
c2VtaWhhbGYuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhcnNoYSBQcml5YSA8aGFyc2hhcHJp
eWEubkBpbnRlbC5jb20+DQo+IA0KPiBBY2tlZC1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBp
ZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NClRoaXMgZml4IGlzIG5vdCBjb21w
bGV0ZSBhcyB0aGUgYXNvY19ydGRfdG9fY29kZWMocnRkLDApIHJldHVybnMgdGhlIGNvZGVjIGlu
c3RhbmNlDQphdCAwdGggbG9jYXRpb24uICBJbnN0ZWFkIHdlIG5lZWQgdG8gdXNlIHRoZSBkcGNt
IGluIHRoZSBzbmRfcGNtX3J1bnRpbWUgc3RydWN0dXJlLg0KSSB3aWxsIG5lZWQgYW5vdGhlciB2
ZXJzaW9uIG9mIHRoaXMgcGF0Y2guIA0KDQo+IA0KPiA+IC0tLQ0KPiA+IHYxIC0+IHYyOg0KPiA+
IC0gRXh0cmFjdCBkbWljIGZyb20gU1NQMCBhcyBldmVyeSBCRSBzaG91bGQgaGF2ZSBvd24gZml4
dXAgZnVuY3Rpb24uDQo+ID4gdjIgLT4gdjM6DQo+ID4gLSBSZXN0b3JlIG5hbWluZyBpbiB0aGUg
ZGFwbSByb3V0ZSB0YWJsZSB0byBub3QgY29uZnVzZSB3aXRoIG90aGVyDQo+ID4gZHJpdmVycw0K
PiA+IC0gRml4ZWQgaW5kZW50YXRpb25zDQo+ID4gdjMgLT4gdjQ6DQo+ID4gLSBVcGRhdGVkIGNv
ZGUgYW5kIGNvbW1pdCBkZXNjcmlwdGlvbiBhY2NvcmRpbmcgdG8gc29sdXRpb24gcHJvcG9zZWQN
Cj4gPiBieSBIYXJzaGENCj4gPiAtLS0NCj4gPiAgIC4uLi9pbnRlbC9ib2FyZHMva2JsX3J0NTY2
M19ydDU1MTRfbWF4OTg5MjcuYyB8IDI4ICsrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9ydDU2NjNfcnQ1NTE0X21heDk4
OTI3LmMNCj4gPiBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2M19ydDU1MTRfbWF4
OTg5MjcuYw0KPiA+IGluZGV4IGIzNGNmNmNmMTEzOTUuLmRmNDU0ZGU0MDczOWEgMTAwNjQ0DQo+
ID4gLS0tIGEvc291bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9tYXg5ODky
Ny5jDQo+ID4gKysrIGIvc291bmQvc29jL2ludGVsL2JvYXJkcy9rYmxfcnQ1NjYzX3J0NTUxNF9t
YXg5ODkyNy5jDQo+ID4gQEAgLTMzMywzNiArMzMzLDMyIEBAIHN0YXRpYyBpbnQga2FieWxha2Vf
c3NwX2ZpeHVwKHN0cnVjdA0KPiBzbmRfc29jX3BjbV9ydW50aW1lICpydGQsDQo+ID4gICB7DQo+
ID4gICAJc3RydWN0IHNuZF9pbnRlcnZhbCAqcmF0ZSA9IGh3X3BhcmFtX2ludGVydmFsKHBhcmFt
cywNCj4gPiAgIAkJCVNORFJWX1BDTV9IV19QQVJBTV9SQVRFKTsNCj4gPiAtCXN0cnVjdCBzbmRf
aW50ZXJ2YWwgKmNoYW4gPSBod19wYXJhbV9pbnRlcnZhbChwYXJhbXMsDQo+ID4gKwlzdHJ1Y3Qg
c25kX2ludGVydmFsICpjaGFubmVscyA9IGh3X3BhcmFtX2ludGVydmFsKHBhcmFtcywNCj4gPiAg
IAkJCVNORFJWX1BDTV9IV19QQVJBTV9DSEFOTkVMUyk7DQo+ID4gICAJc3RydWN0IHNuZF9tYXNr
ICpmbXQgPSBod19wYXJhbV9tYXNrKHBhcmFtcywNCj4gU05EUlZfUENNX0hXX1BBUkFNX0ZPUk1B
VCk7DQo+ID4gLQlzdHJ1Y3Qgc25kX3NvY19kcGNtICpkcGNtID0gY29udGFpbmVyX29mKA0KPiA+
IC0JCQlwYXJhbXMsIHN0cnVjdCBzbmRfc29jX2RwY20sIGh3X3BhcmFtcyk7DQo+ID4gLQlzdHJ1
Y3Qgc25kX3NvY19kYWlfbGluayAqZmVfZGFpX2xpbmsgPSBkcGNtLT5mZS0+ZGFpX2xpbms7DQo+
ID4gLQlzdHJ1Y3Qgc25kX3NvY19kYWlfbGluayAqYmVfZGFpX2xpbmsgPSBkcGNtLT5iZS0+ZGFp
X2xpbms7DQo+ID4gKwlzdHJ1Y3Qgc25kX3NvY19kYWkgKmNvZGVjX2RhaSA9IGFzb2NfcnRkX3Rv
X2NvZGVjKHJ0ZCwgMCk7DQo+ID4NCj4gPiAgIAkvKg0KPiA+ICAgCSAqIFRoZSBBRFNQIHdpbGwg
Y29udmVydCB0aGUgRkUgcmF0ZSB0byA0OGssIHN0ZXJlbywgMjQgYml0DQo+ID4gICAJICovDQo+
ID4gLQlpZiAoIXN0cmNtcChmZV9kYWlfbGluay0+bmFtZSwgIktibCBBdWRpbyBQb3J0IikgfHwN
Cj4gPiAtCSAgICAhc3RyY21wKGZlX2RhaV9saW5rLT5uYW1lLCAiS2JsIEF1ZGlvIEhlYWRzZXQg
UGxheWJhY2siKSB8fA0KPiA+IC0JICAgICFzdHJjbXAoZmVfZGFpX2xpbmstPm5hbWUsICJLYmwg
QXVkaW8gQ2FwdHVyZSBQb3J0IikpIHsNCj4gPiArDQo+ID4gKwlpZiAoIXN0cmNtcChjb2RlY19k
YWktPm5hbWUsIEtCTF9SRUFMVEVLX0RNSUNfQ09ERUNfREFJKSkgew0KPiA+ICsJCWlmIChwYXJh
bXNfY2hhbm5lbHMocGFyYW1zKSA9PSAyIHx8DQo+ID4gKwkJCURNSUNfQ0goZG1pY19jb25zdHJh
aW50cykgPT0gMikNCj4gPiArCQkJY2hhbm5lbHMtPm1pbiA9IGNoYW5uZWxzLT5tYXggPSAyOw0K
PiA+ICsJCWVsc2UNCj4gPiArCQkJY2hhbm5lbHMtPm1pbiA9IGNoYW5uZWxzLT5tYXggPSA0Ow0K
PiA+ICsJfSBlbHNlIHsNCj4gPiAgIAkJcmF0ZS0+bWluID0gcmF0ZS0+bWF4ID0gNDgwMDA7DQo+
ID4gLQkJY2hhbi0+bWluID0gY2hhbi0+bWF4ID0gMjsNCj4gPiArCQljaGFubmVscy0+bWluID0g
Y2hhbm5lbHMtPm1heCA9IDI7DQo+ID4gICAJCXNuZF9tYXNrX25vbmUoZm10KTsNCj4gPiAgIAkJ
c25kX21hc2tfc2V0X2Zvcm1hdChmbXQsIFNORFJWX1BDTV9GT1JNQVRfUzI0X0xFKTsNCj4gPiAt
CX0gZWxzZSBpZiAoIXN0cmNtcChmZV9kYWlfbGluay0+bmFtZSwgIktibCBBdWRpbyBETUlDIGNh
cCIpKSB7DQo+ID4gLQkJaWYgKHBhcmFtc19jaGFubmVscyhwYXJhbXMpID09IDIgfHwNCj4gPiAt
CQkJCURNSUNfQ0goZG1pY19jb25zdHJhaW50cykgPT0gMikNCj4gPiAtCQkJY2hhbi0+bWluID0g
Y2hhbi0+bWF4ID0gMjsNCj4gPiAtCQllbHNlDQo+ID4gLQkJCWNoYW4tPm1pbiA9IGNoYW4tPm1h
eCA9IDQ7DQo+ID4gICAJfQ0KPiA+ICAgCS8qDQo+ID4gICAJICogVGhlIHNwZWFrZXIgb24gdGhl
IFNTUDAgc3VwcG9ydHMgUzE2X0xFIGFuZCBub3QgUzI0X0xFLg0KPiA+ICAgCSAqIHRodXMgY2hh
bmdpbmcgdGhlIG1hc2sgaGVyZQ0KPiA+ICAgCSAqLw0KPiA+IC0JaWYgKCFzdHJjbXAoYmVfZGFp
X2xpbmstPm5hbWUsICJTU1AwLUNvZGVjIikpDQo+ID4gKwlpZiAoIXN0cmNtcChjb2RlY19kYWkt
Pm5hbWUsIEtCTF9NQVhJTV9DT0RFQ19EQUkpKQ0KPiA+ICAgCQlzbmRfbWFza19zZXRfZm9ybWF0
KGZtdCwgU05EUlZfUENNX0ZPUk1BVF9TMTZfTEUpOw0KPiA+DQo+ID4gICAJcmV0dXJuIDA7DQo+
ID4NCg==
