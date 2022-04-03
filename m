Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7764F0840
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 09:16:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D61B168A;
	Sun,  3 Apr 2022 09:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D61B168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648970219;
	bh=Puosx4ScBJ1d6mX7dzd4LfScEkjyaJqMLV7/dbri1Gg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAplunfKwfbuXAVVEE04IelnUHVtgHhZ62OLeE2xWK+/9n+bgzrhrqC3RZDM0Belj
	 ROvjgpU32M5QtBeYXjdfWF8WBjlNoEtdkSWeuVrCOEifNk8Lo0cRdIrlh5bNwTK3bL
	 6+RF/nKO6HOMhZA/eC9arH95NbVe/psODt9VvwLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86790F8028B;
	Sun,  3 Apr 2022 09:15:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DAFCF8012A; Sun,  3 Apr 2022 09:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA15CF8012A
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 09:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA15CF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qo2t7nuA"
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2eb46d33db9so17310377b3.12
 for <alsa-devel@alsa-project.org>; Sun, 03 Apr 2022 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ico19JA9GM1O/bamMVefJvScGGPa2Lrj2Zc1+4P3Dk=;
 b=qo2t7nuAanNyShzJs/m0KlPwYeN9qpYNzHsYelLVUb2PNs9YGroYb0QL4chF5qTOSL
 u/EKCIP3IE46DZANB0DLpNf26qDX6ABIsmYWV9Z/f+LybfmqazCiNDvQw9UxO07CTld8
 Sk0xP1fzpPRNXJE8k6CkhGFQ9oGigFmUwn//xjvEYv7dKaOc0QGIUubd0y2I2cnIl0xJ
 /HL8KOYAgrdwavKhJv2A/U/r32UUKL19657BcYRf4iRGI+KK5VgLwdrl8ir1zeyfA0IS
 em7NfctS7baSBoi6wrr2iAVVLR1EbLguqkz+HWAKz2A2VcIz0lPAcfc0nac5u4tmpUpZ
 ATNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ico19JA9GM1O/bamMVefJvScGGPa2Lrj2Zc1+4P3Dk=;
 b=PcXuXC9cmGImi/ssG53kSchw3i/nvzYdNXhPUUIm6oweH0rhFXnOnkPUDOPFr1523d
 DselZg3E4uku2VerGPWID9tiqHplVqdbotqOJ3pfFLXmZPvgGxB2ov53yQXnCw2Uz/oq
 d5QEthnyinu9+D+MHyLieYVUDErDKJ570GvslkJ9FfSHvqLm832sGU6AO5aqhfmQszVM
 /mWwTWc0UxRssEgZ8myitXJfT1vi+BC72N6iM2xbUx8WobK8SoK5ydktWdw87vf5DbGA
 K2Uqpn71zT4OLQYH30M2Qj/LsjOCSaE98KRFG9RhIm6jRrAfft+ltLIPZ/02gFrk3Mpn
 Rwcg==
X-Gm-Message-State: AOAM530WzVWl9Kd5gTNVAyAQrx+M8ULlFj/xZmO9PWS+qIxMGLCxa3nC
 HYJ4WKHov03C7RB3vuDXcj2AuwAKI2ZQ0jYSpLg=
X-Google-Smtp-Source: ABdhPJxKdHGO5wEnJx1da4CESMJxQvp/xmr8bKemy8fruAhYWGq2jYiClxmZKW8HCNdyfXkNV4G3fZut275u30L10eg=
X-Received: by 2002:a81:6c4b:0:b0:2e5:e0c0:3eaf with SMTP id
 h72-20020a816c4b000000b002e5e0c03eafmr16978188ywc.408.1648970142661; Sun, 03
 Apr 2022 00:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220307084523.28687-1-linmq006@gmail.com>
 <93751991-30ce-93a0-0f33-105f99b8dfe3@wanadoo.fr>
In-Reply-To: <93751991-30ce-93a0-0f33-105f99b8dfe3@wanadoo.fr>
From: =?UTF-8?B?5p6X5aaZ5YCp?= <linmq006@gmail.com>
Date: Sun, 3 Apr 2022 15:15:31 +0800
Message-ID: <CAH-r-ZGw+toVfasD-45p4Z4Rryn2advNOZbgJd0g4SGw_Kd6FQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: msm8916-wcd-digital: Fix missing
 clk_disable_unprepare() in msm8916_wcd_digital_probe
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Hi,

Yes, I agree with you. We should check the error code of
devm_snd_soc_register_component() and do corresponding
handling.

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E4=BA=8E2022=E5=B9=B44=
=E6=9C=883=E6=97=A5=E5=91=A8=E6=97=A5 13:51=E5=86=99=E9=81=93=EF=BC=9A

> Le 07/03/2022 =C3=A0 09:45, Miaoqian Lin a =C3=A9crit :
> > Fix the missing clk_disable_unprepare() before return
> > from msm8916_wcd_digital_probe in the error handling case.
> >
> > Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> >   sound/soc/codecs/msm8916-wcd-digital.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/msm8916-wcd-digital.c
> b/sound/soc/codecs/msm8916-wcd-digital.c
> > index fcc10c8bc625..9ad7fc0baf07 100644
> > --- a/sound/soc/codecs/msm8916-wcd-digital.c
> > +++ b/sound/soc/codecs/msm8916-wcd-digital.c
> > @@ -1201,7 +1201,7 @@ static int msm8916_wcd_digital_probe(struct
> platform_device *pdev)
> >       ret =3D clk_prepare_enable(priv->mclk);
> >       if (ret < 0) {
> >               dev_err(dev, "failed to enable mclk %d\n", ret);
> > -             return ret;
> > +             goto err_clk;
> >       }
> >
> >       dev_set_drvdata(dev, priv);
> > @@ -1209,6 +1209,9 @@ static int msm8916_wcd_digital_probe(struct
> platform_device *pdev)
> >       return devm_snd_soc_register_component(dev, &msm8916_wcd_digital,
> >                                     msm8916_wcd_digital_dai,
> >                                     ARRAY_SIZE(msm8916_wcd_digital_dai)=
);
> > +err_clk:
> > +     clk_disable_unprepare(priv->ahbclk);
> > +     return ret;
> >   }
> >
> >   static int msm8916_wcd_digital_remove(struct platform_device *pdev)
>
> Hi,
> I think that the same should be done for 'priv->mclk' if
> devm_snd_soc_register_component() returns an error.
>
> Can you give it a look?
>
> CJ
>
