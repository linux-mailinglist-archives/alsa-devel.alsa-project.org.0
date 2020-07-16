Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70F222A9E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 20:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F65D1614;
	Thu, 16 Jul 2020 20:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F65D1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594922773;
	bh=RvYHw42p8ALQYt8RFOra9jPBlZfTnUNeCXUcgXB8mPI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rJw3IIoc/L9GecwLKuVKvoSDDdhVWuiPD1weT/lvrW3g6ETaCUuqGPvvRr7hdh6u5
	 Rs4Fyk1XtpatQFTH+o3u8jeCx0oj7EoLHH/TPv5/P5Rj2T7lEInePMwDxM9bm+C5Bk
	 Cmu+eji83mDq4wuH1RSX+4LO1fcbAZCJ/nHkJIRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ECE6F801EC;
	Thu, 16 Jul 2020 20:04:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E10FDF8016F; Thu, 16 Jul 2020 20:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9000F80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 20:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9000F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="O99iaMEQ"
IronPort-SDR: 1Qkl8GrQD9D/1kbRL77MHDMMM24aGc+itb6dXd+hnwQhhdBfZ/5QsPDPLDxmg1HdsBrRIc9dqP
 qKgw/FFDUCdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="129541353"
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="129541353"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 11:04:15 -0700
IronPort-SDR: DXwhkdCTMOLEyKN3muERWrHAPEFul4Tah3xH3W6qlx5sJW7lGw2ViARIB3CuepU1p3z9gOYrXU
 8vRisBAO9vfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; d="scan'208";a="361114527"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga001.jf.intel.com with ESMTP; 16 Jul 2020 11:04:15 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 11:04:15 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX155.amr.corp.intel.com (10.22.240.21) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 11:04:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 11:04:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqiCjUctsmL1hZN2l8Y1RfOsf8ipREokEydNjtvi+h9Qw3k7CZRnmuhL2OA/ycX6ZdPQXG26U/kuA3jU/mZ508/yJlNQhnUkoq0M3t68HUDMbCTUj+d/7zsNR4DqPCvArghU9/QR1wqXAxHcN7SLITlFiRUXYh6kmPo7XTb+EE8+E/NOP0vK7GjttrStiLLyfIbcdRnqT6nG2hW46qxhc0thKC3RvymFriFCispzuWA5tVMW5PBOBuhtPpTlijNl+S+Olg1AWWn9gG8j2q4BbqFHryeX/JuHALcquMtTZiWBzv/sd97tpxPatNtFM5d6vtM1YT/hMJ3Nsee4fcZ7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvYHw42p8ALQYt8RFOra9jPBlZfTnUNeCXUcgXB8mPI=;
 b=kAGfXm+ibrxZsQRhTkdZ798Mmj8moNB2MlRjZmLVk0kTCnr6iBh3+nbW5j2J/Q4HtvjNgXssRJsQf5jrWnYBg3R6KRRZ2Azb0Om6BfoDulXG3HDZVmdDhgUhXoiuOTvzNtDmdWwkzkNJx1jPk7/WRBqKRQOTzGPg6eJF0cJMnDJo8KIqtwlslYbfNbPJCRJg/UHwwDp5icraHc3mfLKNNjHa/xXEq/viE0tV4ih9fVun2VKN2qWrYOW8ysWYdZ1IFHSr8s8/Q3IUvLzOLiyNC6n0Fnf/qC0QpiJUnZ3ySS+aTmXhxhVV38EuJkqAGZQXwcjNOcDd1hG2bg9ZjIWLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvYHw42p8ALQYt8RFOra9jPBlZfTnUNeCXUcgXB8mPI=;
 b=O99iaMEQttZMZRDPrHd55OjlCslJ6B3/AAYwpSVbGsMMQu3FTGmBWbDPzdtouMx17H7Hyol179LeBhlQwurbRSmzf3Ez8snt9roQSCQDMGi1nMVeqZ0Jm6mwr7Bb7lq/mxg0GB65eaPot7IVMbT0L00eqYQlZIRA0rAtJvXx0yE=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB3030.namprd11.prod.outlook.com (2603:10b6:a03:87::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.24; Thu, 16 Jul
 2020 18:04:13 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3174.025; Thu, 16 Jul 2020
 18:04:13 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [PATCH v6] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Thread-Topic: [PATCH v6] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Thread-Index: AQHWW5SMkCnOTqXaoU2Z7cCNya0Ls6kKe6eAgAADcwA=
Date: Thu, 16 Jul 2020 18:04:13 +0000
Message-ID: <BY5PR11MB4307D1BD0356125FC327B1CFFD7F0@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1594919637-31460-1-git-send-email-harshapriya.n@intel.com>
 <48a6db3a-2aef-cfca-19ec-7825573fc3da@linux.intel.com>
In-Reply-To: <48a6db3a-2aef-cfca-19ec-7825573fc3da@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: 9f8d3c4f-ce36-49c7-4145-08d829b2a597
x-ms-traffictypediagnostic: BYAPR11MB3030:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB30304B4F00B3CE8F10AF786EFD7F0@BYAPR11MB3030.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GYsLrpma+D9GyCrNsizeaosES1w/ALzJkIcIVqaxWtlsrQ5sdkPE9dQNmpXeBXC2uouXhKKLlzIbnTyvPltjPoY5o8jGrquu/5CyF0ba1sSQE/WFhY020JVD0kmW7xX0MEcuW8NXOmV131nm975yZxjHB6WCP+uV9hSAj/dfMoheqvDUx4dD8peUFvH7ZEz0NxwAK/0+NN4fK6AJM3R+EtlRzSlp6aZbmKggALulFA1j51XuneqlzGF1p8DW78GBPo6anFQXEfHtvbJCLkgZR6eE9HbjKITX2XAdzU+1xPKD6fMoND8LOx4HXExKU0tKacyc/JKocn2kn2bAxHz96A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(71200400001)(86362001)(8936002)(66946007)(26005)(55016002)(2906002)(33656002)(6506007)(76116006)(8676002)(64756008)(66476007)(7696005)(66556008)(5660300002)(66446008)(186003)(52536014)(316002)(54906003)(478600001)(7416002)(4326008)(110136005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: RdVA1j6uqe901v1+4k94cKFiuJFtms1GjJlq35OdtWNGG3grGWKlz5nR84X1cMFLpmGO2kbD8VQ+/ZzSVI0h7X2e1AW1MUt63U/G9uOX//ntirqE+GdjIG7+0ZyFmyQM+dD0ZQYIoQHSOAQgz/e+TMmu7pcVdFOtTgmDm0StPs06ylWWz0/6hJkOuaPr95advFjcpWu5QHZfU1QVnUbIwr93EGsisKs9aLPYqQC5s2HHh1BQlB+1euMR64MuZ6sBdIwNJ8L1mQVoM0pDorPFCvYmuDfh/mrFBr6X0+c10hcpobn/v8Dp/3CWLTcBwMz6LQvvt7jlyrDxFlOJtRKW9oogwl6qp3JYO53r5gRpjjvEkWRHNs5ghsYDnxcv2vsmWWakk1VamS6wl3UBWkvW6jBpUZLk4EOo7t1rTkEkTb2oI+ju1Fc5L/lmEjt0EDh1WXjzpRV349glMWqrZzQv2Bbg9emsQQQTxTrCkCJlJObH2KMEuc/sLaC7jwhHZGxt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8d3c4f-ce36-49c7-4145-08d829b2a597
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 18:04:13.0576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LkGbw5+gprHPpzdRyIru31R7hF+9WXNRafkk+gUonAEiUJK+vSfBrEQFZOvuBMrBQ/pkFTvFDnPy2L/gUS71fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3030
X-OriginatorOrg: intel.com
Cc: "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "rad@semihalf.com" <rad@semihalf.com>,
 "zwisler@google.com" <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 "brndt@google.com" <brndt@google.com>, "mw@semihalf.com" <mw@semihalf.com>,
 "levinale@chromium.org" <levinale@chromium.org>,
 "lma@semihalf.com" <lma@semihalf.com>
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

PiANCj4gDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvYm9hcmRzL2tibF9y
dDU2NjNfcnQ1NTE0X21heDk4OTI3LmMNCj4gPiBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2Js
X3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYw0KPiA+IGluZGV4IDU4NGU0ZjljZWRjMi4uYjI2MWIx
YzQ2NmE4IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2JsX3J0NTY2
M19ydDU1MTRfbWF4OTg5MjcuYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9ib2FyZHMva2Js
X3J0NTY2M19ydDU1MTRfbWF4OTg5MjcuYw0KPiA+IEBAIC0zNzksMjIgKzM3OSwzMCBAQCBzdGF0
aWMgaW50IGthYnlsYWtlX3NzcF9maXh1cChzdHJ1Y3QNCj4gc25kX3NvY19wY21fcnVudGltZSAq
cnRkLA0KPiA+ICAgCXN0cnVjdCBzbmRfaW50ZXJ2YWwgKmNoYW4gPSBod19wYXJhbV9pbnRlcnZh
bChwYXJhbXMsDQo+ID4gICAJCQlTTkRSVl9QQ01fSFdfUEFSQU1fQ0hBTk5FTFMpOw0KPiA+ICAg
CXN0cnVjdCBzbmRfbWFzayAqZm10ID0gaHdfcGFyYW1fbWFzayhwYXJhbXMsDQo+IFNORFJWX1BD
TV9IV19QQVJBTV9GT1JNQVQpOw0KPiA+IC0Jc3RydWN0IHNuZF9zb2NfZHBjbSAqZHBjbSA9IGNv
bnRhaW5lcl9vZigNCj4gPiAtCQkJcGFyYW1zLCBzdHJ1Y3Qgc25kX3NvY19kcGNtLCBod19wYXJh
bXMpOw0KPiA+IC0Jc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgKmZlX2RhaV9saW5rID0gZHBjbS0+
ZmUtPmRhaV9saW5rOw0KPiA+IC0Jc3RydWN0IHNuZF9zb2NfZGFpX2xpbmsgKmJlX2RhaV9saW5r
ID0gZHBjbS0+YmUtPmRhaV9saW5rOw0KPiA+ICsJc3RydWN0IHNuZF9zb2NfZHBjbSAqZHBjbSwg
KnJ0ZF9kcGNtOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBUaGlzIG1hY3JvIHdpbGwgYmUg
Y2FsbGVkIGZvciBwbGF5YmFjayBzdHJlYW0NCj4gPiArCSAqLw0KPiA+ICsJZm9yX2VhY2hfZHBj
bV9mZShydGQsIFNORFJWX1BDTV9TVFJFQU1fUExBWUJBQ0ssIGRwY20pDQo+ID4gKwkJcnRkX2Rw
Y20gPSBkcGNtOw0KPiA+ICsJLyoNCj4gPiArCSAqIFRoaXMgbWFjcm8gd2lsbCBiZSBjYWxsZWQg
Zm9yIGNhcHR1cmUgc3RyZWFtDQo+ID4gKwkgKi8NCj4gPiArCWZvcl9lYWNoX2RwY21fZmUocnRk
LCBTTkRSVl9QQ01fU1RSRUFNX0NBUFRVUkUsIGRwY20pDQo+ID4gKwkJcnRkX2RwY20gPSBkcGNt
Ow0KPiANCj4gaXMgdGhlIGFzc3VtcHRpb24gdGhhdCBib3RoIG9mIHRob3NlIGxvb3BzIHJldHVy
biB0aGUgc2FtZSBwb2ludGVyPw0Kbm8gb25seSBvbmUgbG9vcCB3aWxsIGVudGVyIGJhc2VkIG9u
IHRoZSBkaXJlY3Rpb24gb2YgdGhlIHN0cmVhbQ0KSWYgaXTigJlzIGEgcGxheWJhY2sgc3RyZWFt
LCB0aGUgZHBjbVsxXSB3aWxsIGJlIGVtcHR5DQpJZiBpdOKAmXMgYSBjYXB0dXJlIHN0cmVhbSwg
dGhlIGRwY21bMF0gd2lsbCBiZSBlbXB0eQ0KDQo+IElmIHllcywgd2h5IG5vdCBzdG9wIGZvciB0
aGUgZmlyc3Qgbm9uLU5VTEwgZHBjbSB2YWx1ZT8NCj4gQWxzbyB3b25kZXJpbmcgaWYgeW91IGFy
ZSB1c2luZyBhIGxvb3AgYmVjYXVzZSB0aGVyZSdzIG5vIG90aGVyIGhlbHBlcg0KPiBhdmFpbGFi
bGU/DQp5ZXMuIEkgZGlkIG5vdCBmaW5kIGFueSBvdGhlciBoZWxwZXIgZnVuY3Rpb24gc28gSSB0
b29rIHRoZSBsb29wLg0K
