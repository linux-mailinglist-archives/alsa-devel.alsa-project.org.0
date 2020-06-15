Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E931FA3EB
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7FC166E;
	Tue, 16 Jun 2020 01:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7FC166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592262684;
	bh=uGUperKe5bl9+DwrvJSAR5yJta3pexSEwk7ZPgimw5I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xa+SlFBUbnTHrg6/ObwkTyLvLJvrHPSXajeJ1176brMYxp/gifJ+dPnfDj9D8JICA
	 vLrF84Opk5gJKLKFbi2ZAN3a1mc1jAdpxqnnvwH1kUFYDbUz33pmZoECZOFpVzlMay
	 KX3Hi5IhYGUu4k/yU9A/tihajG//VOWA4CTzv4IE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4985F801D9;
	Tue, 16 Jun 2020 01:09:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C1AF80171; Tue, 16 Jun 2020 01:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BE60F800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE60F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s8SbpV8W"
Received: by mail-pl1-x643.google.com with SMTP id j4so4234922plk.3
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 16:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CZIooZOYrM4oHys2Fguf/RcobpmlQgsMJE5D3+t8a3E=;
 b=s8SbpV8WwE+0uXdhNI+KLlpCRXLu8JhAicTSsZd0QWEyp3xzmM+kv6/b09cNFeZR9b
 NyDyr9O3fHTyZZJbC35tGVkkhhhK4fQrNJKWcNsYu1cqWPa2Nz8U4H8G8oMx1/titCIq
 vcri45A7ClhV3TX54H+qbPHW+B7ZDeh0gkkggjoSwyWs2jF2GB8i5k3qHHKv8cndJBg+
 TLQZ+Rmd/pUaljPEbAAPV2TfUCqTa10psxgQqGI6kclZPUFV4zdvu09hIwCikTBLrFqD
 fjjTXYau6ovMG3DnPd9pHdBQcwxKgHebLUrUIckOzZroEG5NFovC9Qt/FA7t3JC07Dax
 8ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CZIooZOYrM4oHys2Fguf/RcobpmlQgsMJE5D3+t8a3E=;
 b=AajCy4LE/s1SYKQz/DbeHdh6XXcpED5uHtroWbG3SbNTwUUdSN13+46NzoFCZC7jrh
 Fne87hI6q7WoDcoOrZq4wyvHDxVQ54Q2I9sDNUqkYxJKLHpfRoTqa6JVNy6WZZXfvNuC
 O6lTQHjP8v2WX+V7fVzuaC88oXPMzu1TkHNZBs7/GJoT9DPq7KA6ijQLZ9jFUDNlzaWL
 4XbYfEYTDT1FlEXIExKem0+zs8ekXOl6b8QG6aEM93vgVYEpCwL1HnXIdNPSeE3o1I/D
 1M4TK4S1jjzWfKGIeoDEZuaYA4oYQydSDEID13xxFNOlYlx4bhzZHD8ugz5pJKnVy/3z
 NyUQ==
X-Gm-Message-State: AOAM530JiptM1bZ2y3wGUQHU0e9KQ3BeW4xdrHhBFOyA71gr/tmdaXlx
 ue7VRnVAIGvJ6j+K047GuCQ=
X-Google-Smtp-Source: ABdhPJzYmMCqNo7Tvi3y7s2FcqEPRPMQmasSc/gLlXeb0diBiZXjM3JRbdNbuH7POcVtectfAliYtA==
X-Received: by 2002:a17:90b:18c:: with SMTP id t12mr218974pjs.53.1592262570188; 
 Mon, 15 Jun 2020 16:09:30 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id u4sm466277pjn.42.2020.06.15.16.09.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 16:09:29 -0700 (PDT)
Date: Mon, 15 Jun 2020 16:09:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_ssi: Fix bclk calculation for mono channel
Message-ID: <20200615230912.GA16681@Asurada-Nvidia>
References: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Mon, Jun 15, 2020 at 01:56:18PM +0800, Shengjiu Wang wrote:
> For mono channel, SSI will switch to Normal mode.
> 
> In Normal mode and Network mode, the Word Length Control bits
> control the word length divider in clock generator, which is
> different with I2S Master mode (the word length is fixed to
> 32bit), it should be the value of params_width(hw_params).
> 
> The condition "slots == 2" is not good for I2S Master mode,
> because for Network mode and Normal mode, the slots can also
> be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
> to check if it is I2S Master mode.

The fsl_ssi_set_bclk is only called when fsl_ssi_is_i2s_master,
though I agree that that line of comments sounds confusing now.

> So we refine the famula for mono channel, otherwise there

famula => formula?

> will be sound issue for S24_LE.
> 
> Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> - refine patch for Network mode and Normal mode.
> 
>  sound/soc/fsl/fsl_ssi.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index bad89b0d129e..cbf67d132fda 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -678,7 +678,8 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>  	struct regmap *regs = ssi->regs;
>  	u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
>  	unsigned long clkrate, baudrate, tmprate;
> -	unsigned int slots = params_channels(hw_params);
> +	unsigned int channels = params_channels(hw_params);
> +	unsigned int slots;
>  	unsigned int slot_width = 32;
>  	u64 sub, savesub = 100000;
>  	unsigned int freq;
> @@ -688,9 +689,15 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>  	/* Override slots and slot_width if being specifically set... */
>  	if (ssi->slots)
>  		slots = ssi->slots;
> -	/* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> -	if (ssi->slot_width && slots != 2)
> -		slot_width = ssi->slot_width;
> +	else
> +		/* Apply two slots for mono channel, because DC = 2 */
> +		slots = (channels == 1) ? 2 : channels;
> +
> +	/* ...but keep 32 bits if I2S Master mode */
> +	if ((ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) != SSI_SCR_I2S_MODE_MASTER ||
> +	    channels == 1)
> +		slot_width = ssi->slot_width ? ssi->slot_width :

This looks very complicated...can you review and try mine?
(Basically, take 32-bit out of default but force it later)

@@ -678,8 +678,9 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
        struct regmap *regs = ssi->regs;
        u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
        unsigned long clkrate, baudrate, tmprate;
-       unsigned int slots = params_channels(hw_params);
-       unsigned int slot_width = 32;
+       unsigned int channels = params_channels(hw_params);
+       unsigned int slot_width = params_width(hw_params);
+       unsigned int slots = 2;
        u64 sub, savesub = 100000;
        unsigned int freq;
        bool baudclk_is_used;
@@ -688,10 +689,16 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
        /* Override slots and slot_width if being specifically set... */
        if (ssi->slots)
                slots = ssi->slots;
-       /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
-       if (ssi->slot_width && slots != 2)
+       if (ssi->slot_width)
                slot_width = ssi->slot_width;
 
+       /*
+        * ...but force 32 bits for stereo audio. Note that mono audio is also
+        * sent in 2 slots via NORMAL mode, so check both slots and channels.
+        */
+       if (slots == 2 && channels == 2)
+               slot_width = 32;
+
        /* Generate bit clock based on the slot number and slot width */
        freq = slots * slot_width * params_rate(hw_params);
 
