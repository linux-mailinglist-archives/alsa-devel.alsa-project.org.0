Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABE1FC668
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 08:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A2111675;
	Wed, 17 Jun 2020 08:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A2111675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592376591;
	bh=K+8JhAgCErF0K/0j54F9XkJmYl2XIe7cMWR4HiCgMOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5h9+jTQcp/kXb7ffxMEzYOJNbC/4Pb5/IotoePi4x36Pyn7JkzBkknPCjgnC8xXH
	 FKyID8+PFcbELW/MGA95exf9pKlsa7Cnc9J9xxkNr8KMoXy15rTGOXdkEooi6wm8oE
	 ebOdwjtuAPw6R6z+APV2lvMgLGdMpZVaQ2mI+RKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F0C8F80162;
	Wed, 17 Jun 2020 08:48:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A467F80171; Wed, 17 Jun 2020 08:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F40E2F80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 08:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40E2F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="odqwFLWO"
Received: by mail-qk1-x742.google.com with SMTP id b27so1075768qka.4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 23:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEOcBwuJujk3Z3FbvmUIja3o6yp5Y5I7OHP6v1ayOdc=;
 b=odqwFLWOfz6VFUZ/AEzD/ygRf/c/++SDJbNN/nwQZkGYj3C6pFFoLlEjFCrjxZnWnZ
 /AXyjECC4SETvu2arNrXc95u4TnzXHHqyDF/78eOtDBo6dibwL8+9lRcggEsnlwVQylQ
 Q6I9RWdTF9CTRakRQnCWZ15SP/vM1mxe7/0K8Ox0WcMFOZtvH87w9Kq6KK9S8dN6tZgz
 scyATY9N9Cqf2C8Yjyt4ZoRiMfOrA3xAq6nE7/EB69NaaPNXIztJjRQI5LyEp/Vgc1tS
 it112IuMOvThGIVcZT1bvRazXFl1FSC3dkTQaQZZAoFopsPy+ebRoNsXOxsCSPGsWH32
 17rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEOcBwuJujk3Z3FbvmUIja3o6yp5Y5I7OHP6v1ayOdc=;
 b=KRz9J4PeSE8ZCwYdb+nw7KD2bMc6ZOpJ6Ydc3X3gIYWUhH0YiV/BKYVzAUg0UQo/Lk
 CxzpIfsXCH/U/JDfimyvf4xFFxgZ5pkw5IZA/IXCajQFgcVJm3+rg3cDFdealFb0EiI/
 dlhONveQv2dMgeG8303heHEol2hO8NSnNAp2vU8b8+jjWjQKQhJpf+aXALNQrJU6DUpv
 VH+e7Tk/4UOAqLKyEGNkGLESnyZtuct+2GODcYw/+B4/njGeEhKFWEAH3YY8Zi5kx/Nn
 ZIwC2DU08XeEim+ovAe9LWOEYhGf7CAE9K/EZmMCebxXBopMhRE8jY04hyu5gSJIvI4Y
 PHKw==
X-Gm-Message-State: AOAM532sG18KY5Ly749asUam9xQlWjZrT7yKAzSeWMk6QChumAYxJyxl
 BfR+WHGtWFfQ7cDWk6g0f9b/mHddsEdUoQ5MZxE=
X-Google-Smtp-Source: ABdhPJyNV3aHDegvpKj24F79ISjdEF6CE/prSki/wKRdyu+fjUIjtIU5SobzxF++F/MAqTGJ6CjQl08XmDfeZGFvGf8=
X-Received: by 2002:a37:8a43:: with SMTP id m64mr23295848qkd.37.1592376473937; 
 Tue, 16 Jun 2020 23:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592368322.git.shengjiu.wang@nxp.com>
 <53a969a83999de91f3ff2809d78335c3f0cc1ee3.1592368322.git.shengjiu.wang@nxp.com>
 <20200617062457.GA6411@Asurada-Nvidia>
In-Reply-To: <20200617062457.GA6411@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Jun 2020 14:47:43 +0800
Message-ID: <CAA+D8AOBA2pM0CXpdEO7NS1fdK8Nv=4gRDQ384v6mV9ip6Ke2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Wed, Jun 17, 2020 at 2:27 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Jun 17, 2020 at 12:30:17PM +0800, Shengjiu Wang wrote:
> > The one difference on imx6sx platform is that the root clock
> > is shared with ASRC module, so we add a new flags
> > "shared_root_clock" which means the root clock is independent,
>
> "shared" means "not independent", against "independent" ;)
>
> > then we will not do the clk_set_rate and clk_round_rate to avoid
> > impact ASRC module usage.
> >
> > As add a new flags, we include the soc specific data struct.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> Can add this once fixing the remaining comments:
>
> Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> > +static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif,
> > +                                           int clk)
>
> Can actually merge into single line as kernel has 100-character
> limit now, though 80-char is still preferable for a good coding
> style. But I think this one wouldn't be too bad at all.
>
> > @@ -421,7 +456,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
> >       sysclk_df = spdif_priv->sysclk_df[rate];
> >
> >       /* Don't mess up the clocks from other modules */
>
> We can drop this comments now as it's out-of-date and the name of
> the new helper function is straightforward enough.
>

ok, will send v3.

best regards
wang shengjiu
