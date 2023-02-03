Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F2689601
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 11:29:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 519571E7;
	Fri,  3 Feb 2023 11:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 519571E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675420171;
	bh=rlPEthmutRJ/POVaAzMPR5fkyIXzopzfec53+RzpDco=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s16Nx5E62jF1vUo3Cq1nWJOmS0YJy0jBpeIMLLuqfGK5o6WX6US0vhnxJhDkMbY2G
	 YBKEmHDueSpnxLehJSFfn81h9udFf+cvEtkDIxoF88zLi3wdAi4YUSnh+28U5Jz5Oz
	 pV7sauY8CtRPZQqr3SYxGJ8b0ae7pAcjkBd1efao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E915F80022;
	Fri,  3 Feb 2023 11:28:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FCFAF8032B; Fri,  3 Feb 2023 11:28:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DED36F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 11:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED36F80169
Received: by mail-qt1-f178.google.com with SMTP id v17so4924534qto.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 02:28:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OONFnhP6I7zS1Y45r5yPBZWg15dDNXvDl8f/Zu5HTcU=;
 b=FYz5f6BAf7DxBsE4nPDIgh+izmlzm8PjaYHYCO2gbhHrIv9cUlVk1uSIZU0/nVh6g+
 ku7H0xeEdlUgSTmtaPbjPC+5tKam3T9y5Ci0P27nUc1DnOS3CeqcSXTdReeLSwwvwJof
 WD1LA5Hv1Nqx/9WwoOu7ox5uiRmKsRqtHDRn+jdrENz9Q3hXyFIYOk99JWJ8ZyX78dnK
 1u3YSvdOkIKRzQw9KI/N9RjfYH6NClcHBCapJRc2Z2cR2IHXlpSPxGgD3Xjnaq+3qj8N
 LHJ3+lAkgYxr/j7sROhfmgCvHow8p0SviqdK/lzY4XP3j0L/ihLXbSmxFWGaqIm6HsLU
 rGdw==
X-Gm-Message-State: AO0yUKVr3xD30YEhewyGpPdvEaQHELYUuk/w/LayyFALlWJ2O6N1nj7j
 RqJJBRrveoFQErRk3utvro5FeGOygOvw3A==
X-Google-Smtp-Source: AK7set8kLcNza4wi7Fs0tXX3XkV2ecJNasuIvhuHWAYqjKpPOJq04QYrdYz/ze3obsP6Z7wixvCL1g==
X-Received: by 2002:a05:622a:1a8d:b0:3b8:ca09:e01d with SMTP id
 s13-20020a05622a1a8d00b003b8ca09e01dmr18639282qtc.53.1675420096181; 
 Fri, 03 Feb 2023 02:28:16 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 f11-20020ac8014b000000b003b86d5c4fbbsm1363153qtg.1.2023.02.03.02.28.15
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:28:15 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id x4so5709564ybp.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 02:28:15 -0800 (PST)
X-Received: by 2002:a25:820a:0:b0:7d5:b884:3617 with SMTP id
 q10-20020a25820a000000b007d5b8843617mr1035225ybk.380.1675420094927; Fri, 03
 Feb 2023 02:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
In-Reply-To: <20230203101624.474611-1-tudor.ambarus@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 11:28:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Message-ID: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, trivial@kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Tudor,

On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> The deciding factor for when a/an should be used is the sound
> that begins the word which follows these indefinite articles,
> rather than the letter which does. Use "an SPI" (SPI begins
> with the consonant letter S, but the S is pronounced with its
> letter name, "es.").

While I agree with your pronunciation, I believe the SPI maintainer
(which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
with "spy" ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
