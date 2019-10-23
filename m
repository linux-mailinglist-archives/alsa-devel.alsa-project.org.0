Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D7E2285
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 20:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4DC165F;
	Wed, 23 Oct 2019 20:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4DC165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571855600;
	bh=vIxPwswX5VSZ6nXTw9x/wD+7zsFkXpskMNqjWfq5QAE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0gfA7iKzdPho405q5mGbfYEyVs1zUFOCGJQLDVhYFwVLz6qjCCMcY+sOdseDLUp5
	 EGjlY5u2y6pHxPFE7W171I5kBcA6gRR6CpKxtFtxCYNb6sBqfwIOYsW0/BPIVs+vO8
	 7kTTMaaORaYk2xwjYw0C4vG0wJT8bRhs3x3q1tks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAD91F80274;
	Wed, 23 Oct 2019 20:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB13DF80368; Wed, 23 Oct 2019 20:31:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B30CF80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 20:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B30CF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O0V7U6xd"
Received: by mail-pg1-x543.google.com with SMTP id p1so12641356pgi.4
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QhucI9QNtNBjoT1eOT78ESBAn4mEJQ0ycZgAHsd53Fc=;
 b=O0V7U6xdxg3UJAoCsFL181e1vuQig/OWqm5AcucL89tYd3b9qkjvMM9lP+EMxIsd/D
 nULS8++93595dJ/MuPxdOiWNwPro4vx1uibpDaTFOBc/mbbfnZWArkgAkdi/1Sj4/3pn
 CnpHhKkutuirpbGJ15oFkWcPeKybaQuwdY/Oazfd9/NO6HOUG/4hvUOU/gPflhn79F4c
 jtn03qKJHmp9p9aXWAi6MaSW2jHtLl2JfuzxfmqRrM5JSt3BefvV2/wNb5KsF+eiNmTo
 9HFMS5Pxk97txKDYDYBY6kMTP4UH0oyklI+Gu8j1EQSiUodwRt97MzOGork+gaeFtCPn
 6VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QhucI9QNtNBjoT1eOT78ESBAn4mEJQ0ycZgAHsd53Fc=;
 b=V+Cdu0k0D5cjEP2WSDiiRSU64JvZLJMu5Uej0/9do9uOen1QehNOIttyUt2JSiHN5l
 ZF8JieAnxESH5F27X+Bi3e9UQ9m51Cf5z7r6kYJTQCe1qVcGh+B2et9BuXAmIhME1mfM
 nKhvCt8fHXZvRcz/R8JrkrOL6bz6SDWN+4D2H/wpOmhSP/voMfL9OSwOd8du18/m9jbG
 mMU+kbqyd2Tl8evu3eGYDo41rWRQc754Mb9/Si3xyHXulgDZ5EqiLq+CGTnDf8+q5IE0
 mX9+aEociKFzSbw5MLMsNhwmubVghXZB8FYSwhDfJO8ID1RxMIpnLyXbQjcQ8EgT6ra5
 ELwg==
X-Gm-Message-State: APjAAAUUCs8ex3I9nvOQ11ggmQvsRiQcU1Y6vy9rU3brd++ZvfPG6/23
 mwcomzH7JGJm2/pxCgb0Uc4=
X-Google-Smtp-Source: APXvYqxzu1oD36VJIGp854tNQIRLLmtcz4McKHR96Hyw1WByLg+NWOb5VOZ+kJaLQ35nHQjMgw5vEw==
X-Received: by 2002:aa7:8ac5:: with SMTP id b5mr12396158pfd.66.1571855488547; 
 Wed, 23 Oct 2019 11:31:28 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z4sm30137417pfn.45.2019.10.23.11.31.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Oct 2019 11:31:28 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:31:03 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191023183102.GA16043@Asurada-Nvidia.nvidia.com>
References: <1571815789-15656-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571815789-15656-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_esai: Add spin lock to protect
	reset and stop
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

On Wed, Oct 23, 2019 at 03:29:49PM +0800, Shengjiu Wang wrote:
> xrun may happen at the end of stream, the
> trigger->fsl_esai_trigger_stop maybe called in the middle of
> fsl_esai_hw_reset, this may cause esai in wrong state
> after stop, and there may be endless xrun interrupt.

What about fsl_esai_trigger_start? It touches ESAI_xFCR_xFEN bit
that is being checked in the beginning of fsl_esai_hw_reset.

Could the scenario below be possible also?

1) ESAI TX starts
2) Xrun happens to TX
3) Starting fsl_esai_hw_reset (enabled[TX] = true; enabled[RX] = false)
4) ESAI RX starts
5) Finishing fsl_esai_hw_reset (enabled[RX] is still false)

Thanks
Nicolin

> So Add spin lock to lock these two function.
> 
> Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_esai.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 37b14c48b537..6a797648b66d 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -33,6 +33,7 @@
>   * @fsysclk: system clock source to derive HCK, SCK and FS
>   * @spbaclk: SPBA clock (optional, depending on SoC design)
>   * @task: tasklet to handle the reset operation
> + * @lock: spin lock to handle reset and stop behavior
>   * @fifo_depth: depth of tx/rx FIFO
>   * @slot_width: width of each DAI slot
>   * @slots: number of slots
> @@ -56,6 +57,7 @@ struct fsl_esai {
>  	struct clk *fsysclk;
>  	struct clk *spbaclk;
>  	struct tasklet_struct task;
> +	spinlock_t lock; /* Protect reset and stop */
>  	u32 fifo_depth;
>  	u32 slot_width;
>  	u32 slots;
> @@ -676,8 +678,10 @@ static void fsl_esai_hw_reset(unsigned long arg)
>  {
>  	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
>  	bool tx = true, rx = false, enabled[2];
> +	unsigned long lock_flags;
>  	u32 tfcr, rfcr;
>  
> +	spin_lock_irqsave(&esai_priv->lock, lock_flags);
>  	/* Save the registers */
>  	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
>  	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
> @@ -715,6 +719,8 @@ static void fsl_esai_hw_reset(unsigned long arg)
>  		fsl_esai_trigger_start(esai_priv, tx);
>  	if (enabled[rx])
>  		fsl_esai_trigger_start(esai_priv, rx);
> +
> +	spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
>  }
>  
>  static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
> @@ -722,6 +728,7 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  {
>  	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> +	unsigned long lock_flags;
>  
>  	esai_priv->channels[tx] = substream->runtime->channels;
>  
> @@ -734,7 +741,9 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		spin_lock_irqsave(&esai_priv->lock, lock_flags);
>  		fsl_esai_trigger_stop(esai_priv, tx);
> +		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -1002,6 +1011,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(&pdev->dev, esai_priv);
>  
> +	spin_lock_init(&esai_priv->lock);
>  	ret = fsl_esai_hw_init(esai_priv);
>  	if (ret)
>  		return ret;
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
