Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E56BDCCB
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 00:19:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82F6F103C;
	Fri, 17 Mar 2023 00:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82F6F103C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679008760;
	bh=0OHLvMHZsCu3tuo1mxCMwGF88ZDkoo1SSOKq4ysw61s=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bMcrpxq/I2/yMQmQm2bO9hsYsmJT+QBqygIG+S3V8PxZfQ6pNMxIxV1mem5m6/ywJ
	 9YITnOWaqX9g33nwoToMhVwpm7dnRP90AdPfAUmmXQp5XCQVtIL4s9iNe7/mD/77CM
	 UOqfl99b+p5aB35/3p51M1bCCdhFI5c9Sl9MCMtU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B1CDF804B1;
	Fri, 17 Mar 2023 00:17:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15C2FF804FE; Fri, 17 Mar 2023 00:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9482F80482
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 00:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9482F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SHsXYvsl
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5447d217bc6so61883147b3.7
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Mar 2023 16:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679008663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OHLvMHZsCu3tuo1mxCMwGF88ZDkoo1SSOKq4ysw61s=;
        b=SHsXYvslg0EPaiopXygrIwyYfuKm/LWVrXLaolEG3O9ZPzgvjpUxnS3nPSMTb1b3cc
         GL5iZ5krkTyiw/Hp2/5gelwc/zp5wKWr9/yQIjn+lM5v7U2BASgWHLwcr//PctPCa4R9
         EQVz9fIYeJHbsVx4MK7ZWF23kNRf8BPrnxmvZLE4fPBIoeD1VcU8td2v7mKcYpTF7XMe
         x38FYVxWdLYFQWVQM01yok4X0Ng74wqer+UsY/qq/G0VsbEI75PSyCfy8UPuJlXf8pK4
         beVLs89lyjGSm83r3peiYiMdr7tpSduLS5jUvF8zMXh8laaK97o4yiyWdmTPTpOx6CLi
         zdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679008663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OHLvMHZsCu3tuo1mxCMwGF88ZDkoo1SSOKq4ysw61s=;
        b=Fav9n9Hjpr1MUH6rGM5qnkxpUsFo2QPMqvtqh1VwhkEY8UVWa56+JIqqDcrCqzlGRc
         W6VRxuLAhzCm2vnP4kePbJoPQ3f3v44f5tsyAIQQ16tq2mgjf82/gUG6eswQGJ4MRX/J
         e2o7wnuALEIJPb02lSIdo0qXcNbRn9FML1BArmN/KCorlF55YI2jxY7NLNPc5CDIXIQ0
         Xq1uiBltmVUbAMTtmIEsp3bnLGqJuFEtHGGfRhdQpBzV0U6B16l99vu83b2deWpbR+Sx
         oYW6+97I65vOm8P6zqGMnc4iKESo/kDBj5spk7bbGDRMZjk+U7nsmS0SxFRNtukocVFh
         5dJw==
X-Gm-Message-State: AO0yUKUpe7Lfm8sJsMUUW0H+A2x77kbW/8pkD926Ool+8ljPpjzPj15k
	9LokY13mPtsoGeijPQLq4C3h9jaJxE61lInHF8j50WhTE/I+yDLfFjM=
X-Google-Smtp-Source: 
 AK7set8JhBrocubsnWdPgrfLmFVWmP/Eu8jRde+7Ifa0u0Gmsar15ng6NZh+cAFlds9CE6QZQ5RgNHxxRitm5Lzdn9E=
X-Received: by 2002:a81:aa0c:0:b0:530:b21f:d604 with SMTP id
 i12-20020a81aa0c000000b00530b21fd604mr3207522ywh.9.1679008663144; Thu, 16 Mar
 2023 16:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-168-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-168-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Mar 2023 00:17:31 +0100
Message-ID: 
 <CACRpkdZbPOJAEdzA3O84CTHL0frj1k9stCLFdU9Ri0vrwOaxcA@mail.gmail.com>
Subject: Re: [PATCH 167/173] ASoC: ux500: mop500: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: KHEAVYZXD7QW6EJZC3X52VREB25IH2KH
X-Message-ID-Hash: KHEAVYZXD7QW6EJZC3X52VREB25IH2KH
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHEAVYZXD7QW6EJZC3X52VREB25IH2KH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 15, 2023 at 4:08=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
