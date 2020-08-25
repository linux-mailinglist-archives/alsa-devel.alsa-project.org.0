Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BC251B34
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 16:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CB11675;
	Tue, 25 Aug 2020 16:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CB11675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598366965;
	bh=ao3z3zkFcJJ44CgZPi2cNBH2cFx/PMHFD+CjJiGu3ws=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6HWttwSvF5ikCRz3ig8IziKFOuQRrzs4yiVn0ZTpvYJ8OcI8zvOiLzC34HyJdX/1
	 B5rG417Gd8tfxNcMfkGfmIF9/eaE8c5nr3KJEJLhMkPOL7kca9wpSAEEk9QCAqj8ZB
	 dToJxc1Av/R1aLEMEMFiJgLi4QXrKiju6JQblU18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D57E9F800EB;
	Tue, 25 Aug 2020 16:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6632F8025A; Tue, 25 Aug 2020 16:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE88F800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 16:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE88F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="J157NSAH"
IronPort-SDR: UIvfgsHm1GV6AuJWbYqS/uTEwfXsCWi3jI9Xh6sscXZZMQcbhVZHUY14Hib4gc/NJY4e0kYUgS
 bRv02vqGOGyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="143895151"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="143895151"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 07:47:32 -0700
IronPort-SDR: Qv3F/XdMHenMZI2xM4l53kMYmg/vGpDbwdJ4mI9cpOMhDZosdY6A//ricoXTYYYGrACD0FEQak
 qYFkZUNXVdog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="328884318"
Received: from fmsmsx602-2.cps.intel.com (HELO fmsmsx602.amr.corp.intel.com)
 ([10.18.84.212])
 by orsmga008.jf.intel.com with ESMTP; 25 Aug 2020 07:47:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Aug 2020 07:47:28 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 25 Aug 2020 07:47:27 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 25 Aug 2020 07:47:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 25 Aug 2020 07:47:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpPRFfbM8cS+VkbPE0/I9K5b1PD2Vt0ACc/v1rYTO5iKzNAs6UGJoDWFDuc7TQ++uHDsk7VZe/nZ+RIKoqSrVkiV7HmhXuCLWrOcjCIOTAYlwxf0P/9Hl90jingBX34ZMzMw+9LvvWMiSSiNkMW+t28g0rsTNuHIw625zEXRH0KCH9hR3RIqzBUySUGXYV14f+qM1B6qlrnldRa3i0XIntcuarL4Ti/cILr7GWrCuVc0srhgi+9U6Cw+MB9zwKtDmGrUagj6b6GDHwj1CI2tqwqwfBRPC8Cj3bGrAkiULvuKXFnjDOMvOjNBVfdgo5T5I4vg19kD/k3zysAVLU1wFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao3z3zkFcJJ44CgZPi2cNBH2cFx/PMHFD+CjJiGu3ws=;
 b=ZCE1yiZ9gQf44BPdwQGSIeUBZsHNirT1o6lx5ln9BI9hA7XbSnVQl9xXB+gMQYZxiqG/1mxJTgRRVVcn0FANtmeVTvA3sJqsJhnoaOBAFr+Y6j0zTQslteT8S6fhcJ84euRACQW3ePYokpqyCx7nUx7hTaM+C4DNhkn7ngsJ16cqky03GRC8VzOr7m/Ug+bZsYjg+zKM7fbt3MuqmPF5Xdgtg4aKx8ndoPt+buPktaS6ukppEepHcH8bEursqo6NwxjEugAtOcXNEfdy6QRO58B2pgNpUdVnOkkzh8UHSaGG0Nq5AFDjRpe5jpYu2UNslCo/4WOtok63aArVTSsyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao3z3zkFcJJ44CgZPi2cNBH2cFx/PMHFD+CjJiGu3ws=;
 b=J157NSAHPyY5fzGE3Men3hLsuWMZtRfptQN1yy9SoCLS/sC7ubcyUQwDX3ZOQhrvWJOHprgpJdR3D0Lyg3XD+i4ygir75EYiSazVeoiwf4cOzsiTOm6mAmcLNbO8rAmNj6Rx9DCocvia6E9lfCIXmnai5EHw0DYv9+UbM+7fujs=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB4210.namprd11.prod.outlook.com (2603:10b6:a03:1bd::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 14:47:24 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 14:47:24 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Topic: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Thread-Index: AQHWeuKlXabfYqCTjkSzu2rSWobUsalI11CQgAACZgCAAA3OFw==
Date: Tue, 25 Aug 2020 14:47:24 +0000
Message-ID: <2B5A2EFF-7391-4565-9B35-DCE395C7DD80@intel.com>
References: <20200825132102.GA306074@mwanda>
 <CE6D3DA0-65A3-42BA-8341-13A3C6E80A55@intel.com>, <20200825135800.GS5493@kadam>
In-Reply-To: <20200825135800.GS5493@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none; alsa-project.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [2001:d08:db:bfac:c4b5:810:19b6:2a11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cdaa1c3-f5e1-4ffe-5ccd-08d84905c7c6
x-ms-traffictypediagnostic: BY5PR11MB4210:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB421032350F29A67985F8E9769D570@BY5PR11MB4210.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AQN0KBDLJqT04F71ib7VRZcGadAEGw7J39R7zLt94qRc3/drhAeOu8aYj6beAnFZW2dB7tJ04g/BzW4AMYKkrtdFPpNb/pE0PlSbIYAYGLFO4W/nlw7hSUI66RQ6Pa01LzYpKE+drVd/D3wrazhb/Pm6tZ791Uee9MjdrY7h+0zBpadDLLN3AXaC7TJoqyB/74hUsHKGpcGN8eaFLjeFdCFbu9vUtWziWIQ19QhuNvS79DnUsk4O/csNhWEqiWHRBzYnYCsqIKwl39SojvsYLEFbfD+2wHphOMhilxpOJ+NzNzfAK3BtmyIKdrq28v0SMh/DDcHS37prfL0PQtZNfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(2616005)(6916009)(54906003)(4326008)(5660300002)(71200400001)(66556008)(66476007)(6506007)(53546011)(76116006)(64756008)(66446008)(478600001)(66946007)(33656002)(91956017)(86362001)(36756003)(186003)(8936002)(107886003)(8676002)(2906002)(6512007)(83380400001)(6486002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FU1mQA6n0TWyrRL9cfimb+0R8TrmOTEKENVfBNZx8+2iVNxRzpkMAAKPlYIXRcNmCvKuZjX86azZ93vg8qC3QSkzIVZQMCi6ToH4FbNx1wRpA/2BMzzpVBSO1VA9l9+zYUl1nh+t/Edgh99vjDMDc/PSjta5ekuCwH9CAG6jwbRsfdx89RbRwkZtUEOUZlDA1UNNcMhWce15FZ1d5Sh+GM9KIT1TNNuilQD6vtmVA6w5cZCGmSZMF8PvrAZKe8I4xTdEzB3k8EEtwD2GMI6D+8jxJ7RokGtb2dkG2jpCwnGNJ1mhcE7jL0LVEBS2XJxrgJmAd5sa4lyzJJYJdlTuevWflKOR+K82qdsCUhXotUZmmyLtb6X8/J/cRKhxXV8AWVY4lxVC+OuC+N2fVMpHUYWnaBKDv7iDCdNds2uwQpqn6f9uI/UHfn9egXIVuTwfyRi5UUXT+zMW8yhA2sfM37Q/qhbg2ZrO+MvDOc9AD9YAqlwBeBBQRP6jip5BQa11WRaDmbUgseGi1LQOr17nnHWQBkchfYwQ0anK5husLVOP3jCofaoXQsu2KapXucg/7YX9eDYhaa1qd7QbFunrkNa+xFW3c064XJx/QWExCh3wM+bIt1cU2SG8RXgPcsNrTYlwClz60v66mWXaiCRdsQICf6OPcY0yx4Gjla9NwuYC/eU1QgqSP7kzEkft2fm8iJAJFauSu0Y1EgvPff/rQQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdaa1c3-f5e1-4ffe-5ccd-08d84905c7c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 14:47:24.7395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kR8aV2ChMdgWtIC5h+y0tlI4Vv9yhnlKj4hdZ8t5/zvIWmOKo0elfaCi50DihptWi/rMikQCiNGFF5sMAefzsIfxbVNSLjfeTDiE2CMpycA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4210
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

DQoNCj4gT24gMjUgQXVnIDIwMjAsIGF0IDEwOjAwIFBNLCBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gVHVlLCBBdWcgMjUsIDIwMjAg
YXQgMDE6NDk6MjVQTSArMDAwMCwgU2l0LCBNaWNoYWVsIFdlaSBIb25nIHdyb3RlOg0KPj4gDQo+
PiANCj4+Pj4gT24gMjUgQXVnIDIwMjAsIGF0IDk6MjEgUE0sIERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAb3JhY2xlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4g77u/SGVsbG8gTWljaGFlbCBT
aXQgV2VpIEhvbmcsDQo+Pj4gDQo+Pj4gVGhlIHBhdGNoIDljM2JhYjNjNGYxNTogIkFTb0M6IElu
dGVsOiBLTUI6IEVuYWJsZSBURE0gYXVkaW8gY2FwdHVyZSINCj4+PiBmcm9tIEF1ZyAxMSwgMjAy
MCwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPj4+IA0K
Pj4+ICAgc291bmQvc29jL2ludGVsL2tlZW1iYXkva21iX3BsYXRmb3JtLmM6NTE4IGttYl9kYWlf
aHdfcGFyYW1zKCkNCj4+PiAgIHdhcm46IHBvdGVudGlhbCAhIHZzIH4gdHlwbw0KPj4+IA0KPj4+
IHNvdW5kL3NvYy9pbnRlbC9rZWVtYmF5L2ttYl9wbGF0Zm9ybS5jDQo+Pj4gIDUwMiAgICAgICAg
ICB9DQo+Pj4gIDUwMyAgDQo+Pj4gIDUwNCAgICAgICAgICBjb25maWctPmNoYW5fbnIgPSBwYXJh
bXNfY2hhbm5lbHMoaHdfcGFyYW1zKTsNCj4+PiAgNTA1ICANCj4+PiAgNTA2ICAgICAgICAgIHN3
aXRjaCAoY29uZmlnLT5jaGFuX25yKSB7DQo+Pj4gIDUwNyAgICAgICAgICBjYXNlIDg6DQo+Pj4g
IDUwOCAgICAgICAgICBjYXNlIDQ6DQo+Pj4gIDUwOSAgICAgICAgICAgICAgICAgIC8qDQo+Pj4g
IDUxMCAgICAgICAgICAgICAgICAgICAqIFBsYXRmb3JtIGlzIG5vdCBjYXBhYmxlIG9mIHByb3Zp
ZGluZyBjbG9ja3MgZm9yDQo+Pj4gIDUxMSAgICAgICAgICAgICAgICAgICAqIG11bHRpIGNoYW5u
ZWwgYXVkaW8NCj4+PiAgNTEyICAgICAgICAgICAgICAgICAgICovDQo+Pj4gIDUxMyAgICAgICAg
ICAgICAgICAgIGlmIChrbWJfaTJzLT5tYXN0ZXIpDQo+Pj4gIDUxNCAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4gIDUxNSAgDQo+Pj4gIDUxNiAgICAgICAgICAg
ICAgICAgIHdyaXRlX3ZhbCA9ICgoY29uZmlnLT5jaGFuX25yIC8gMikgPDwgVERNX0NIQU5ORUxf
Q09ORklHX0JJVCkgfA0KPj4+ICA1MTcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KGNvbmZpZy0+ZGF0YV93aWR0aCA8PCBEQVRBX1dJRFRIX0NPTkZJR19CSVQpIHwNCj4+PiAgNTE4
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFNQVNURVJfTU9ERSB8IFRETV9PUEVS
QVRJT047DQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5e
Xl5eXl4NCj4+PiBNQVNURVJfTU9ERSBpcyBCSVQoMTMpLiAgSXQncyB1bmNsZWFyIHdoYXQgdGhp
cyBpcyBzdXBwb3NlZCB0byBiZS4gIE15DQo+Pj4gYmVzdCBndWVzcyBpcyB0aGF0IHRoZSAhIHNo
b3VsZCBqdXN0IGJlIGRlbGV0ZWQuDQo+PiANCj4+IFRoaXMgISBpcyBpbnRlbnRpb25hbCBiZWNh
dXNlIGl0IGlzIG1lYW50IHRvIGJlIFNsYXZlIG1vZGUuIFdvdWxkIGEgYmV0dGVyIGFwcHJvYWNo
IGJlIHRvIGNyZWF0ZSBhbm90aGVyICNkZWZpbmUgZm9yIHNsYXZlIG1vZGU/DQo+IA0KPiBJbiBt
eSBvcGluaW9uLCBpdCdzIGJldHRlciB0byBqdXN0IGxlYXZlIGl0IG91dC4gIE9SaW5nIHdpdGgg
emVybyBjYXVzZXMNCj4gYSBkaWZmZXJlbnQgc3RhdGljIGNoZWNrZXIgd2FybmluZyBvbiBteSB1
bnJlbGVhc2VkIGNoZWNrcy4uLiAgSXMgaXQNCj4gMCA8PCAxMz8gIEkgZmVlbCBsaWtlIE9SaW5n
IHdpdGggemVybyBqdXN0IG1ha2VzIHRoaW5ncyBtb3JlIGNvbmZ1c2luZy4NCj4gDQpJdCBpcyAw
PDwxMywgaW4gdGhlIGV2ZW50IGl0IHdhcyBwcmV2aW91c2x5IGNvbmZpZ3VyZWQgdG8gTWFzdGVy
IEkgd291bGQgbmVlZCB0byB1bnNldCB0aGUgYml0DQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50
ZXINCj4gDQo=
