Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CA2355BB
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Aug 2020 08:45:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C331D16B9;
	Sun,  2 Aug 2020 08:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C331D16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596350753;
	bh=PQjgMmHGSIJKYrXf6CYzUAtDoryifNrUt65vg/DSxog=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t/GPFWplJisT7cDtowbZUJjcMfQk/plW1SNCbeKVdRB6cYZg/U74INbZRz+vweEPn
	 7M3ERYo20+h1zHmekVGjIING10lGiXPhzWPsz22MrdduqeXegjNEB873eOdzlVRsdu
	 Q6lQv5yZ9Tk0+wVwNH+HdPwKsKozFLrbdXlcxwPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEB7AF8014C;
	Sun,  2 Aug 2020 08:44:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B47CF80150; Sun,  2 Aug 2020 08:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26961F800B7
 for <alsa-devel@alsa-project.org>; Sun,  2 Aug 2020 08:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26961F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NVwzdDzr"
Received: by mail-pl1-x644.google.com with SMTP id r4so8605652pls.2
 for <alsa-devel@alsa-project.org>; Sat, 01 Aug 2020 23:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=X2aoqAI7ZyUC5Rm/QGa/RZ2mj9QoixqrEf8FBg4wiIE=;
 b=NVwzdDzrwGuTsH/vRGeNQFdLRqkgojk4/9Jlwet5zvG3h2zgFl7ZbxGfHRg8wffHUV
 1a/LFn1ZW7JNnr8JoVOER9hf2rBtohqBMf8T6rO54OBH+FuZOrRXdtqfQvvN0WPJ1W5k
 Q3ouXMqZXP7rj9EkRoqITzgshE5MVGBVCcl21FdPO4zv5GMcYT+AqefwIS03y+4sabBG
 u8MBuDWOZ6IoFpbrYGAQN9NyDt0kipob/5m0LYS2Nn5n+AMRR6tqwuWoauLGMtweZa5a
 30eeof/z+kPgHfve/tQG/b1IwEPqGVu6hzjIGyw67PY5Dex6SiMMHxTwzthlayu1G/A5
 MZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X2aoqAI7ZyUC5Rm/QGa/RZ2mj9QoixqrEf8FBg4wiIE=;
 b=eeM5OwI1pY76P7zgxlUlUuH7q4d1jE/J0Sckbh6CYMOakjUSgsY20TAp1z/LCODFld
 p6RZ9htvOAlLVKyx65iuF1rKEkO+oCHXpco+2GdE3TLnklUNPicmoHfrrr8WOqO/De8O
 oY6YeguJ7laGfWzRTuRuRNse5yz38WKsMW2/FmFUBCEyUXWuXmgHRpozWOX5HvQUVW+C
 WyDMO286M+hvCIk9c5FVaAcfe/D6+Yknnn05gqH4icV9qvR44eiM29pKIuDtMzfrrFH3
 g8WXr/dwI8YcpEEFwl87wd9aL5vY+4SEOnOXj322ATFuqw2oTZ/M3moBicTK6t12m85f
 +mdA==
X-Gm-Message-State: AOAM5339KS8nN8XPCL8kyL0Tj8RAzVzxV+pk4jBOaoqLFRuZQ/kIs+4n
 JDd/boENpXsAPCB6H91sNbw=
X-Google-Smtp-Source: ABdhPJzT67tILFTVcT+5Nq4nLiq/ChOlKvzNLIZhqH09UIVzSNlqRhHDagQVesDQEPfSG0+9p5y7aQ==
X-Received: by 2002:a17:90a:6285:: with SMTP id
 d5mr11743122pjj.85.1596350642900; 
 Sat, 01 Aug 2020 23:44:02 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id f18sm15347558pgv.84.2020.08.01.23.44.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 01 Aug 2020 23:44:02 -0700 (PDT)
Date: Sat, 1 Aug 2020 23:43:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
Message-ID: <20200802064351.GA24213@Asurada-Nvidia>
References: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
 <20200801075954.GA19629@Asurada-Nvidia>
 <CAA+D8AMM90bt_WbPCny6C=R=dv6gXXh49p59yng2vH7DDuD2PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AMM90bt_WbPCny6C=R=dv6gXXh49p59yng2vH7DDuD2PQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Sun, Aug 02, 2020 at 10:22:35AM +0800, Shengjiu Wang wrote:

> > > +     /* Specific configuration for PLL */
> > > +     if (codec_priv->pll_id && codec_priv->fll_id) {
> > > +             if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
> > > +                     pll_out = priv->sample_rate * 384;
> > > +             else
> > > +                     pll_out = priv->sample_rate * 256;
> > > +
> > > +             ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
> > > +                                       codec_priv->pll_id,
> > > +                                       codec_priv->mclk_id,
> > > +                                       codec_priv->mclk_freq, pll_out);
> > > +             if (ret) {
> > > +                     dev_err(dev, "failed to start FLL: %d\n", ret);
> > > +                     goto out;
> > > +             }
> > > +
> > > +             ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
> > > +                                          codec_priv->fll_id,
> > > +                                          pll_out, SND_SOC_CLOCK_IN);
> >
> > Just came into my mind: do we need some protection here to prevent
> > PLL/SYSCLK reconfiguration if TX/RX end up with different values?
> >
> Sorry,  not really catching your point. could you please elaborate?
> Why do TX/RX end up with different values?

If TX and RX run concurrently but in different sample rates or
sample formats, pll_out would be overwritten to PLL/SYSCLK?

I remember imx-wm8962 uses SSI, having symmetric flags for rates/
channels/samplebits, but fsl-asoc-card might have (or will have)
other use case.

If all existing combinations don't have any problem, we can add
a protection later when we need.
