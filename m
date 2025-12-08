Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40965CAC1B2
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 06:58:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA9A60201;
	Mon,  8 Dec 2025 06:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA9A60201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765173507;
	bh=EqdCuYh60ICB+VnZZ8RAriuFMePctRfxZN3C6KTIH2U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hc+kBdxMnQFi6fjaSA/dn8CTX1bkv+paAT1NHaesYmR/26/O/n11UGNffzYjowB5L
	 vRV9817YoHPc+I3/5NIR24Q+hpGipdguHJYlrTr2IqPKZtgVarcmeCvC0sppPJ1tz5
	 ymJ9kiKHNF4u5H8EhpbANQldlIL+lNLzqmhBJzb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F319F805D3; Mon,  8 Dec 2025 06:57:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E09B8F805C6;
	Mon,  8 Dec 2025 06:57:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41997F80525; Mon,  8 Dec 2025 06:55:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E24AF800ED
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 06:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E24AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=Nhkvz3Cd
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B85tghT73468989,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765173342; bh=EqdCuYh60ICB+VnZZ8RAriuFMePctRfxZN3C6KTIH2U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Nhkvz3CdDJxomrfqN8WoJT6un91M2DfMGWIf+AclRHYeJJ2eHehcfwSCH1D2S7c4L
	 whhk96Df9ys/rAnS6K91O/YAh5ZeTPyrbN1zuWeW0cDVWOCSPB2Md1fuEFU3OY+iDP
	 RDydH2JcT2DqVZvLq1FcIhjvAZnNBGjXOaxj8r+LyLm+GqXN52l9UinqcJyfseE7nK
	 QdgsPclmTiYsBn9J0D8H0ajSBwwbfCls8G61tYqU1Wn7t1ROkUKXsGa6HbfePRrRVd
	 E+HXC+XalgF0A0TUoQd/m+2diotQygrTDtI+cH8/XzRMavCZIC6Wr/+P6shWRzK59V
	 hpWRPxH5t5sxA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5B85tghT73468989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 13:55:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 8 Dec 2025 13:55:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 8 Dec 2025 13:55:42 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::2fa5:eccb:34ee:7bb%10]) with mapi id
 15.02.1544.027; Mon, 8 Dec 2025 13:55:42 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
CC: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "perex@perex.cz" <perex@perex.cz>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Flove(HsinFu)"
	<flove@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?=
	<shumingf@realtek.com>,
        Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Thread-Topic: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Thread-Index: AQHcYrFaKydGtVTIOUeezPiWPUvKu7USN3yAgAAAOwCABQqdwA==
Date: Mon, 8 Dec 2025 05:55:41 +0000
Message-ID: <d78ec6446eab41349c55d6952de80275@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-3-oder_chiou@realtek.com>
 <20251205-stylish-numbat-of-awe-10edcd@quoll>
 <8e537cb4-08a0-4ecb-90f5-01ff2d4b32f8@kernel.org>
In-Reply-To: <8e537cb4-08a0-4ecb-90f5-01ff2d4b32f8@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: H7UL5CUXHCCDHCG6HB7D3J7NEYN22QMO
X-Message-ID-Hash: H7UL5CUXHCCDHCG6HB7D3J7NEYN22QMO
X-MailFrom: oder_chiou@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7UL5CUXHCCDHCG6HB7D3J7NEYN22QMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgNSwgMjAyNSA0OjMy
IFBNDQo+IFRvOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPg0KPiBDYzogY2V6
YXJ5LnJvamV3c2tpQGludGVsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21h
aWwuY29tOw0KPiByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRA
a2VybmVsLm9yZzsgcGVyZXhAcGVyZXguY3o7DQo+IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZzsgRmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+OyBTaHVtaW5nIFutUw0KPiCu
0bvKXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29t
PjsgRGVyZWsgW6TovHcNCj4guHFdIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY4IDIvMl0gQVNvQzogZHQtYmluZGluZ3M6IHJlYWx0ZWsscnQ1NTc1OiBh
ZGQgYmluZGluZ3MgZm9yDQo+IEFMQzU1NzUNCj4gDQo+IA0KPiBFeHRlcm5hbCBtYWlsIDogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QN
Cj4gcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IA0KPiANCj4gT24gMDUvMTIvMjAyNSAwOTozMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToN
Cj4gPg0KPiA+PiArDQo+ID4+ICsgIHJlZzoNCj4gPj4gKyAgICBtYXhJdGVtczogMQ0KPiA+PiAr
DQo+ID4NCj4gPiBZb3UgbGlzdGVkIHNvIG1hbnkgImltcHJlc3NpdmUiIGFuZCAicmljaCIgZmVh
dHVyZXMgdGhhdCBmb3Igc3VyZSB0aGlzDQo+ID4gaXMgaW5jb21wbGV0ZS4NCj4gPg0KPiA+IFBs
ZWFzZSBwb3N0IGNvbXBsZXRlIGJpbmRpbmdzIGZvciAiaW1wcmVzc2l2ZSIgZGV2aWNlLg0KPiA+
DQo+ID4gWW91IG1pc3Mgc3VwcGxpZXMsIHlvdSBtaXNzIGFsbCB0aGUgQUkgcmVsYXRlZCBoeXBl
IChubyBjbHVlIHdoYXQgdGhhdA0KPiA+IHdvdWxkIGJlLCBidXQgZm9yIHN1cmUgTlBVIGZlZWxz
IGxpa2UgbmVlZGluZyByZW1vdGVwcm9jIG9yIGF0IGxlYXN0DQo+ID4gc29tZSBvdGhlciB3YXkg
dG8gY29tbXVuaWNhdGUpLiBXZSBhbGwga25vdyB0aGF0IEFJIGlzIHBvd2VyIGh1bmdyeSwNCj4g
PiBzbyBpdCBpcyBpbXBvc3NpYmxlIHRvIHJ1biBpdCB3aXRob3V0IGVsZWN0cmljaXR5ICh0aHVz
IHN1cHBsaWVzKS4NCj4gPg0KPiANCj4gQWxzbyB0d28gc3RhbmRhcmQgbml0cywgaW4gY2FzZSBJ
IGRpZCBub3QgYXNrIGFib3V0IHRoZW0gYmVmb3JlOg0KPiANCj4gQSBuaXQsIHN1YmplY3Q6IGRy
b3Agc2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiYmluZGluZ3MiLiBUaGUgImR0LWJpbmRpbmdzIiBw
cmVmaXgNCj4gaXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGJpbmRpbmdzLg0KPiBT
ZWUgYWxzbzoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTctcmMzL3Nv
dXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmkNCj4gbmRpbmdzL3N1Ym1pdHRpbmctcGF0
Y2hlcy5yc3QjTDE4DQoNClRoZSBzdWJqZWN0IHdpbGwgYmUgY2hhbmdlIHRvDQpBU29DOiBkdC1i
aW5kaW5nczogcmVhbHRlayxydDU1NzU6IGFkZCBzdXBwb3J0IGZvciBBTEM1NTc1DQoNCj4gUGxl
YXNlIG9yZ2FuaXplIHRoZSBwYXRjaCBkb2N1bWVudGluZyB0aGUgY29tcGF0aWJsZSAoRFQgYmlu
ZGluZ3MpIGJlZm9yZQ0KPiB0aGUgcGF0Y2ggdXNpbmcgdGhhdCBjb21wYXRpYmxlLg0KPiBTZWUg
YWxzbzoNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTQtcmM2L3NvdXJj
ZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmkNCj4gbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hl
cy5yc3QjTDQ2DQoNCkkgd2lsbCByZW9yZGVyIHRoZSBwYXRjaGVzIHNvIHRoYXQgdGhlIERUIGJp
bmRpbmdzIGNvbWUgZmlyc3QuDQoNClRoYW5rcy4NCg0K
