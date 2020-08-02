Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E262354E0
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Aug 2020 04:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4757A16A9;
	Sun,  2 Aug 2020 04:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4757A16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596335109;
	bh=kViwOdzwtBRtsEQ6QfGohgiEch4OfgnzVpfS0xLr9l4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=krYGdYeVn4+itSwRuLK4tX3iK0ixZY5uUNxxjv+QRWlJywRa1YLkxLyr+pqAxOUgN
	 gVzFG7VQJOEfy0jbsUBvOvCj9yjWiOTm8sVCGL72Khek5tQml1IUzmdwAqle3uuWRd
	 rgIfVFREGhumd4afOD59y5LJENPDHISc9Np6mIcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6823BF8011C;
	Sun,  2 Aug 2020 04:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AAB0F80150; Sun,  2 Aug 2020 04:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 416D2F8011C
 for <alsa-devel@alsa-project.org>; Sun,  2 Aug 2020 04:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 416D2F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GT+DUHoL"
Received: by mail-qt1-x843.google.com with SMTP id 6so25966349qtt.0
 for <alsa-devel@alsa-project.org>; Sat, 01 Aug 2020 19:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=whOvptctYszI0TUoSb9wHwW4EucWmLnWHPSIiYGN8Wg=;
 b=GT+DUHoLyEtK/qt+Sl6m8Mf+/U/Q8YGwJbZQspRR/1cq9u8FUPWTRWwLNmCNY3JUxP
 1qy9NrIWokY2Vnh7eWIHVvWNN5jtyeXj1JPKyU8nDJI/CCYA68tNtCURbY1tL7UPSc22
 3yQnM1wHR4Oe1023lD3cRY5PbLwT8Y8bxZbGaQSMrfZFWR5vI1is0il6HOs5wNN5daUe
 vO1Qsh5a4CntBIYA5kpBv+7RBsOsRwopAO37ClYQyoNZsx5K78yetewKgHCZehgNRd1k
 ZXThfFVMGKnTMdCRlnBGkrkWCfpcbnow50sw+sjZSScZkiOLCNWLhMd53Pxwj9zNvb52
 idag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whOvptctYszI0TUoSb9wHwW4EucWmLnWHPSIiYGN8Wg=;
 b=XqrE+hYY0t4ooKZiUzQGegIpIszWgi5xrhDKVwfLAkSnPtqZs1Kj2mA4b7uZ9dRhL1
 fF9Th27cUA4ujGKFUMs8k9PWT0oPOiXdoDqM+zBPgz0HyA4e8A7khJ8qPjiW1/A1fGyC
 0NWI+HnPHkoMGimnVvBIeL1to5JIwlP82GyL/G5UnvrAtIqHkZOjyhtmQSq9J0Hd+Xyo
 uoMNk/iyWBMT/wT8PQcH9n3jcj9/dsZRjVdPFSYJkWIUDrh2OIMwuKe7zLdFTTjTAokW
 m14B40QtCDVoEvQleb7yux3y3C+S/VIOyI6PZDBJY8shBkNHh5nieQzsHVSX8zOse5c0
 8PsA==
X-Gm-Message-State: AOAM530WLtrAZgDXJkOllo/EPO5LCTUT1jXErvBKQNQKdKvO9IEItX2s
 FzHvosaECFaxFlkZcasA6xBLKeaKtGkC8v9SFM8=
X-Google-Smtp-Source: ABdhPJx+oNY0MJ6Pd5AOYnXI12LGvR++U9v1s05zQk6gTj0oayzG0KE5Co6SYk/c4xn465qVOihcKPEWfsGkyGTJ6ws=
X-Received: by 2002:ac8:450c:: with SMTP id q12mr10542733qtn.292.1596334966873; 
 Sat, 01 Aug 2020 19:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
 <20200801075954.GA19629@Asurada-Nvidia>
In-Reply-To: <20200801075954.GA19629@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 2 Aug 2020 10:22:35 +0800
Message-ID: <CAA+D8AMM90bt_WbPCny6C=R=dv6gXXh49p59yng2vH7DDuD2PQ@mail.gmail.com>
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

On Sat, Aug 1, 2020 at 4:01 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Hi,
>
> Having two nits and one question, inline:
>
> On Thu, Jul 30, 2020 at 05:47:02PM +0800, Shengjiu Wang wrote:
> > @@ -182,6 +180,69 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
> >                                              cpu_priv->slot_width);
> >               if (ret && ret != -ENOTSUPP) {
> >                       dev_err(dev, "failed to set TDM slot for cpu dai\n");
> > +                     goto out;
> > +             }
> > +     }
> > +
> > +     /* Specific configuration for PLL */
> > +     if (codec_priv->pll_id && codec_priv->fll_id) {
> > +             if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
> > +                     pll_out = priv->sample_rate * 384;
> > +             else
> > +                     pll_out = priv->sample_rate * 256;
> > +
> > +             ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
> > +                                       codec_priv->pll_id,
> > +                                       codec_priv->mclk_id,
> > +                                       codec_priv->mclk_freq, pll_out);
> > +             if (ret) {
> > +                     dev_err(dev, "failed to start FLL: %d\n", ret);
> > +                     goto out;
> > +             }
> > +
> > +             ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
> > +                                          codec_priv->fll_id,
> > +                                          pll_out, SND_SOC_CLOCK_IN);
>
> Just came into my mind: do we need some protection here to prevent
> PLL/SYSCLK reconfiguration if TX/RX end up with different values?
>
Sorry,  not really catching your point. could you please elaborate?
Why do TX/RX end up with different values?

best regards
wang shengiu
> > +     return 0;
> > +
> > +out:
> > +     priv->streams &= ~BIT(substream->stream);
> > +     return ret;
>
> Rather than "out:" which doesn't explicitly indicate an error-out,
> "fail:" would be better, following what we used in probe().
>
> > +static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> > +     struct codec_priv *codec_priv = &priv->codec_priv;
> > +     struct device *dev = rtd->card->dev;
> > +     int ret;
> > +
> > +     priv->streams &= ~BIT(substream->stream);
> > +
>
> > +     if (!priv->streams && codec_priv->pll_id &&
> > +         codec_priv->fll_id) {
>
> This now can fit into single line :)
