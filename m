Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44831CECF2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 08:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A38D1658;
	Tue, 12 May 2020 08:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A38D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589264458;
	bh=p2fsmH6Psbgqd9XjHmzsfeYFa+JMhh7SiOm8F/4OHFI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZxbAqeQ5yzS+WadMsiKkAF/tsAIvEjHa2GEJG6ID39RbcfX8Xm4D8bbKUt0v7/fEn
	 uv6vWGcuUzvbM/xazwCKvT3x1ZOKsOgG1KQuImJYeJgE9l9LbqaTKRLNvLVF5wjD4A
	 mk0b+bdIGCd8kjSP27Mhhjwq97zxDfHxhevCMyVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B6A7F8014C;
	Tue, 12 May 2020 08:19:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1B84F8015A; Tue, 12 May 2020 08:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAF83F800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 08:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF83F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="lzSyNB92"
IronPort-SDR: xMnjALCETL6xQXCa6kQA1UFfvtH8bxRwACaPuo2L2VeXmlODDUooM+QzJkTvnZh2ORowbgqj4A
 +xrF/68ZgFjQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 23:19:23 -0700
IronPort-SDR: QZHohtsxei+8W9d1ljalOAuDh2TDNKxJlukWgQOg/X/1OVhKBsiezfoVfufkfUdE+gObDMZ87a
 EZ8GH2jGlwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,382,1583222400"; d="scan'208";a="463426006"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga005.fm.intel.com with ESMTP; 11 May 2020 23:19:22 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 23:19:22 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx163.amr.corp.intel.com (10.18.125.72) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 23:19:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 11 May 2020 23:19:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzM2em86sgOny4TQsu5ips2dX2scSaWVPLJza47O+DWLF2Qze80ewP6nD7QDUhYx0wUKwK7qtx6ikPruLBZsu0AbcAibqE88JCP53Kw6d9IcBrh/HwX+h7KjgDjH/Qj69njCaQ8EWNI1BPGXnsDhdG7yDSpisFRF7Me/4GuUO2Odhz+MnPE5EWe84af/Ux79HzM2xxXG7mNeO0gBZllDiO+7H8aq7C0F0tovwnylXq8fGPlZBx2OqrV2qFcalRVx9us+BEOPFy03VtgesGk0V/rUUwHa92f60zSIgxBm7XzfmpCtcITJIYaCdtFSp77cq1OW6YKg72ipQdfPhvjCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2fsmH6Psbgqd9XjHmzsfeYFa+JMhh7SiOm8F/4OHFI=;
 b=iPlZhEVUBJYTatj4B8XM1xsHcacVrxuQqZ9pKGXXb6XXDXnqDLAJSGg6Sx+B8VKPAqLhTHZLbnQlQzCFPRSzr5avZk39JuHLhq6Gm271gx+8auNTLZPiPsYEc0gsGVJee/iPEXRmBfhGKJoG9fHQifCJ05IjamuIGIUTQyuUafYXplJka8YtsN9vnPvK61v2an3+qqFSv3t+rSNCaRYX5FeGvswsh5NlFU1LVjzXC7D9pDiHVJg7Piodp0Psf7mdrQDdBTL+pTBgsrx1xGmCF2jCwoj0Ci7MosPC8LEtYAjXkLOA43bM3MADaF6nMvKQQfkYy2uUAtdoP987DZUXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2fsmH6Psbgqd9XjHmzsfeYFa+JMhh7SiOm8F/4OHFI=;
 b=lzSyNB92gUdi8NNa7AcO4w8/q5W2hcDF5kMPV87cBcBV+mhhTXd/k2gtR3od/rYZaG6efpYcrBGZq9ltvZI4/drs3taNuvSU6A1aZZ7VabnpzxzqpcM3PpdS8WIJy1EeJpqI4i2OOW20kRL1Y+Pxo0k3v7pcOvUsPOaQC0r6W60=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2116.namprd11.prod.outlook.com
 (2603:10b6:405:58::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 06:19:20 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::5419:a938:2a3:ee27%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 06:19:20 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, "Rojewski, Cezary"
 <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>
Subject: RE: [PATCH 2/2] ASoC: Intel: Use readq to read 64 bit registers
Thread-Topic: [PATCH 2/2] ASoC: Intel: Use readq to read 64 bit registers
Thread-Index: AQHWJGKmcP7PUrMDikSfQKUDcB20uqikAa0g
Date: Tue, 12 May 2020 06:19:20 +0000
Message-ID: <BN6PR1101MB21322ED504F08AAC3DF028C697BE0@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <20200507133405.32251-1-amadeuszx.slawinski@linux.intel.com>
 <20200507133405.32251-2-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20200507133405.32251-2-amadeuszx.slawinski@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [36.230.206.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22afeae6-b29f-49f4-5432-08d7f63c682e
x-ms-traffictypediagnostic: BN6PR1101MB2116:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB2116D98A20C16DC026D70AEC97BE0@BN6PR1101MB2116.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MwLyJ791oWDkNtxEu21Cgkw5w59OlydKlB5IhnL7T+PkgyB089zXI1OP4FqYgUiHAoiJcOuKUPksRjm1W0rxpti9ErB7uNZwc/BZQQ4vDfhZNzZQnCjyA5gJFOZFNX7npU4I1NzFIx6BdMnPOJSvlBPoxOoYXFCAtJlo3oRPpnea4DR5FEp5lLGC89ydZ+3Ho+J4F6914KsY+ukiKHBFjYj745+/OSrw907GRalodd3iU767dgdTss9XTiKfNHaYYhfAP/rkyLB1bv2wNHHA4icLN8k3pC7Cplw6nXD95A6RWcM3EPOL1Uo5vbgGKdT1wSf1jQuDVeRoFIXO1htzOj4zYgv0FBb6FIeWcSsZbQ/KXHP9iYMjv9SLsOkeFfqYI22FbnJPmEJn29YUhAGbaN67Ovtj96FDBpIEAseX2wU+EW4rQ9E1Ng+5Px8eB0RIk0ITxNM8t25F//dLQJA1Zy8/uCFeCbiQIbH6Brj4kbmJDoL2eDmLiutU4Sf0o0MhMi6qVHA1pOD45YnoJ4TFCN1GDFIEi3ilp4nI7YJBdsPhOJT7oDsJZYNKcf+KGx6GI/7LoZxTLpRffW7uhtto2/V5nlRUJiZcYBUu9Yb7C00=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(136003)(396003)(39860400002)(346002)(33430700001)(478600001)(55016002)(7696005)(9686003)(76116006)(66946007)(66446008)(6506007)(186003)(66556008)(64756008)(52536014)(53546011)(66476007)(26005)(86362001)(110136005)(33440700001)(66574014)(8936002)(33656002)(8676002)(966005)(316002)(5660300002)(4326008)(2906002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yCm5AEB3/Uz9KUZMWVTRlAf55mycvE6YGQqvB3+FYkHjj1nmoYSAz3TqEPQfST+FVka2exROxIMubwFhPueNNKN+IIWUh4ebhTeNp7J417A9rCkMifj+d2KzCHgksIrjN5D6vAKjf3LTGxZLCmvSur7sN4oiEo8eClgzm/Ez0HmPzjwSFKphX7iFdyKGXWE/RHVI3jltwpaNt88Yi7Q2jldJN8V+lHOLD4XTY7OXoWYHoqEIQNBXuiGLrPDhxN6yjiLhzKPUG1x9d1Fc/rDpk++TyuPhaVPrIlYysBgnxKMnFe6M80ngVhDgE7YnPRpDhSm7EeBzxz7pv9fjfeTUF+e9m3UnCTVLKLqvNHCsCJe1oSO3o0dbUYLM/zYBUzLCTAlnKh5zxeQGxLqGntlksRTC2+1BxeWsdWxEg08J4GEtxrD+p9UGEiKvLs1ZgZtvzrwZY/OyIEQ3d+1nG/3K94v+VRCmwBs1bX5HGJnRrj/98zSYYEfUlHcaXN/ycqut
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22afeae6-b29f-49f4-5432-08d7f63c682e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 06:19:20.1342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEQLEvMzQsOfW4yj0bU7huGFD/aaZVuBpv2kHf+JDhBi8SiovtoqcURPoQPoLwgtNVTi6oS0oB1du0/R9YBNwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2116
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbHNhLWRldmVsIDxhbHNhLWRl
dmVsLWJvdW5jZXNAYWxzYS1wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IEFtYWRldXN6IFNs
YXdpbnNraQ0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDcsIDIwMjAgOTozNCBQTQ0KPiBUbzogUm9q
ZXdza2ksIENlemFyeSA8Y2V6YXJ5LnJvamV3c2tpQGludGVsLmNvbT47IFBpZXJyZS1Mb3VpcyBC
b3NzYXJ0DQo+IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+OyBMaWFtIEdp
cmR3b29kDQo+IDxsZ2lyZHdvb2RAZ21haWwuY29tPjsgSmllIFlhbmcgPHlhbmcuamllQGxpbnV4
LmludGVsLmNvbT47IE1hcmsgQnJvd24NCj4gPGJyb29uaWVAa2VybmVsLm9yZz47IFRha2FzaGkg
SXdhaSA8dGl3YWlAc3VzZS5jb20+DQo+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7
IEFtYWRldXN6IFPFgmF3acWEc2tpDQo+IDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVs
LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvMl0gQVNvQzogSW50ZWw6IFVzZSByZWFkcSB0byBy
ZWFkIDY0IGJpdCByZWdpc3RlcnMNCj4gDQo+IEluIG9yZGVyIHRvIGZpeCBpc3N1ZSBkZXNjcmli
ZWQgaW46DQo+ICJBU29DOiBJbnRlbDogc3N0OiBpcGMgY29tbWFuZCB0aW1lb3V0Ig0KPiBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNDgyODI5Lw0KPiANCj4gdXNlIHJlYWRx
IGZ1bmN0aW9uLCB3aGljaCBpcyBtZWFudCB0byByZWFkIDY0IGJpdCB2YWx1ZXMgZnJvbSByZWdp
c3RlcnMuDQo+IE9uIDMyIGJpdCBwbGF0Zm9ybXMgaXQgZmFsbHMgYmFjayB0byB0d28gcmVhZGwg
Y2FsbHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1
c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+DQo+IFJlcG9ydGVkLWJ5OiBCcmVudCBMdSA8
YnJlbnQubHVAaW50ZWwuY29tPg0KDQpUZXN0ZWQtYnk6IEJyZW50IEx1IDxicmVudC5sdUBpbnRl
bC5jb20+DQoNCg0KUmVnYXJkcywNCkJyZW50DQoNCj4gLS0tDQo+ICBzb3VuZC9zb2MvaW50ZWwv
Y29tbW9uL3NzdC1kc3AuYyB8IDkgKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9p
bnRlbC9jb21tb24vc3N0LWRzcC5jDQo+IGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtZHNw
LmMNCj4gaW5kZXggZWM2NmJlMjY5YjY5Li4zNmMwNzdhYTM4NmUgMTAwNjQ0DQo+IC0tLSBhL3Nv
dW5kL3NvYy9pbnRlbC9jb21tb24vc3N0LWRzcC5jDQo+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9j
b21tb24vc3N0LWRzcC5jDQo+IEBAIC0xMCw3ICsxMCw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgv
aW50ZXJydXB0Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+IC0jaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gKyNp
bmNsdWRlIDxsaW51eC9pby02NC1ub25hdG9taWMtbG8taGkuaD4NCj4gICNpbmNsdWRlIDxsaW51
eC9kZWxheS5oPg0KPiANCj4gICNpbmNsdWRlICJzc3QtZHNwLmgiDQo+IEBAIC0zNCwxNiArMzQs
MTMgQEAgRVhQT1JUX1NZTUJPTF9HUEwoc3N0X3NoaW0zMl9yZWFkKTsNCj4gDQo+ICB2b2lkIHNz
dF9zaGltMzJfd3JpdGU2NCh2b2lkIF9faW9tZW0gKmFkZHIsIHUzMiBvZmZzZXQsIHU2NCB2YWx1
ZSkgIHsNCj4gLQltZW1jcHlfdG9pbyhhZGRyICsgb2Zmc2V0LCAmdmFsdWUsIHNpemVvZih2YWx1
ZSkpOw0KPiArCXdyaXRlcSh2YWx1ZSwgYWRkciArIG9mZnNldCk7DQo+ICB9DQo+ICBFWFBPUlRf
U1lNQk9MX0dQTChzc3Rfc2hpbTMyX3dyaXRlNjQpOw0KPiANCj4gIHU2NCBzc3Rfc2hpbTMyX3Jl
YWQ2NCh2b2lkIF9faW9tZW0gKmFkZHIsIHUzMiBvZmZzZXQpICB7DQo+IC0JdTY0IHZhbDsNCj4g
LQ0KPiAtCW1lbWNweV9mcm9taW8oJnZhbCwgYWRkciArIG9mZnNldCwgc2l6ZW9mKHZhbCkpOw0K
PiAtCXJldHVybiB2YWw7DQo+ICsJcmV0dXJuIHJlYWRxKGFkZHIgKyBvZmZzZXQpOw0KPiAgfQ0K
PiAgRVhQT1JUX1NZTUJPTF9HUEwoc3N0X3NoaW0zMl9yZWFkNjQpOw0KPiANCj4gLS0NCj4gMi4x
Ny4xDQoNCg==
