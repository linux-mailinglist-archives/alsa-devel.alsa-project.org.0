Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2783242CE2
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 18:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C372166B;
	Wed, 12 Aug 2020 18:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C372166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597248643;
	bh=QNbIcqeeTKyQ+q0psOhZp2PkqwZaVVL6iLfbLfT0fUM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VTXOzRfA0c86HYtbLh64K2sdVtPMycRfdsHGVuJTCyWwYezOPtLMNGKEZrE7dsa+j
	 M5md0AoJytH4ieCzvXcIiJ36t7jt3PAwQNuBbT+5NIRIJonnBWEc1gImCRP7M5u/kB
	 Z+5cAHMuGIX1aauxIdm2ExUPBTYkIATwB+Ow2Gio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9DCF800F4;
	Wed, 12 Aug 2020 18:09:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8DE6F8022B; Wed, 12 Aug 2020 18:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B73DF800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 18:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B73DF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Z0MAhBEP"
IronPort-SDR: ggMB6BZtB7wHTgPQqcqFP4ynJsKOEu6Mng1MBv2pmlvGyfFqkBU1rodRdFozayXg3485wmKkRu
 6WNq1eUaPtZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="155117614"
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="155117614"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 09:08:45 -0700
IronPort-SDR: uA3qpctBbwB+myCC8F8NNgtdhZGocnwdwXeUaQESXuG8tRIbik2zwqk2DbP8qXVbRvmOrP5VDp
 PMYvn/2IU4oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="308765873"
Received: from fmsmsx602-2.cps.intel.com (HELO fmsmsx602.amr.corp.intel.com)
 ([10.18.84.212])
 by orsmga002.jf.intel.com with ESMTP; 12 Aug 2020 09:08:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Aug 2020 09:08:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 12 Aug 2020 09:08:43 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.52) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 12 Aug 2020 09:08:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gClzw8kXIK6+RMRCQMIrhTtLy7kjzw2xkeCKnj2SaeHywP9U1JcYVhVKzUVn6qRsD7FKUz+s4MeUvW0WxebaDGiPJ3y2XBy2J+trPszqw0PmLZ8Vryq2GISbzi3+zbXvlTsubqWwdSQgzmGbE+s7Jh8C8VN+2oR3pPJbIjOYRNon6XU5DyrN8w6sew6UbtnscKCm6uVbMGmVIjHLKWuQT7K/ewcKoexVO/0q1+83rvWT3ey7k+EP28BLNnMqfgaw2S5AAsYi6AZ7odW5H+S46ExPf4icoByPEMDV6b2oge9guHm1sdBH508GBm3Hx9+T9nN669hFFSk8NTXUYbhIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNbIcqeeTKyQ+q0psOhZp2PkqwZaVVL6iLfbLfT0fUM=;
 b=OP0zngWpOuXd6jAZxGBHlw3uIKwYXFoDWuH3lr0/2SPFIJw3GkO3lBCXvDRe8RTdWl7noU/XPGRLEgXBMzn5uU3jXuoawGOXac0/LdwCMVpgf/e3BrjNGNQQjr5wxKsWaGFIXZLob7sXUnqyuorSY7Vxan+c9Q/MW9cJQVNawIunzfMTUs3NeYUwHl/R244PK2RbbS7WS+8TmrhniicXHIo+AvbKFZiTdhlaoX4dfGyk7eLl0Y65uw7OPY5Ox3Vl9Lg0RxPuz1NTDfiX76wCIrhwSCwHRbstohoStdTJnxlXkLRV+mOD/0s0RpPVNG64zLMX9It7sytKq5IjJTVJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNbIcqeeTKyQ+q0psOhZp2PkqwZaVVL6iLfbLfT0fUM=;
 b=Z0MAhBEP3LUikOYIu8MK3NH+t73lovHRNJpbfEJujH2qujYkgjRVyahrQ6+pJV1NbsI2Kf3ZPuMSSGdU78uaUa5xh2349pEn1FCcFIL41Z8Fv1Qes1OTCTSfGTzZX6Yz393QpxXD/evihgvG6gGr5YdeaqbbNGPSKnhUSXiiy14=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB4058.namprd11.prod.outlook.com (2603:10b6:5:193::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 12 Aug
 2020 16:08:38 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3261.025; Wed, 12 Aug 2020
 16:08:38 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai
 <tiwai@suse.de>
Subject: RE: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Topic: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
Thread-Index: AQHWZzZzIgMFwAI7HkKT1/DPVspAl6khsDgAgAFDasCAAAm3gIADX8DAgAAlz4CAABcIUIAABbiAgACx9iCAALX6gIADSeRAgAYuywCAACtmAIAAiqgQgAAJsgCAAFelAIAAC9AAgAAD0wCAAA/XgIAAWOKAgAAhvQCAAAewgIAApDwAgAAzaoCAAAsZAIAAAU+AgAAMkQCAAAEQAIAAdTUAgAACd4CAABB9AIAAAZsg
Date: Wed, 12 Aug 2020 16:08:38 +0000
Message-ID: <DM6PR11MB364242D3652EDC2F9B8B214897420@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
 <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
 <s5ho8nh37br.wl-tiwai@suse.de>
 <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
 <20200811145353.GG6967@sirena.org.uk>
 <d78f9adc-d583-f0f2-ce38-3c9175c939b8@linux.intel.com>
 <20200811172209.GM6967@sirena.org.uk>
 <CAGvk5PqGi7cXthLHFi4NyypxFiGnoHvD9vp+5nJdH-_VkVvcKw@mail.gmail.com>
 <s5hr1scz908.wl-tiwai@suse.de>
 <CAGvk5Pp+Gk5Uk-iLdhVPWuCL0FiL9OhsaAtwkotay5JAYUNxdQ@mail.gmail.com>
 <s5hlfikz6y8.wl-tiwai@suse.de>
 <CAGvk5Pq3rEGJX=WjriPfWg_sEAVWHGZ9S=4iySNfYaHX7Xcw0g@mail.gmail.com>
 <s5h8sekz4ox.wl-tiwai@suse.de>
 <e4cc6231-8b19-c145-1b18-91d3a00131d3@linux.intel.com>
 <s5hv9hnx6am.wl-tiwai@suse.de>
 <be45d821-57c6-6ca5-0864-ac3aa521d82e@linux.intel.com>
In-Reply-To: <be45d821-57c6-6ca5-0864-ac3aa521d82e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.212.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23df4bd3-12f1-4780-012b-08d83ed9f96f
x-ms-traffictypediagnostic: DM6PR11MB4058:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4058F929CEA9D0A817FC605A97420@DM6PR11MB4058.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PlZUiXQoGNR9xRoMV+YHpi+HUn4U9VfsV8GkHqZATSSaQ/9GKL2ZTenpbVQ460CE+IvYTkRBDXcgzfY6lxWt/MaHgssE/d2uCm8WFzbL2cS6c0MW7v4vUz/BAcAjbIl5xTheW7AW1kwclfmnJNyLlJCAkmdmU6LQ0xkMLXeVFePeo/q8qzx+no9l3Q/7nIkRfxpwcKPNFVuH6swjjhWDUZUhuwFyzTqxOYk/qUDQS8IF94bIAqd9z86ZRfCBw4/EWZtncJM9jqgzz1gt1Lp+Ty5NpYqq62eSf1wgKgvbVw9N1ylU4NOE4D+if3tu2cDGyGgiyvSDgJ2fVgjdtOZGDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(2906002)(7416002)(66446008)(71200400001)(86362001)(52536014)(4744005)(66476007)(66556008)(76116006)(66946007)(5660300002)(64756008)(316002)(8676002)(26005)(54906003)(7696005)(33656002)(186003)(9686003)(4326008)(478600001)(55016002)(110136005)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MHbuvE945gtJWBuzC387n+FTxRNMepSSY84gUngO5b/lL3V4wzeTWllSucgXtpXpUvfCiUwaEqbCcvU7L8UnBeL5+2Fy6d1cCssbJXxH7M6509K+j6rG6uZoXOtUP2ovgGkM0S1z2kj58DXu8P7/nR0UZKN6Ha3TmBtRmRy85QO9hNLntbOVgYpWNc5/In5pvx21WuXdYGzmCxhSKsfnEcaeUCp+jsZ+OzyQi7efDgalIL5YDLpD9EdJT5H6FI7x28l5oa9+YmDjj/aXrHG0MOOfoXBCvsdMAA27d5pm8/syZTwjdquaceMk+l5U2C6vT5u6lSWSHy+AJOZ7lQ+EqO+Ih0G0GeI65srUVsZRXqRSlBuZEXrXxAs/VB6AQ73zwDSGSXPUiN6ZzdglNrGPkINwEwNiB0MIfDEyQ/5zlkf8XQnw2PR913o0KBwb442InnziC0j/DtvXFvhEf2OVd58pFi7+STXQN0zg2oTszDnO25H7gJA2IzII4XZIdtsq/cDZMGwblNQEIz1+BaAy7HKPTN2b2j7ckkH93qTpYddjotlnttpC84T+Q/ThJPnDiNGM3SMr283XcIwlBoAga1gPdUCTWBxvsDGjCJE6uN5jLHtjYlde0M3/j3M9xtWV5GQ8RN7EzZpQW945M4dWHA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23df4bd3-12f1-4780-012b-08d83ed9f96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2020 16:08:38.5262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMAZN2pS86exCVEpkWjT7RnmsEk3EUXNYWHfrTd9dednApddJUn6R5BEChcJtNUFWwHRb2idos/oG26Dt1oinQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4058
X-OriginatorOrg: intel.com
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi
 Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Sam
 McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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

PiA+DQo+ID4gSSBhbHNvIHdvbmRlciB3aGF0J3MgcmVhbGx5IG1pc3NpbmcsIHRvbyA6KQ0KPiA+
DQo+ID4gQlRXLCBJIHRvb2sgYSBsb29rIGJhY2sgYXQgdGhlIHRocmVhZCwgYW5kIENSQVMgc2Vl
bXMgdXNpbmcgYSB2ZXJ5DQo+ID4gbGFyZ2UgYnVmZmVyLCBuYW1lbHk6DQo+ID4gWyAgIDUyLjQz
NDc5MV0gc291bmQgcGNtQzFEMHA6ICAgUEVSSU9EX1NJWkUgWzI0MDoyNDBdDQo+ID4gWyAgIDUy
LjQzNDgwMl0gc291bmQgcGNtQzFEMHA6ICAgQlVGRkVSX1NJWkUgWzIwNDQ4MDoyMDQ0ODBdDQo+
IA0KPiB5ZXMsIHRoYXQncyA4NTIgcGVyaW9kcyBhbmQgNC4yNjAgc2Vjb25kcy4gTmV2ZXIgc2Vl
biBzdWNoIHZhbHVlcyA6LSkNCg0KQ1JBUyBjYWxscyBzbmRfcGNtX2h3X3BhcmFtc19zZXRfYnVm
ZmVyX3NpemVfbWF4KCkgdG8gdXNlIGFzIGxhcmdlDQpidWZmZXIgYXMgcG9zc2libGUuIFNvIHRo
ZSBwZXJpb2Qgc2l6ZSBpcyBhbiBhcmJpdHJhcnkgbnVtYmVyIGluIGRpZmZlcmVudA0KcGxhdGZv
cm1zLiBBdG9tIFNTVCBwbGF0Zm9ybSBoYXBwZW5zIHRvIGJlIDI1NiwgYW5kIENNTCBTT0YgcGxh
dGZvcm0NCmlzIDEwNTYgZm9yIGV4YW1wbGUuDQoNCg0KUmVnYXJkcywNCkJyZW50DQoNCg0K
