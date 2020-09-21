Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B72731B9
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 20:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3811016CF;
	Mon, 21 Sep 2020 20:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3811016CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600712205;
	bh=VMLiWFQ4J7F8q0XTUcBccmirfl5I0kCaeOY8D2k/Gjg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFtUetGi5uX0KG1binI6EYhV/7jff2Z6N+ENyNUD7LrlUDMhdSTUXOvvOct+A7pQy
	 6YFmw3Su0vMC9nhcyNucbTlIfZUjl66c2dClySI6QxoI9q3i9ap51nlyL/jIvRj6Gr
	 OfWVVEjLDFQHScj6apGr5MeVHSg1AkByDDjD7ICg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C434F8021C;
	Mon, 21 Sep 2020 20:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2B6F802D2; Mon, 21 Sep 2020 20:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DDBF802C3
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 20:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DDBF802C3
IronPort-SDR: TwAKXQafjIRN8WkMlki5587PZ2JKHrWgSCt0VVQk7qZHrsWwymtqlVdzgwyNVODzdLdTXAIqqx
 bsYbNkO5vc5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="157829552"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="157829552"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 11:14:53 -0700
IronPort-SDR: Io38fe1xikIGN6ywGvDd/+yvIy8seM8TOjMOQ6iJrxm1pHQCjaigRjQAP2AhePpOUaz0C8yy2F
 WuMJpMnkJ2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="309162026"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga006.jf.intel.com with ESMTP; 21 Sep 2020 11:14:51 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 19:14:49 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 21 Sep 2020 19:14:49 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: RE: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Thread-Topic: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Thread-Index: AQHWkA4pBFUDuLKjeUm4qjF+MvEK1aly/TsAgAAQe4CAAAYMAIAAAM6AgABRZNA=
Date: Mon, 21 Sep 2020 18:14:49 +0000
Message-ID: <da15c3c312704adaaec2111e52bfcf15@intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <2c073526-fc9d-832b-48d4-f955e3b99e24@linux.intel.com>
 <20200921142012.GY3956970@smile.fi.intel.com>
 <20200921142305.GZ3956970@smile.fi.intel.com>
In-Reply-To: <20200921142305.GZ3956970@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Hejmowski, Krzysztof" <krzysztof.hejmowski@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
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

T24gMjAyMC0wOS0yMSA0OjIzIFBNLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IE9uIE1vbiwg
U2VwIDIxLCAyMDIwIGF0IDA1OjIwOjEyUE0gKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToN
Cj4+IE9uIE1vbiwgU2VwIDIxLCAyMDIwIGF0IDAzOjU4OjMzUE0gKzAyMDAsIEFtYWRldXN6IFPF
gmF3acWEc2tpIHdyb3RlOg0KPj4+IE9uIDkvMjEvMjAyMCAyOjU5IFBNLCBBbmR5IFNoZXZjaGVu
a28gd3JvdGU6DQo+Pj4+PiArc3RydWN0IGNhdHB0X3NldF92b2x1bWVfaW5wdXQgew0KPj4+Pj4g
Kwl1MzIgY2hhbm5lbDsNCj4+Pj4+ICsJdTMyIHRhcmdldF92b2x1bWU7DQo+Pj4+PiArCXU2NCBj
dXJ2ZV9kdXJhdGlvbjsNCj4+Pj4+ICsJZW51bSBjYXRwdF9hdWRpb19jdXJ2ZV90eXBlIGN1cnZl
X3R5cGUgX19hbGlnbmVkKDQpOw0KPj4+Pj4gK30gX19wYWNrZWQ7DQo+Pj4+IEhvdyB0aGlzIF9f
cGFja2VkIGNoYW5nZXMgYW55dGhpbmc/IEluIGdlbmVyYWwgX19wYWNrZWQgZG9lc24ndCBtYWtl
IHNlbnNlIGZvcg0KPj4+PiBpbi1rZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzLiBPdGhlcndpc2UgeW91
IGhhdmUgdG8gdXNlIHByb3BlciAoUE9EKSB0eXBlcyBmb3INCj4+Pj4gZGF0YS4gRGl0dG8gZm9y
IGFsbCBzaW1pbGFyIGNhc2VzLg0KPj4+DQo+Pj4gQWxsIG9mIF9fcGFja2VkIHVzZSBpbiBjb2Rl
IGlzIGRvbmUgb24gc3RydWN0dXJlcyB1c2VkIHRvIGNvbW11bmljYXRlIHdpdGgNCj4+PiBGVywg
d2hpY2ggaXMgYmluYXJ5IGludGVyZmFjZSwgc28gaXQgaXMgbm90IGtlcm5lbCBvbmx5IHN0cnVj
dHVyZSwgYXMgaXQgaXMNCj4+PiBhbHNvIEZXIG9uZS4gV2hpbGUgd2UgY2FuIGV4cGVjdCBjb21w
aWxlciB0byBkbyB0aGUgcmlnaHQgdGhpbmcsIEkgY29uc2lkZXINCj4+PiBpdCBpcyBiZXR0ZXIg
dG8gYmUgZXhwbGljaXQgYWJvdXQgd2hhdCBraW5kIG9mIGRhdGEgd2UgYXJlIGhhbmRsaW5nLCBz
bw0KPj4+IHRoZXJlIGFyZW4ndCBhbnkgc3VycHJpc2VzLg0KPj4NCj4+IFNpemUgb2YgZW51bSBp
cyBjb21waWxlciBkZWZpbmVkLiBJdCBtYXkgbm90IGJlIHVzZWQgaW4gdGhlIEFCSXMuDQo+IA0K
PiBJIGhhdmUgdG8gZWxhYm9yYXRlIHRoYXQgSSdtIHRhbGtpbmcgaW4gQUJJcyB3aGljaCBpbXBs
aWVzIGRpZmZlcmVudCBjb21waWxlcnMNCj4gYW5kIGV2ZW4gbWF5IGJlIHJ1biBvbiBkaWZmZXJl
bnQgQ1BVIGFyY2hpdGVjdHVyZXMuDQo+IA0KPj4gX191WFggdnMuIHVYWCBJIGR1bm5vLg0KPiAN
Cj4gQW5kIGhlcmUgSSdtIHRhbGtpbmcgYWJvdXQgRlcgPC0tPiBPUyBpbnRlcmZhY2UuIEl0J3Mg
bm90IHVzZXIgdmlzaWJsZSBBQkksIGJ1dA0KPiBzdGlsbCBzb21lIEV4dCA8LS0+IEludCBwcm90
b2NvbC4gSSBzYXcgdVhYIHR5cGVzIGluIGRhdGEgc3RydWN0dXJlcyBvZiBGVw0KPiBjb21tdW5p
Y2F0aW9uIHByb3RvY29scy4NCj4gDQoNCldpbGwgcmVtb3ZlIGVudW0gbWVtYmVycyBmcm9tIElQ
QyBzdHJ1Y3RzIGluIHY4IGFzIHJlcXVlc3RlZC4NCg0KVGhhbmtzLA0KQ3phcmVrDQoNCg==
