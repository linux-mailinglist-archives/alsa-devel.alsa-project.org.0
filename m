Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33329B0A0
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 15:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6881674;
	Fri, 23 Aug 2019 15:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6881674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566566481;
	bh=j5yTIS2tYzIN81lFsoUWBnCUdaRhag4+93cGrRBrW/s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o/hbzdgoATq2VI16DSdXT9Awxh57wXGUJ5iR/yiLufaXeo+bSSMYaxynAQpBFO7Y2
	 UN6/d1Ad6w/olfneaw2giuXtLOGhwsuhXXaIZdRNLsoyWMFE3v+gfadt8al2chT/OA
	 VlSOzJ3p7m4PnU+cKDzSkfNB2PshaVChXHwNMUY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 575EEF802FB;
	Fri, 23 Aug 2019 15:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02461F80306; Fri, 23 Aug 2019 15:19:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B8E4F80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 15:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B8E4F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mUnOqF6u"
Received: by mail-wr1-x442.google.com with SMTP id p17so8597769wrf.11
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZPOX0INdRlOUvoefxV/HDc1vutqvPxYj4fWM1wy0rw=;
 b=mUnOqF6uNCM6LcdyehIFjzjsqAEof9B3kEFEJZUVN62H3iSJhkiiVCYHQ96YMhS7pg
 WWQxX7Zi4CQ/Hh3F8NxgU/YpVIdxTlD8WDG2Qtaq/ydXMvpj3C8idH/Ml46oVakYSRxD
 6W3Tj1DIeuKn/rRGwr3eC0wJZCyMqsBKqGFmTNSeBrrr23oJNlbCIcaHm6u6FFoocaC/
 nmyGYShss+ThniPimc4+KAPMoD9enuctPgOIRGG+NrkXuYMVi7TBln7NIqhMZxoyR75g
 wPyvuX4jjMhc9QpsgJzCdI02ckNVcKlWZfPj2tL4KCFYZJviAwZuhb6IEUrGk3yGizqd
 /Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZPOX0INdRlOUvoefxV/HDc1vutqvPxYj4fWM1wy0rw=;
 b=he59wSPETmXlGzucgAtCklf2c/pazkkWr4xEHtr34JAQHNU8x/NfI9tstOuHSCVtbi
 NWUemG4KqNdR2AOdusqSVnCprykJ7zy/L05WXNPMvD7GqR19zTrPmkujzMD15lsaPs5z
 CPfm5y108F6ld2/jDG/gOT8lfQTtec18xYKUrQnn8B/yGP8fL3MytA4joL+UiWQSjy40
 XK7CZnkrMKcS1ySkwTZAH19Vyx0KP+tuVKoVdJRlrDI4NU8zweRZuP2s8pdS7K3Iw0zT
 PJ2z05jNgRCum29ImyPGZRxMS/4vPkg9dU8hjxgExgU1GYQrUXLhgv2ryQEAEIp2miZ6
 VPqg==
X-Gm-Message-State: APjAAAVW6wDqkz4vQidZrRQXvkqaquHq2lxfJta6/PrKVnahu8n3B8sg
 JHy4CdLH5P/0UFn80poUsQJZ7/2y0R+xsjOwCj8=
X-Google-Smtp-Source: APXvYqwyGM+XjqB1+xj7Yj+k9wbVw5I8l/PwOau11tLzSRWm/a4VmG0taIHdQ+qFDPb+UCQEGmlZKo4bD9c+QGFI4wc=
X-Received: by 2002:a5d:5408:: with SMTP id g8mr5348355wrv.201.1566566369129; 
 Fri, 23 Aug 2019 06:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190823125939.30012-1-yuehaibing@huawei.com>
In-Reply-To: <20190823125939.30012-1-yuehaibing@huawei.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 23 Aug 2019 16:19:17 +0300
Message-ID: <CAEnQRZA3reBF=H58596-e1xRLHLz5pVHZVhVgiXEmbV-wwOctg@mail.gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Make some functions
	static
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

On Fri, Aug 23, 2019 at 4:12 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fix sparse warnings:
>
> sound/soc/sof/imx/imx8.c:104:6: warning: symbol 'imx8_dsp_handle_reply' was not declared. Should it be static?
> sound/soc/sof/imx/imx8.c:115:6: warning: symbol 'imx8_dsp_handle_request' was not declared. Should it be static?
> sound/soc/sof/imx/imx8.c:336:5: warning: symbol 'imx8_get_bar_index' was not declared. Should it be static?
> sound/soc/sof/imx/imx8.c:341:6: warning: symbol 'imx8_ipc_msg_data' was not declared. Should it be static?
> sound/soc/sof/imx/imx8.c:348:5: warning: symbol 'imx8_ipc_pcm_params' was not declared. Should it be static?
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/sof/imx/imx8.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index e502f58..6404724 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -101,7 +101,7 @@ static int imx8_get_window_offset(struct snd_sof_dev *sdev, u32 id)
>         return MBOX_OFFSET;
>  }
>
> -void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
> +static void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
>  {
>         struct imx8_priv *priv = imx_dsp_get_data(ipc);
>         unsigned long flags;
> @@ -112,7 +112,7 @@ void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
>         spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
>  }
>
> -void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
> +static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
>  {
>         struct imx8_priv *priv = imx_dsp_get_data(ipc);
>
> @@ -333,21 +333,21 @@ static int imx8_remove(struct snd_sof_dev *sdev)
>  }
>
>  /* on i.MX8 there is 1 to 1 match between type and BAR idx */
> -int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
> +static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
>  {
>         return type;
>  }
>
> -void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
> -                      struct snd_pcm_substream *substream,
> -                      void *p, size_t sz)
> +static void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
> +                             struct snd_pcm_substream *substream,
> +                             void *p, size_t sz)
>  {
>         sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
>  }
>
> -int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
> -                       struct snd_pcm_substream *substream,
> -                       const struct sof_ipc_pcm_params_reply *reply)
> +static int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
> +                              struct snd_pcm_substream *substream,
> +                              const struct sof_ipc_pcm_params_reply *reply)
>  {
>         return 0;
>  }
> --
> 2.7.4
>
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
