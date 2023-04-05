Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 115536D7EF9
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 16:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BB91FC;
	Wed,  5 Apr 2023 16:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BB91FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680704182;
	bh=zLCbqzqreL/SDJwaz6NG3NuxhGyWu+VOlVJt7oD3Qks=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p2HwwoGo9SFX02HVmKBkIyLlLxKWP3Tace+TgJ4nZmTrLbnkDe2uLXfzQX7D1rYVx
	 UYcBwPgWBwZMdVgWYa9EVb/qH8XFnTXHjsmRxQxBCHJbgE2Gc4NYPa0XTS7w4vhIFa
	 Yzt1WAIkQ9Eq0xIqrDwTdAunY8qdzlxpLg2zKVwA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F6A1F8024C;
	Wed,  5 Apr 2023 16:15:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 151FDF8024C; Wed,  5 Apr 2023 16:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69BA1F80054
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69BA1F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IqKMH9j+
Received: by mail-wm1-x333.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso1271186wmr.0
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Apr 2023 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpgaWsNbw3Z/0dUj+oRiMAi8hpXpay23y++dOCQUOjE=;
        b=IqKMH9j+XgjSSYg203S4TCDvawuH3m0kFu+LzhdkJXPrh806MOa+moVcWGnPUvyKRE
         Z1ccadg7pF/yS+pim7uP8Q4HKbeleevJ4xygTU1/+mYj4dsbmyJlbTG4mLKimdUw8pQi
         OuJDj3SnxvAms/mnntZG40XEuwS4sJfGf3F3/3r4BYIgljquJAOmHa53vk5d4k5IYDn0
         lr7bKAZ7nTHyL3GYQA8hb/TIqqzKnJWgddVXEi6bI1K68d/uUaGE0SeNcQP2dmcuxMLq
         HnmcsATAlXPdr7VkW+5+QPu7i4DN0TcV7hASajh6RBKpKQKEJb5Wlms8dERAm6Xi7w4y
         6mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpgaWsNbw3Z/0dUj+oRiMAi8hpXpay23y++dOCQUOjE=;
        b=az8znlmH3ISB2DvtcN8YyV0xQJyHKHfW9sbgcbUZgGj+gY2OgOc3LuobDZrBocDUpx
         I0ad8N34H34i3/GWqgIGAB+PPbMPTXjD2+dDaI9u7X99eRHBQ0sCWrwTT18zeNNEm9hg
         6ibOokw/iVEBcb+uzn90G3hBjAlSxc4VARcaAtXCimls0rQawbIV/cJy+VawI0IBPGR3
         TljNxy3RJHVvdF2tUdZ+LNOYkbY1IBFsrMC9JfqXAXcnk5D2miXBEFERuJBOIThO3RRb
         sSIQtB54+kvY23rGBeD+m7rfREPxYaVl/FOQEf2fRyIO4t3ktuT4sgQPnUFFJwSVSe44
         Sd5g==
X-Gm-Message-State: AAQBX9eG8J2MITxjAcZlyiwmPm4mENbLlpHA4Cvr/nk8xxj5jRdDw1J+
	OzHUKGrW94UcvcgpndinaAGVRJYWRl0eklmQgg==
X-Google-Smtp-Source: 
 AKy350azZaSzk8DjHMVg2DTjnVRsVWr5aliNryusechEoMgYowM3+V02MfTqCZXmgjJyyOLHa43HvkjA9hgT2lTfbxM=
X-Received: by 2002:a05:600c:21ce:b0:3ed:c669:8a13 with SMTP id
 x14-20020a05600c21ce00b003edc6698a13mr1658782wmj.8.1680704113286; Wed, 05 Apr
 2023 07:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230331030116.54136-1-frank.li@vivo.com>
In-Reply-To: <20230331030116.54136-1-frank.li@vivo.com>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Wed, 5 Apr 2023 22:15:00 +0800
Message-ID: 
 <CAE=m61_asm=8SuBjD8cYXDJF-QZb7BXUDPh+HMoDBgyvvyjkNA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sunxi: handle reset_control_deassert() error
To: Yangtao Li <frank.li@vivo.com>
Message-ID-Hash: PK6FT3LKBEUMS32UYCLWIG7MFIUWSKBN
X-Message-ID-Hash: PK6FT3LKBEUMS32UYCLWIG7MFIUWSKBN
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
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PK6FT3LKBEUMS32UYCLWIG7MFIUWSKBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

WWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+IOS6jjIwMjPlubQz5pyIMzHml6XlkajkupQg
MTE6MDHlhpnpgZPvvJoNCg0KPiBBZGQgZXJyb3IgY2hlY2sgZm9yIHJlc2V0X2NvbnRyb2xfZGVh
c3NlcnQoKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5j
b20+DQo+IC0tLQ0KPiAgc291bmQvc29jL3N1bnhpL3N1bjUwaS1kbWljLmMgfCA2ICsrKysrLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEvc291bmQvc29jL3N1bnhpL3N1bjUwaS1kbWljLmMgYi9zb3VuZC9zb2Mvc3Vu
eGkvc3VuNTBpLWRtaWMuYw0KPiBpbmRleCAwNjljOTkzYWNiMzEuLjdmMGU2MzEzMGQ5NSAxMDA2
NDQNCj4gLS0tIGEvc291bmQvc29jL3N1bnhpL3N1bjUwaS1kbWljLmMNCj4gKysrIGIvc291bmQv
c29jL3N1bnhpL3N1bjUwaS1kbWljLmMNCj4gQEAgLTM0NSw3ICszNDUsMTEgQEAgc3RhdGljIGlu
dCBzdW41MGlfZG1pY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAg
ICAgICAgIGlmIChJU19FUlIoaG9zdC0+cnN0KSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIoaG9zdC0+cnN0KSwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gZ2V0IHJlc2V0LlxuIik7DQo+
IC0gICAgICAgcmVzZXRfY29udHJvbF9kZWFzc2VydChob3N0LT5yc3QpOw0KPiArICAgICAgIHJl
dCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoaG9zdC0+cnN0KTsNCj4gKyAgICAgICBpZiAocmV0
KSB7DQo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZGVh
c3NlcnQgcmVzZXQ6ICVkXG4iLCByZXQpOw0KPg0KUGxlYXNlIHVzZSAiZGV2X2Vycl9wcm9iZSgu
Li4pIg0KDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiArICAgICAgIH0NCj4NCiAg
ICAgICAgcmV0ID0gZGV2bV9zbmRfc29jX3JlZ2lzdGVyX2NvbXBvbmVudCgmcGRldi0+ZGV2LA0K
PiAmc3VuNTBpX2RtaWNfY29tcG9uZW50LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJnN1bjUwaV9kbWljX2RhaSwgMSk7DQo+IC0tDQo+IDIuMzUuMQ0K
Pg0KPg0K
