Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C87B11013
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jul 2025 18:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF9C860237;
	Thu, 24 Jul 2025 18:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF9C860237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753376359;
	bh=oi8FGO1psOx81HUBIRS3QyXQ1ErFNE8ttxyum62km0A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J2EUX3SU6Y1MMZEx7r/K36IHk8D52OcKZR4l0R3r934LeX5GIxNqxIUTFB2PlB3Zg
	 nHqN4aAvKj6h1kiuSsGEPOPDlNSviSXtKzGKjBDWS29YG0MppclCbqu3f4D9zn/KYg
	 uokQ2QJb/Jg90E7RveSLQEXuBobQx3sa5DqG9/ao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8604FF8060D; Thu, 24 Jul 2025 18:58:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D24B6F80606;
	Thu, 24 Jul 2025 18:58:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8381AF80254; Sat, 19 Jul 2025 06:30:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B479DF80088
	for <alsa-devel@alsa-project.org>; Sat, 19 Jul 2025 06:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B479DF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Mzo0ccQd
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56J4TrFh843181;
	Fri, 18 Jul 2025 23:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752899393;
	bh=oi8FGO1psOx81HUBIRS3QyXQ1ErFNE8ttxyum62km0A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Mzo0ccQdnrgFWRTnbVSHEuLfw97XBY3/aGE4slT6KqEe9sR3rxHMPAs46RR/8XEbu
	 A4gqM0nalFznqHX8VH1ovGIlKxnsSBqhpvXgJ5NXxDlOZIY1MVT+zUhTagkFI1yPWE
	 I8y1JrZPKo5wy2ki7hMKfWyWAqwoaOaZ5zkGLCio=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56J4TqF22837956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 18 Jul 2025 23:29:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 18
 Jul 2025 23:29:52 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.055; Fri, 18 Jul 2025 23:29:52 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Ding, Shenghao"
	<shenghao-ding@ti.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>,
        "P O, Vijeth" <v-po@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ALSA: hda: Add TAS2770 support
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ALSA: hda: Add TAS2770 support
Thread-Index: AQHb98ixOJRCWPnlVkCBFp4TVnPJVrQ4I18AgAC32RA=
Date: Sat, 19 Jul 2025 04:29:52 +0000
Message-ID: <26bbebb22e0046bcb154dcfd5c7094e9@ti.com>
References: 
 <20250718094454.26574-1-baojun.xu@ti.com>,<87ms917kdl.wl-tiwai@suse.de>
In-Reply-To: <87ms917kdl.wl-tiwai@suse.de>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.165.138]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MJEA4JXWVLUFCIQJBL3LYCBDWAQUTUS5
X-Message-ID-Hash: MJEA4JXWVLUFCIQJBL3LYCBDWAQUTUS5
X-Mailman-Approved-At: Thu, 24 Jul 2025 16:58:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJEA4JXWVLUFCIQJBL3LYCBDWAQUTUS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBGcm9tOiBU
YWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+IFNlbnQ6IDE4IEp1bHkgMjAyNSAyMDoyOQ0K
PiBUbzogWHUsIEJhb2p1bg0KPiBDYzogYnJvb25pZUBrZXJuZWwub3JnOyBhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgRGluZywg
U2hlbmdoYW87IE5hdmFkYSBLYW55YW5hLCBNdWt1bmQ7IDEzOTE2Mjc1MjA2QDEzOS5jb207IEhh
bXBpaG9saSwgVmFsbGFiaGE7IFAgTywgVmlqZXRoOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW0VYVEVSTkFMXSBS
ZTogW1BBVENIIHYxXSBBTFNBOiBoZGE6IEFkZCBUQVMyNzcwIHN1cHBvcnQNCj4gDQo+IE9uIEZy
aSwgMTggSnVsIDIwMjUgMTE64oCKNDQ64oCKNTQgKzAyMDAsIEJhb2p1biBYdSB3cm90ZTogDQo+
IA0KPiBBZGQgVEFTMjc3MCBzdXBwb3J0IGluIFRJJ3MgSERBIGRyaXZlci4gDQo+IEFuZCBhZGQg
aGRhX2NoaXBfaWQgZm9yIG1vcmUgcHJvZHVjdCBzdXBwb3J0IGluIHRoZSBmdXR1cmUuIA0KPiBT
ZXBhcmF0ZWQgRFNQIGFuZCBub24tRFNQIGluIGZpcm13YXJlIGxvYWQgZnVuY3Rpb24uIA0KPiAN
Cj4gU2lnbmVkLW9mZi1ieToNCj4gWmpRY21RUllGcGZwdEJhbm5lclN0YXJ0DQo+IFRoaXMgbWVz
c2FnZSB3YXMgc2VudCBmcm9tIG91dHNpZGUgb2YgVGV4YXMgSW5zdHJ1bWVudHMuDQo+IERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRo
ZSBzb3VyY2Ugb2YgdGhpcyBlbWFpbCBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiA8
aHR0cHM6Ly91cy1waGlzaGFsYXJtLWV3dC5wcm9vZnBvaW50LmNvbS9FV1QvdjEvRzN2SyF2eGRy
SGZ3bkYwMDd3V3p2dnh0b1g2VVNtVmVNQ1lWY2VidE5Uc2FGdzJQR0N6bDJIQzgtNVhFclhsYV9N
a3c5Mm04eXN3JD4NCj4gUmVwb3J0IFN1c3BpY2lvdXMNCj4gDQo+IFpqUWNtUVJZRnBmcHRCYW5u
ZXJFbmQNCj4gDQo+IE9uIEZyaSwgMTggSnVsIDIwMjUgMTE6NDQ6NTQgKzAyMDAsDQo+IEJhb2p1
biBYdSB3cm90ZToNCj4gPg0KPiA+IEFkZCBUQVMyNzcwIHN1cHBvcnQgaW4gVEkncyBIREEgZHJp
dmVyLg0KPiA+IEFuZCBhZGQgaGRhX2NoaXBfaWQgZm9yIG1vcmUgcHJvZHVjdCBzdXBwb3J0IGlu
IHRoZSBmdXR1cmUuDQo+ID4gU2VwYXJhdGVkIERTUCBhbmQgbm9uLURTUCBpbiBmaXJtd2FyZSBs
b2FkIGZ1bmN0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmFvanVuIFh1IDxiYW9qdW4u
eHVAdGkuY29tPg0KPiANCj4gQW55IHJlYXNvbiBvZiB0aGUgc3VibWlzc2lvbiBvZiB0aGUgdmVy
eSBzYW1lIHBhdGNoPw0KPiBJdCB3YXMgcmVxdWVzdGVkIHRvIHJlc3VibWl0IGFmdGVyIHJlYmFz
aW5nIHRvIHRoZSBuZXcgbG9jYXRpb24gZm9yDQo+IEhELWF1ZGlvIChzb3VuZC9oZGEvKikgYXMg
Zm91bmQgaW4gZm9yLW5leHQgYnJhbmNoIG9mIHNvdW5kLmdpdCB0cmVlLg0KPiANCg0KSSBoYXZl
IHVwbG9hZGVkIHRvOg0KZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25l
eHQvbGludXgtbmV4dC5naXQsDQphbmQgeW91IHNhaWQ6DQoiVGFrYXNoaSBJd2FpIDx0aXdhaUBz
dXNlLmRlPiwgU2F0IDEyLzA3LzIwMjUgMTY6MjkNCg0KVGhlIHdob2xlIEhELWF1ZGlvIHN0dWZm
IGhhcyBiZWVuIG1vdmVkIHVuZGVyIHNvdW5kL2hkYSByZWNlbnRseS4NClBsZWFzZSBjcmVhdGUg
YSBwYXRjaCBiYXNlZCBvbiBmb3ItbmV4dCBicmFuY2ggb2YgdGhlIHNvdW5kIGdpdCB0cmVlLiIN
Cg0KU28gSSByZS1wYXRjaGVkIGl0IHRvIGZvci1uZXh0Og0KZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc291bmQuDQoNCkRvIEkgaGF2ZSBhIG1pc3VuZGVy
c3RhbmRpbmcgYWJvdXQgaXQ/IERvIEkgc3RpbGwgbmVlZCBwYXRjaCBvbg0KL25leHQvbGludXgt
bmV4dC5naXQsIGp1c3QgYWZ0ZXIgdGhlIGNvZGUgd2FzIG1vdmVkIHRvIHNvdW5kL2hkYS9jb2Rl
Y3Mvc2lkZS1jb2RlY3M/DQoNCj4gDQo+IHRoYW5rcywNCj4gDQo+IFRha2FzaGkNCj4gDQoNCkJl
c3QgUmVnYXJkcw0KSmltDQo=
