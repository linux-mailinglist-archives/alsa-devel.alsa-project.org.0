Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FA3FB20B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 09:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A7071712;
	Mon, 30 Aug 2021 09:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A7071712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630309486;
	bh=n+oZBZbUePjiqxewt0xMXIG7XJSFjLMgCTbyqYKbDrQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lKKbalOvatQ+g2SU/Dk5VvMoCQoYBxG7EStwE+v2VngaTDiErzPjqIu932wibMvgT
	 tGlA8nQ/GObl0SR6RpJuozTBB6r3ewEi/Xr7CpaKWD5wmeyrW4aR5Ck2glBCEW0Yw8
	 ORPgsu/KEy9GIP2BUbGDw+2CrtgDA31ikC7P8tAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC6BF8016E;
	Mon, 30 Aug 2021 09:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED2A7F80218; Mon, 30 Aug 2021 09:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11278F80171
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 09:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11278F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="nXR9Z7I8"
X-UUID: 1feac300037f4653afcc212f80878b0b-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=n+oZBZbUePjiqxewt0xMXIG7XJSFjLMgCTbyqYKbDrQ=; 
 b=nXR9Z7I88KPzb/qfNoH/HSoFlZkl+NUcgi49q0vy4vAOvea38pst9OCMALmj/pmDXgWlaIV8nNcUeL07WF4HxMEXf2u3EFD9+4d7XEwGp14JjQE3eSuwLgeLx6xrE8dmezG7jyhmkHcM53bNElnFSew0t1qlcZXXLi5Vi2vp4QE=;
X-UUID: 1feac300037f4653afcc212f80878b0b-20210830
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1806516203; Mon, 30 Aug 2021 15:43:11 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 15:43:11 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 15:43:11 +0800
Message-ID: <126146d89214d6fdf4a326abfb0eec2ca0a9a246.camel@mediatek.com>
Subject: Re: [bug report] ASoC: mediatek: implement mediatek common structure
From: Trevor Wu <trevor.wu@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, <garlic.tseng@mediatek.com>
Date: Mon, 30 Aug 2021 15:43:06 +0800
In-Reply-To: <20210827085734.GB9183@kili>
References: <20210827085734.GB9183@kili>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com
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

SGkgRGFuLA0KDQpHYXJsaWMgaGFzIGxlZnQgbWVkaWF0ZWssIHNvIEkgd2lsbCBoZWxwIHRoaXMg
cHJvYmxlbS4NClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgb3V0IHRoZSBwcm9ibGVtLg0KSXQgc2Vl
bXMgdGhhdCBzb21lIGhhbmRsaW5nIGZvciBOVUxMIGNhc2Ugc2hvdWxkIGJlIGFkZGVkIHRvDQpz
dXNwZW5kL3Jlc3VtZSBmdW50aW9uLg0KSSB3aWxsIHNlbmQgYSBwYXRjaCBmb3IgdGhlIHByb2Js
ZW0uDQoNClRoYW5rcywNClRyZXZvcg0KDQoNCk9uIEZyaSwgMjAyMS0wOC0yNyBhdCAxMTo1NyAr
MDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gSGVsbG8gR2FybGljIFRzZW5nLA0KPiANCj4g
VGhlIHBhdGNoIDI4M2I2MTI0MjlhMjogIkFTb0M6IG1lZGlhdGVrOiBpbXBsZW1lbnQgbWVkaWF0
ZWsgY29tbW9uDQo+IHN0cnVjdHVyZSIgZnJvbSBKdW4gMTcsIDIwMTYsIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcNCj4gU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5pbmc6DQo+IA0KPiAJc291bmQv
c29jL21lZGlhdGVrL2NvbW1vbi9tdGstYWZlLWZlLWRhaS5jOjM2NCBtdGtfYWZlX3Jlc3VtZSgp
DQo+IAllcnJvcjogd2UgcHJldmlvdXNseSBhc3N1bWVkICdhZmUtPnJlZ19iYWNrX3VwJyBjb3Vs
ZCBiZSBudWxsDQo+IChzZWUgbGluZSAzNTkpDQo+IA0KPiBzb3VuZC9zb2MvbWVkaWF0ZWsvY29t
bW9uL210ay1hZmUtZmUtZGFpLmMNCj4gICAgIDM1NCAgICAgICAgIGlmIChwbV9ydW50aW1lX3N0
YXR1c19zdXNwZW5kZWQoZGV2KSB8fCAhYWZlLQ0KPiA+c3VzcGVuZGVkKQ0KPiAgICAgMzU1ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgIDM1NiANCj4gICAgIDM1NyAgICAgICAgIGFm
ZS0+cnVudGltZV9yZXN1bWUoZGV2KTsNCj4gICAgIDM1OCANCj4gICAgIDM1OSAgICAgICAgIGlm
ICghYWZlLT5yZWdfYmFja191cCkNCj4gICAgIDM2MCAgICAgICAgICAgICAgICAgZGV2X2RiZyhk
ZXYsICIlcyBubyByZWdfYmFja3VwXG4iLCBfX2Z1bmNfXyk7DQo+IA0KPiBTaG91bGQgdGhpcyBy
ZXR1cm4/ICBBbHNvIHdoZW4gLT5yZWdfYmFja191cCBpcyBhbGxvY2F0ZWQgdGhlcmUgaXMgbm8N
Cj4gY2hlY2sgZm9yIE5VTEwgc28gaXQgc2VlbXMgbGlrZSBhIHZlcnkgcG9zc2libGUgY29uZGl0
aW9uLg0KPiANCj4gICAgIDM2MSANCj4gICAgIDM2MiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBh
ZmUtPnJlZ19iYWNrX3VwX2xpc3RfbnVtOyBpKyspDQo+ICAgICAzNjMgICAgICAgICAgICAgICAg
IG10a19yZWdtYXBfd3JpdGUocmVnbWFwLCBhZmUtDQo+ID5yZWdfYmFja191cF9saXN0W2ldLA0K
PiAtLT4gMzY0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFmZS0+cmVnX2JhY2tf
dXBbaV0pOw0KPiAgICAgMzY1IA0KPiAgICAgMzY2ICAgICAgICAgYWZlLT5zdXNwZW5kZWQgPSBm
YWxzZTsNCj4gICAgIDM2NyAgICAgICAgIHJldHVybiAwOw0KPiAgICAgMzY4IH0NCj4gDQo+IHJl
Z2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiBM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IA0KaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWtfXzshIUNUUk5LQTl3TWcwQVJidyEzbU1DYnh4LVlGSU1Nc0J0NjVHN1J1Q1JZ
T3lGdlBSX1pkQjlTamRXT2hFbEhWdHNFNmNBYXM0bm1vZExHREhSNnckDQo+ICANCg==

