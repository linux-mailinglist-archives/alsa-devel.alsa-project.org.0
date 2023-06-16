Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2173317B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 14:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ACA31CF;
	Fri, 16 Jun 2023 14:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ACA31CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686919425;
	bh=jwuiM48HT3XuhYlvVrcWu5d70ItRWKuRafj9J/nP5Og=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QRqUFI5MBeEK5xModBDQcEWd3RAcR5t71oDiz4qogL3UDkH4cSqNzLKImYV0bBt7h
	 QLUHV5VrKJIrp3NIGL7hBCBox9ijAf/lYcgMxtNj43vIPJkXpSTEBTIb8Doas9bWeT
	 wCAOPnTTcmC8vt6Dh8pvmhD6fWdXNcgAR2wsQfeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C69E2F800BA; Fri, 16 Jun 2023 14:42:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D773F80132;
	Fri, 16 Jun 2023 14:42:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68F31F80149; Fri, 16 Jun 2023 14:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 613A1F800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 14:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 613A1F800BA
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-269-JJvQb2sfOriquygsMnYC7w-1; Fri, 16 Jun 2023 13:42:37 +0100
X-MC-Unique: JJvQb2sfOriquygsMnYC7w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 16 Jun
 2023 13:42:33 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 16 Jun 2023 13:42:33 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Herve Codina' <herve.codina@bootlin.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: RE: [PATCH v4 07/13] minmax: Introduce {min,max}_array()
Thread-Topic: [PATCH v4 07/13] minmax: Introduce {min,max}_array()
Thread-Index: AQHZn2z+IMzVucn/mECJ0o8xQC0QeK+NI4PggAAd4ACAABw3kA==
Date: Fri, 16 Jun 2023 12:42:33 +0000
Message-ID: <73144a81d75c477b9639872ed9f4cbf3@AcuMS.aculab.com>
References: <20230614074904.29085-1-herve.codina@bootlin.com>
	<20230614074904.29085-8-herve.codina@bootlin.com>
	<CAHp75Vcur=H_2mBm5Ztuvd7Jnvmr6+tvCbEkFtmaVLsEjXr8NQ@mail.gmail.com>
	<20230614114214.1371485e@bootlin.com>
	<CAHp75VcmW2StPqb_LtKFyNyJ2+jz3c19zNRDiSuGs06Bseq04w@mail.gmail.com>
	<20230614223418.0d7e355d@bootlin.com>
	<CAHp75VfFyDzr4qHNssXZ8RLy0gxMWdjBgac4JLd7grRLEG-vyw@mail.gmail.com>
	<20230615113512.07967677@bootlin.com>
	<6c7fe34f7b65421ab618d33ba907ae09@AcuMS.aculab.com>
 <20230616134844.09e7fda3@bootlin.com>
In-Reply-To: <20230616134844.09e7fda3@bootlin.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Message-ID-Hash: C5VRXGCKVDW6JLVT6H7IAH7XA5FEZZHK
X-Message-ID-Hash: C5VRXGCKVDW6JLVT6H7IAH7XA5FEZZHK
X-MailFrom: david.laight@aculab.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5VRXGCKVDW6JLVT6H7IAH7XA5FEZZHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RnJvbTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IDE2
IEp1bmUgMjAyMyAxMjo0OQ0KPiANCj4gSGkgRGF2aWQsDQo+IA0KPiBPbiBGcmksIDE2IEp1biAy
MDIzIDA5OjA4OjIyICswMDAwDQo+IERhdmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0QEFDVUxBQi5D
T00+IHdyb3RlOg0KPiANCj4gLi4uDQo+IA0KPiA+DQo+ID4gSnVzdCBkZWZpbmUgdHdvIHZhcmlh
YmxlcyB0eXBlb2YoX19hcnJheVswXSArIDApIG9uZSBmb3IgYW4gZWxlbWVudA0KPiA+IGFuZCBv
bmUgZm9yIHRoZSBsaW1pdC4NCj4gPiBUaGUganVzdCB0ZXN0IChlZyk6DQo+ID4gCWlmIChsaW1p
dCA+IGl0ZW0pIGxpbWl0ID0gaXRlbTsNCj4gPiBmaW5hbGx5IGNhc3QgdGhlIGxpbWl0IGJhY2sg
dG8gdGhlIG9yaWdpbmFsIHR5cGUuDQo+ID4gVGhlIHByb21vdGlvbnMgb2YgY2hhci9zaG9ydCB0
byBzaWduZWQgaW50IHdvbid0IG1hdHRlci4NCj4gPiBUaGVyZSBpcyBubyBuZWVkIGZvciBhbGwg
dGhlIHR5cGUtY2hlY2tpbmcgaW4gbWluL21heC4NCj4gPg0KPiA+IEluZGVlZCwgaWYgbWluX3Qo
dHlwZSwgYSwgYikgaXMgaW4gYW55d2F5IHNhbmUgaXQgc2hvdWxkDQo+ID4gZXhwYW5kIHRvOg0K
PiA+IAl0eXBlIF9hID0gYSwgX2IgPSBiOw0KPiA+IAlfYSA8IF9iID8gX2EgOiBfYg0KPiA+IHdp
dGhvdXQgYW55IG9mIHRoZSBjaGVja3MgdGhhdCBtaW4oKSBkb2VzLg0KPiANCj4gSSBmaW5hbGx5
IG1vdmUgdG8gdXNlIF9HZW5lcmljKCkgaW4gb3JkZXIgdG8gInVuY29uc3RpZnkiIGFuZCBhdm9p
ZCB0aGUNCj4gaW50ZWdlciBwcm9tb3Rpb24uIFdpdGggdGhpcyBkb25lLCBubyBleHRyYSBjYXN0
IGlzIG5lZWRlZCBhbmQgbWluKCkvbWF4KCkNCj4gYXJlIHVzYWJsZS4NCj4gDQo+IFRoZSBwYXRj
aCBpcyBhdmFpbGFibGUgaW4gdGhlIHY1IHNlcmllcy4NCj4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1rZXJuZWwvMjAyMzA2MTUxNTI2MzEuMjI0NTI5LTgtaGVydmUuY29kaW5hQGJv
b3RsaW4uY29tLw0KPiANCj4gRG8geW91IHRoaW5rIHRoZSBjb2RlIHByZXNlbnQgaW4gdGhlIHY1
IHNlcmllcyBzaG91bGQgYmUgY2hhbmdlZCA/DQo+IElmIHNvLCBjYW4geW91IGdpdmUgbWUgeW91
ciBmZWVkYmFjayBvbiB0aGUgdjUgc2VyaWVzID8NCg0KSXQgc2VlbXMgaG9ycmlibHkgb3Zlci1j
b21wbGljYXRlZCBqdXN0IHRvIGdldCBhcm91bmQgdGhlIHBlcnZlcnNlDQpvdmVyLXN0cm9uZyB0
eXBlIGNoZWNraW5nIHRoYXQgbWluL21heCBkbyBqdXN0IHRvIGF2b2lkIHNpZ24NCmV4dGVuc2lv
biBpc3N1ZXMuDQoNCk1heWJlIEkgb3VnaHQgdG8gdHJ5IGdldHRpbmcgYSBwYXRjaCBhY2NlcHRl
ZCB0aGF0IGp1c3QgY2hlY2tzDQogIGlzX3NpZ25lZF90eXBlKHR5cGVvZih4KSkgPT0gaXNfc2ln
bmVkX3R5cGUodHlwZW9mKHkpKQ0KaW5zdGVhZCBvZg0KICB0eXBlb2YoeCkgPT0gdHlwZW9mKHkp
DQpUaGVuIHdvcnJ5IGFib3V0IHRoZSB2YWxpZCBzaWduZWQgdiB1bnNpZ25lZCBjYXNlcy4NCg0K
SW5kZWVkLCBzaW5jZSB0aGUgYXJyYXkgaW5kZXggY2FuIGJlIGFzc3VtZWQgbm90IHRvIGhhdmUg
c2lkZQ0KZWZmZWN0cyB5b3UgY291bGQgdXNlIF9fY21wKHgsIHksIG9wKSBkaXJlY3RseS4NCg0K
Tm8gb25lIGhhcyBwb2ludGVkIG91dCB0aGF0IF9fZWxlbWVudCBzaG91bGQgYmUgX19ib3VuZC4N
Cg0KCURhdmlkDQoNCgkNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K

