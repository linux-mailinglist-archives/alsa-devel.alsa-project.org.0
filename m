Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8006239D3B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 03:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D52165E;
	Mon,  3 Aug 2020 03:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D52165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596418202;
	bh=9tuP0lfwv5VlaoodZ9McRZtKeTxHTQb0h5NedbhK9fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFwNxgi4t/d6c3lA6NyoIezDb/5kwxUVCzjGrkyP2WWAUERN4K2aPaqfmwmmak3+G
	 vLOwdpZkmhveBejYbLGCQQC1qb7P4P1/VzXwJKYPDo+UuKKEvdxfpeED3nQV91t2nY
	 jbm7NOXOK9/iC8CrwrEk6+GnvRZ0pGb0fPFDETa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 774B4F8015A;
	Mon,  3 Aug 2020 03:28:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9777F80150; Mon,  3 Aug 2020 03:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB6C4F80141
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 03:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB6C4F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fEdiU72r"
Received: by mail-qt1-x841.google.com with SMTP id s23so27161588qtq.12
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 18:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdPTwt6GzaEE8ypkWcyEAGla3ExjJ1L9xlPLjdJjECo=;
 b=fEdiU72rgYUFv9VxZJS1kvdK2VZZ3oV8HbXncHDDjA5BQ65BZMi8GwdFhXl1Ye4PpZ
 bI1ijchagYxkSM4OfR2b6qC7gI4oNsmp9TcwMT80BR6lleR9ee9i7WFxeCVdvfuvSqLu
 UHltGgZaXzD77Vy6L32svJpXEJvmaB0fTCbw4JubQ2ny2imbJtgqROPHQyU2A7xfvrxs
 6n780V50p67eQizGGpyIKfBpqyIVN9iNtvGYaML06s2jMGegknEJIFwJkCfoSABhJba+
 +0zBty3ts1Q/agn7DV2tT6YXAfZFPp8/5OX+J35KOQdo+w55Gr6sS5hy+RTcU9Pacz82
 1f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdPTwt6GzaEE8ypkWcyEAGla3ExjJ1L9xlPLjdJjECo=;
 b=ffQdF+4CwNNIDjkFiD1TZ3Mv6l4eOjAXK6XB8SxIgfXzmrgV036JhXwJmbB493EeY+
 mhsUWa7fRRdPPYoh1HtrR2LNINThKe6Yva0+LiQmGnahOLewztRDov6H7ss80BxPw9K6
 45DJ5u69bcw73kT4B2og8tuw0sL6xGvA8vceJb5eG182EzvwnBzYnl+mDLkmEkXAHjI+
 +cX/qnmDN6cw6LAauhQ0ZmcHIhkspbn2Td06Yymdsa7ghmcOAzgLrDpD9AuU+aCue5Gf
 LNCg1w7SA+7E8amwDnOoyOsvoMthLAXZ5IRVejywAWDvSet0wkUyCy7mjUr05QxMyWdS
 FzMQ==
X-Gm-Message-State: AOAM530Wu9/mN7o+VLBalOtDcWLDR8+bqLdhvfQKyyMdm3O9RPZemyeK
 feYCX9zLNB5GCYo33Hdw1QhEkEl2yRCgB6LuAvs=
X-Google-Smtp-Source: ABdhPJwocfcyQPliB369D5sk19qV1NbUk9jBsxi7F2QFFlJFuMT6+0u0s+7ZI7bqi/ttnQcjQ9O5aO+qWGK5SbuojF0=
X-Received: by 2002:ac8:6d0f:: with SMTP id o15mr14208849qtt.121.1596418092106; 
 Sun, 02 Aug 2020 18:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
 <20200801075954.GA19629@Asurada-Nvidia>
 <CAA+D8AMM90bt_WbPCny6C=R=dv6gXXh49p59yng2vH7DDuD2PQ@mail.gmail.com>
 <20200802064351.GA24213@Asurada-Nvidia>
In-Reply-To: <20200802064351.GA24213@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 3 Aug 2020 09:28:01 +0800
Message-ID: <CAA+D8APexk_-o91B=u1bthVxXr_+gUL9Yq4UA5zscLfP3Xsa6Q@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, Aug 2, 2020 at 2:44 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Aug 02, 2020 at 10:22:35AM +0800, Shengjiu Wang wrote:
>
> > > > +     /* Specific configuration for PLL */
> > > > +     if (codec_priv->pll_id && codec_priv->fll_id) {
> > > > +             if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
> > > > +                     pll_out = priv->sample_rate * 384;
> > > > +             else
> > > > +                     pll_out = priv->sample_rate * 256;
> > > > +
> > > > +             ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
> > > > +                                       codec_priv->pll_id,
> > > > +                                       codec_priv->mclk_id,
> > > > +                                       codec_priv->mclk_freq, pll_out);
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "failed to start FLL: %d\n", ret);
> > > > +                     goto out;
> > > > +             }
> > > > +
> > > > +             ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
> > > > +                                          codec_priv->fll_id,
> > > > +                                          pll_out, SND_SOC_CLOCK_IN);
> > >
> > > Just came into my mind: do we need some protection here to prevent
> > > PLL/SYSCLK reconfiguration if TX/RX end up with different values?
> > >
> > Sorry,  not really catching your point. could you please elaborate?
> > Why do TX/RX end up with different values?
>
> If TX and RX run concurrently but in different sample rates or
> sample formats, pll_out would be overwritten to PLL/SYSCLK?
>
> I remember imx-wm8962 uses SSI, having symmetric flags for rates/
> channels/samplebits, but fsl-asoc-card might have (or will have)
> other use case.
>
> If all existing combinations don't have any problem, we can add
> a protection later when we need.

Good point. Current cases should be ok, as the boards with
wm8960 and wm8962 are all designed as synchronous mode.

Agree to add protection when needed in the future.

I will fix the nits and send v3.

best regards
wang shengjiu
