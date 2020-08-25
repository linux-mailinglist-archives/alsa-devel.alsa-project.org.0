Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C72251A2D
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 15:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D8861670;
	Tue, 25 Aug 2020 15:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D8861670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598363487;
	bh=SPFhd4tYdkuNtVAjdTrPUyjaZ+fP3Ia5nUhC7JXje5I=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npedcExylMvMeDDM3xHvhClSN3O04B+12QsiGLiHSyUS3mzHtsYeh7LoMJObQXwfd
	 9wWPT8NN/YKIT7jeapBP59fbXPePDWfRPlzwzteHToVB22WywiD5KxAJPW7TSxWAer
	 DnOmvW/erUPKEr6R4Qdq90m/kQrWsa6p13S1FfwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E129F8025A;
	Tue, 25 Aug 2020 15:49:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C31CF8025A; Tue, 25 Aug 2020 15:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC6FF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 15:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC6FF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="sDTOuhLP"
IronPort-SDR: 5ekoBFdssxA4snrf9WqFxY0s0KCuF2wjH2oEeN/uRne1RDCZxahrg3OO7ocF+F2cmrXTsZRVUg
 B6qMHgNJ2h1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="220369082"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="220369082"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 06:49:32 -0700
IronPort-SDR: osI8RyfEkBOjmZUKFfJv43m8QezScSRye+/DuAWkhPMYWRnz6t+MPy8OpbnPnFKH6Rd3G/9ITb
 s1zE+xsQRXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="312554453"
Received: from orsmsx601-2.jf.intel.com (HELO ORSMSX601.amr.corp.intel.com)
 ([10.22.229.81])
 by orsmga002.jf.intel.com with ESMTP; 25 Aug 2020 06:49:32 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Aug 2020 06:49:31 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Aug 2020 06:49:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 25 Aug 2020 06:49:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRzDnBZFGL17yH8IXuxXmwRGg0CiYp847KHJ1eHiWoi73QKWxfwEiDMbq0eRgzAigSGVcMMPtnEv0X1E9cl9RFYaj5KwPledbb0fR/f+O6gKg4h/oeNTpRjCmUjoGlmIHbANc47JMNBIY5XhHZgzK9TK8gSpYj5bWJzBW6/+3dR/Z8pZrLdGxPbdZNcjePZRoAJ/e9GCpldaWjH+RDenjfhAhPKyv9TU9vm021tXy6KPcrHBMxsyCX2FnVMDzWSIbMiEegYL657pSPq3WdtwhdUklH2R7/cdAsFagVxrafDvYZrGHi0XEW853pjhSKOvDsxhWmhWuqUqCKgY6lnxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPFhd4tYdkuNtVAjdTrPUyjaZ+fP3Ia5nUhC7JXje5I=;
 b=CF6IXxrXvAvJyk7l6QderQGo1K/cA41y/jDA55iC2orlRiNGsK5A7/E6LHBLtcjJ2soTljcfFdIEQvao4+xUJNl4K/0OKgOgWxQRyfuZBcaElfCssHFReKF3vUygxqdoA6pTjfRZdSHbEohT2emzoGKk4AFTu77N9FzkWWLCR8UYkedTYZ3vkkxLRgf8FDg4SM3XFf7h/xpWM22rD9n0eR3T/i7YLB0oqia9YBejdg5mQBP9d0p/c9W2r43KeZPQ0xws+e7PK/nRHo0aH+Hkiw1MZmcKOUYfdlQkPZ9oCXaEwEoZ1inLKeEwuRhNNwN/oj5cUXu4aKZpf3b6AvktGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPFhd4tYdkuNtVAjdTrPUyjaZ+fP3Ia5nUhC7JXje5I=;
 b=sDTOuhLPLwyx0WUWAO0wenMH39ZBkcLUBUBNIbdOo1HFMsXcx0rjBNm/T7z4g9EFq73BXPz9fQPk0uXcNyG/gQiMn+oJqhBbToYfZOYohdS47OWSwD6HaWs9tjt2cZ3V0f2A4p7dvwFEpemfMvQ+QquMW+O4rddUa/LhaeTSpC8=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BYAPR11MB3656.namprd11.prod.outlook.com (2603:10b6:a03:f8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 13:49:25 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 13:49:25 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Topic: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Index: AQHWeuKlXabfYqCTjkSzu2rSWobUsalI11CQ
Date: Tue, 25 Aug 2020 13:49:25 +0000
Message-ID: <CE6D3DA0-65A3-42BA-8341-13A3C6E80A55@intel.com>
References: <20200825132102.GA306074@mwanda>
In-Reply-To: <20200825132102.GA306074@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none; alsa-project.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [2001:d08:db:bfac:c4b5:810:19b6:2a11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25b78e91-d37c-49f0-ba5e-08d848fdadd0
x-ms-traffictypediagnostic: BYAPR11MB3656:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB365695DB7E98AE0C91CBFE559D570@BYAPR11MB3656.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a1S6mnGzZ3W9SLrI9/vGvgOqtJ3qKkhFPxMgwnJBhKg+Oeiq4f5NbS//zL85RrdES6tDoSawRMh/DtOflqvcnfS9epUZcZNjbJz2VJNwM8f2/mLvlSMF1btpc0eU6l81r22QpIYdH3iE14YUWqu0MiTS3nlcLwPKELGu5EqRwD1fiAI5xajjQbeAzcNQ1+trlRHx75lgtjO1jq4vIAdr4ZAVr3Q6Z9rp+h/dVlpY5RMAnyWvHO5FgolfczYk3xqwTpsthzk+M7shNxGlOwF5SDf3wiApQQUzVyBqQ/WF63cK2gGDGm/ZvcxvgR+uFCrt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(71200400001)(6486002)(66446008)(86362001)(107886003)(4326008)(36756003)(6512007)(54906003)(186003)(66556008)(33656002)(6506007)(2906002)(83380400001)(2616005)(478600001)(53546011)(76116006)(91956017)(316002)(8676002)(66476007)(8936002)(64756008)(6916009)(66946007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MwHHumjYePj3IKzoo+vnNJTFOmkVgQjVevVXC0NCa5/EvhcYY//jq7TRSvfXji2hmlA9DDo0vw802RvMeE/BaIpa8jYLnrBrKc9PNe3fU4kZK6jO+qgxHGy/L2U1JoeFw3ZLPOwRiBHEeLIMuEnndMgozM7q2l0PWWUpuJpUNE4APwsZq1r1fnmglMXGnwyoWOCZ7X6mmacxjBIPng9xLnpoIKS0Avs7jMKjoP8xG3ST5pu+IrBkPDtrO3gzDbUbLdkIptYUZYGacEIqQRGVdZeWHntWeX9rebBsqsLvRGg5Jpy+WXKu3H8Q2lXULE8rCuCM6/xJ41mitgJt9EZtuTgaFdC7nxwLvUhdRSEjD37BWWT5bdHOp9oz1vaMZZXkKjpz4QmTq1CX2Q3l0vUNDJwKoIa1SWSwNhxGlpEldm8mvKFXTKv5F4q5aznzOOm7XUTU6QQpjYgIw86gSW21Bub7yybbgn1kZGaevaOC4I1SHDzgNUOMutJdfeBRifaMxe3ZKZiB87KJKMXNSLIz3HjgAHOpEhJSNeVGwLBqnqgJUKVACcYxtdChA1AzSkC+i7WPTl5PissDIqgbTiHW2FjnQDlkCh+lGRZOOeifdS8BakpYqtECkOdL/35kL9bx+Q3FUlUFPRNgAD2micn8+OZWaMyLdVq6JiTBT13AEZ3GtCDzBveJ9O+9jlBhP4Le44HpDZdnFAS32fscqWPtHQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b78e91-d37c-49f0-ba5e-08d848fdadd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 13:49:25.1429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ynC3Yo94MYOxWfK8tJA/wEDt2/qm5D/4d5EuvB2qa35pFjjw6FCloNBA0THTxVvpORoO5Rc6DSZnnPO62WuqmWXaj3Txl7UUUB5FzOdt8C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3656
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia, Jee
 Heng" <jee.heng.sia@intel.com>
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDk6MjEgUE0sIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79IZWxsbyBNaWNoYWVsIFNpdCBXZWkg
SG9uZywNCj4gDQo+IFRoZSBwYXRjaCA5YzNiYWIzYzRmMTU6ICJBU29DOiBJbnRlbDogS01COiBF
bmFibGUgVERNIGF1ZGlvIGNhcHR1cmUiDQo+IGZyb20gQXVnIDExLCAyMDIwLCBsZWFkcyB0byB0
aGUgZm9sbG93aW5nIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+IA0KPiAgICBzb3VuZC9zb2Mv
aW50ZWwva2VlbWJheS9rbWJfcGxhdGZvcm0uYzo1MTgga21iX2RhaV9od19wYXJhbXMoKQ0KPiAg
ICB3YXJuOiBwb3RlbnRpYWwgISB2cyB+IHR5cG8NCj4gDQo+IHNvdW5kL3NvYy9pbnRlbC9rZWVt
YmF5L2ttYl9wbGF0Zm9ybS5jDQo+ICAgNTAyICAgICAgICAgIH0NCj4gICA1MDMgIA0KPiAgIDUw
NCAgICAgICAgICBjb25maWctPmNoYW5fbnIgPSBwYXJhbXNfY2hhbm5lbHMoaHdfcGFyYW1zKTsN
Cj4gICA1MDUgIA0KPiAgIDUwNiAgICAgICAgICBzd2l0Y2ggKGNvbmZpZy0+Y2hhbl9ucikgew0K
PiAgIDUwNyAgICAgICAgICBjYXNlIDg6DQo+ICAgNTA4ICAgICAgICAgIGNhc2UgNDoNCj4gICA1
MDkgICAgICAgICAgICAgICAgICAvKg0KPiAgIDUxMCAgICAgICAgICAgICAgICAgICAqIFBsYXRm
b3JtIGlzIG5vdCBjYXBhYmxlIG9mIHByb3ZpZGluZyBjbG9ja3MgZm9yDQo+ICAgNTExICAgICAg
ICAgICAgICAgICAgICogbXVsdGkgY2hhbm5lbCBhdWRpbw0KPiAgIDUxMiAgICAgICAgICAgICAg
ICAgICAqLw0KPiAgIDUxMyAgICAgICAgICAgICAgICAgIGlmIChrbWJfaTJzLT5tYXN0ZXIpDQo+
ICAgNTE0ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICA1MTUg
IA0KPiAgIDUxNiAgICAgICAgICAgICAgICAgIHdyaXRlX3ZhbCA9ICgoY29uZmlnLT5jaGFuX25y
IC8gMikgPDwgVERNX0NIQU5ORUxfQ09ORklHX0JJVCkgfA0KPiAgIDUxNyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoY29uZmlnLT5kYXRhX3dpZHRoIDw8IERBVEFfV0lEVEhfQ09O
RklHX0JJVCkgfA0KPiAgIDUxOCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhTUFT
VEVSX01PREUgfCBURE1fT1BFUkFUSU9OOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeXl5eXl5eXl5eXl4NCj4gTUFTVEVSX01PREUgaXMgQklUKDEzKS4gIEl0J3Mg
dW5jbGVhciB3aGF0IHRoaXMgaXMgc3VwcG9zZWQgdG8gYmUuICBNeQ0KPiBiZXN0IGd1ZXNzIGlz
IHRoYXQgdGhlICEgc2hvdWxkIGp1c3QgYmUgZGVsZXRlZC4NCg0KVGhpcyAhIGlzIGludGVudGlv
bmFsIGJlY2F1c2UgaXQgaXMgbWVhbnQgdG8gYmUgU2xhdmUgbW9kZS4gV291bGQgYSBiZXR0ZXIg
YXBwcm9hY2ggYmUgdG8gY3JlYXRlIGFub3RoZXIgI2RlZmluZSBmb3Igc2xhdmUgbW9kZT8NCj4g
DQo+ICAgNTE5ICANCj4gICA1MjAgICAgICAgICAgICAgICAgICB3cml0ZWwod3JpdGVfdmFsLCBr
bWJfaTJzLT5wc3NfYmFzZSArIEkyU19HRU5fQ0ZHXzApOw0KPiAgIDUyMSAgICAgICAgICAgICAg
ICAgIGJyZWFrOw0KPiAgIDUyMiAgICAgICAgICBjYXNlIDI6DQo+ICAgNTIzICAgICAgICAgICAg
ICAgICAgLyoNCj4gICA1MjQgICAgICAgICAgICAgICAgICAgKiBQbGF0Zm9ybSBpcyBvbmx5IGNh
cGFibGUgb2YgcHJvdmlkaW5nIGNsb2NrcyBuZWVkIGZvcg0KPiAgIDUyNSAgICAgICAgICAgICAg
ICAgICAqIDIgY2hhbm5lbCBtYXN0ZXIgbW9kZQ0KPiAgIDUyNiAgICAgICAgICAgICAgICAgICAq
Lw0KPiAgIDUyNyAgICAgICAgICAgICAgICAgIGlmICghKGttYl9pMnMtPm1hc3RlcikpDQo+ICAg
NTI4ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICA1MjkgIA0K
PiAgIDUzMCAgICAgICAgICAgICAgICAgIHdyaXRlX3ZhbCA9ICgoY29uZmlnLT5jaGFuX25yIC8g
MikgPDwgVERNX0NIQU5ORUxfQ09ORklHX0JJVCkgfA0KPiAgIDUzMSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAoY29uZmlnLT5kYXRhX3dpZHRoIDw8IERBVEFfV0lEVEhfQ09ORklH
X0JJVCkgfA0KPiAgIDUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNQVNURVJf
TU9ERSB8IEkyU19PUEVSQVRJT047DQo+ICAgNTMzICANCj4gICA1MzQgICAgICAgICAgICAgICAg
ICB3cml0ZWwod3JpdGVfdmFsLCBrbWJfaTJzLT5wc3NfYmFzZSArIEkyU19HRU5fQ0ZHXzApOw0K
PiAgIDUzNSAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiAgIDUzNiAgICAgICAgICBkZWZhdWx0
Og0KPiAgIDUzNyAgICAgICAgICAgICAgICAgIGRldl9kYmcoa21iX2kycy0+ZGV2LCAiY2hhbm5l
bCBub3Qgc3VwcG9ydGVkXG4iKTsNCj4gICA1MzggICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gICA1MzkgICAgICAgICAgfQ0KPiANCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRl
cg0K
