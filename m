Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 476221F7DA2
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 21:31:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85721681;
	Fri, 12 Jun 2020 21:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85721681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591990310;
	bh=tp5IWUyotW+T5shk3CQSPIWwuz8oGz8bxMaBulbtFfQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcVsXmu/QOdRkRI5RSbtWn8d940s8J0ZyjoMa6ttZ2mwCjXRMv8Dnk2JhEi5VIoTl
	 Wq63PwLGAHQ0h4D2/nuudkqGHN+VIZt3Ylz4f7zopZY7/TPslAEl4hHXtHMawNlutR
	 D2fGeF3/GAVRmMLb08w64BTnheMWCJR5lX7V5qeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4AB7F800CC;
	Fri, 12 Jun 2020 21:30:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5558F8021C; Fri, 12 Jun 2020 21:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDA91F800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 21:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDA91F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MrnP4M4K"
Received: by mail-pf1-x444.google.com with SMTP id j1so4773490pfe.4
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a4a2Pl1CFSq1GWe8QgYdCA4ph+xymGtgDfDZzT+4IG4=;
 b=MrnP4M4KchL7FJOLTbUbPeOpodea9cEMKXenI/A9XfvsliD4gdI1bSGbPo1HCq+PeH
 oUhU47XbIwNvM0D9ph7ctwVBwr6W40VlCNZqs43FVd5nzcvHLD8M3/uHBHRYkXCtQEHA
 cxH82FsGLEeN7WqHFmUaIBmBaCyCejKE+QWjR20w+l2Bu/ILF2kFdtUMYtYx8UjGpkZN
 wUnCINgTl53WsnF/rjdzmuwWp7QCP+QFIaJdK85+DncHWScwDNghqbdUEfYwLtmHe+XC
 MiRMHphwN+URaJvMgL+HNSAasFx3k3VYwsdevmtFcSaot4+UFugcdAPD0ynpq9es6vxi
 WVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a4a2Pl1CFSq1GWe8QgYdCA4ph+xymGtgDfDZzT+4IG4=;
 b=lsWjuLd74blRv/1BZHVx213KAJKCGNtNsxHknKrNM1ajM+qZThMBzgNuweXSzRst8P
 m8pIRa9onQrZQh+0zewJp/NNwo+Q9d7o+TTVBNdyc4HGRK0PszhNkDiQL8K93mFevirW
 k/NNn0GNuoUzDNen6epj/TO6Pv9UnEl/hx7JX3AQgIh97MIRg257RBi92/pC+WjJFyD+
 SpjJguionZBQMJ44JOxOKW8as3Ub6JvV4yL5LtWe+mj1NBqdV9HbaEo9S/Fz8y2UYSg9
 mgWRUdihi+vTJEJGpOAGLHfBVURIvcmGg2r+SBVVkztHhH1pwGzEcfhZtfOyX5DLCyao
 nYEg==
X-Gm-Message-State: AOAM533acAdhFfu/0CprE5yE3I4mL43nGPJw1T4YaHUYPTrRIAS8F5BI
 XtBwRzbplFHn1YqcXC+DPtc=
X-Google-Smtp-Source: ABdhPJwseWqOvjBDHGRP7yoAe1UiXi1K4/GCKgBeAGhWekH7P5Vblc/Zm0oGbIJRoz6jgvwLhh+5gA==
X-Received: by 2002:a65:5349:: with SMTP id w9mr12392157pgr.281.1591990194780; 
 Fri, 12 Jun 2020 12:29:54 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id c1sm6977123pfo.197.2020.06.12.12.29.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 12:29:54 -0700 (PDT)
Date: Fri, 12 Jun 2020 12:29:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_ssi: Fix bclk calculation for mono channel
Message-ID: <20200612192942.GA26587@Asurada-Nvidia>
References: <1591690768-1691-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591690768-1691-1-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, Jun 09, 2020 at 04:19:28PM +0800, Shengjiu Wang wrote:
> For mono channel, ssi will switch to normal mode. In normal
> mode, the Word Length Control bits control the word length
> divider in clock generator, which is different with I2S master
> mode, the word length is fixed to 32bit.
> 
> So we refine the famula for mono channel, otherwise there
> will be sound issue for S24_LE.
> 
> Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_ssi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index bad89b0d129e..e347776590f7 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -695,6 +695,11 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>  	/* Generate bit clock based on the slot number and slot width */
>  	freq = slots * slot_width * params_rate(hw_params);
>  
> +	/* The slot_width is not fixed to 32 for normal mode */
> +	if (params_channels(hw_params) == 1)

This function has a local variable that you can reuse here:
	unsigned int slots = params_channels(hw_params);

> +		freq = (slots <= 1 ? 2 : slots) * params_width(hw_params) *
> +		       params_rate(hw_params);

We have a small section of slots and slot_width calculation
at the top of this function where we can squash these in.
