Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D37560D5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 12:47:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA38847;
	Mon, 17 Jul 2023 12:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA38847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689590819;
	bh=Orv69VdzXqgownmSEXSjEcTJhBQYaT4sBVAGviHJb6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pKf+6JTbWnuUSZeqVo/g/y/drypeIFYmNuuvG9SE8UXPP7nc1h44gmhdONqyClEWy
	 Tzd97cr+BC1DrrxJTuWhPQh2CozDGmbg+KxcV6jLw5L02JsEt8at/ADT/ECapM7Nu2
	 tiQAdgObCtmKa16oyD0eFTIKTwDAl2mXLPvVvmmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A783EF80527; Mon, 17 Jul 2023 12:46:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FB1CF8032D;
	Mon, 17 Jul 2023 12:46:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BCE9F8047D; Mon, 17 Jul 2023 12:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C192F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 12:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C192F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=PzSTLKrH
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-262e839647eso3033802a91.2
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689590752; x=1690195552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eUAGq1bjx/BPoBhYV0omfN6CI0tBdhKBqPXS2ABCy3U=;
        b=PzSTLKrH2RfSP9lTwgMp4OEStlvck4KdDxwL+snA8YZZhhfiG3kOoUSIf3LmAZAycp
         2lixdta+PIUNtE07nbyU0udH3/GOBElYFSh2wPLtCuqnQLi4VEWyTdNDM/rXamg2kNcA
         yDSLnBz9bVwYhSygn3odBX9KHbe15r5KwcZhSekQje07Q2M0j0srulU++aX6UexRmhoK
         Xn3VRQsWeGksMMZ/jQsOWlQ60/JLOUO3OZ6KzRtIXkGroae63XNUZ31DqCAOJayK5bHG
         J5GChlROMwTKuwuBj8Aa5SUZl/LXkjse+sNSi4i/p8VlJtsu3LVZh012BYEPTtNw7ZCM
         8l1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689590752; x=1690195552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUAGq1bjx/BPoBhYV0omfN6CI0tBdhKBqPXS2ABCy3U=;
        b=jvxkkfTVkQnVa3eB+nI0n9khweOYySeXBZ9lbfwiS9tpumTz75hGdVAyWJIZSw0fE7
         v48DEeiNuZukzYdSyZy22mHDy1FCwFhFXA6L9nXGTmRgIZ9zvCiRzemESayRSMh3ZZTZ
         exysySnCAsaS8OrPJVSi6tlaHZR1P/e79RQfVbuWTEjXD3APeTHZOGqDyo8uilxB6kbw
         lpX10YcHQ/XFkFZobFYRoLFrhEF9gwimXfb5OPgmYPHGIxuD6RpeUUALoEEcdR1e/8tQ
         C7wECuk9B2xseDGNRLJcE9LsVTWbCg9oj96Wj27VJRoB6E8MiC5c0FLf+4g9rKlsZimB
         KY7A==
X-Gm-Message-State: ABy/qLbHxvl7j1OgNJupB8CSjDaaq3HC1e3lWSHYyd7zCWbZJ5KGnhAY
	pbe8XXpTNU8HfLpeRshIwY3qvxQKn3KOm8ok3k4=
X-Google-Smtp-Source: 
 APBJJlHtEpAq0w+fiTyFHZYwHtUjXKpGutqItTzMX2S4gY+mUjtKAIeRPejvQTrDqeOQb12dwhV7URqBft+iPxx42Rw=
X-Received: by 2002:a17:90b:709:b0:260:fd64:a20 with SMTP id
 s9-20020a17090b070900b00260fd640a20mr11121947pjz.9.1689590752039; Mon, 17 Jul
 2023 03:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230712124934.32232-1-matuszpd@gmail.com>
In-Reply-To: <20230712124934.32232-1-matuszpd@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 17 Jul 2023 18:45:40 +0800
Message-ID: 
 <CAA+D8AM0Pf02mC+vBkCi=jh5mcO0TBxEa20wogO=yrjtDDg0OA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
To: Matus Gajdos <matuszpd@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Message-ID-Hash: 3QCHJ4C66ABOTOOJWCXU6OL4QOMJZIMW
X-Message-ID-Hash: 3QCHJ4C66ABOTOOJWCXU6OL4QOMJZIMW
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QCHJ4C66ABOTOOJWCXU6OL4QOMJZIMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgODo1M+KAr1BNIE1hdHVzIEdhamRvcyA8bWF0dXN6cGRA
Z21haWwuY29tPiB3cm90ZToNCg0KPiBPdGhlcndpc2UgYml0IGNsb2NrIHJlbWFpbnMgcnVubmlu
ZyB3cml0aW5nIGludmFsaWQgZGF0YSB0byB0aGUgREFDLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXR1cyBHYWpkb3MgPG1hdHVzenBkQGdtYWlsLmNvbT4NCj4NCg0KQWNrZWQtYnk6IFNoZW5naml1
IFdhbmcgPHNoZW5naml1LndhbmdAZ21haWwuY29tPg0KDQpCZXN0IHJlZ2FyZHMNCldhbmcgU2hl
bmdqaXUNCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2ZzbC9mc2xfc2FpLmMgfCAyICstDQo+ICBz
b3VuZC9zb2MvZnNsL2ZzbF9zYWkuaCB8IDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9mc2wv
ZnNsX3NhaS5jIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmMNCj4gaW5kZXggNWUwOWY2MzRjNjFi
Li5kY2M3ZmJlN2FjYWMgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jDQo+
ICsrKyBiL3NvdW5kL3NvYy9mc2wvZnNsX3NhaS5jDQo+IEBAIC03MTksNyArNzE5LDcgQEAgc3Rh
dGljIHZvaWQgZnNsX3NhaV9jb25maWdfZGlzYWJsZShzdHJ1Y3QgZnNsX3NhaQ0KPiAqc2FpLCBp
bnQgZGlyKQ0KPiAgICAgICAgIHUzMiB4Y3NyLCBjb3VudCA9IDEwMDsNCj4NCj4gICAgICAgICBy
ZWdtYXBfdXBkYXRlX2JpdHMoc2FpLT5yZWdtYXAsIEZTTF9TQUlfeENTUih0eCwgb2ZzKSwNCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgRlNMX1NBSV9DU1JfVEVSRSwgMCk7DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgIEZTTF9TQUlfQ1NSX1RFUkUgfCBGU0xfU0FJX0NTUl9CQ0Us
IDApOw0KPg0KPiAgICAgICAgIC8qIFRFUkUgd2lsbCByZW1haW4gc2V0IHRpbGwgdGhlIGVuZCBv
ZiBjdXJyZW50IGZyYW1lICovDQo+ICAgICAgICAgZG8gew0KPiBkaWZmIC0tZ2l0IGEvc291bmQv
c29jL2ZzbC9mc2xfc2FpLmggYi9zb3VuZC9zb2MvZnNsL2ZzbF9zYWkuaA0KPiBpbmRleCA4MjU0
YzM1NDdiODcuLjU1MGRmODdiNmEwNiAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2ZzbC9mc2xf
c2FpLmgNCj4gKysrIGIvc291bmQvc29jL2ZzbC9mc2xfc2FpLmgNCj4gQEAgLTkxLDYgKzkxLDcg
QEANCj4gIC8qIFNBSSBUcmFuc21pdC9SZWNlaXZlIENvbnRyb2wgUmVnaXN0ZXIgKi8NCj4gICNk
ZWZpbmUgRlNMX1NBSV9DU1JfVEVSRSAgICAgICBCSVQoMzEpDQo+ICAjZGVmaW5lIEZTTF9TQUlf
Q1NSX1NFICAgICAgICAgQklUKDMwKQ0KPiArI2RlZmluZSBGU0xfU0FJX0NTUl9CQ0UgICAgICAg
ICAgICAgICAgQklUKDI4KQ0KPiAgI2RlZmluZSBGU0xfU0FJX0NTUl9GUiAgICAgICAgIEJJVCgy
NSkNCj4gICNkZWZpbmUgRlNMX1NBSV9DU1JfU1IgICAgICAgICBCSVQoMjQpDQo+ICAjZGVmaW5l
IEZTTF9TQUlfQ1NSX3hGX1NISUZUICAgMTYNCj4gLS0NCj4gMi4yNS4xDQo+DQo+DQo=
