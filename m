Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97273DE2C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:51:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B221537;
	Mon, 26 Jun 2023 13:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B221537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780265;
	bh=uh/+vSA09hy2AuLFjmYs4Bd0Ami5MGqo95dMCjfAlyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rw5iejclbTWsbEIIhbMsY0CS91qAtdT2fJafQ/1iji76WhHxgL/iTs6DutKPbxIMC
	 /yGl/YJ+aa223InvbKjBrXFg/pODrvriedPiYaz3BiqdvZJkhTJqcnbQF7r2PX92F6
	 C1uH/bumrF8ooaXZEe1xgbYcbzDZHgMmDOlrbQ7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50D0CF806B2; Mon, 26 Jun 2023 13:43:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E1E9F806AA;
	Mon, 26 Jun 2023 13:43:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B225F80246; Mon, 26 Jun 2023 09:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F30CF80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 09:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F30CF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=KoeVJe5X
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fa8ce2307dso16446745e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687765958; x=1690357958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=irlZVhx/XKlbttEvUnkzS/s4wzYma5T1mMdZcjlEesw=;
        b=KoeVJe5XpQX5WRA9xHMmehzdrbQVOwdi2+dOPnORWgDRrxWjXZpLAhL25Ou8OqLnJa
         LAGpO2QfhHsomFUpEsBIfBbnDWotjDvSJ/TQz3Qr+qvDQv1+UqUbUY0ibKfz3G3q5JKo
         bguQCZxFYo1XcNqkPMHF9A7GtxfDz9lpPyKRQtAuKj0lfy84UZC3VJyWBcWcy2kFltNX
         dZnlNER/WpKUDNMrSifUt9dy7r85nuQ8vv2vwGmrntuc6eeZsBslKko6ER83olt2iawm
         V4QCLiAkAn4Z6czjihrynQpNTEHdGm02+2oQQbYVLM2PgLlFRp5Hj0wRFDW2GekNUFbs
         G0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687765958; x=1690357958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irlZVhx/XKlbttEvUnkzS/s4wzYma5T1mMdZcjlEesw=;
        b=SSdPNkXwaRCkLpE2kVTOxyv/qHMAj0+5sOV5bpPp3IJo3p3iONZZCB+hgAAkm5heGX
         1RgnWjfo0f12632cjrvVhJoAx3Zl/iK1cFWYfv/4lQkQGXEQAS0D8oBZEVwkxlmKTE+m
         izV0Yz4usL5n0T9qZ7iq+FkqfrXjLr5ArF55hy77ViFS28ITtQEpVWlNXghHp6t9+I+M
         Lr+YfCAMWVemCo/GNqgUfWJqw9C2qgQb1hHRuljqYWToTyhjaXaHm/OVEnojPdAFApbq
         T/TMbCH2fmT8zSrGfjoCEeu2NHGNZAwIkVE8fbkUZtLc4xM2B+aGnD6iL+NayIFMmwhc
         nSrA==
X-Gm-Message-State: AC+VfDzyNNXPrErnieN4tqVrx60h5tz31OsP2EzZls6L08hLfW8f6kjL
	AAlc4eFo+bz8cPguMxWLT6UBCZkd0Kk6z775rvM=
X-Google-Smtp-Source: 
 ACHHUZ5aHx7TsBeLGvfREUZ4S4k1gxhPakWI23RtFUuoy89vsffopk/L6hfk5qp95bvldWkyK+KwCrnbXbqZPB9GH4A=
X-Received: by 2002:a7b:c7d8:0:b0:3fa:935e:e185 with SMTP id
 z24-20020a7bc7d8000000b003fa935ee185mr3819456wmk.22.1687765957756; Mon, 26
 Jun 2023 00:52:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
 <877crqwvi1.wl-tiwai@suse.de>
 <CADm8Tenfy8joto5WLCqQWjfT8WimsbJgOss0hJe-ciyDRMrSXw@mail.gmail.com>
 <871qhywucj.wl-tiwai@suse.de>
In-Reply-To: <871qhywucj.wl-tiwai@suse.de>
From: Tuo Li <islituo@gmail.com>
Date: Mon, 26 Jun 2023 15:52:30 +0800
Message-ID: 
 <CADm8Te=k38KRch7ONZVRZak-=om4kEEy24c=JwwTKLvSiBs5Bw@mail.gmail.com>
Subject: Re: [BUG] ALSA: core: pcm_memory: a possible data race in
 do_alloc_pages()
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	Linux Kernel <linux-kernel@vger.kernel.org>, baijiaju1990@outlook.com
X-MailFrom: islituo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PBYGDCE7VCVPFJEMVA2YAW3S6B2TEMZA
X-Message-ID-Hash: PBYGDCE7VCVPFJEMVA2YAW3S6B2TEMZA
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:42:25 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBYGDCE7VCVPFJEMVA2YAW3S6B2TEMZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGVsbG8sDQoNClRoYW5rcyBmb3IgeW91ciByZXBseSEgSXQgaXMgdmVyeSBoZWxwZnVsIQ0KU2hv
dWxkIEkgc3VibWl0IGEgcGF0Y2ggYXMgeW91IHN1Z2dlc3RlZCBmb3Igc2FmZXR5Pw0KDQpCZXN0
IHdpc2hlcywNClR1byBMaQ0KDQpPbiBNb24sIEp1biAyNiwgMjAyMyBhdCAzOjMz4oCvUE0gVGFr
YXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPiB3cm90ZToNCg0KPiBPbiBNb24sIDI2IEp1biAyMDIz
IDA5OjMxOjE4ICswMjAwLA0KPiBUdW8gTGkgd3JvdGU6DQo+ID4NCj4gPg0KPiA+IEhlbGxvLA0K
PiA+DQo+ID4gVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5IQ0KPg0KPiBGV0lXLCB0aGUgc2ltcGxl
c3QgZml4IHdvdWxkIGJlIHNvbWV0aGluZyBsaWtlIGJlbG93LCBqdXN0IGV4dGVuZGluZw0KPiB0
aGUgbXV0ZXggY292ZXJhZ2UuICBCdXQgaXQnbGwgc2VyaWFsaXplIHRoZSBhbGwgY2FsbHMsIHNv
IGl0IG1pZ2h0DQo+IGluZmx1ZW5jZSBvbiB0aGUgcGVyZm9ybWFuY2UsIHdoaWxlIGl0J3MgdGhl
IHNhZmVzdCB3YXkuDQo+DQo+DQo+IFRha2FzaGkNCj4NCj4gLS0tIGEvc291bmQvY29yZS9wY21f
bWVtb3J5LmMNCj4gKysrIGIvc291bmQvY29yZS9wY21fbWVtb3J5LmMNCj4gQEAgLTM3LDIwICsz
NywyMiBAQCBzdGF0aWMgaW50IGRvX2FsbG9jX3BhZ2VzKHN0cnVjdCBzbmRfY2FyZCAqY2FyZCwg
aW50DQo+IHR5cGUsIHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAgICAgICBlbnVtIGRtYV9kYXRh
X2RpcmVjdGlvbiBkaXI7DQo+ICAgICAgICAgaW50IGVycjsNCj4NCj4gKyAgICAgICBtdXRleF9s
b2NrKCZjYXJkLT5tZW1vcnlfbXV0ZXgpOw0KPiAgICAgICAgIGlmIChtYXhfYWxsb2NfcGVyX2Nh
cmQgJiYNCj4gLSAgICAgICAgICAgY2FyZC0+dG90YWxfcGNtX2FsbG9jX2J5dGVzICsgc2l6ZSA+
IG1heF9hbGxvY19wZXJfY2FyZCkNCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0K
PiArICAgICAgICAgICBjYXJkLT50b3RhbF9wY21fYWxsb2NfYnl0ZXMgKyBzaXplID4gbWF4X2Fs
bG9jX3Blcl9jYXJkKSB7DQo+ICsgICAgICAgICAgICAgICBlcnIgPSAtRU5PTUVNOw0KPiArICAg
ICAgICAgICAgICAgZ290byB1bmxvY2s7DQo+ICsgICAgICAgfQ0KPg0KPiAgICAgICAgIGlmIChz
dHIgPT0gU05EUlZfUENNX1NUUkVBTV9QTEFZQkFDSykNCj4gICAgICAgICAgICAgICAgIGRpciA9
IERNQV9UT19ERVZJQ0U7DQo+ICAgICAgICAgZWxzZQ0KPiAgICAgICAgICAgICAgICAgZGlyID0g
RE1BX0ZST01fREVWSUNFOw0KPiAgICAgICAgIGVyciA9IHNuZF9kbWFfYWxsb2NfZGlyX3BhZ2Vz
KHR5cGUsIGRldiwgZGlyLCBzaXplLCBkbWFiKTsNCj4gLSAgICAgICBpZiAoIWVycikgew0KPiAt
ICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygmY2FyZC0+bWVtb3J5X211dGV4KTsNCj4gKyAgICAg
ICBpZiAoIWVycikNCj4gICAgICAgICAgICAgICAgIGNhcmQtPnRvdGFsX3BjbV9hbGxvY19ieXRl
cyArPSBkbWFiLT5ieXRlczsNCj4gLSAgICAgICAgICAgICAgIG11dGV4X3VubG9jaygmY2FyZC0+
bWVtb3J5X211dGV4KTsNCj4gLSAgICAgICB9DQo+ICsgdW5sb2NrOg0KPiArICAgICAgIG11dGV4
X3VubG9jaygmY2FyZC0+bWVtb3J5X211dGV4KTsNCj4gICAgICAgICByZXR1cm4gZXJyOw0KPiAg
fQ0KPg0KPg0K
