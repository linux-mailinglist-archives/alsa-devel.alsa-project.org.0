Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB32525B9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 05:11:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88CC81701;
	Wed, 26 Aug 2020 05:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88CC81701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598411513;
	bh=HxrD/rEwL+ijxvcptvH/tUeJvE8Jh9jwNXINVyFA7EM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/9Ai/TuX5K37cFfAXWP7z3i48Rx02DXlJ5yJlMRn3VCQO/o5TOLd2Dl4J9756HSn
	 spcqIhxwbvmmdaLEZGM3Dfx4fes7xTUWYRImkRd0W6O5TVS+PtyUu3fOIUI2v0A8RU
	 2HHiE7MuKy49qjR/nSzgxtuVv8XDwVlKT1gjC56M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A621DF800EB;
	Wed, 26 Aug 2020 05:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F76EF801D9; Wed, 26 Aug 2020 05:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E0CF800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 05:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E0CF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Zx7D7d8s"
IronPort-SDR: iF74Nvoo8lknKC+ZW2cJEyd1NpwV7n5wByZAtLSWpMe1MiqFiVPkgZ+2NQEqwGLXamlEhtXme4
 io34sUPji9ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="174274581"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="174274581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 20:09:55 -0700
IronPort-SDR: NCkvAkTOS00/VT0XjtxuSSJLg3UKfmP92sQW0QnnEhG4pe53dqbfqLhxNwlNinkRrEW2No9YIF
 HYh56BXv1Dkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="339016130"
Received: from orsmsx606-2.jf.intel.com (HELO ORSMSX606.amr.corp.intel.com)
 ([10.22.229.86])
 by orsmga007.jf.intel.com with ESMTP; 25 Aug 2020 20:09:55 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Aug 2020 20:09:55 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Aug 2020 20:09:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 25 Aug 2020 20:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBQM2efygCDkSQkU+oUsamS1xFcTf27EmgHEACsWPpUgDNkiyjK/6njD65+y+gUNRgsMfxCZj/evyIJEL6II3BK4hE936g5zfBZzeMmhrj3ETa5+qciRO9H2uzlthZ4j1DVv/yLumixXpwEf7oj6UbVeteYurnzQsK36ojU9ed4idsUTfhF3ot9RcDx+8XXi/h40DJPsy/LnrXe9ebvMWeTjruqHRPm/br+x7Eyg12yIBdzwJQvW+WH4ChpVVNuEo24ZaejQfbzFXCF+y9N+33a1yaq1uuNJ2nUVxul85x6yepu6jC4Slo8mrak2/P/3n1hfNE38b+cGsJ5/givtXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxrD/rEwL+ijxvcptvH/tUeJvE8Jh9jwNXINVyFA7EM=;
 b=Wc4UbOUX1i2Eg87GRTQsjrTcoOGiDTDFftL3M7KJxwBO4kHHuqhvgE1asik61/x9N01WpgTqSC8Om9KyNtnWxCQnLKij8Mtyf4mhjj+G6lgoP2rMLqM+sFDWcWrI9NeMeRxFauHXBB/XOHzkh0AA4Xn4bdTKyHjzNz7u/nfEzzS0Ff5GdccqxUU0Of0Ofx4qnNQ0vf31oiqkaOjhNRy67J4hIPrljlZxiKV+1TzmKX2nWfuj2i5AwcUu+ojSHlt25a3CVXSL4/kSgi+Qfk4JwIEuYEepBCL6B4lIozRerNLju1mbYuSsQ/oBl4mr9XWvRwwiMOpEYT85CoHjU/y6fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HxrD/rEwL+ijxvcptvH/tUeJvE8Jh9jwNXINVyFA7EM=;
 b=Zx7D7d8supqAQuW97rBipOUG2ovkT/bS5TRp9+rCVLo6XPi6HpbXiBjw1pukwA5O90eeCYgfFWL4z6C4gkSlysRz8JitZMDDrERIXGPbgQD8j8nkHgoYSKDtCH/YmfpaQDN6k6XiiycrJgq75iOgOukwoCuZozwJrh1za5jr294=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 26 Aug
 2020 03:09:51 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3326.019; Wed, 26 Aug 2020
 03:09:50 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: RE: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Topic: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Index: AQHWeuKlXabfYqCTjkSzu2rSWobUsalI11CQgAACZgCAAA3OF4AAE9WAgAAXc5+AABECgIAAkrTA
Date: Wed, 26 Aug 2020 03:09:50 +0000
Message-ID: <BYAPR11MB304663BC1BE5F7B2CAC887659D540@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200825132102.GA306074@mwanda>
 <CE6D3DA0-65A3-42BA-8341-13A3C6E80A55@intel.com>
 <20200825135800.GS5493@kadam>
 <2B5A2EFF-7391-4565-9B35-DCE395C7DD80@intel.com>
 <5789a393-d2b7-4127-4875-2dbcb5a19bfc@linux.intel.com>
 <EDE660AC-9B3C-4FBB-88F9-464A0D953EA7@intel.com>
 <68c77e0e-564f-6b41-26e5-b5db8b36a7f7@linux.intel.com>
In-Reply-To: <68c77e0e-564f-6b41-26e5-b5db8b36a7f7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [58.71.220.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79f7c579-5efd-4b76-92e6-08d8496d7f4e
x-ms-traffictypediagnostic: BY5PR11MB4165:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4165B3059769C75BB1669DCE9D540@BY5PR11MB4165.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DtxhFUICxe2ov9pCWGOWKKH5FSPtsGdKNXQjaNu8M5oZs6PCbZFRvUk5LDn+7XsW35DfkFpBIfUc2+XegXv7h6500Oxsogh68kESS77BMnNdeDath8lX2HG7gdIZtSIhCN4Z6rgTndpZyYx/N2icXaeLN7swCSEEPHGuvR6s7fjnofdM8vDeVJZECNcya06no+ND0LqRPRjjI/deoug4YsXjYmlZSV8f3ErvD1dPys5G6GfbQC4Q8fkKhuIrRfEDaQo0h88V6YnKNofFeQrqKZuwzkYywiPhgaYqp9DGo514DQIhSkUMKet/qORQ+lon
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(4326008)(7696005)(54906003)(316002)(478600001)(66476007)(52536014)(76116006)(86362001)(71200400001)(64756008)(5660300002)(66556008)(66946007)(66446008)(186003)(26005)(53546011)(6506007)(2906002)(9686003)(55016002)(33656002)(8936002)(6916009)(83380400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kM0Aqbn7anh7KFupl91NpFjsqYrL4yuvuWnbWb4siVM4u36zeMUXULAx7IWoTJJ0UvJ33sY9faFyFoXbNmXFx/Kg6mEqf4dgkdAe+rDcI41qsxO9J0YHDlremA51peIhGIacj3NIdEIiNAy1WSYYop0pj9oASvYp/A99XfC6x+T9hymVw4gZmvbGaKywVLLS4sfC1rNKpYeOIXhHyumFDUSqr++D+kYWaSNdstc6eCm2hZ5KvrOBkAoCmZ1o8gzjbPmLzLdm73PKTuZOj9dsd/1Nheg3lFJIRMzGAiqbfhGq+jVKzj0UZzWD5IlEX4F43mK10NNhxevnqE/J2u3uf1JJbV5TkiWZV/EHfXDS4ytUiz67xydmHiXPuWzdwwGE6CI13nlJkU0BxbQcSAiiDbLoLju7Xm5HGhf9Ven+fwVIDdkuPh3vmZbiAvkKc6yZbj0Ao+XoTeLeDPDxir1ALZ4gcvdbwBgq731XWoCERZyxBQr3CIAebpPQXLovmUUWad9qQq/x+eMCN7xdF9oELSHqdY6jiZlWGMoKat4sJsHUNtOhFKCgrN8qJetL273W2aE9sB7yo6t/vgC4qQMWasR0ErIpgsqM2aRC3gvn2Q7f21gPVpnsndULNRFDeapW36lPGDQzRquu9YEyyAF9Qw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f7c579-5efd-4b76-92e6-08d8496d7f4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2020 03:09:50.8054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysTfsp3sbZ39Kj6hd+TGgd1i4Fo+tNR4TYGj1cSz3CHJYFTblAMxxTIk+dJ5xJiLmExd1Lkni9wfyqLl1ashCwiwLkwUulmekHxdbGn+yCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4165
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCAyNiBBdWd1c3QsIDIwMjAgMjoyMyBBTQ0KPiBUbzogU2l0LCBNaWNoYWVsIFdlaSBI
b25nIDxtaWNoYWVsLndlaS5ob25nLnNpdEBpbnRlbC5jb20+DQo+IENjOiBEYW4gQ2FycGVudGVy
IDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+OyBhbHNhLWRldmVsQGFsc2EtDQo+IHByb2plY3Qu
b3JnOyBTaWEsIEplZSBIZW5nIDxqZWUuaGVuZy5zaWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW2J1ZyByZXBvcnRdIEFTb0M6IEludGVsOiBLTUI6IEVuYWJsZSBURE0gYXVkaW8NCj4gY2Fw
dHVyZQ0KPiANCj4gDQo+ID4+Pj4+PiAgIDUwNiAgICAgICAgICBzd2l0Y2ggKGNvbmZpZy0+Y2hh
bl9ucikgew0KPiA+Pj4+Pj4gICA1MDcgICAgICAgICAgY2FzZSA4Og0KPiA+Pj4+Pj4gICA1MDgg
ICAgICAgICAgY2FzZSA0Og0KPiA+Pj4+Pj4gICA1MDkgICAgICAgICAgICAgICAgICAvKg0KPiA+
Pj4+Pj4gICA1MTAgICAgICAgICAgICAgICAgICAgKiBQbGF0Zm9ybSBpcyBub3QgY2FwYWJsZSBv
ZiBwcm92aWRpbmcgY2xvY2tzDQo+IGZvcg0KPiA+Pj4+Pj4gICA1MTEgICAgICAgICAgICAgICAg
ICAgKiBtdWx0aSBjaGFubmVsIGF1ZGlvDQo+ID4+Pj4+PiAgIDUxMiAgICAgICAgICAgICAgICAg
ICAqLw0KPiA+Pj4+Pj4gICA1MTMgICAgICAgICAgICAgICAgICBpZiAoa21iX2kycy0+bWFzdGVy
KQ0KPiA+Pj4+Pj4gICA1MTQgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+Pj4+Pj4gICA1MTUNCj4gPj4+Pj4+ICAgNTE2ICAgICAgICAgICAgICAgICAgd3JpdGVf
dmFsID0gKChjb25maWctPmNoYW5fbnIgLyAyKSA8PA0KPiBURE1fQ0hBTk5FTF9DT05GSUdfQklU
KSB8DQo+ID4+Pj4+PiAgIDUxNyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoY29u
ZmlnLT5kYXRhX3dpZHRoIDw8DQo+IERBVEFfV0lEVEhfQ09ORklHX0JJVCkgfA0KPiA+Pj4+Pj4g
ICA1MTggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIU1BU1RFUl9NT0RFIHwgVERN
X09QRVJBVElPTjsNCj4gPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5eXl5eXl5eXl5eXiBNQVNURVJfTU9ERQ0KPiA+Pj4+Pj4gaXMgQklUKDEzKS4gIEl0J3Mg
dW5jbGVhciB3aGF0IHRoaXMgaXMgc3VwcG9zZWQgdG8gYmUuICBNeSBiZXN0DQo+ID4+Pj4+PiBn
dWVzcyBpcyB0aGF0IHRoZSAhIHNob3VsZCBqdXN0IGJlIGRlbGV0ZWQuDQo+ID4+Pj4+DQo+ID4+
Pj4+IFRoaXMgISBpcyBpbnRlbnRpb25hbCBiZWNhdXNlIGl0IGlzIG1lYW50IHRvIGJlIFNsYXZl
IG1vZGUuDQo+IFdvdWxkIGEgYmV0dGVyIGFwcHJvYWNoIGJlIHRvIGNyZWF0ZSBhbm90aGVyICNk
ZWZpbmUgZm9yIHNsYXZlDQo+IG1vZGU/DQo+ID4+Pj4NCj4gPj4+PiBJbiBteSBvcGluaW9uLCBp
dCdzIGJldHRlciB0byBqdXN0IGxlYXZlIGl0IG91dC4gIE9SaW5nIHdpdGggemVybw0KPiA+Pj4+
IGNhdXNlcyBhIGRpZmZlcmVudCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nIG9uIG15IHVucmVsZWFz
ZWQNCj4gPj4+PiBjaGVja3MuLi4gIElzIGl0DQo+ID4+Pj4gMCA8PCAxMz8gIEkgZmVlbCBsaWtl
IE9SaW5nIHdpdGggemVybyBqdXN0IG1ha2VzIHRoaW5ncyBtb3JlDQo+IGNvbmZ1c2luZy4NCj4g
Pj4+Pg0KPiA+Pj4gSXQgaXMgMDw8MTMsIGluIHRoZSBldmVudCBpdCB3YXMgcHJldmlvdXNseSBj
b25maWd1cmVkIHRvIE1hc3RlciBJDQo+ID4+PiB3b3VsZCBuZWVkIHRvIHVuc2V0IHRoZSBiaXQN
Cj4gPj4NCj4gPj4gWW91IGFyZSBhc3NpZ25pbmcgdGhlIHJlc3VsdCB0byB3cml0ZV92YWwsIHNv
IHRoZXJlJ3Mgbm8gbWVtb3J5DQo+IG9mIHdoYXQgd2FzIGNvbmZpZ3VyZWQgYmVmb3JlPw0KPiA+
DQo+ID4gWWVhIHlvdSBhcmUgcmlnaHQsIHdvdWxkIGxlYXZpbmcgdGhpcyAhTUFTVEVSX01PREUg
b3V0IHRoZSBiZXN0DQo+IHNvbHV0aW9uPw0KPiANCj4gU291bmRzIGdvb2QgdG8gbWUuIFRoYW5r
cyBEYW4gZm9yIHRoZSByZXBvcnQhDQpUZXN0ZWQgcmVtb3ZpbmcgdGhlICFNQVNURVJfTU9ERSBm
cm9tIHRoZSB3cml0ZV92YWwsIGl0IHN0aWxsIHdvcmtzIGFzIGV4cGVjdGVkDQpSZW1vdmluZyAh
TUFTVEVSX01PREUgc291bmRzIGdvb2QgdG8gbWUuIFRoYW5rcyBEYW4gZm9yIHRoZSByZXBvcnQh
DQo=
