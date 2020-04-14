Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 380861A84EE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 18:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C369316A5;
	Tue, 14 Apr 2020 18:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C369316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586881828;
	bh=ur3LgpVGVjQKywH0bqtrXiLL6nyonHvy7T9O+iVKbNw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScVyUl7DgOXBVioE0eFiAc/q71NxdM1SYW/Bkn/ELYwsgUs0ZFAzfZ2NYAgFPOiNa
	 Z44ZWW4Aae8t7JxMTVAZmnbADH+iNxzqw/9maT1Q8n+mN/nMlPfAvJ0o1d0w/vor0D
	 la34PBkwyZXmm0ynRFOg5uGOOlYORa+fv3HZ5l8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13ED4F80126;
	Tue, 14 Apr 2020 18:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B2B2F8013D; Tue, 14 Apr 2020 18:20:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B76AF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 18:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B76AF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Tw70ZwLP"
IronPort-SDR: ATzhGsgB4ZzndRfzQC6r0E2MISHgZ5yaFTmet++pCyx2+SP2d1gXpf7hjfroxbH2yxI7w5msTq
 9Edb3zhP3JEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 09:20:31 -0700
IronPort-SDR: 9JGqibV6nrUsHDGAjh0vHDJnTHES0LH2TU6GsptLfyFOXPutBA3rRLhsjRUKJNDFtbd1muDce0
 36aY7kpa7oWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="363418206"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2020 09:20:30 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 14 Apr 2020 09:20:30 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX158.amr.corp.intel.com (10.22.240.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 14 Apr 2020 09:20:29 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.50) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 14 Apr 2020 09:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftwl/NRPPnhcgme536MHg4RCrG8hHUYeKJQ0bz9oIVJpMuU1O3v6DoPl5J8T+xi+9UkrzVen82Nz3pNIMSGJQynSGMPHGX0wIyPCGXn4c6U9cJFJWqcLm9H9dcCS23/98RZqcjZC83QndjNVy5c8lg4NmqDwMeHw9V79mf/PIAJNNiuZVyJlm49YLjat45w3FEci+i6Nk+tyqxEvpJEmpthF1ANtBHIwpz/p/MJjjiJCANh62x972KCKrV06y3ETt9ecVKbU3d/K61i155xx8/L+Vi2YOmo16T7UTR/+dG85YBXwf/RC6Ht9JQsvwPwjw+F5Mz9lbXRHTHhvTa6PuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ur3LgpVGVjQKywH0bqtrXiLL6nyonHvy7T9O+iVKbNw=;
 b=bm/Mb5EArx146na84+z40mx52JpPh4KeN2UoYikdkXPLGwOilMYKsQvkfcoE2l6aNNMLQsXe3eP+Lr2OHslgu/F8l9JP+5tZO+x4MoLB5hkC5HVovL7JHC1bXzOaLYzzllc1Z0NaM6VVKJB88Pil4QmMOi1DcIF1ERGM0qLU9jOpuMV16hPlAF/3AqnXfaUpaEvKALHcGXw2I+PlKgf4eH708qwLE+QFSfkHmu4P4ateduppyejbfW3N68H8OPbQ8Y4vtYI+ya3lO3PIkNe5ROnNgJBJ2xs5PAzwxtERGYO0K/zS0YGjKadQNQQ16YM4fSZita+Ws5sfv0glVqhwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ur3LgpVGVjQKywH0bqtrXiLL6nyonHvy7T9O+iVKbNw=;
 b=Tw70ZwLP4b5vfLOdsUslvpfESGicK6Iw2pYpZyj02cbte7SFu8Gl2sPMafWbdcmKDIb/x/tZEzTULHi23YA5IDnTS83xu4WrIq3lrIBX1vCwnRFNr0kEVj9p/xGv6VLBC7HtLgv6ROtJDa4GTPU+uJ3Ua/HFiAKOLw4CYbk4dNc=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2148.namprd11.prod.outlook.com
 (2603:10b6:405:52::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Tue, 14 Apr
 2020 16:20:27 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6%11]) with mapi id 15.20.2900.028; Tue, 14 Apr
 2020 16:20:26 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Topic: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Index: AQHWDxGPcERmvVi2FUaZ0GDzXVeqv6h4uesAgAAAnRA=
Date: Tue, 14 Apr 2020 16:20:26 +0000
Message-ID: <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
In-Reply-To: <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [192.55.52.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1af039e-4904-43ab-0b3a-08d7e08fbe0d
x-ms-traffictypediagnostic: BN6PR1101MB2148:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB214836C1AE03CDD506117E9097DA0@BN6PR1101MB2148.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(136003)(396003)(346002)(366004)(376002)(7696005)(6506007)(54906003)(110136005)(66946007)(316002)(81156014)(8936002)(8676002)(86362001)(33656002)(66556008)(7416002)(76116006)(52536014)(55016002)(26005)(66476007)(66446008)(64756008)(5660300002)(71200400001)(478600001)(9686003)(2906002)(186003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eeq4btUb1iDNn7gntQefFovVxXpX5owKWpqKd3afMhXDed7pJQQPu5uqNFmrsmEjjJ8ro5ifCD1m8Cvbqgk/bjEOYp8ljBLOTQjv39AUzWPSpboRzvvDVVaomxBri+F4k56FgbwwEXzGzJcimqX+pZ5co105hinFnbiwNapWshKhYKU6KpNhyPCi7Gl3vR/01jPx+T82laGC5V/H775S7+G89SN0shcw5d9XwwlNoV1UwoBq3wE1+SPmw0VSLoRNU3mwSSx6uY41TlW28yAyWsqVWhH2CeqaB+83Ka75bdbwtPAcB7ezd1wz5LgBR9RSakl0jqakuHoIs0VY4CdmuVbLkpwAcPjeIiFPIQ/TOLa7bGwRWqHw2SyY4RtRD6fs1Z8ZpyJhKX09bmdaQKFdQEUixWVLK2P4vSzugJCLY1stnjlz5sDXEDnr/HLwAK+4
x-ms-exchange-antispam-messagedata: 9ehB8hdnylPRy5TiWKtpYavnd8DNTOJ97N/mp+8XqLEH65MT2bFy8d1B/bUG3hz4+jU9RLFtkEC9Va1qyCnoAMJSO6cBQAw8ZXI4PodWr+wTVvrEEZ/VnHYFpRMZUGKjkk9992j2N73R5yO49GpzGA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d1af039e-4904-43ab-0b3a-08d7e08fbe0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 16:20:26.8925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1kqZIaKiLZgeQNW7kRA41Mue5n1jIKr2Y17Gs79/TQt8/IjP8gSdS6rJi9xXv0Oj86z8/lHWykYnYSs98v04/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2148
X-OriginatorOrg: intel.com
Cc: Kate Stewart <kstewart@linuxfoundation.org>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

PiANCj4gSSBoYXZlIG1peGVkIGZlZWxpbmdzIGFib3V0IHRoaXMuDQo+IA0KPiBPbmUgb25lIGhh
bmQsIHRoaXMgbG9va3Mgc2ltcGxlIGVub3VnaC4NCj4gDQo+IEJ1dCBvbiB0aGUgb3RoZXIgaGFu
ZCB3ZSBoYXZlIG90aGVyIHVzZXJzIG9mIG1lbWNweV9mcm9taW8oKSwgaW5jbHVkaW5nDQo+IFNP
RiBkcml2ZXJzLCBzbyB3aGF0IGFyZSB0aGUgb2RkcyB3ZSBoYXZlIHRoZSBzYW1lIHByb2JsZW1z
IGluIG90aGVyDQo+IHBsYWNlcz8gV291bGRuJ3QgaXQgYmUgc2FmZXIgdG8gZWl0aGVyIGNoYW5n
ZSB0aGlzIGZ1bmN0aW9uIHNvIHRoYXQgaXQncw0KPiBiZWhhdmlvciBpcyBub3QgYW1iaWd1b3Vz
IG9yIGNvbXBpbGVyLWRlcGVuZGVudCwgb3IgZml4IHRoZSBjb21waWxlcj8NCj4gDQoNCkhpIFBp
ZXJyZSBhbmQgQW1hZGV1c3osDQoNCkkgaGF2ZSB0byBhZG1pdCB0aGF0IEkgZGlkbid0IGRpZyBp
bnRvIGNsYW5nJ3MgX19idWlsdGluX21lbWNweSB0byBzZWUgd2hhdCdzDQpoYXBwZW5pbmcgaW5z
aWRlIHNvIEkgZG9uJ3QgaGF2ZSBkaXJlY3QgZXZpZGVuY2UgdG8gc2F5IGl0J3MgY2xhbmcncyBw
cm9ibGVtLg0KV2hhdCBJIGtub3cgaXMga2VybmVsIGJ1aWx0IGJ5IGNsYW5nMTAgd29ya3MgZmlu
ZSBidXQgaGF2ZSB0aGlzIGlzc3VlIG9uY2UNCmNoYW5nZWQgdG8gY2xhbmcxMS4gQXQgZmlyc3Qg
SSBhbHNvIHN1c3BlY3QgdGhhdCBpdCdzIGEgdGltaW5nIGlzc3VlIHNvIEkgY2hlY2tlZA0KdGhl
IGNvbW1hbmQgdHJhbnNhY3Rpb24uIFRoZSB0cmFuc2FjdGlvbiBpcyBzaW1wbGUsIGhvc3Qgd3Jp
dGVzIGNvbW1hbmQNCmluIFNTVF9JUENYIHJlZ2lzdGVyLCB0aGUgRFNQIHRoZW4gd3JpdGVzIHJl
cGx5IGluIFNTVF9JUENEIHJlZ2lzdGVyIGFuZA0KdHJpZ2dlciBhbiBpbnRlcnJ1cHQuIEZpbmFs
bHkgdGhlIGlycSB0aHJlYWQgc3N0X2J5dF9pcnFfdGhyZWFkKCkgcmVhZHMgdGhlDQpTU1RfSVBD
RCByZWdpc3RlciB0byBjb21wbGV0ZSB0aGUgdHJhbnNhY3Rpb24uIEkgYWRkZWQgc29tZSBkZWJ1
ZyBtZXNzYWdlcw0KdG8gc2VlIGlmIHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyBpbiB0aGUgdHJh
bnNhY3Rpb24gYnV0IGl0IGFsbCBsb29rcyBnb29kLiANCg0KSSBhbSBhbHNvIGNvbmZ1c2VkIHRo
YXQgd2h5IHRoaXMgb25seSBoYXBwZW5zIHRvIEJZVCBidXQgbm90IEJEVyBzaW5jZSB0aGV5DQpz
aGFyZSB0aGUgc2FtZSByZWdpc3RlciBhY2Nlc3NpbmcgY29kZSBpbiBzc3QtZHNwLmMuIEkgY2hl
Y2tlZCB0aGUgY29kZSBhbmQNCnJlYWxpemVkIHRoYXQgaW4gQkRXLCB0aGUgaXJxIHRocmVhZCAo
aHN3X2lycV90aHJlYWQpIHBlcmZvcm1zIDMyLWJpdCByZWdpc3Rlcg0KcmVhZCBpbnN0ZWFkIG9m
IDY0LWJpdCBpbiBCWVQgcGxhdGZvcm0uIFRoZXJlZm9yZSBJIGNoYW5nZSB0aGUgY29kZSBpbiBC
WVQgdG8NCnVzZSB0d28gcmVhZGwoKSBjYWxscyBhbmQgZm91bmQgdGhlIHByb2JsZW0gaXMgZ29u
ZS4gTXkgYmVzdCBndWVzcyBpcyBpdCdzDQpyZWxhdGVkIHRvIHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiBfX2J1aWx0aW5fbWVtY3B5KCkgYnV0IG5vdCBzdXJlIGl0J3MgdGhlDQp0aW1pbmcgb3IgaW1w
bGVtZW50aW5nIGNhdXNlIHRoaXMgcHJvYmxlbS4NCg0KDQpSZWdhcmRzLA0KQnJlbnQNCg==
