Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BEF741DF5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 04:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 693B07F4;
	Thu, 29 Jun 2023 04:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 693B07F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688004604;
	bh=vX6uya1D0rPXe4u02wUpvNXozY3ag5yMK1pvS9p0SR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MoVPQ2unEDA0Y9szG5HpaXEWCZ8nVzXgwvUok8lbL93oJCT/V5ItFLpPux5vJRk0e
	 KIaDupnrDk5vulnaVqey0jAH+BfrpJSfSANgyBM1OqkGoLdPVW3HjgH6dr4+yPGF+v
	 1giRBae8KunENbGbArYXk17avPjGyH6Ovv0Dn59E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F874F8051E; Thu, 29 Jun 2023 04:09:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 530BDF80212;
	Thu, 29 Jun 2023 04:09:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8BDFF80246; Thu, 29 Jun 2023 04:09:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B19A6F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 04:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19A6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=oPQaRMG8
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-262d9f449f4so114544a91.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688004531; x=1690596531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4tvKp5IVvBN2wL4gpSqmm/VGo0jXEVtysv0gwc3bnhI=;
        b=oPQaRMG88VBbTo73W4JawaB2TJeOUUTbMQe8oqpXRzMLkS6V/nm5ofYHeaSZJjE8dR
         aad7p/Y89kv9efA7+PWAdfzNrYvMiqV56Mj2Fm6yqCsokYfFkvQ9MO6a/iE8dt6DIqfH
         DdlO/xCicjISIlFV5MY5W0k0yKdO8kskOA1AHE2igsHO5W/3AbMOWyW/euyKiUfjXAfR
         DbeLKE3SAtA23bBmS2t8AD8CMIOSqx7PRbmyuUQn4bR1N6y5To7Sig4aIUMtFSnMS1af
         PGN1qMvfaNlDGhU9GK5ifpdc9qkAJ59nZnMb2TnXPDWEh/xDOtnlbbvbZPe3qZSW98JO
         dVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688004531; x=1690596531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tvKp5IVvBN2wL4gpSqmm/VGo0jXEVtysv0gwc3bnhI=;
        b=Zoce96PzzncU4Anv2ovtfWuQM7gcxzDL6vDr8zvNOWKb5guTvWEpdP2/HFlz9mKGy2
         lQiEbW11RhbzWs1qvfEQ7Bpa0v1DUS8eI8G095AS5CajL5ZgSkoCocXJwjvuy9EHgNQA
         l89BYtv71Y9SiraFYnC5YqB+iflK7rGJ98TVdkCsXRryLEAFgUtzjj3Q9RsAi3U+lp4+
         Lc5CXKDnXm4FdVkSnhKozyDgjb/MY76aWj2H13Cor35X4PfYUNqdVSMP86UYlqoXNEHB
         8IAFn+Gwe7mqSTi/0N/+XfmAUF8JPj26sF4Vz4BDCew4XmlDrGWY5MqSrmsPPPbTgO7u
         L5uw==
X-Gm-Message-State: AC+VfDwbTsNcCWEAfi3NFxIZEJHGvuSCetPm59hhIfFVfC9+VfLq6y1g
	PZc++5WjyD8t6bhQuw3X2pZY1eS7+w3HpbJugTE=
X-Google-Smtp-Source: 
 ACHHUZ6s7P36xoI1fcsUzA5Rug04ALg8yvKgfvzOhV6qXVSlq3DtbmC1P8uBK/0BDpcb0g2+Cue+jFs4VdJelX9aJVI=
X-Received: by 2002:a17:90a:1d7:b0:262:ca69:bf9a with SMTP id
 23-20020a17090a01d700b00262ca69bf9amr10835593pjd.21.1688004531443; Wed, 28
 Jun 2023 19:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230625065412.651870-1-chancel.liu@nxp.com>
In-Reply-To: <20230625065412.651870-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jun 2023 10:08:40 +0800
Message-ID: 
 <CAA+D8AN3yX+DW4zbMYuqvCzJ8XBHeawCkObaO=ZJJ=pffG8_rg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Set PCM hardware parameters
 separately
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Message-ID-Hash: DPYN2NJXSSKKVYK4PTZFR2LF3CZPC55W
X-Message-ID-Hash: DPYN2NJXSSKKVYK4PTZFR2LF3CZPC55W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPYN2NJXSSKKVYK4PTZFR2LF3CZPC55W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMjo1NOKAr1BNIENoYW5jZWwgTGl1IDxjaGFuY2VsLmxp
dUBueHAuY29tPiB3cm90ZToNCg0KPiBEaWZmZXJlbnQgUENNIGRldmljZXMgbWF5IGhhdmUgZGlm
ZmVyZW50IFBDTSBoYXJkd2FyZSBwYXJhbWV0ZXJzLiBJdA0KPiByZXF1aXJlcyBQQ00gaGFyZHdh
cmUgcGFyYW1ldGVycyBzZXQgc2VwYXJhdGVseSBpZiB0aGVyZSBpcyBtb3JlIHRoYW4NCj4gb25l
IHJwbXNnIHNvdW5kIGNhcmQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENoYW5jZWwgTGl1IDxjaGFu
Y2VsLmxpdUBueHAuY29tPg0KPg0KDQpBY2tlZC1ieTogU2hlbmdqaXUgV2FuZyA8c2hlbmdqaXUu
d2FuZ0BnbWFpbC5jb20+DQoNCkJlc3QgcmVnYXJkcw0KV2FuZyBTaGVuZ2ppdQ0KDQo+IC0tLQ0K
PiAgc291bmQvc29jL2ZzbC9pbXgtcGNtLXJwbXNnLmMgfCAxMiArKysrKysrKy0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9zb3VuZC9zb2MvZnNsL2lteC1wY20tcnBtc2cuYyBiL3NvdW5kL3NvYy9mc2wvaW14
LXBjbS1ycG1zZy5jDQo+IGluZGV4IDc2NWRhZDYwN2JmNi4uZDYzNzgyYjhiZGVmIDEwMDY0NA0K
PiAtLS0gYS9zb3VuZC9zb2MvZnNsL2lteC1wY20tcnBtc2cuYw0KPiArKysgYi9zb3VuZC9zb2Mv
ZnNsL2lteC1wY20tcnBtc2cuYw0KPiBAQCAtMjI4LDYgKzIyOCwxMCBAQCBzdGF0aWMgaW50IGlt
eF9ycG1zZ19wY21fb3BlbihzdHJ1Y3QNCj4gc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNuZF9wY21fc3Vic3RyZWFt
ICpzdWJzdHJlYW0pDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IHJwbXNnX2luZm8gKmluZm8gPSBk
ZXZfZ2V0X2RydmRhdGEoY29tcG9uZW50LT5kZXYpOw0KPiArICAgICAgIHN0cnVjdCBzbmRfc29j
X3BjbV9ydW50aW1lICpydGQgPSBhc29jX3N1YnN0cmVhbV90b19ydGQoc3Vic3RyZWFtKTsNCj4g
KyAgICAgICBzdHJ1Y3Qgc25kX3NvY19kYWkgKmNwdV9kYWkgPSBhc29jX3J0ZF90b19jcHUocnRk
LCAwKTsNCj4gKyAgICAgICBzdHJ1Y3QgZnNsX3JwbXNnICpycG1zZyA9IGRldl9nZXRfZHJ2ZGF0
YShjcHVfZGFpLT5kZXYpOw0KPiArICAgICAgIHN0cnVjdCBzbmRfcGNtX2hhcmR3YXJlIHBjbV9o
YXJkd2FyZTsNCj4gICAgICAgICBzdHJ1Y3QgcnBtc2dfbXNnICptc2c7DQo+ICAgICAgICAgaW50
IHJldCA9IDA7DQo+ICAgICAgICAgaW50IGNtZDsNCj4gQEAgLTI1NSwxMCArMjU5LDExIEBAIHN0
YXRpYyBpbnQgaW14X3JwbXNnX3BjbV9vcGVuKHN0cnVjdA0KPiBzbmRfc29jX2NvbXBvbmVudCAq
Y29tcG9uZW50LA0KPg0KPiAgICAgICAgIGluZm8tPnNlbmRfbWVzc2FnZShtc2csIGluZm8pOw0K
Pg0KPiAtICAgICAgIGlteF9ycG1zZ19wY21faGFyZHdhcmUucGVyaW9kX2J5dGVzX21heCA9DQo+
IC0gICAgICAgICAgICAgICAgICAgICAgIGlteF9ycG1zZ19wY21faGFyZHdhcmUuYnVmZmVyX2J5
dGVzX21heCAvIDI7DQo+ICsgICAgICAgcGNtX2hhcmR3YXJlID0gaW14X3JwbXNnX3BjbV9oYXJk
d2FyZTsNCj4gKyAgICAgICBwY21faGFyZHdhcmUuYnVmZmVyX2J5dGVzX21heCA9IHJwbXNnLT5i
dWZmZXJfc2l6ZTsNCj4gKyAgICAgICBwY21faGFyZHdhcmUucGVyaW9kX2J5dGVzX21heCA9IHBj
bV9oYXJkd2FyZS5idWZmZXJfYnl0ZXNfbWF4IC8gMjsNCj4NCj4gLSAgICAgICBzbmRfc29jX3Nl
dF9ydW50aW1lX2h3cGFyYW1zKHN1YnN0cmVhbSwgJmlteF9ycG1zZ19wY21faGFyZHdhcmUpOw0K
PiArICAgICAgIHNuZF9zb2Nfc2V0X3J1bnRpbWVfaHdwYXJhbXMoc3Vic3RyZWFtLCAmcGNtX2hh
cmR3YXJlKTsNCj4NCj4gICAgICAgICByZXQgPSBzbmRfcGNtX2h3X2NvbnN0cmFpbnRfaW50ZWdl
cihzdWJzdHJlYW0tPnJ1bnRpbWUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgU05EUlZfUENNX0hXX1BBUkFNX1BFUklPRFMpOw0KPiBAQCAtNTk3LDcgKzYw
Miw2IEBAIHN0YXRpYyBpbnQgaW14X3JwbXNnX3BjbV9uZXcoc3RydWN0IHNuZF9zb2NfY29tcG9u
ZW50DQo+ICpjb21wb25lbnQsDQo+ICAgICAgICAgaWYgKHJldCkNCj4gICAgICAgICAgICAgICAg
IHJldHVybiByZXQ7DQo+DQo+IC0gICAgICAgaW14X3JwbXNnX3BjbV9oYXJkd2FyZS5idWZmZXJf
Ynl0ZXNfbWF4ID0gcnBtc2ctPmJ1ZmZlcl9zaXplOw0KPiAgICAgICAgIHJldHVybiBzbmRfcGNt
X3NldF9maXhlZF9idWZmZXJfYWxsKHBjbSwgU05EUlZfRE1BX1RZUEVfREVWX1dDLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjbS0+Y2FyZC0+ZGV2LA0K
PiBycG1zZy0+YnVmZmVyX3NpemUpOw0KPiAgfQ0KPiAtLQ0KPiAyLjI1LjENCj4NCj4NCg==
