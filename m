Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43536411293
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 12:06:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C7E169C;
	Mon, 20 Sep 2021 12:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C7E169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632132412;
	bh=/rKN0TRlG4jUjiQFuZBWWVXi57C3cYujtbWL5c76c6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfSNPdhzpKdVmBhVmQHDw6TnUqZEBE0eAbmNE+uNT85Y8hb1mfSRaw2RaFEPmfj/v
	 DHs9ZCsJjOq9dYthaU6kgMw1eXcD8ZFV9gPbTRBLWqTvR806rhTvpQnoBZr+qhYb4V
	 ZKUKBjIhxQVEdnorfYll/PJZb2B2B7ftB0Hj/PWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54196F80124;
	Mon, 20 Sep 2021 12:05:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC2F8F8025D; Mon, 20 Sep 2021 12:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1F4FF80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 12:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F4FF80129
Received: by mail-vk1-f173.google.com with SMTP id d10so6356272vke.10
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 03:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJlXbAv3u12lESrV/6ZqM6UNLLxRX/MyMpJQH7eW+7g=;
 b=aTHD6Lq698YXQTschRkMjBUawfNtdUu7PLI0hFAIpM1/SRjAcoHt+EU02Pe571mvVp
 3HJoGR8UtH7pcU0NHrfHNPJUsKwu3guKfySmkoWSYbV+L/0BVbBabtnD405f1YhsnhOR
 gVwEvSOgfuCBsgHSB7F48dN/ItfDcvNxb4/qxZbCfpFLVHB7CGXGsjF7sEcwgZhRhTD8
 b+6xW7pmDHnZQ0mukczwxryY+HokCzWI86pbW87a+s2b7ek0oqM/mSSVcCXUA+5nM6IT
 ctkbBpZkDGjXvDQJdtxLQpPkdOw4StYSD0mAIBN+30qc01uVN5PCfqNMRScP5faqtHF/
 eB4w==
X-Gm-Message-State: AOAM532YWxFUxnQVnm16gTa0hKVWD3w/3ywkceP1yzHAE8/C2YGqu5ut
 vTkgs4rWeN8ioK96XOIq635/5V6j4NzBlJOcyiw=
X-Google-Smtp-Source: ABdhPJw21KYJ6+E01J7XKEBzRND+bYGJxtvpgL/KCdlzvGuzKjTv1Xd3XS/lrKcKi3oLR3yuOCRgqcDqibrEOieac7U=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr13427328vkj.11.1632132324735; 
 Mon, 20 Sep 2021 03:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210920100206.1418649-1-arnd@kernel.org>
In-Reply-To: <20210920100206.1418649-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Sep 2021 12:05:13 +0200
Message-ID: <CAMuHMdUvb=nCZ=qfeUyUHQJ7TRjMjs4OVtd2q3yQT5SPk6Dx_g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi Arnd,

Thanks for your patch!

On Mon, Sep 20, 2021 at 12:02 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Without CONFIG_COMMON_CLK, this driver fails to link:
>
> ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
> ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>
> Add the proper Kconfig dependency for compile testing.
>
> Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
> Fixes: 940ffa194547 ("ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK")

I don't think the second Fixes tag is appropriate, as that commit did not
relax the dependencies.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/mediatek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 5a2f4667d50b..268c1f74aa3e 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -187,7 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
>
>  config SND_SOC_MT8195
>         tristate "ASoC support for Mediatek MT8195 chip"
> -       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on ARCH_MEDIATEK || (COMPILE_TEST && COMMON_CLK)

Why not add a second line

    depends on COMMON_CLK

to make a clear distinction between hard and soft dependencies?

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
