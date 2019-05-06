Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67014570
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 09:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9E3183A;
	Mon,  6 May 2019 09:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9E3183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557128391;
	bh=gMxjL5sHx1hFYMwQpYHVnUxXGO/mI7KESc36JhIDIak=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qN9qyBoh/lZF8S409NyMbLdolXifUyBiLbNxaS8Jb7S7PquHDxbCD4x/qYylZnM+c
	 r4iaMCKiMaYmjts7R/Jk/LcOIm55Bzhjjkt/m/rDSHOAU/ZlTEpJjfmXi2EtIvJpQk
	 5oChDgjNrse8ebfFYygV99OC1Z/ipdhok+7ZMy/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 944A9F89673;
	Mon,  6 May 2019 09:38:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C39EF89673; Mon,  6 May 2019 09:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C750F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 09:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C750F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G8Apsdac"
Received: by mail-ot1-x341.google.com with SMTP id b18so10620820otq.3
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBzgaXpZlMW3qUziKMTrNIsU6hoCECAA0i8m2SW5Vno=;
 b=G8Apsdac6cxEre7pzQch8MuGvLvy4OAtrerFD+8qUqPq00aP7B+rH2m2zh3fNiP683
 JehsG+fRLsRyp//KRtYczGH4yN3/qRae0Yoz8nUiIYy4QvgA/EvZh6vlT0qAf4y+Pc3c
 Jm656p/xZ+K2CNY+PrRf/kDB65dlgip3ZR4nZ6wuj3PmsRWHhQaLqT+BygaLHxG4RSNx
 5bSTtESxQhLlea8qgJPl+qgXiTLgKMP7y/IqUkE/37dbXGtZvYfqaEnEjUXo6aM3r6Gt
 YOoIsa1QbIkID6YMdwJ267M+ofqNBXOy08lz0fdr/O+QHIEyi0pGeUOMIe6zCIYaXAIy
 Kt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBzgaXpZlMW3qUziKMTrNIsU6hoCECAA0i8m2SW5Vno=;
 b=F8txqLf8GaLFk1SwM3qW6I2wq2CC2y7vNqD471cdCIhML0duOtMr+jrzV+18CKM4zq
 NzfBwxwdsAbu2kIFo9c1WEAkHpA87MVOTWLlOQiyBzf2T35PiTri1cc/SMOoRiH2MhgJ
 +s0Gvs2MR+wKXalDz0FS17jP1RnT1wjZBWLTYiZP95z+lHtKzOSeqzT7+xcxXMusGDWa
 r9zsKZWdpBKUIeQ8ZbNgdjGK20dYb8a/0uvUqgYVIeB+xMzcYIkY/NI0b/vN0BdqSYiC
 N6eJ4XZdcvtAY9fcPMcwskMB5cd7ClTSwNJfHAK345tGfQgyp/eUhMiWA3dj5HZKufLo
 bM/A==
X-Gm-Message-State: APjAAAX9m3hZGLxlsC5HZ/9JTqWsPj/xpjFARp2UzOcsla7CDJPWwe8i
 F6mKqyq1+ZmzCpQXuMdpb8+eQtM2cq5lcDz8m8n8ig==
X-Google-Smtp-Source: APXvYqyK4/SAtmNGvtd8ck3bkArJwNTGFExfjP5d2CwifK0lVSo64KVSCvSjMkZDMJ2Qwp4Isu90YKRnrZ8jvsp4Ctc=
X-Received: by 2002:a05:6830:b:: with SMTP id
 c11mr15200300otp.281.1557128271074; 
 Mon, 06 May 2019 00:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <ee4a22c3491628abf94c8d356dccd67984604811.1555049554.git.baolin.wang@linaro.org>
 <20190418102606.AE0181126DA9@debutante.sirena.org.uk>
In-Reply-To: <20190418102606.AE0181126DA9@debutante.sirena.org.uk>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Mon, 6 May 2019 15:37:39 +0800
Message-ID: <CAMz4kuLK_XS93Wpq+BkXVAJA3M+vFnL8pR0gR7aRpYxBzwLv9w@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [alsa-devel] Applied "ASoC: sprd: Add reserved DMA memory
	support" to the asoc tree
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On Thu, 18 Apr 2019 at 18:26, Mark Brown <broonie@kernel.org> wrote:
>
> The patch
>
>    ASoC: sprd: Add reserved DMA memory support
>
> has been applied to the asoc tree at
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

I did not find this patch in your sound git tree and the linux-next
tree, so could you check if you missed this patch? Or did I miss
anything? Thanks a lot.

>
> Thanks,
> Mark
>
> From 25a073bb9ceda91b8bf731b20ac01b68cc8877a9 Mon Sep 17 00:00:00 2001
> From: Baolin Wang <baolin.wang@linaro.org>
> Date: Fri, 12 Apr 2019 14:40:17 +0800
> Subject: [PATCH] ASoC: sprd: Add reserved DMA memory support
>
> For Spreadtrum audio platform driver, it need allocate a larger DMA buffer
> dynamically to copy audio data between userspace and kernel space, but that
> will increase the risk of memory allocation failure especially the system
> is under heavy load situation.
>
> To make sure the audio can work in this scenario, we usually reserve one
> region of memory to be used as a shared pool of DMA buffers for the
> platform component. So add of_reserved_mem_device_init_by_idx() function
> to initialize the shared pool of DMA buffers to be used by the platform
> component.
>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/sprd/sprd-pcm-dma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
> index 9be6d4b2bf74..d38ebbbbf169 100644
> --- a/sound/soc/sprd/sprd-pcm-dma.c
> +++ b/sound/soc/sprd/sprd-pcm-dma.c
> @@ -6,6 +6,7 @@
>  #include <linux/dma/sprd-dma.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -530,8 +531,14 @@ static const struct snd_soc_component_driver sprd_soc_component = {
>
>  static int sprd_soc_platform_probe(struct platform_device *pdev)
>  {
> +       struct device_node *np = pdev->dev.of_node;
>         int ret;
>
> +       ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
> +       if (ret)
> +               dev_warn(&pdev->dev,
> +                        "no reserved DMA memory for audio platform device\n");
> +
>         ret = devm_snd_soc_register_component(&pdev->dev, &sprd_soc_component,
>                                               NULL, 0);
>         if (ret)
> --
> 2.20.1
>


-- 
Baolin Wang
Best Regards
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
