Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EBC16A4B2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 12:16:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4381686;
	Mon, 24 Feb 2020 12:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4381686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582542999;
	bh=RpJEbXanR/STGPBhnQgqkY6Oghlhx6RVT/of2k0eozs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzxTLBI5eq2Vyj7UC2rXG15rjBohp+WMMgKDT3oxywIimfB7torXsWFF40JCHZe+p
	 hPn2g6HkPhgwUulPjNVluYrYPZrzcBJnjr+4U+93QyoxtBYBUnYWYXpVbsyv4Bkai6
	 oXX4W0WGsgMTyJOPEI3jQAoerLna93wXu6P9l3Sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F600F8014D;
	Mon, 24 Feb 2020 12:14:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6DFAF8014E; Mon, 24 Feb 2020 12:14:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E27FDF80137
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 12:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E27FDF80137
Received: by mail-oi1-f196.google.com with SMTP id b18so8580674oie.2
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 03:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6J56GZAIisN7s+G2kGZDSpihGRsq1TAS9IAl8pKmY94=;
 b=b7F5AP2+HJO8CCv9XkeyczAhoiQar2Tb7hZLwAoVx1bdGjJJMqtmIdbNS9uKsPjMQw
 7iUvorccmsFm8WvlxrtGG8DicoMzDYvls03w0BlyaOXLt5KHDR0Z/ZeF95K84cYPdQWM
 pQRorLp3/C33OqEqdbm9D0NEIeiDXLMyc+8ApcDnHCq34fSo7hx+75yeUC4HmEv9RtOf
 FmzGwKlFCfhRN0oz+D0WDZXWXWPmUAUkMLxfvOG5MZ+eL87iMNWimehz8bwre/94pRZV
 ek6Md7hapHDqaEFKfaE5cpu1VRn8dvh0F/Ba6mg2YgB5B+yvULb0MPqk1FRbnUgL0Bm9
 +Glg==
X-Gm-Message-State: APjAAAXfiuQWm0Z1g0LcP8X/Eiva1fo9yMmt6MlnYXQEoluihE0KsS9t
 Ag7ja3039daE7CxP/qVgPN0B6Ncxof+mRhUhF9A=
X-Google-Smtp-Source: APXvYqyJGLntakWARp86s91QH32t/qVwHjeTCsojy/gtzoQLTXH03yoyT3RIy6NniXxO35oP/uCuX+NiSRuYe1mWX5k=
X-Received: by 2002:aca:b4c3:: with SMTP id
 d186mr11814856oif.131.1582542890533; 
 Mon, 24 Feb 2020 03:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20180603201202.15468-1-robert.jarzmik@free.fr>
In-Reply-To: <20180603201202.15468-1-robert.jarzmik@free.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Feb 2020 12:14:39 +0100
Message-ID: <CAMuHMdU3uxfBwKd8SkOtZSDV5Ai3CKc3CWRhDy0Cz94T1Hn0iA@mail.gmail.com>
Subject: non-existent SND_SOC_AC97_BUS_NEW (was: Re: [PATCH v9] ASoC: pxa:
 switch to new ac97 bus support)
To: Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>
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

Hi Robert,

On Sun, Jun 3, 2018 at 10:12 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Switch to the new ac97 bus support in sound/ac97 instead of the legacy
> snd_ac97 one.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

This is commit 1c8bc7b3de5e76cb ("ASoC: pxa: switch to new ac97 bus
support") in v4.20-rc1 and later.

> --- a/sound/soc/pxa/Kconfig
> +++ b/sound/soc/pxa/Kconfig
> @@ -20,13 +20,12 @@ config SND_MMP_SOC
>
>  config SND_PXA2XX_AC97
>         tristate
> -       select SND_AC97_CODEC
>
>  config SND_PXA2XX_SOC_AC97
>         tristate
> -       select AC97_BUS
> +       select AC97_BUS_NEW
>         select SND_PXA2XX_LIB_AC97
> -       select SND_SOC_AC97_BUS
> +       select SND_SOC_AC97_BUS_NEW

The actual SND_SOC_AC97_BUS_NEW symbol never made it upstream, although
4 of its users did (3 have been removed in commit ea00d95200d02ece
("ASoC: Use imply for SND_SOC_ALL_CODECS")).

The definition seems to have been dropped silently in v4 of the series.
What should the select be replaced with? Or should it just be dropped?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
