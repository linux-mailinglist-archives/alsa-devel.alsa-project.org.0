Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF1F218F40
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1D721607;
	Wed,  8 Jul 2020 19:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1D721607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594230788;
	bh=MxnLLsxUD5ExepmnjpAPZ9UfGK3+rupEWwYpk4ZyIH8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Comx+a8jM3EjrjhPT0Nl+/4uXAudvb13wi777uH7kDUibwi45IeDrI9fDrdlSaLUr
	 X0Pxe/7tujq+x6BqoO1wBibNTSP+GNFoq/cii/sibat/pJYq/3sFVV5dm+TDvisyXH
	 aosUE7F3f0/z84u7bBGk8Ku+kxGVPw6Zu3o41gSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A89EF8015C;
	Wed,  8 Jul 2020 19:51:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 679F3F8015A; Wed,  8 Jul 2020 19:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20151F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20151F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="OzA7R+pv"
Received: by mail-wr1-x444.google.com with SMTP id s10so49865599wrw.12
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7SQJhbW9iFT0GAfAIqHssBvgsuF+/Q2rlb1LOfoE3Dg=;
 b=OzA7R+pvW5s80iDwljKpzPfzJpi33QbPyL02J9vQRicBjee/2//LIsykAXKhMqcvfx
 7rPtOGJEBnbi78A8LFqY0fQ2wG5o4Ekz8g18p+6qFlIXZZerwp76g2kRTc+rOfrd1m/0
 Xl04VzboUPA0mE62FIpPY3fScjYQkYR8qTSy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7SQJhbW9iFT0GAfAIqHssBvgsuF+/Q2rlb1LOfoE3Dg=;
 b=kadyt5TW4q9teagH4z5OV5xYXCKkh99rLWXrCbKEW+hCDaopOYgki5ZxKclMhJDzbS
 jIHyGoMfwl6syjR1ZCWenlTLtwHM5IHgw5V/+/ZC5MpPrL0nYUSzP5fp2BwCect1TLCT
 vifc323Tu+j4stFGLlvsp59VlhYDgUq2bhjT0uFKtt5fFtBITPUhHKyGIMmRMFJA30fs
 xeVrU3dXwZHwdhs67XUn7qeoc4eCT9he5KWUVaVhT7QL3NTkqfrxoZwYCUMBI7h7ot7y
 PIkYqML7+ib63Gg2jOLDdymrZvdN+rat/yShJtVs6xxahl5DtRi03z5Vdy7uRyolCcl8
 IYZA==
X-Gm-Message-State: AOAM533A2Im+4LsNj2hKSqS9mg1LlbTFVLbaKHEOclMbUT93P9HzAzDQ
 WBZouHfbKwZTWHBeDSLMGBrLpzVXJL0akPkOp5W4TQ==
X-Google-Smtp-Source: ABdhPJy2alGvzZL6wQszq75bUER1H71H1cXO2lQ2Kqo3cndUKYuoAJw+NUjXk0Tx7RN/Wp+wMSWb5XBs5ORDoJdCXZ0=
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr30713365wrj.14.1594230671246; 
 Wed, 08 Jul 2020 10:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200708071117.3070707-1-yuhsuan@chromium.org>
 <f6a0ea44-3805-5901-9864-72d4a3a4562e@collabora.com>
 <CABXOdTfV_oGgZWbyP3o07obMuYGOLY87fou2h3_gowQkV7QVNw@mail.gmail.com>
 <CAGvk5Po=BcHZ8uQJAp10cYHJcvc6-x613o-0Jj00K23xpeQpaQ@mail.gmail.com>
 <CABXOdTf1+nBtau7ujnUVTfNd68D-RijZBPU8XMv=ZQ-RLbpzAg@mail.gmail.com>
In-Reply-To: <CABXOdTf1+nBtau7ujnUVTfNd68D-RijZBPU8XMv=ZQ-RLbpzAg@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Thu, 9 Jul 2020 01:51:00 +0800
Message-ID: <CAGvk5Po2osJOc077x6AWOn7bDgYsWzYSfqrSp64XBgjvjMHKsQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Guenter Roeck <groeck@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Gwendal Grignou <gwendal@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Yicheng Li <yichengli@chromium.org>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=889=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:26=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jul 8, 2020 at 9:17 AM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
> >
> > Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=888=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:28=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Wed, Jul 8, 2020 at 3:16 AM Enric Balletbo i Serra
> > > <enric.balletbo@collabora.com> wrote:
> > > >
> > > > Hi Yu-Hsuan,
> > > >
> > > > Thank you for your patch.
> > > >
> > > > On 8/7/20 9:11, Yu-Hsuan Hsu wrote:
> > > > > It is not guaranteed that I2S RX is disabled when the kernel boot=
ing.
> > > > > For example, if the kernel crashes while it is enabled, it will k=
eep
> > > > > enabled until the next time EC reboots. Reset I2S RX when probing=
 to
> > > > > fix this issue.
> > > > >
> > > > > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > > > > ---
> > > > >  include/linux/platform_data/cros_ec_commands.h | 1 +
> > > > >  sound/soc/codecs/cros_ec_codec.c               | 7 +++++++
> > > > >  2 files changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/include/linux/platform_data/cros_ec_commands.h b/inc=
lude/linux/platform_data/cros_ec_commands.h
> > > > > index 69210881ebac8..11ce917ca924c 100644
> > > > > --- a/include/linux/platform_data/cros_ec_commands.h
> > > > > +++ b/include/linux/platform_data/cros_ec_commands.h
> > > > > @@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
> > > > >       EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH =3D 0x2,
> > > > >       EC_CODEC_I2S_RX_SET_DAIFMT =3D 0x3,
> > > > >       EC_CODEC_I2S_RX_SET_BCLK =3D 0x4,
> > > > > +     EC_CODEC_I2S_RX_RESET =3D 0x5,
> > > >
> > > > Is this a new command not available in the firmware that is already=
 in the field?
> > > >
> > > >
> > > > >       EC_CODEC_I2S_RX_SUBCMD_COUNT,
> > > > >  };
> > > > >
> > > > > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/=
cros_ec_codec.c
> > > > > index 8d45c628e988e..5495214e73e68 100644
> > > > > --- a/sound/soc/codecs/cros_ec_codec.c
> > > > > +++ b/sound/soc/codecs/cros_ec_codec.c
> > > > > @@ -1034,6 +1034,13 @@ static int cros_ec_codec_platform_probe(st=
ruct platform_device *pdev)
> > > > >       }
> > > > >       priv->ec_capabilities =3D r.capabilities;
> > > > >
> > > > > +     /* Reset EC codec I2S RX. */
> > > > > +     p.cmd =3D EC_CODEC_I2S_RX_RESET;
> > > > > +     ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_COD=
EC_I2S_RX,
> > > > > +                                (uint8_t *)&p, sizeof(p), NULL, =
0);
> > > > > +     if (ret)
> > > > > +             dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", =
ret);
> > > > > +
> > > >
> > > > With an old firmware I suspect this message will appear on every bo=
ot, right?
> > > > So, to solve the issue and get rid of this error you're forced to u=
pgrade the
> > > > firmware. Is that true?
> > > >
> > >
> > > It might possibly make more sense to fail this silently and to send
> > > EC_CODEC_I2S_RX_DISABLE as backup if it is not supported (-ENOTSUPP
> > > can possibly be used as trigger if the call returns it).
> > >
> > > Also, I don't accept dev_err() if the error is ignored for patches in
> > > my scope of responsibility.
> > >
> > > Guenter
> > Thanks for the suggestion. Our plan is to upstream this patch first.
> > And then we will merge it into the kernel after the firmware is
> > updated. Is it feasible? (I'm not sure whether there is the better way
> > if I want to update EC and the kernel at the same time.)
> >
> > I think calling EC_CODEC_I2S_RX_DISABLE does not make sense because it
> > checks the value of i2s_rx_enabled first. If i2s_rx_enabled is false,
> > it will skip the function. However, we don't need to reset while the
> > i2s_rx_enabled is already false.
> >
> Exactly my point. If i2s_rx_enabled is false, nothing needs to be
> done, and it doesn't hurt if the EC does nothing. If i2s_rx_enabled is
> true, it needs to be set to false, which is accomplished by sending
> EC_CODEC_I2S_RX_DISABLE.
Sorry my bad. If i2s_rx_enabled is false, it will skip and return
EC_RES_BUSY. And then we may need to handle one more error. I think it
may become too complicated to handle those errors. Could we just merge
this change after the firmware updates? So that we don't need to worry
about the unsupported command.

>
> > In addition, since it is a sub-command, it will return
> > EC_RES_INVALID_PARAM but not ENOTSUPP if the command is not supported.
> > And then EC_RES_INVALID_PARAM will turn into -EPROTO finally so it's
> > difficult to do other operators basing on the return value.
> >
>
> You might have to convince Enric to permit another error code to
> translate EC_RES_INVALID_PARAM. After all, that would meet his
> requirement that the error code must be used in the kernel to accept a
> translation.
>
> Guenter
>
> > Thanks,
> > Yu-Hsuan
> >
> > >
> > > > >       platform_set_drvdata(pdev, priv);
> > > > >
> > > > >       ret =3D devm_snd_soc_register_component(dev, &i2s_rx_compon=
ent_driver,
> > > > >
