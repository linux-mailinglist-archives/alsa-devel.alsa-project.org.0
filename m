Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B96822161
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:51:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5102950;
	Tue,  2 Jan 2024 19:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5102950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221492;
	bh=UHw0iYzMzI3PwqgkCNZFQ4grq8hrenFPPolEPSXUz1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hz4oDqYjDhgfBtK6aHnhklw7lq/sDHMGK8h9E/vhOoQNMe7kFH3YkUtHNLJraFw4p
	 zoMnccZVpi0KWec/adLidQzkJMWkKv3sx4WsB2iwWTqnv7+iFKDpqCIAHwbuyAWqLo
	 wcU+BuG27Q0GjL/3aFNREcH9snoF++lOlQ92q36g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7559F805E2; Tue,  2 Jan 2024 19:50:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE40F805DA;
	Tue,  2 Jan 2024 19:50:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB3DBF80425; Mon, 18 Dec 2023 13:11:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B180F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B180F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20230601 header.b=dMiVOabB
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5907ded6287so2048156eaf.0
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Dec 2023 04:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702901474; x=1703506274;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XipVSqQzKqtglGoKtAjvOkS+gpcglshIzvLg4VLg3es=;
        b=dMiVOabBBayif+urzsz/Xwjl1iBeIrM8gpotP5edcb1MJuR9a+mB3FhrsewAiLfA9v
         qseUIs1nHb/F4rcl5tGPW9oPNP7XZl7dm0gnDpCv6j4vnAM0NRYQ2EYSXGAOLIfSYVP1
         dGLIlRDhP15fOEO16ilFABQEWU16EvpdnDCuPlSHB837jvgT0jkppwdQk5xP1sZYmWte
         snfSjsvCUFMKTCtK3P9LQV710FxQO9un9c+oYqgvWUFiIIPePh3nP2GfKdadv2zsFWWX
         1vosHwHCPAQtbNA2PLJJZRDdhC3XugHstKkKLFDlH2NCH+q/0ffixryZCajls9Q/K5B9
         8omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901474; x=1703506274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XipVSqQzKqtglGoKtAjvOkS+gpcglshIzvLg4VLg3es=;
        b=wghbQez6TsGjMlRuWQjHDcBdYy9Jm3lui7rdv5ppEIN452TXeTO2NmCbfgluqLtGKB
         Ste4FpWUxuRTTqVRSWr8KjQ4UuENv8KQqvK48H61GbkOFK7soXq5eB9eh8+M4Bvmqj6z
         B+kn+nPC3NLYe4EiynQigPfWqSU3tpasUwHAEPqZH1sA6JGmc1M9W2PC+V1lcQF3PG8z
         Tn4N6Ty6lm9VZCETD2buMFWCQbJHJiPiBwkepg8WFe8LaZKUXvH2oThXnkwq8B4wgLEB
         wzllwYdyzKzIz3XGywHOm75NiP4GLsJXEKg0dv6gq4kFCaFghFeq6DYodFjHg2ZOfTmx
         NVzg==
X-Gm-Message-State: AOJu0YyJprWZeOGmWKIV7PTN3q1GvLu239rCXhqtiOHFxA3Tf2zYsZYN
	+E2N3qmQ4TtQtM2HWvhU9quvpM6WGew7jF8V+SklTw==
X-Google-Smtp-Source: 
 AGHT+IHiLeNQ4XJ8jteCHRP/OxdiZsSsZ+qKJ0sbqVmNnKqY6rauNBm19Pn+z/k7E2ue+/HY3oSHL7yIAFyiWEZKVXA=
X-Received: by 2002:a4a:b086:0:b0:591:935f:3669 with SMTP id
 k6-20020a4ab086000000b00591935f3669mr3195111oon.14.1702901474415; Mon, 18 Dec
 2023 04:11:14 -0800 (PST)
MIME-Version: 1.0
References: <20231106104013.704356-1-jbrunet@baylibre.com>
 <CADYyEwTNyY+fR9SgfDa-g6iiDwkU3MUdPVCYexs2_3wbcM8_vg@mail.gmail.com>
 <1jil4zq2on.fsf@starbuckisacylon.baylibre.com>
 <CACb=7PXkaKYupZafD2BTiqusHZ1nEFq8AfWVot7VL07kxm0uWw@mail.gmail.com>
 <1j5y0v22ol.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j5y0v22ol.fsf@starbuckisacylon.baylibre.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Mon, 18 Dec 2023 20:11:03 +0800
Message-ID: 
 <CADYyEwSuZuV8WKisrRszKtWhJbGFkVoRagt8_Rpqy+beih8t4A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: register hpd callback on component
 probe
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Hsin-Yi Wang <hsinyi@google.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GNBPG4VVAGASQBLRVYI2FR6JG73S2VG6
X-Message-ID-Hash: GNBPG4VVAGASQBLRVYI2FR6JG73S2VG6
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:16:43 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GNBPG4VVAGASQBLRVYI2FR6JG73S2VG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgNzowM+KAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToNCg0KPg0KPiBPbiBGcmkgMTUgRGVjIDIwMjMgYXQgMTQ6NTUs
IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGdvb2dsZS5jb20+IHdyb3RlOg0KPg0KPiA+IE9uIEZyaSwg
RGVjIDE1LCAyMDIzIGF0IDEyOjQw4oCvQU0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJy
ZS5jb20+DQo+IHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+PiBPbiBGcmkgMTUgRGVjIDIwMjMgYXQg
MTI6NTEsIFpoZW5ncWlhbyBYaWENCj4gPj4gPHhpYXpoZW5ncWlhb0BodWFxaW4uY29ycC1wYXJ0
bmVyLmdvb2dsZS5jb20+IHdyb3RlOg0KPiA+Pg0KPiA+PiA+IEhpIEplcm9tZSwNCj4gPj4gPg0K
PiA+PiA+IEFmdGVyIG15IHRlc3RpbmcsIEkgZm91bmQgdGhhdCB0aGlzIHBhdGNoIHdpbGwgY2F1
c2UgdGhlIGF1ZGlvIG9uIHRoZQ0KPiBleHRlcm5hbCBkaXNwbGF5IHRvIG5vdCB3b3JrIHByb3Bl
cmx5IGFmdGVyDQo+ID4+ID4gcmVzdGFydC4NCj4gPj4gPiBZb3UgbW92ZSB0aGUgcGx1Z2dlZF9j
YiB0byBydW4gaW4gaGRtaV9wcm9iZSwgYXQgdGhpcyB0aW1lIGhjcC0gPg0KPiBqYWNrID0gTlVM
TCwgdGhlIGRyaXZlciBjYW5ub3QgcmVwb3J0IGBTTkRfSkFDS19MSU5FT1VUDQo+ID4+ID4gYCBu
b3JtYWxseS4NCj4gPj4gPiBzdGF0aWMgdm9pZCBoZG1pX2NvZGVjX2phY2tfcmVwb3J0KHN0cnVj
dCBoZG1pX2NvZGVjX3ByaXYgKmhjcCwNCj4gPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgamFja19zdGF0dXMpDQo+ID4+ID4gew0KPiA+PiA+ICAgICAg
IHByaW50aygieHpxLTg2NiBoZG1pX2NvZGVjX2phY2tfcmVwb3J0OiBqYWNrPSV4LA0KPiBqYWNr
X3N0YXR1cz0lZCIsIGhjcC0+amFjaywgamFja19zdGF0dXMgIT0gaGNwLT5qYWNrX3N0YXR1cyk7
DQo+ID4+ID4gICAgICAgaWYgKGhjcC0+amFjayAmJiBqYWNrX3N0YXR1cyAhPSBoY3AtPmphY2tf
c3RhdHVzKSB7DQo+ID4+ID4gICAgICAgICAgICAgICBzbmRfc29jX2phY2tfcmVwb3J0KGhjcC0+
amFjaywgamFja19zdGF0dXMsDQo+IFNORF9KQUNLX0xJTkVPVVQpOw0KPiA+PiA+ICAgICAgICAg
ICAgICAgaGNwLT5qYWNrX3N0YXR1cyA9IGphY2tfc3RhdHVzOw0KPiA+PiA+ICAgICAgIH0NCj4g
Pj4gPiB9DQo+ID4+ID4gU28gd2UgbXVzdCBjYWxsICBwbHVnZ2VkX2NiICBpbiBoZG1pX2NvZGVj
X3NldF9qYWNrLCAgQ2FuIHlvdSBtYWtlDQo+IHNvbWUgY2hhbmdlcz8NCj4gPj4NCj4gPj4gSGkg
WmhlbmdxaWFvLA0KPiA+Pg0KPiA+PiBUaGF0IGlzIHVuZm9ydHVuYXRlLiBTb3JyeS4NCj4gPj4N
Cj4gPj4gVGhpcyBwYXRjaCBoYXMgY2hhbmdlZCB3aGVuIHRoZSBocGQgY2FsbGJhY2sgaXMgcmVn
aXN0ZXJlZCwgbm8gd2hlbiBpdA0KPiA+PiBjb21lcyBpbiBlZmZlY3QuIFRoaXMgaXMgc3RpbGwg
ZGVwZW5kZW50IG9uIGNhbGxpbmcgLnNldF9qYWNrKCkgYW5kIGl0DQo+ID4+IGlzIG5vdCBoYXBw
ZW5pbmcgYW55IGxhdGVyIHRoYW4gaXQgd2FzIGJlZm9yZS4gU28sIGluIHRoZW9yeSwgaXQgc2hv
dWxkDQo+ID4+IG5vdCBoYXZlIGNoYW5nZWQgYW55dGhpbmcsIGlmIHlvdXIgZHJpdmVyIGFjdHVh
bGx5IHJlbGllcyBvbiB0aGUgSFBEDQo+ID4+IGV2ZW50Lg0KPiA+Pg0KPiA+PiBUcnlpbmcgdG8g
Z3Vlc3Mgd2hhdCBpcyBoYXBwZW5pbmcgZm9yIHlvdSwgSSBzdXBwb3NlIHlvdXIgSERNSSBkcml2
ZXIgaXMNCj4gPj4gImZha2luZyIgYW4gSFBEIGV2ZW50IHRvIHJlcG9ydCB0aGUgaW5pdGlhbCBq
YWNrIHN0YXR1cyB3aGVuIHRoZQ0KPiA+PiBob29rX3BsdWdnZWRfY2IoKSBpcyBjYWxsZWQuIENv
dWxkIHlvdSBwb2ludCBtZSB0byB0aGUgaGRtaSBkcml2ZXIgeW91DQo+ID4+IGFyZSB1c2luZyBz
byBJIGNhbiBoYXZlIGEgbG9vayA/DQo+ID4+DQo+ID4+IE15IHJlZmVyZW5jZSB3aGVuIHRlc3Rp
bmcgdGhpcyB3YXMgZHctaGRtaS1pMnMtYXVkaW8gYW5kIGl0IGRvZXMgbm90IGRvDQo+ID4+IHRo
YXQsIGl0IGp1c3QgcmVnaXN0ZXJzIHRoZSBjYWxsYmFjay4gSSB0aGluayB0aGlzIGlzIHdoYXQg
aXQgc3VwcG9zZWQNCj4gPj4gdG8gZG8gVEJILg0KPiA+Pg0KPiA+PiBBbiBpZGVhIEkgaGF2ZSBi
ZWVuIHRoaW5raW5nIGFib3V0IGZvciBhIHdoaWxlIGlzIGhhdmUgdGhlIGhkbWktY29kZWMNCj4g
Pj4gaW5zZXJ0IHRoZSBqYWNrIGluIHRoZSBjYXJkIGl0c2VsZiwgaW5zdGVhZCBvZiB0aGUgY2Fy
ZCBkb2luZy4gVGhhdA0KPiA+PiB3b3VsZCBnaXZlIHRoZSBqYWNrICJmb3IgZnJlZSIgdG8gYW55
IHVzZXIgb2YgdGhlIEhETUkgY29kZWMgYW5kIG1pZ2h0DQo+ID4+IGFsc28gc29sdmUgeW91ciBp
c3N1ZS4gSXQgd291bGQgcmVxdWlyZSBhIHNtYWxsIHJld29yayBvZiB0aGUgY2FyZHMNCj4gZG9p
bmcNCj4gPj4gdGhlIGhkbWkgamFjayByZWdpc3RlciwgYnV0IHRoZXJlIGFyZSBub3QgbWFueSBv
ZiB0aGVzZSBBRkFJSy4NCj4gPj4NCj4gPg0KPiA+IFRoZSBkcml2ZXIgaXMgaXQ2NTA1LiBUaGUg
aW1wbGVtZW50YXRpb24gb2YgaG9va19wbHVnZ2VkX2NiKCk6DQo+ID4gMS4gcmVnaXN0ZXIgcGx1
Z2dlZF9jYg0KPiA+IDIuIGNhbGwgcGx1Z2dlZF9jYihib29sIHBsdWdnZWQpDQo+ID4NCj4gPiBi
cmlkZ2UgZGV0ZWN0IGNhbGxiYWNrIGl0NjUwNV9kZXRlY3Qgd291bGQgYWxzbyBjYWxsIHBsdWdn
ZWRfY2IsIGJ1dA0KPiA+IG9ubHkgb24gdGhlIGZpcnN0IHRpbWUgaHBkIHN0YXR1cyBjaGFuZ2Vk
IChlZy4gY2hhbmdlZCBmcm9tIGNvbm5lY3QNCj4gPiA8LS0+IGRpc2Nvbm5lY3QpDQo+ID4gaXQ2
NTA1X2RldGVjdCgpIHsNCj4gPiAgIHN0YXR1cyA9IGl0NjUwNS0+aHBkX3N0YXRlIC4uLg0KPiA+
ICAgLi4uDQo+ID4gICBpZiAoaXQ2NTA1LT5jb25uZWN0b3Jfc3RhdHVzICE9IHN0YXR1cykgew0K
PiA+ICAgICBpdDY1MDUtPmNvbm5lY3Rvcl9zdGF0dXMgPSBzdGF0dXM7DQo+ID4gICAgIGl0NjUw
NV9wbHVnZ2VkX3N0YXR1c190b19jb2RlYyhpdDY1MDUpOyAvLyB0aGlzIHdpbGwgY2FsbCBwbHVn
Z2VkX2NiDQo+ID4gICB9DQo+ID4gfQ0KPiA+DQo+ID4gVW5mb3J0dW5hdGVseSB0aGUgZmlyc3Qg
dGltZSBhZnRlciBib290IHRoYXQgaHBkIHN0YXR1cyBjaGFuZ2VkIHdhcw0KPiA+IGRldGVjdGVk
IGJlZm9yZSBzZXRfamFjay4gSWYgd2UgcmVwbHVnIGhkbWksIHRoZSBwbHVnZ2VkX2NiKCkgd2Fz
DQo+ID4gY2FsbGVkIGJ5IGJyaWRnZV9kZXRlY3QsIHdoaWNoIGlzIGV4cGVjdGVkLg0KPiA+DQo+
ID4gUHJpb3IgdG8gdGhpcyBwYXRjaCwgdGhlIGluaXRpYWwgcGx1Z2dlZF9jYigpIHdhcyBjYWxs
ZWQgYnkNCj4gaG9va19wbHVnZ2VkX2NiKCkuDQo+ID4gQWZ0ZXIgdGhlIHBhdGNoLCBwbHVnZ2Vk
X2NiKCkgc2hvdWxkIGJlIGNhbGxlZCBieSBocGQgY2hhbmdlIChieQ0KPiA+IGJyaWRnZSBkZXRl
Y3QpLCBidXQgZHVlIHRvIHRoZSBkcml2ZXIgbG9naWMgb25seSBjYWxsaW5nIGl0IG9uIHRoZQ0K
PiA+IGZpcnN0IGhwZCBzdGF0ZSBjaGFuZ2UsIGl0IGZhaWxzIHRvIGNhbGwgcGx1Z2dlZF9jYigp
IGFnYWluIHdoZW4gamFjaw0KPiA+IGlzIHNldC4NCj4NCj4gVGhpcyBpcyB3aGF0IHRob3VnaHQN
Cj4NCj4gPg0KPiA+IEkgY2hlY2tlZCB0aGUgZHctaGRtaS5jJ3MgYnJpZGdlX2RldGVjdCwgYW5k
IGl0J3Mgc2ltaWxhciBpbiB0aGF0IGl0DQo+ID4gYWxzbyBjaGVja3MgdGhlIGxhc3RfY29ubmVj
dG9yX3Jlc3VsdCwgc28gbWF5YmUgaXQncyBkdWUgdG8gYSB0aW1pbmcNCj4gPiBkaWZmZXJlbmNl
Pw0KPg0KPiBObywgSSBoYXZlIG92ZXJsb29rZWQgdGhhdC4NCj4gSSdtIHByZXBhcmluZyBhIGZp
eC4gSSdsbCBDYyB5b3UuDQo+DQo+IEV2ZW50dWFsbHksIEkgc3RpbGwgd291bGQgbGlrZSB0byBt
YWtlIGl0IGVhc2llciBmb3IgY2FyZHMgdG8gdXNlIHRoZQ0KPiBIRE1JIGphY2sgYW5kIGhhdmUg
dG8gY29kZWMgZG8gdGhhdCByZWdpc3RyYXRpb24gb24gaXRzIG93bi4gSXQgd2lsbA0KPiByZXF1
aXJlIHNvbWUgcmV3b3JrIG9mIGNhcmRzIGFscmVhZHkgZG9pbmcgaXQuDQo+DQo+IEkndmUgb25s
eSBzZWVuIDIgY2FyZHMgZG9pbmcgdGhhdCBhdCB0aGUgbW9tZW50Og0KPiAqIGlteC1oZG1pLmMN
Cj4gKiBtdDgxODgtbXQ2MzU5LmMNCj4NCj4gQ291bGQgeW91IHBvaW50IG1lIHRvIHlvdXJzID8N
Cg0KDQppdCBpcyBtdDgxODYtbXQ2MzY2LXJ0MTAxOS1ydDU2ODJzLmMgOg0KaHR0cHM6Ly9zb3Vy
Y2UuY2hyb21pdW0ub3JnL2Nocm9taXVtb3MvY2hyb21pdW1vcy9jb2Rlc2VhcmNoLysvbWFpbjpz
cmMvdGhpcmRfcGFydHkva2VybmVsL3Y1LjE1L3NvdW5kL3NvYy9tZWRpYXRlay9tdDgxODYvbXQ4
MTg2LW10NjM2Ni1ydDEwMTktcnQ1Njgycy5jDQoNCj4NCj4NCj4NCj4gPj4gPg0KPiA+PiA+IE9u
IE1vbiwgTm92IDYsIDIwMjMgYXQgNjo0MOKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5
bGlicmUuY29tPg0KPiB3cm90ZToNCj4gPj4gPg0KPiA+PiA+ICBUaGUgSERNSSBob3RwbHVnIGNh
bGxiYWNrIHRvIHRoZSBoZG1pLWNvZGVjIGlzIGN1cnJlbnRseSByZWdpc3RlcmVkDQo+IHdoZW4N
Cj4gPj4gPiAgamFjayBpcyBzZXQuDQo+ID4+ID4NCj4gPj4gPiAgVGhlIGhvdHBsdWcgbm90IG9u
bHkgc2VydmVzIHRvIHJlcG9ydCB0aGUgQVNvQyBqYWNrIHN0YXRlIGJ1dCBhbHNvDQo+IHRvIGdl
dA0KPiA+PiA+ICB0aGUgRUxELiBJdCBzaG91bGQgYmUgcmVnaXN0ZXJlZCB3aGVuIHRoZSBjb21w
b25lbnQgcHJvYmVzIGluc3RlYWQsDQo+IHNvIGl0DQo+ID4+ID4gIGRvZXMgbm90IGRlcGVuZCBv
biB0aGUgY2FyZCBkcml2ZXIgcmVnaXN0ZXJpbmcgYSBqYWNrIGZvciB0aGUgSERNSSB0bw0KPiA+
PiA+ICBwcm9wZXJseSByZXBvcnQgdGhlIEVMRC4NCj4gPj4gPg0KPiA+PiA+ICBGaXhlczogMjVj
ZTRmMmIzNTkzICgiQVNvQzogaGRtaS1jb2RlYzogR2V0IEVMRCBpbiBiZWZvcmUgcmVwb3J0aW5n
DQo+IHBsdWdnZWQgZXZlbnQiKQ0KPiA+PiA+ICBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0
IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4NCj4gPj4gPiAgLS0tDQo+ID4+ID4gICBzb3VuZC9zb2Mv
Y29kZWNzL2hkbWktY29kZWMuYyB8IDI3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiA+
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+
ID4+ID4NCj4gPj4gPiAgZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5j
DQo+IGIvc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMNCj4gPj4gPiAgaW5kZXggMDllZWY2
MDQyYWFkLi4yMGRhMWVhYTRmMWMgMTAwNjQ0DQo+ID4+ID4gIC0tLSBhL3NvdW5kL3NvYy9jb2Rl
Y3MvaGRtaS1jb2RlYy5jDQo+ID4+ID4gICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2Rl
Yy5jDQo+ID4+ID4gIEBAIC04NzcsMTggKzg3NywxMyBAQCBzdGF0aWMgaW50IGhkbWlfY29kZWNf
c2V0X2phY2soc3RydWN0DQo+IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsDQo+ID4+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQ0KPiA+PiA+ICAgew0K
PiA+PiA+ICAgICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX3ByaXYgKmhjcCA9DQo+IHNuZF9zb2Nf
Y29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+ID4+ID4gIC0gICAgICAgaW50IHJl
dCA9IC1FTk9UU1VQUDsNCj4gPj4gPg0KPiA+PiA+ICAgICAgICAgIGlmIChoY3AtPmhjZC5vcHMt
Pmhvb2tfcGx1Z2dlZF9jYikgew0KPiA+PiA+ICAgICAgICAgICAgICAgICAgaGNwLT5qYWNrID0g
amFjazsNCj4gPj4gPiAgLSAgICAgICAgICAgICAgIHJldCA9DQo+IGhjcC0+aGNkLm9wcy0+aG9v
a19wbHVnZ2VkX2NiKGNvbXBvbmVudC0+ZGV2LT5wYXJlbnQsDQo+ID4+ID4gIC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoY3AtPmhjZC5kYXRhLA0K
PiA+PiA+ICAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGx1Z2dlZF9jYiwNCj4gPj4gPiAgLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBvbmVudC0+ZGV2KTsNCj4gPj4gPiAgLSAgICAgICAgICAg
ICAgIGlmIChyZXQpDQo+ID4+ID4gIC0gICAgICAgICAgICAgICAgICAgICAgIGhjcC0+amFjayA9
IE5VTEw7DQo+ID4+ID4gICsgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPj4gPiAgICAgICAg
ICB9DQo+ID4+ID4gIC0gICAgICAgcmV0dXJuIHJldDsNCj4gPj4gPiAgKw0KPiA+PiA+ICArICAg
ICAgIHJldHVybiAtRU5PVFNVUFA7DQo+ID4+ID4gICB9DQo+ID4+ID4NCj4gPj4gPiAgIHN0YXRp
YyBpbnQgaGRtaV9kYWlfc3BkaWZfcHJvYmUoc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpDQo+ID4+
ID4gIEBAIC05ODIsNiArOTc3LDIxIEBAIHN0YXRpYyBpbnQgaGRtaV9vZl94bGF0ZV9kYWlfaWQo
c3RydWN0DQo+IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsDQo+ID4+ID4gICAgICAgICAg
cmV0dXJuIHJldDsNCj4gPj4gPiAgIH0NCj4gPj4gPg0KPiA+PiA+ICArc3RhdGljIGludCBoZG1p
X3Byb2JlKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50KQ0KPiA+PiA+ICArew0K
PiA+PiA+ICArICAgICAgIHN0cnVjdCBoZG1pX2NvZGVjX3ByaXYgKmhjcCA9DQo+IHNuZF9zb2Nf
Y29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+ID4+ID4gICsgICAgICAgaW50IHJl
dCA9IDA7DQo+ID4+ID4gICsNCj4gPj4gPiAgKyAgICAgICBpZiAoaGNwLT5oY2Qub3BzLT5ob29r
X3BsdWdnZWRfY2IpIHsNCj4gPj4gPiAgKyAgICAgICAgICAgICAgIHJldCA9DQo+IGhjcC0+aGNk
Lm9wcy0+aG9va19wbHVnZ2VkX2NiKGNvbXBvbmVudC0+ZGV2LT5wYXJlbnQsDQo+ID4+ID4gICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoY3AtPmhj
ZC5kYXRhLA0KPiA+PiA+ICArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGx1Z2dlZF9jYiwNCj4gPj4gPiAgKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBvbmVudC0+ZGV2KTsNCj4gPj4gPiAgKyAg
ICAgICB9DQo+ID4+ID4gICsNCj4gPj4gPiAgKyAgICAgICByZXR1cm4gcmV0Ow0KPiA+PiA+ICAr
fQ0KPiA+PiA+ICArDQo+ID4+ID4gICBzdGF0aWMgdm9pZCBoZG1pX3JlbW92ZShzdHJ1Y3Qgc25k
X3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkNCj4gPj4gPiAgIHsNCj4gPj4gPiAgICAgICAgICBz
dHJ1Y3QgaGRtaV9jb2RlY19wcml2ICpoY3AgPQ0KPiBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2
ZGF0YShjb21wb25lbnQpOw0KPiA+PiA+ICBAQCAtOTkyLDYgKzEwMDIsNyBAQCBzdGF0aWMgdm9p
ZCBoZG1pX3JlbW92ZShzdHJ1Y3QNCj4gc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkNCj4g
Pj4gPiAgIH0NCj4gPj4gPg0KPiA+PiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudF9kcml2ZXIgaGRtaV9kcml2ZXIgPSB7DQo+ID4+ID4gICsgICAgICAgLnByb2JlICAg
ICAgICAgICAgICAgICAgPSBoZG1pX3Byb2JlLA0KPiA+PiA+ICAgICAgICAgIC5yZW1vdmUgICAg
ICAgICAgICAgICAgID0gaGRtaV9yZW1vdmUsDQo+ID4+ID4gICAgICAgICAgLmRhcG1fd2lkZ2V0
cyAgICAgICAgICAgPSBoZG1pX3dpZGdldHMsDQo+ID4+ID4gICAgICAgICAgLm51bV9kYXBtX3dp
ZGdldHMgICAgICAgPSBBUlJBWV9TSVpFKGhkbWlfd2lkZ2V0cyksDQo+ID4+DQo+ID4+DQo+ID4+
IC0tDQo+ID4+IEplcm9tZQ0KPg0KPg0KPiAtLQ0KPiBKZXJvbWUNCj4NCg==
