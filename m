Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F793231060
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 19:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16FAA171B;
	Tue, 28 Jul 2020 19:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16FAA171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595955885;
	bh=yik4VYqm2a4y+pV+4ARfFYLiRLg1vmXKMlBrtEGiXrc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d20MQxlIdOZNiUCfFdaRF/LgJG/DDJcmue5qnsdoalGKCkzCMwYEVRe6eU1ORnXsu
	 gIz6ea/gQtfIkLxo5NVWrD0uXKXfXK2CtmaLAR9stCQeYNKn+aXllBVWrpf26s+llt
	 SNPepZJdODx9nnq5fp4yeG+UIscRfVaAPf/3OTD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA29F80227;
	Tue, 28 Jul 2020 19:03:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 483DAF8021E; Tue, 28 Jul 2020 19:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECF1DF8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 19:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF1DF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Sd2ukVlp"
IronPort-SDR: KuwyncWApbtTF4lwJyc+7bECyf00nWe4L4GRFKM0Qy0N9Hnp8Vr1ac38imTBZDEjy7NouvM72N
 RPXrXLE4mheQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="131331315"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="131331315"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 10:02:31 -0700
IronPort-SDR: JJP9zFG8KOEEgwi8HnzP4/UBBAsH/GXHbqMt0YaEj1jD7y0Rh2MZ0flQi/b85/DhmfGLpcTTop
 tm5WXeoR/udg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; d="scan'208";a="489967816"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2020 10:02:29 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 10:02:29 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX111.amr.corp.intel.com (10.22.240.12) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 10:02:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 10:02:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NryF/5bjO6hSADFXE1HrrD1LYE8LEOKlxxaBjpoRTY2bJSmI6tFcw2Dg0Hz0YIrTUvX/Y/wrfx5AsfdP5GdadxU06S2CsaKPvIS1saPtNewIhOIWsIQ8TL+DHQpGhnuyK9xk3Ku5Ks5A3zDlqvg3rNs4yXjTpEB5mWKZ7cqgC1PjbwYTXjJ/aTmmDdwCwmUv9E3pg2SnHq4MHRgj1+ZflYsuo0QZGendcCS5lDvSKRO7tCQ0lxvSsubM4uoAn9bBfCI0vohRm9ZeqsyFep1DDgc+zWUSxgvjmA72MplA+vO5ozUC06EH+UhKe4+kjhOd7Mtz5JD5ydFPQiR7XgE1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yik4VYqm2a4y+pV+4ARfFYLiRLg1vmXKMlBrtEGiXrc=;
 b=k3yjtgKFXQM17kaXC7UmzrXZPQWVN+ubm3rOmLFXvNM43J2jXD+QgCxMVxEHYni/p2l2qq3a2JdJxhHRCpEcrC+v79I2SBsUzRLP8IakOp6zMR6ubZ5RXXZn80ZRYS7qnUtZTkdGFEJTOalByX8C3r0EoDIeC/9bDkdLKvfgRrb1LQXEC+irN3Lc+3IpPFohh2xx8UCMtaRUBciupVyGOz+QrGdKbXMuovh27zegYqtZrT27M9xvTbsGU0jYRn6MsQR47pvsydBGLqVwiMjGoIS7ZLQL+X/q7AWr1CXngbkU9nBidCNUXIGjizycGg6eTM/48bUGgi+wOrkwIH1pWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yik4VYqm2a4y+pV+4ARfFYLiRLg1vmXKMlBrtEGiXrc=;
 b=Sd2ukVlpBSHnpRb8JSN72SrfmHMD1RsuR4AUxxKb+0djHMEfF9eaWaQqJC9u1MAVtMn16DljdC1PlHKAwzlHaaN/2NA3+4f19/eyd4YFEUIeUqZGyrwsHDvqbkfbyg60qmAoYdytM++C6GzP6V7Gxx7GlmMrAUAaziMg/bopck4=
Received: from DM6PR11MB3642.namprd11.prod.outlook.com (2603:10b6:5:138::26)
 by DM6PR11MB3785.namprd11.prod.outlook.com (2603:10b6:5:13f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 28 Jul
 2020 17:02:23 +0000
Received: from DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41]) by DM6PR11MB3642.namprd11.prod.outlook.com
 ([fe80::f043:4bdc:ef57:1b41%5]) with mapi id 15.20.3239.016; Tue, 28 Jul 2020
 17:02:23 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: Atom: use hardware counter to update hw_ptr
Thread-Topic: [PATCH] ASoC: Intel: Atom: use hardware counter to update hw_ptr
Thread-Index: AQHWY2e1AMm9opfdpkGft589vBQJfqkbeEuAgAC7fpCAALRXgIAASocg
Date: Tue, 28 Jul 2020 17:02:23 +0000
Message-ID: <DM6PR11MB3642AF0905E0CF57B094906297730@DM6PR11MB3642.namprd11.prod.outlook.com>
References: <1595779727-31404-1-git-send-email-brent.lu@intel.com>
 <7dec7fcd-0381-d279-4dac-77c27ea5f6fe@linux.intel.com>
 <DM6PR11MB3642BE84A5C91504D6AF4ECB97730@DM6PR11MB3642.namprd11.prod.outlook.com>
 <14fde5e9-a11a-077d-b533-1e6db4b7a262@linux.intel.com>
In-Reply-To: <14fde5e9-a11a-077d-b533-1e6db4b7a262@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.25.81.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fba68e34-a48d-4b1e-7664-08d83317ff4e
x-ms-traffictypediagnostic: DM6PR11MB3785:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3785276D970CA85C55454BD197730@DM6PR11MB3785.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5D+4uaZ5MZPnQJ27yg0yUtEX7hG7+4qL1IGnT+30VY+8bXJ5Xub+thtfDVtLRZwwjNogHmHhg+B09BeQfWB3oZqKPXR+yqVKMHBvLhO2lTpQW790v1OY3z38ZSoJhJAKgetRiznMH01ZO/7USd3q4Pd6ER0Rys7bXOCfDYP0bs8WdWz5JUZHOJkYPXu0PZaViQOuZl2yjI0CF1Lr7XK6KeaRsdTqZv1N2qAk89qTSO4m2jhKUd1OouUSl9/9+MfXUa4CDCNcfqWjpOPQ7Qvf9GOppJj9pWNjFFYY+2GdrFCSClSrwTmbExwgwmQiFxv4uJJT8lIaMhknCEaP5tgyJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(64756008)(4326008)(86362001)(2906002)(9686003)(71200400001)(8936002)(55016002)(478600001)(52536014)(66446008)(66556008)(54906003)(316002)(6506007)(76116006)(186003)(15650500001)(8676002)(26005)(5660300002)(83380400001)(110136005)(33656002)(66476007)(66946007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BqaHHsyoiQk6lw11s9mWXTtCcVumKlmw+XoPa/yiF+wirbtsU9PvtVoIHm4jZdIcfqa+N/GS8Y5D+0zAJJlvgyvM3cBpTDqOtH8ZoHEPnOg2/v0HORbqki1fyC0VkWK+bu0t1muHF8mT5zfivJVWhSKNR82pFhwxVpq9qkfcMjlMTEfqmKhtfyQil7Fnh3Q0iwQ01/TIY/0MIsitGv/sqZl9HXhVTBuoFJr/Zc+ZfkCNmRO0Xb9Vz+CoGQB0E8WCwMNZy680oHpqCRRB5ZUIA3pWSHj8/+hAezeDRHk1HMC02QfMHj7b/9XJMIwOLmAvmKfKcIAxBAWs8BNI1IFDSnmiBBxTqN9io14GJJ6TvQeTH+E5TtA5wiA/NLWT2Kc6G+nWjIFkkkLdD08LZ9TeEI35N9DlOxE2u+W61LDvKHXqQVtujCp67bVf9PhiKgEIrQQpT2Wp4o0n81FQ/TgN0so5kjzGvZSILwcnllJj00/p55fmFKt8dKGS3Xcchla5iMQRuXS8rPfEDFle+iv1XIy3zp+dOFzcqbdQxGWQf/8nYnKLMP2AJOBfVWz9Kbrn4Gp0f52h3TGxz96ZqJqJltOnR+P3n2qe15/Qsbj8TqpbQM1cMLy5Gr8hoqJJaYZN0RCfFtyaimpoW3N1Ua2P7A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba68e34-a48d-4b1e-7664-08d83317ff4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 17:02:23.2682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xhe3gtj+zVx67KSXuxC4k5/IM7JAr3uWutB/FZgy+KsgLjk8K5zkHAI56xzqXpkNx+nWlnCLkksumZmylRL7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3785
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

PiANCj4gU28gaWYgdGhlcmUgYXJlIGFscmVhZHkgcXVpcmtzIGluIGF0b20gbWFjaGluZSBkcml2
ZXJzIHRvIGNoYW5nZSB0aGUgcGVyaW9kDQo+IHNpemUsIHdoeSBpcyB0aGlzIHBhdGNoIG5lY2Vz
c2FyeT8NCj4gDQoNClRoZSBzdG9yeSBpczogZ29vZ2xlIGltcGxlbWVudGVkIHRoZSBjb25zdHJh
aW50IGJ1dCBkb2Vzbid0IGtub3cgd2h5IGl0IHdvcmtzDQpzbyBhc2tlZCB1cyB0byBleHBsYWlu
LiBBZnRlciBjaGVja2luZyB0aGUgdHdvIGNvdW50ZXJzIEkgcmVhbGl6ZWQgdGhlIGluY3JlYXNl
IG9mDQpyaW5nIGJ1ZmZlciBwb2ludGVyIGZvbGxvd3MgdGhlIHBlcmlvZCBzaXplIHNldHRpbmcg
aW4gaHdfcGFyYW0gKDI1NikgYnV0IHRoZQ0KcGVyaW9kIG9mIGludGVycnVwdCBpcyBhbHdheXMg
NW1zIGluc3RlYWQgb2YgNS4zMyBzbyBpdCdzIHJ1bm5pbmcgbGl0dGxlIGJpdCB0b28gZmFzdC4N
Ckl0IHNlZW1zIHRoZSBMUEUga2VlcHMgdHJhY2tpbmcgdGhlIGRpZmZlcmVuY2Ugb2YgdHdvIGNv
dW50ZXJzLiBXaGVuIHRoZQ0KZGlmZmVyZW5jZSBleGNlZWRzIDIxNjAgc2FtcGxlcywgdGhlIG5l
eHQgaW50ZXJydXB0IHdpbGwgYmUgY2FuY2VsZWQgc28gdGhlDQpoYXJkd2FyZSBjb3VudGVyIGNv
dWxkIGNhdGNoIHVwIGEgbGl0dGxlLg0KDQpbICAgNDMuMjA4Mjk5XSBpbnRlbF9zc3RfYWNwaSA4
MDg2MjJBODowMDogbXJmbGQgcmluZ19idWZmZXJfY291bnRlciAxMDc1MjAgaGFyZHdhcmVfY291
bnRlciA5ODg4MCBwY20gZGVsYXkgODY0MCAoaW4gYnl0ZXMpDQpbICAgNDMuMjA4MzA2XSBpbnRl
bF9zc3RfYWNwaSA4MDg2MjJBODowMDogYnVmZmVyIHB0ciAyNjg4MCBwY21fZGVsYXkgcmVwOiAy
MTYwDQpbICAgNDMuMjA4MzIxXSBzb3VuZCBwY21DMUQwcDogW1FdIHBvcyAyNjg4MCBod19wdHIg
MjY4ODAgYXBwbF9wdHIgNDAwMDAgYXZhaWwgMTkxNjgwDQo9PiBvbmUgaW50ZXJydXB0IGlzIHNr
aXBwZWQuDQpbICAgNDMuMjE4Mjk5XSBpbnRlbF9zc3RfYWNwaSA4MDg2MjJBODowMDogbXJmbGQg
cmluZ19idWZmZXJfY291bnRlciAxMDg1NDQgaGFyZHdhcmVfY291bnRlciAxMDA4MDAgcGNtIGRl
bGF5IDc3NDQgKGluIGJ5dGVzKQ0KWyAgIDQzLjIxODMwN10gaW50ZWxfc3N0X2FjcGkgODA4NjIy
QTg6MDA6IGJ1ZmZlciBwdHIgMjcxMzYgcGNtX2RlbGF5IHJlcDogMTkzNg0KWyAgIDQzLjIxODMz
Nl0gc291bmQgcGNtQzFEMHA6IFtRXSBwb3MgMjcxMzYgaHdfcHRyIDI3MTM2IGFwcGxfcHRyIDQw
MDAwIGF2YWlsIDE5MTkzNg0KDQpTbyBJIHRoaW5rIHdoeSBub3QgdXNpbmcgdGhlIGhhcmR3YXJl
IGNvdW50ZXI/IEl0IGluY3JlYXNlcyAyNDAgc2FtcGxlcyBldmVyeSA1bXMNCnBlcmZlY3RseSBt
YXRjaCB0aGUgNDgwMDAgc2FtcGxlIHJhdGUuIFRoZSB0ZXN0IHJlc3VsdCBpcyBnb29kIGJ1dCBJ
IGtub3cgdGhlcmUgbXVzdA0KYmUgYSByZWFzb24gZm9yIHRoZSBvcmlnaW5hbCBkZXNpZ25lciB0
byB1c2UgcmluZyBidWZmZXIgY291bnRlciBpbnN0ZWFkIG9mIGhhcmR3YXJlDQpjb3VudGVyLiBJ
IHVwbG9hZGVkIHRoaXMgcGF0Y2ggdG8gc2VlIGlmIGFueW9uZSBzdGlsbCByZW1lbWJlciB0aGUg
cmVhc29uIGFuZCBzaGFyZQ0Kc29tZSBpbnNpZ2h0IHdpdGggbWUuDQoNCkkgdG90YWxseSBhZ3Jl
ZSB0aGF0IHdlIHNob3VsZG4ndCB0b3VjaCB0aGlzIHBhcnQgb2YgZGVzaWduLiBEbyB5b3UgdGhp
bmsgaXQgbWFrZSBzZW5zZQ0KdG8gYWRkIGEgY29uc3RyYWludCB0byBlbmZvcmNlIHRoZSBwZXJp
b2Qgc2l6ZSBpbiBtYWNoaW5lIGRyaXZlcj8gSWYgeWVzIHRoZW4gSSB3b3VsZA0KdXBsb2FkIHBh
dGNoZXMgZm9yIENocm9tZSBhdG9tIG1hY2hpbmVzIGZvciBnb29nbGUuDQoNCg0KUmVnYXJkcywN
CkJyZW50DQoNCj4gPiBJJ20gY3VyaW91cyB3aHkgbm90IGp1c3QgdXNpbmcgaGFyZHdhcmUgY291
bnRlciB0byB1cGRhdGUgaHdfcHRyIGFuZA0KPiA+IGdldCByaWQgb2YgdGhlIHBlcmlvZCBzZXR0
aW5nIGluIGh3X3BhcmFtPyBJdCBzZWVtcyB0byBtZSB0aGUgcmluZw0KPiA+IGJ1ZmZlciBjb3Vu
dGVyIGRvZXMgbm90IHJlZmxlY3QgdGhlIHJlYWwgc3RhdHVzLg0KPiANCj4gSSBkb24ndCByZWNh
bGwgcHJlY2lzZWx5IHdoYXQgdGhpcyBoYXJkd2FyZSBjb3VudGVyIGRvZXMuIEkgdmFndWVseSBy
ZWNhbGwgaXQncw0KPiB0aWVkIHRvIHRoZSAxOS4yTUh6IGV4dGVybmFsIHRpbWVyIHdoaWNoIGlz
IGFsc28gdXNlZCB0byBzY2hlZHVsZSB0aGUgMW1zDQo+IFNCQSBtaXhlciBhbmQgdGhlIFNTUCBJ
T3MuIEFuZCBieSBjb21wYXJpbmcgd2l0aCB0aGUgcmluZyBidWZmZXIgcG9pbnRlcg0KPiB5b3Ug
Y2FuIGluZmVyIHRoZSBkZWxheSBpbnNpZGUgdGhlIERTUC4gSSB0aGluayB5b3UgYXJlIGFsc28g
bWFraW5nIGFuDQo+IGFzc3VtcHRpb24gdGhhdCBhbGwgc3RyZWFtcyBhcmUgdGllZCB0byB0aGUg
b3V0cHV0IHJhdGUsIGJ1dCB0aGF0J3MgbW9zdCBsaWtlbHkNCj4gYSBiYWQgYXNzdW1wdGlvbi4g
VGhlIGhhcmQtY29kZWQgdG9wb2xvZ3kgc3VwcG9ydGVkIG1lZGlhLCBzcGVlY2ggYW5kDQo+IGNv
bXByZXNzZWQgZGF0YSBhbmQgdGhlIGNvbnN1bXB0aW9uIHJhdGUgb24gdGhlIERNQSBzaWRlIGNv
dWxkIGJlIGZhc3Rlcg0KPiB3aXRoIHNvbWUgYnVmZmVyaW5nIGhhcHBlbmluZyBpbiB0aGUgRFNQ
Lg0KPiBJdCdzIG5vdCBhIHBhc3N0aHJvdWdoIERNQSBpbiBhbGwgY2FzZXMuDQo+IA0KPiBUaGlz
IGlzIHJlYWxseSBsZWdhY3kgY29kZSB0aGF0IG5vIG9uZSByZWFsbHkgZnVsbHkgdW5kZXJzdGFu
ZHMgbm9yIHBsYW5zIG9uDQo+IGltcHJvdmluZywgaXQnZCBiZSBhIGJhZCBpZGVhIHRvIGNoYW5n
ZSB0aGUgcGNtIHBvaW50ZXIgcmVwb3J0cyBub3csIDYgeWVhcnMNCj4gYWZ0ZXIgdGhlIGluaXRp
YWwgY29kZSByZWxlYXNlIGFuZCBhZnRlciBhbGwgaW5pdGlhbCBjb250cmlidXRvcnMgbW92ZWQg
b24uIEl0J3MNCj4gd2hhdCBpdCBpcy4NCj4gDQoNCg==
