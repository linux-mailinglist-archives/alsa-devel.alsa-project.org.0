Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C756BF9C3
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Mar 2023 13:13:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51A33DEB;
	Sat, 18 Mar 2023 13:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51A33DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679141627;
	bh=cJ4/i/geM3URcibhmRUnvN7uSoFx78nMegE2t9nEoFU=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r649rgnTnccwmdTGwMbSJ1cEK0Tv1GIZF2OKa69qDZ7Rf4XWI9QHYtQE7rZU31YB0
	 B4DWDOUvDIywlLQS8oqadXk65tovF8tmVEM9aSAIwT0IbQM0WtQ0VtZMLeE1U8A0XW
	 cahB2+PSl5m36rH5JaMKhvhqy0oT16JHfIVEGVN8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E5A3F8032D;
	Sat, 18 Mar 2023 13:12:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80A00F80423; Sat, 18 Mar 2023 13:11:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FF5AF80272
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 13:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FF5AF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l31eQyIB
Received: by mail-wm1-x32e.google.com with SMTP id m35so4769650wms.4
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679141463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TyoxkUTuMKSdk6W3xN39zPhRNeiQvIKJzTcTLKQfVjk=;
        b=l31eQyIBzvPnkoe0Jby/r7paHARRhElcixj5PunA1YxeZkpCiM9ZbWDdI2P1WxBa/X
         ftsLsjmpW//fZrUrtaZPKqCdNsii81owMCAPhUdVuu0n968JX07t4pnaV+b88Oah0cd3
         Fecj+fzMV/punAvdU/lxOTvAza8IxyVCjgiPv7jayfoWWDgeIXL3iiizs3BTND1gpF4i
         u+f7NKGIAC4QTB9k+ZcCbpzx6Mgteoipsug/hz7Hi4Ejy+nofG+jadkpZ+bJt50987JN
         EiZrGTttGQ6+m7mdRxsMQbnfY1OAl1XjX7WlU0b70RhHDdyDAIsVETMRCGupUk0+23ns
         lJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyoxkUTuMKSdk6W3xN39zPhRNeiQvIKJzTcTLKQfVjk=;
        b=0AKxSbK0JDG+1N4UU+71NXbEY/9mCQALOIVcfXy8sMuo6PmyZapngGybXbY70SvMV/
         buxzEfcu1AtKBSG0KCH4OCKfoQgbwF5geRBBvx5FjuUVF969JlUWbNOwdnFAl5xKKkjJ
         LANa72T4Q1NB6UqQrLEpcZ2/rUicMZdlclwbihnGWc5+UvO1OQMps7pwkQSGZsqKzZb1
         LG+2OJQ5UG2dwAX2xKzP4fJWDvJq6/9iQzbTZS5Z8LnzOR2SsATOqa78EHv0vlx1C2oz
         R5ZTW0kNWdsV20XdTICkBNVzOhkqY6ZpO1CcWyCo4JchJ0Iv4UXMydM7G2YpRGE8cFQ/
         RqFw==
X-Gm-Message-State: AO0yUKVFDH90qceQ1V6NGsAEu2slWKg6ZiaQHr+xhZSYHC/Sh9VHdlxT
	aMagHS4C2M+IUXAkJIyH9T/I74f3hxH8GRGymg==
X-Google-Smtp-Source: 
 AK7set+DuVmzWNfJrk6Xf/nKKlAOFqPypFDgCv4/8Txmn+WbXyB9SzAs4yXIlyLwx1NHU4kkI5vnoH6r/RCo/cVB6rs=
X-Received: by 2002:a1c:4b0b:0:b0:3ed:6979:3b7 with SMTP id
 y11-20020a1c4b0b000000b003ed697903b7mr1973053wma.8.1679141463317; Sat, 18 Mar
 2023 05:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-144-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-144-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Sat, 18 Mar 2023 20:10:51 +0800
Message-ID: 
 <CAE=m619ox7An5JtBZAzuFRy-05iD+-gggUJBBFjPCAjYZjNU9Q@mail.gmail.com>
Subject: Re: [PATCH 143/173] ASoC: sunxi: sun50i-dmic: Convert to platform
 remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID-Hash: FJ7JEI6Y73NOWUZMBSFLKGAFJZHY2YUE
X-Message-ID-Hash: FJ7JEI6Y73NOWUZMBSFLKGAFJZHY2YUE
X-MailFrom: fengzheng923@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJ7JEI6Y73NOWUZMBSFLKGAFJZHY2YUE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g5LqOMjAy
M+W5tDPmnIgxNeaXpeWRqOS4iSAyMzowOOWGmemBk++8mg0KDQo+IFRoZSAucmVtb3ZlKCkgY2Fs
bGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzDQo+
IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBl
cnJvciBoYW5kbGluZyBieQ0KPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUg
dmFsdWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZA0KPiBhbmQgdGhpcyB0eXBpY2FsbHkg
cmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGENCj4g
cXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmly
c3Qgc3RlcCBvZiB0aGlzDQo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJl
bW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMNCj4gdm9pZC4NCj4NCj4gVHJpdmlhbGx5
IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJl
bW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4NCj4NCkFja2VkLWJ5OiBCYW4gVGFvIDxmZW5nemhlbmc5MjNAZ21haWwuY29tPg0KDQo+
IC0tLQ0KPiAgc291bmQvc29jL3N1bnhpL3N1bjUwaS1kbWljLmMgfCA2ICsrLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL3NvdW5kL3NvYy9zdW54aS9zdW41MGktZG1pYy5jIGIvc291bmQvc29jL3N1bnhpL3N1
bjUwaS1kbWljLmMNCj4gaW5kZXggMDY5Yzk5M2FjYjMxLi5jMTA0MzliOWUwYTIgMTAwNjQ0DQo+
IC0tLSBhL3NvdW5kL3NvYy9zdW54aS9zdW41MGktZG1pYy5jDQo+ICsrKyBiL3NvdW5kL3NvYy9z
dW54aS9zdW41MGktZG1pYy5jDQo+IEBAIC0zNzMsMTMgKzM3MywxMSBAQCBzdGF0aWMgaW50IHN1
bjUwaV9kbWljX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gIH0NCj4NCj4gLXN0YXRpYyBpbnQgc3VuNTBpX2RtaWNfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBzdW41MGlfZG1p
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gICAgICAgICBw
bV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7DQo+ICAgICAgICAgaWYgKCFwbV9ydW50aW1l
X3N0YXR1c19zdXNwZW5kZWQoJnBkZXYtPmRldikpDQo+ICAgICAgICAgICAgICAgICBzdW41MGlf
ZG1pY19ydW50aW1lX3N1c3BlbmQoJnBkZXYtPmRldik7DQo+IC0NCj4gLSAgICAgICByZXR1cm4g
MDsNCj4gIH0NCj4NCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzdW41MGlfZG1p
Y19wbSA9IHsNCj4gQEAgLTM5NCw3ICszOTIsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBzdW41MGlfZG1pY19kcml2ZXIgPSB7DQo+ICAgICAgICAgICAgICAgICAucG0gICAgID0g
JnN1bjUwaV9kbWljX3BtLA0KPiAgICAgICAgIH0sDQo+ICAgICAgICAgLnByb2JlICAgICAgICAg
ID0gc3VuNTBpX2RtaWNfcHJvYmUsDQo+IC0gICAgICAgLnJlbW92ZSAgICAgICAgID0gc3VuNTBp
X2RtaWNfcmVtb3ZlLA0KPiArICAgICAgIC5yZW1vdmVfbmV3ICAgICA9IHN1bjUwaV9kbWljX3Jl
bW92ZSwNCj4gIH07DQo+DQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHN1bjUwaV9kbWljX2Ry
aXZlcik7DQo+IC0tDQo+IDIuMzkuMg0KPg0KPg0K
