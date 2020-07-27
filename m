Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11322E390
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 02:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F1101694;
	Mon, 27 Jul 2020 02:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F1101694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595811513;
	bh=oDMmaJ4W7IGzaDNb0cUGiFZmaEwW/BkTS0g7B4qQwms=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BKn+yGblAh14lJ/iG90EcOPKkqeFH3iT5xgDWjEodf5blYBpyh24W8cDKH0NsRWUv
	 PxOYglK9pB5lYsP7Z1i3ke+Y1KGvY1oR8ju+Nd9xQSo24MP86CKGPYKtmCHNyz7nRh
	 rzeP9POPiOAGYCOhQ8PNEqMXN0jp/USuQxowcWec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A630F8021C;
	Mon, 27 Jul 2020 02:56:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E847F8020B; Mon, 27 Jul 2020 02:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72625F80134
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72625F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qECpGkVD"
Received: by mail-pj1-x1042.google.com with SMTP id t15so8282783pjq.5
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 17:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9VytBfcaiiwF/SVBWcvrj4CgGXad34ZD6/IzLtTN6BY=;
 b=qECpGkVDv2cow+e4GmXBbUtYwC2BxMmasbbOkXzXC7gU3EnKJiQrQUcAu0XkqsTpOC
 fNV/XKKsMoVQazhJZMbF13OfNde2LKYJ6yZgLqG4SvH2h/tpIP1KXfgtpxmSHrAchFwH
 WUkP2EXnU4NOvRq9EO84tuWkBUbCqLK6kVzooFZTCZQAHOF6QjQ+UyFvv2sTqqvoGNDR
 6WwJ1U7hbYF2979H608Y7jli0PJGd7skrHfasilFDLh77gMysD4ADYn4sRaxLkkIZ3pz
 AiOM3jwD1JYr1H/cguYxLEcWe/x+pbdfnBGoIzt6NYAz66CXYDgTaz693+Cuz7d3jcdv
 OMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9VytBfcaiiwF/SVBWcvrj4CgGXad34ZD6/IzLtTN6BY=;
 b=FepxmlnsCZ/+7fThhvN6ctwqLOI/B5SQBMJ6M501qm+pUCwzgqpFC3jQnB/p5qBPVs
 kfTdoDoS0wJilNci0jp/kymWtsNFntuRZwprUlAwmqhQG3o/jqmBR43qF4d2tK8EATZY
 gyvXvSkkr9OTR9zJKT7CSHwslVw6cacyZZMrPtGOzmH9pTfbWUAcOuUHN5Dmou+9vOLX
 VzGRx73pRIxmuzqDjiPhTxRCZcFfPvI32jBAyWGXAbXPR5+F7zKexbBDc83Zaofr5787
 SBG/OEbkxK63jCer6/eM28p0ptl5H8MWigJpr4Aryg0IV/S1llYbj5/Tbq1ZqXRHygaI
 NXRw==
X-Gm-Message-State: AOAM530Fi04xXBILEGJ/bD9/Bd1DjfjuIWp4LSEpIgjBGSqmyj/um38+
 n9lJ2QTY5Br08weCymH0Ct0=
X-Google-Smtp-Source: ABdhPJxjbwFwZRPOhq8ClPjborSekOfOe3pyNf+GPEnnAFAc44svuxU+ktHfX7yMtMp1WpWUDb709Q==
X-Received: by 2002:a17:902:988b:: with SMTP id
 s11mr16232999plp.229.1595811399410; 
 Sun, 26 Jul 2020 17:56:39 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id k23sm12499712pgb.92.2020.07.26.17.56.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Jul 2020 17:56:39 -0700 (PDT)
Date: Sun, 26 Jul 2020 17:55:59 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level
 function
Message-ID: <20200727005558.GA30124@Asurada-Nvidia>
References: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Sun, Jul 26, 2020 at 07:20:17PM +0800, Shengjiu Wang wrote:
> With this case:
> aplay -Dhw:x 16khz.wav 24khz.wav
> There is sound distortion for 24khz.wav. The reason is that setting
> PLL of WM8962 with set_bias_level function, the bias level is not
> changed when 24khz.wav is played, then the PLL won't be reset, the
> clock is not correct, so distortion happens.
> 
> The resolution of this issue is to remove fsl_asoc_card_set_bias_level.
> Move PLL configuration to hw_params and hw_free.

Hmm...using set_bias_level() instead of hw_params/hw_free() was
strongly suggested by Mark when I got imx-wm8962 machine driver
upstream. So we will need his input here, although I personally
don't have a problem with it...

> After removing fsl_asoc_card_set_bias_level, also test WM8960 case,
> it can work.
> 
> Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 149 +++++++++++++++-------------------
>  1 file changed, 66 insertions(+), 83 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 4848ba61d083..0517dbb3e908 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -73,6 +73,7 @@ struct cpu_priv {
>   * @codec_priv: CODEC private data
>   * @cpu_priv: CPU private data
>   * @card: ASoC card structure
> + * @is_stream_in_use: flags for release resource in hw_free

Would love to see something shorter... Could we reuse similar
one below, borrowing from fsl_ssi driver?

 * @streams: Mask of current active streams: BIT(TX) and BIT(RX)

>  static int fsl_asoc_card_audmux_init(struct device_node *np,
>  				     struct fsl_asoc_card_priv *priv)
>  {
> @@ -611,7 +600,6 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	/* Diversify the card configurations */
>  	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
>  		codec_dai_name = "cs42888";
> -		priv->card.set_bias_level = NULL;

Can check if set_bias_level is still being used with this change.
