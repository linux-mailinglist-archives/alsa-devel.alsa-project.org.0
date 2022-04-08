Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FAE4F8D3D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 07:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C4E189C;
	Fri,  8 Apr 2022 07:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C4E189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649394807;
	bh=KlRj+8zsPeWVR+aVrdiD88tJ3Ft7lkiTXMNjOOG0TGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EeKwfCXX3iLmufHMyBiO+vOxK4BSXe6hLCK3ULpceT3vk//W9uM93NK6fD49OLcop
	 tjx8KJSki93lP0+hOwlUefkNSOw448Ri9JAEs8VYD19JIUiQy2cmwbLU1Y3qfLHoOA
	 G0j3/zb1rb/IR4qhrgsdop5Ksbx59HWwFlket7dE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF98F80311;
	Fri,  8 Apr 2022 07:12:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 492ECF8014E; Fri,  8 Apr 2022 07:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E113EF80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 07:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E113EF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IsM2UpSn"
Received: by mail-qv1-xf32.google.com with SMTP id t9so2688427qvd.3
 for <alsa-devel@alsa-project.org>; Thu, 07 Apr 2022 22:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18lMCRKWhLHowOLVfVEiF4lqEP378JdeXGE8FkJi59s=;
 b=IsM2UpSnDeP6JOFMdOcd07r2fu2wiKT8wv4ntTnNosOzQgRLHKp0YRbKNhGOzMRTMR
 /RDX5aQvhUrfn4apAh5IZxEQ71Z6JAlBrcDQ8jiAVTv0B4qEPZqKJQjrcNkCKBG5A1p2
 u37l3NGpiRoZk8lTSUHIFYZrTvdcrwp5R6icX6X/6iTGvq74lRXU+LvyP75zutmZKzQq
 thHceWCvuYK8ikXdiEhcJugUmpU1qNMA4M78FrxugJncrNm1RbhHZ1+ss4ckqXhFDp2b
 wN17qHq5bWR8/xFDHbcvYH8injK/UcCzyKNZFoRwOi0Z3OQWWYrx2JsfBk1ePErUBLA9
 DVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18lMCRKWhLHowOLVfVEiF4lqEP378JdeXGE8FkJi59s=;
 b=tm0awc6zIwuj/snUK7epeFyxqhMYkt0xp/XLGgWNbDM2H2uNjLjlZ7GejD4UgexjKY
 jONaJZ4IVp6V99uZ7nLWKDiv1r9YnxLC+onZbRVDBEfsZl2KwRwnj9lLmdhtv2/n8DfN
 5zJcg4805TM4+qOugjKKMn4CW6IR2yPthgBL3u1GZ36TB40kYEGqbzMcwaFQcLRZXW/t
 5zTU9xA/xmJ49lpNtkCF51IDL1g4by3dqIDxes34zZGPKFqv8vLZJuqz0yYgr9eL0uUc
 3pMNqQ4yLeBpr0wDM9m2JipDvDoRTwKxr/mO1Y83H/AUFJ2+Xc9l+BoYvjWscr7xdD5I
 TM8g==
X-Gm-Message-State: AOAM531AK3JNC3FFWpvO5LcDFivuQ4VgSm2QMJHWH1sPWsFk+nrzT5qn
 Fbebq53S9DMvFflltrYnc9V+Z9eODgufqKR/qyk=
X-Google-Smtp-Source: ABdhPJwbA1Ah4EoERGcMkajEAZFUCef+K13WgvW8vdk4lfBeli+uXcRqtnRZDrtdVmxDyuPAiJcmBP/NMm38pzNH5Q0=
X-Received: by 2002:a05:6214:21af:b0:443:e253:61fa with SMTP id
 t15-20020a05621421af00b00443e25361famr14479371qvc.31.1649394735720; Thu, 07
 Apr 2022 22:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220407084936.223075-1-s.hauer@pengutronix.de>
 <20220407084936.223075-13-s.hauer@pengutronix.de>
In-Reply-To: <20220407084936.223075-13-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Apr 2022 13:12:05 +0800
Message-ID: <CAA+D8APNnoX=hv6C_wPcjsgxH1YPHqETQgYL-ojs-zkOPX9x=Q@mail.gmail.com>
Subject: Re: [PATCH v4 12/21] ASoC: fsl_micfil: add multi fifo support
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

On Thu, Apr 7, 2022 at 4:49 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The micfil hardware provides the microphone data on multiple successive
> FIFO registers, one register per stereo pair. Also to work properly the
> SDMA_DONE0_CONFIG_DONE_SEL bit in the SDMA engines SDMA_DONE0_CONFIG
> register must be set. This patch provides the necessary information to
> the SDMA engine driver.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>
> Notes:
>     Changes since v3:
>     - Fix include name
>
>     Changes since v2:
>     - Add forgotten commit message
>
>  sound/soc/fsl/fsl_micfil.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 4656a18a03e45..56df916ad55f2 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -16,6 +16,7 @@
>  #include <linux/regmap.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> +#include <linux/dma/imx-dma.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/pcm.h>
>  #include <sound/soc.h>
> @@ -35,6 +36,7 @@ struct fsl_micfil {
>         struct clk *busclk;
>         struct clk *mclk;
>         struct snd_dmaengine_dai_dma_data dma_params_rx;
> +       struct sdma_peripheral_config sdmacfg;
>         unsigned int dataline;
>         char name[32];
>         int irq[MICFIL_IRQ_LINES];
> @@ -324,6 +326,10 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>                 return ret;
>         }
>
> +       micfil->dma_params_rx.peripheral_config = &micfil->sdmacfg;
> +       micfil->dma_params_rx.peripheral_size = sizeof(micfil->sdmacfg);
> +       micfil->sdmacfg.n_fifos_src = channels;
> +       micfil->sdmacfg.sw_done = true;
>         micfil->dma_params_rx.maxburst = channels * MICFIL_DMA_MAXBURST_RX;
>
>         return 0;
> --
> 2.30.2
>
>
