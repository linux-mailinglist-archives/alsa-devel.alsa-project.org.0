Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EEC28B17C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 11:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D88D167E;
	Mon, 12 Oct 2020 11:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D88D167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602494773;
	bh=PUdCPqKqk4gZ5OuJ2z/lhFmJhj9EyQLieaXf08pbA1s=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R/h73wZ9H3xPYVphhpIdafIAyC9mfLYGBTue+7tB3G4n6VjeG2XfJBgnsPvvrSPwn
	 WDa7hOuMNKeQasiGWOHI3yLPFUPD2CNDd9jrH0084ViRvl/VMfeUfJILKAhMqc64Lh
	 ervXGricnpX9kZdlsB3ddnACM5xnvpdoRALdGx6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E02FCF80141;
	Mon, 12 Oct 2020 11:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A737F80217; Mon, 12 Oct 2020 11:24:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B1CFF80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 11:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B1CFF80141
IronPort-SDR: 863gD+L1yI68ksK8vdd/WwfguapNjZ95HmlmgrNPob83Vk8ZMkp34igEXJME4ONp6utKWZX5FL
 SPNf4EvsUM5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="145033297"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="145033297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 02:24:20 -0700
IronPort-SDR: hShmw0ZntB6DPNJ9iGCYkU0DZy2/Q76QUf3IGZpsOuyMuKgik7Mab14MgWiErkOKibQZRv73nr
 +UclHPsWGmbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="420168589"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2020 02:24:18 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Oct 2020 10:24:18 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 12 Oct 2020 10:24:18 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Hans de Goede <hdegoede@redhat.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
Thread-Topic: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
Thread-Index: AQHWm6zgujBgnZDY0kedbl6MD/dAjKmTmpiAgAAgHxA=
Date: Mon, 12 Oct 2020 09:24:18 +0000
Message-ID: <d64473eb74bb4428a25f9c7903e295e5@intel.com>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
 <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
In-Reply-To: <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
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
Cc: "Hejmowski, Krzysztof" <krzysztof.hejmowski@intel.com>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
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

T24gMjAyMC0xMC0xMiAxMDoyNiBBTSwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4gSGksDQo+IA0K
PiBPbiAxMC82LzIwIDg6NDggQU0sIENlemFyeSBSb2pld3NraSB3cm90ZToNCj4+IEZvbGxvdyB1
cCB0byBjYXRwdCBzZXJpZXMgYXMgbWVudGlvbmVkIGluOg0KPj4gW1BBVENIIHYxMCAwMC8xNF0g
QVNvQzogSW50ZWw6IENhdHB0IC0gTHlueCBhbmQgV2lsZGNhdCBwb2ludA0KPj4gaHR0cHM6Ly93
d3cuc3Bpbmljcy5uZXQvbGlzdHMvYWxzYS1kZXZlbC9tc2cxMTY0NDAuaHRtbA0KPj4NCj4+IEFz
IGNhdHB0IGlzIGEgZGlyZWN0IHJlcGxhY2VtZW50IHRvIHNvdW5kL3NvYy9pbnRlbC9oYXN3ZWxs
LCBpdCBsZWF2ZXMgYQ0KPj4gbG90IG9mIGNvZGUgcmVkdWRhbnQuIFRoZSBzZWNvbmQgbGVnYWN5
IHNvbHV0aW9uIC0gYmF5dHJhaWwgLSBpcw0KPj4gZGVwcmVjYXRlZCBmb3IgYSBsb25nIHRpbWUg
Ynkgc291bmQvc29jL2ludGVsL2F0b20gd2l0aCBTT0YgZmxhdm9yDQo+PiBhdmFpbGFibGUgdG9v
Lg0KPj4NCj4+IFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aGUgcmVkdWRhbmN5IGFuZCByZW1vdmVz
IG9ic29sZXRlIGNvZGUuIEFsb25nDQo+PiB3aXRoIHRoZSBsZWdhY3kgc29sdXRpb25zLCBhbGwg
b3JwaGFuZWQgY29tcG9uZW50cyBhcmUgcmVtb3ZlZCB0b28uDQo+Pg0KPj4gQXMgYSBjb25zZXF1
ZW5jZSwgZnVydGhlciBjbGVhbnVwcyBhcmUgdW5sb2NrZWQ6IHNvdW5kL3NvYy9pbnRlbC9za3ls
YWtlDQo+PiBiZWNvbWVzIHRoZSBzb2xlIHVzZXIgb2YgcHJvY2Vzc2luZyBjb2RlIGZvdW5kIGlu
DQo+PiBzb3VuZC9zb2MvaW50ZWwvY29tbW9uLiBUaG9zZSBhcmUgbm90IHBhcnQgb2YgdGhpcyBz
ZXJpZXMuDQo+IA0KPiBTaW5jZSBJJ3ZlIG1vc3RseSB3b3JrZWQgd2l0aCBQaWVycmUtTG91aXMg
b24gdGhpcywgSSBndWVzcyB5b3UgbWF5IG5vdA0KPiBrbm93IHRoaXMsIGJ1dCBJIGhhdmUgbW9y
ZSBvciBsZXNzIHNpbmdsZSBoYW5kZWRseSBoYXZlIG1hZGUgc3VyZSB0aGF0DQo+IGF1ZGlvIHdv
cmtzIHByb3Blcmx5IG9uIEJheSBUcmFpbCBhbmQgQ2hlcnJ5IFRyYWlsIGRldmljZXMgZHVyaW5n
IHRoZQ0KPiBsYXN0IGZldyB5ZWFycy4gIENhbiB5b3UgcGxlYXNlIENjIG1lIG9uIGZ1dHVyZSBz
ZXJpZXMgd2hpY2ggaW1wYWN0DQo+IEJheSBUcmFpbCAvIENoZXJyeSBUcmFpbCBzdXBwb3J0ID8N
Cj4gDQoNCkhlbGxvIEhhbnMsDQoNClRoYW5rcyBmb3IgeW91ciBoZWxwIGR1cmluZyBtYWludGVu
YW5jZSBvZiBCWVQgJiBDSFQgcHJvZHVjdHMuDQpBZ3JlZWQsIHdpbGwgQ2MgeW91IGluIGZ1dHVy
ZSBzZXJpZXMgZm9yIGxpc3RlZCBkZXZpY2VzLg0KDQo+IEZXSVcgKHNpbmNlIHRoYXQgdGhpcyBp
cyBhbHJlYWR5IG1lcmdlZCkgSSdtIGZpbmUgd2l0aCByZW1vdmluZyB0aGUNCj4gcXVpdGUgb2xk
IEJheSBUcmFpbCBzdXBwb3J0IGZyb20gY29tbW9uL3NzdC1hY3BpLmMsIGF0IGxlYXN0IEZlZG9y
YQ0KPiBoYXMgYmVlbiB1c2luZyB0aGUgbWVkaXVtLW9sZCAod2l0aCBTT0YgYmVpbmcgdGhlIG5l
dyB0aGluZykNCj4gQ09ORklHX1NORF9TU1RfSVBDX0FDUEkgc3VwcG9ydCBmb3IgQmF5IFRyYWls
IGF1ZGlvIHN1cHBvcnQgZm9yDQo+IHF1aXRlIHNvbWUgdGltZSBub3cuDQo+IA0KDQpQbGVhc2Ug
bm90ZSBDT05GSUdfU05EX1NTVF9JUENfQUNQSSBpcyB0YXJnZXRpbmcgL2F0b20vIHNvbHV0aW9u
LCBub3QNCnRoZSAvYmF5dHJhaWwvIG9uZSAoc2VlIHRoZSAvYXRvbS9zc3QvTWFrZWZpbGUpLiBG
YWN0IHRoYXQgaXMgaGFzIGJlZW4NCnVzZWQgd2l0aGluIC9jb21tb24vc3N0LWFjcGkuYyBpcyBh
IGRldmVsb3BlcidzIG1pc3Rha2UgcHJvYmFibHkgY2F1c2VkDQpieSBnZW5lcmljIG5hbWluZyBv
ZiBtZW50aW9uZWQga2NvbmZpZy4NCg0KSSdsbCBzZW5kIGEgcGF0Y2ggdG9kYXkgc29tZXdoYXQg
YWRkcmVzc2luZyB0aGlzIGluY29uc2lzdGVuY3kuDQoNCj4gVGhpcyBpcyBub3QganVzdCBhYm91
dCBCYXkgVHJhaWwgQW5kIENoZXJyeSBUcmFpbCBkZXZpY2VzIHRob3VnaCwNCj4gdGhpcyBzZXJp
ZXMgYWxzbyBtYWtlcyBjaGFuZ2VzIGltcGFjdGluZyBIYXN3ZWxsIGFuZCBCcm9hZHdlbGwgZGV2
aWNlcy4NCj4gDQo+IFRoZSBjb21taXQgcmVtb3ZpbmcgdGhpcyBzdXBwb3J0IGNsYWltcyB0aGF0
IGF0IGxlYXN0IGZvciBIYXN3ZWxsIHRoZQ0KPiBuZXcgc291bmQvc29jL2ludGVsL2NhdHB0IHJl
cGxhY2VzIGl0LCBidXQgSSBkbyBub3Qgc2VlIHRoYXQgY29kZSBpbg0KPiA1LjksIHNvIHRoYXQg
bWVhbnMgdGhhdCBpbiBvbmUgY3ljbGUgd2UgYXJlIGJvdGggaW50cm9kdWNpbmcgdGhlDQo+IHJl
cGxhY2VtZW50IGFuZCBkcm9wcGluZyB0aGUgb2xkIGNvZGUgPyAgSSdtIG5vdCBzdXJlIGlmIHRo
YXQgaXMgc3VjaA0KPiBhIGdyZWF0IGlkZWEsIHdoYXQgaXMgdGhlIGZhbGxiYWNrIHBsYW4gaWYg
dGVzdGluZyBkb2VzIGZpbmQgc2lnbmlmaWNhbnQNCj4gaXNzdWVzIHdpdGggdGhlIG5ldyBjYXRw
dCBjb2RlID8NCj4gDQo+IEFueXdheXMgc2luY2UgQUZBSUsgdGhpcyBzZXJpZXMgaXMgYWxyZWFk
eSBpbiBuZXh0IEkgZ3Vlc3Mgd2Ugd2lsbA0KPiBmaW5kIG91dCBob3cgdGhpcyBnb2VzLg0KPiAN
Cg0KWW91ciByZXBvcnQgYWJvdXQgdGhpcyBzZXJpZXMgYmVpbmcgbWVyZ2VkIHRvIHY1LjkgaXMg
d29ycnlpbmcuIEl0IGlzDQpub3Qgc3VwcG9zZWQgdG8gYmUgdGhlcmUgYXMgY2F0cHQtc2VyaWVz
IGlzIGl0cyBkaXJlY3QgZGVwZW5kZW5jeS4gQ292ZXINCmxldHRlciBmb3IgdGhlIGxhdHRlciBt
ZW50aW9ucyB0aGF0IGV4cGxpY2l0bHkgd2hpbGUgdGhpcyBzZXJpZXMgc3RhcnRzDQp3aXRoICJG
b2xsb3cgdXAgdG8gY2F0cHQgc2VyaWVzIi4NCg0KT2xkIGhzdy9iZHcgY29kZSBpcyBpbiBmYWN0
IHRoZSBtYWluIHJlY2lwaWVudCwgb2xkIGJheXRyYWlsIGlzICd3aGlsZQ0KYXQgaXQnIGRvICgu
Li4pLiBPdmVyIHRoZSBwYXN0IG1vbnRocyBJJ3ZlIGhlYXJkIG1vcmUgYW5kIG1vcmUgdm9pY2Vz
DQpyZXF1ZXN0aW5nIHNvdW5kL3NvYy9pbnRlbC8gY29kZSBzaXplIHJlZHVjdGlvbiAtIGRyb3Bw
aW5nIHRoZSByZWR1bmRhbnQNCnNvbHV0aW9ucyBhbmQgYWN0dWFsbHkgdmVyaWZ5IHRoZWlyIGNv
cnJlY3RuZXNzLiBXZWxsLCAvaGFzd2VsbC8gZmFpbGVkDQphbGwgdGVzdHMgYnV0IHNpbXBsZSBw
Yi9jcC4gL2JheXRyYWlsLyBoYXMgYmVlbiBmbGFnZ2VkIGFzIH4xMDAlDQpkdXBsaWNhdGUgdG8g
L2F0b20vIGFuZCBtb3N0IG9mIC9jb21tb24vIGNvZGUgaXNuJ3QgYWN0dWFsbHkgY29tbW9uLiBZ
b3UNCmNhbiBzZWUgdGhhdCBpbiB0aGlzIHZlcnkgc2VyaWVzIHdoZXJlIG9uZSBieSBvbmUgSSdt
IGRpc3NlY3RpbmcgcmVnaW9ucw0KdG8gYmUgcmVtb3ZlZC4NCg0KR2l2ZW4gdGhlIHdvcmsgdGhh
dCBoYXMgYmVlbiBkb25lIGJlaGluZCB0aGUgc2NlbmVzLCBJJ2QgYXJndWUgaHN3L2Jkdw0KaGFz
IG5ldmVyIGJlZW4gaW4gdGhlIGJldHRlciBwbGFjZSB0aGFuIGl0IGlzIHRvZGF5IC0gdGhhdCBn
b2VzIGZvcg0KYm90aCwgTGludXggYW5kIFdpbmRvd3Mgc29sdXRpb25zIGFzIGJvdGggd29ybGRz
IHRvb2sgcGFydCBpbiB0aGlzDQpwcm9qZWN0LiBDb2RlIHJld3JpdHRlbiwgYWN0dWFsIENJIHJ1
bm5pbmcsIHNldmVyYWwgc2V0dXBzIGluIHJhY2tzLA0KZG9jdW1lbnRhdGlvbiByZWZyZXNoZWQs
IEZXICsgU1cgd2luZG93cyBhZ2FpbiBvbiB0aGllciBsZWdzIGFuZCBzbyBvbi4NCg0KSSdsbCBi
ZSBzZW5kaW5nIH4yIHBhdGNoZXMgYWRkcmVzc2luZyBtb3JlIGFkdmFuY2VkIHNjZW5hcmlvcyB3
aGljaA0KL2hhc3dlbGwvIHdhc24ndCBldmVuIGNvdmVyaW5nLiBXaWxsIGtlZXAgeW91IGluIENj
IHRvby4NCg0KUmVnYXJkcywNCkN6YXJlaw0KDQo=
