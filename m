Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35C410B44
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Sep 2021 13:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A78169C;
	Sun, 19 Sep 2021 13:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A78169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632050579;
	bh=bCNasuMSqT7MQIOX2zCglLS0pL4F0TwxgdlVNMpj3Tg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rkUQz7pQkkRcDf8B1Hz0avZ1m0O8YOumsEELyV//JpIoqa3Gg3bBs/wsoL0XmWDwU
	 e9i2S7KBDMbwfyER7n0rRM+D+CvI34QVS/7jiln6jBLCnQFpaiPI+KSG2/vMjGk/CZ
	 /6uGwdRtceBPZGJ9qLrm8XDNQhgZLVy1wRQ9+KHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD813F8026A;
	Sun, 19 Sep 2021 13:21:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EBC0F80268; Sun, 19 Sep 2021 13:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28E9AF80152
 for <alsa-devel@alsa-project.org>; Sun, 19 Sep 2021 13:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28E9AF80152
Received: by mail-vs1-f53.google.com with SMTP id q66so8356065vsa.4
 for <alsa-devel@alsa-project.org>; Sun, 19 Sep 2021 04:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/ORHhnIy4nRW8aqt0HSfTMaa02QlmIV//+XG+bOnCU=;
 b=KNX4lCv/FWX9oo925a1VTDg2jgkCybMmK/hJRBGNkIqbDNuT2vaC10UyeUhOAx81mR
 cG8pKzS0vvNUCsr6gGT27NE/CQyNyMgbzlvT6cC9ONdNJc6uUwIPC+CjdkgwueQqQXHe
 JH/ot4n4AVr3AF5D/WU3QjaQbss1BKTMG0FNr+hW2HTaI48L1tnmJ96+J3gzOBBl2dza
 dZRZopxTTDkFOTTVIVMdwQ9EX+xDfUBQvln7A2EntTmFVCZfvbI6uI6ZyF+c/e0UxLX2
 7NbrhGmMoYlAtD3xDchdlK6+U3gJC/+xlbIkiB25/DLQCcC6sOm1EZbQSGQcLHSJI6TJ
 ceZw==
X-Gm-Message-State: AOAM531KuSBH3jXpuTn63SnNn+DHqrWyCwi0TUW9piMoFeArT4OHCOFP
 wd/SM/Q3q5a9kevndmxYFZG1VUEG0HwwsRqQAeQ=
X-Google-Smtp-Source: ABdhPJwsB+qX90+yBYMN6r5ozVeZNqsRYThb/1LSzyrHRlpuxm7MGRTllo/zneEm4++pxAdqeW8raOaQ69xnLE9sMcM=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr12982410vsl.37.1632050484249; 
 Sun, 19 Sep 2021 04:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210918051632.1297025-1-liu.yun@linux.dev>
In-Reply-To: <20210918051632.1297025-1-liu.yun@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 Sep 2021 13:21:13 +0200
Message-ID: <CAMuHMdX2Wk6T9JAZT4Nqoiay5H+00xaUsn_pAGgspodpQuJcJQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: SND_SOC_MT8195 remove depends on
 COMPILE_TEST
To: Jackie Liu <liu.yun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
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

Hi Jackie,

On Sat, Sep 18, 2021 at 7:17 AM Jackie Liu <liu.yun@linux.dev> wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> After compiling with COMPILE_TEST, we are most likely to compile on a
> different architecture, such as x86. At this time, it is possible that
> the HAVE_CLK macro is not selected, resulting in compilation failure.
>
> Avoid fail like:
>
>   Kernel: arch/x86/boot/bzImage is ready  (#17)
>   ERROR: modpost: "clkdev_add" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>   ERROR: modpost: "clkdev_drop" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>   ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>   ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>   make[1]: *** [scripts/Makefile.modpost:134: modules-only.symvers] Error 1
>   make[1]: *** Deleting file 'modules-only.symvers'
>   make: *** [Makefile:1783: modules] Error 2
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 940ffa194547 ("ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK")
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

Thanks for your patch!

> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -187,7 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
>
>  config SND_SOC_MT8195
>         tristate "ASoC support for Mediatek MT8195 chip"
> -       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on ARCH_MEDIATEK

Instead of dropping support for compile-testing, wouldn't it be better
to add the missing real dependencies?

    HAVE_CLK (clkdev_add, clkdev_drop)
    COMMON_CLK (clk_unregister_gate, clk_register_gate)

As the latter selects the former, adding the line

    depends on COMMON_CLK

Also, the Fixes line is wrong as the link failure happened before.
Fixes: 6746cc858259985a ("ASoC: mediatek: mt8195: add platform driver")

>         select SND_SOC_MEDIATEK
>         help
>           This adds ASoC platform driver support for Mediatek MT8195 chip

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
