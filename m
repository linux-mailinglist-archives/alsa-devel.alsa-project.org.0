Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34033218CCB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 18:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7923B9F6;
	Wed,  8 Jul 2020 18:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7923B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594225155;
	bh=EZTnZ0KGR4nMFZG7y5n9R08MHJsiudsRUMaSBvYegWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qKmpsFVpEw85UjnvHxxt3pEn2wvuv35jTwQlEOwPk7aj8pvwCuZGc6sjdLAq1li0Z
	 3vJ+ECG4V+zP0Kt7e3dBM0nAYD7N6DQ3UogdaTyO0ONbh1ZMarpHt3HqdBtCnWg2WF
	 4aT827T9fyoB+mR7a3HnRKKKI5ffKefFEttaK8m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71D30F800AE;
	Wed,  8 Jul 2020 18:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B319F8015A; Wed,  8 Jul 2020 18:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB6F7F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB6F7F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iia7mGZt"
Received: by mail-wm1-x341.google.com with SMTP id a6so4289165wmm.0
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5kAcxP8yp944C33ROLXVPNzrfs8jnGeNlhJxbTbvZzg=;
 b=iia7mGZtpCQgy3YOdSOK6NvhZ9DV6sfk80EaAKaVG0F7rSN//EzGF6YidC4viD2yjE
 vI0mdKXKht4KbaakdleqqsPz/hS2gZSsGgDVnh/cvbATz0aI2VTNG78Gs7H5UbxJtXqG
 3MF9+QrQHlQNccapi8P93wGOJT2bpczaay6MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5kAcxP8yp944C33ROLXVPNzrfs8jnGeNlhJxbTbvZzg=;
 b=YmMaE8UzkNUXmIGALWVGcLMbgW9g9Qhqm9MEcsHKBOdVXYHhBm5adsjNbA0XQJyjeK
 3BoIjQryZbIXnUwMqqbsF14A40topXpfDutyES38furAURfrgEtSNct7vy0DSR3U5Bsi
 /rS+8q6lGNCVazb+gDdQcvgkcdpSZnvtGN1MHwyZAZeAaXJ13PwCIsQCjiEFixCYXpGr
 gYlJKEcRjWkwDIRS9/eq5PzLISpvsQmCGqEipvMOaQ1KFRIVle0QBPTaAHA4nVCsxRyD
 QQ4FzL907DscFPt+6zJ0aptlqig+mqVgoea1TWjA/S9vzjWafoqZsxDDoxFvV4luG3sG
 S7nw==
X-Gm-Message-State: AOAM530fouH2IyuhDI/YZyTNiOpvEVWeDmo+8eWV5K9byYk/TTgmoFcW
 1oLYxpaM+UIetyPtqPl1680G3Y0eC2AW8m9x1llo/w==
X-Google-Smtp-Source: ABdhPJwiVqLB7/Ty3jBK0KqJkumzblgAGK+E2oKwEaMcIEqr6+uFRi3qc6Vg7JRssEFSwhc7WzEdvjeO6GZcrCwWgSU=
X-Received: by 2002:a1c:e088:: with SMTP id x130mr9669890wmg.14.1594225038874; 
 Wed, 08 Jul 2020 09:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200708071117.3070707-1-yuhsuan@chromium.org>
 <f6a0ea44-3805-5901-9864-72d4a3a4562e@collabora.com>
 <CABXOdTfV_oGgZWbyP3o07obMuYGOLY87fou2h3_gowQkV7QVNw@mail.gmail.com>
In-Reply-To: <CABXOdTfV_oGgZWbyP3o07obMuYGOLY87fou2h3_gowQkV7QVNw@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Thu, 9 Jul 2020 00:17:07 +0800
Message-ID: <CAGvk5Po=BcHZ8uQJAp10cYHJcvc6-x613o-0Jj00K23xpeQpaQ@mail.gmail.com>
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

Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jul 8, 2020 at 3:16 AM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
> >
> > Hi Yu-Hsuan,
> >
> > Thank you for your patch.
> >
> > On 8/7/20 9:11, Yu-Hsuan Hsu wrote:
> > > It is not guaranteed that I2S RX is disabled when the kernel booting.
> > > For example, if the kernel crashes while it is enabled, it will keep
> > > enabled until the next time EC reboots. Reset I2S RX when probing to
> > > fix this issue.
> > >
> > > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > > ---
> > >  include/linux/platform_data/cros_ec_commands.h | 1 +
> > >  sound/soc/codecs/cros_ec_codec.c               | 7 +++++++
> > >  2 files changed, 8 insertions(+)
> > >
> > > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include=
/linux/platform_data/cros_ec_commands.h
> > > index 69210881ebac8..11ce917ca924c 100644
> > > --- a/include/linux/platform_data/cros_ec_commands.h
> > > +++ b/include/linux/platform_data/cros_ec_commands.h
> > > @@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
> > >       EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH =3D 0x2,
> > >       EC_CODEC_I2S_RX_SET_DAIFMT =3D 0x3,
> > >       EC_CODEC_I2S_RX_SET_BCLK =3D 0x4,
> > > +     EC_CODEC_I2S_RX_RESET =3D 0x5,
> >
> > Is this a new command not available in the firmware that is already in =
the field?
> >
> >
> > >       EC_CODEC_I2S_RX_SUBCMD_COUNT,
> > >  };
> > >
> > > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros=
_ec_codec.c
> > > index 8d45c628e988e..5495214e73e68 100644
> > > --- a/sound/soc/codecs/cros_ec_codec.c
> > > +++ b/sound/soc/codecs/cros_ec_codec.c
> > > @@ -1034,6 +1034,13 @@ static int cros_ec_codec_platform_probe(struct=
 platform_device *pdev)
> > >       }
> > >       priv->ec_capabilities =3D r.capabilities;
> > >
> > > +     /* Reset EC codec I2S RX. */
> > > +     p.cmd =3D EC_CODEC_I2S_RX_RESET;
> > > +     ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I=
2S_RX,
> > > +                                (uint8_t *)&p, sizeof(p), NULL, 0);
> > > +     if (ret)
> > > +             dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret)=
;
> > > +
> >
> > With an old firmware I suspect this message will appear on every boot, =
right?
> > So, to solve the issue and get rid of this error you're forced to upgra=
de the
> > firmware. Is that true?
> >
>
> It might possibly make more sense to fail this silently and to send
> EC_CODEC_I2S_RX_DISABLE as backup if it is not supported (-ENOTSUPP
> can possibly be used as trigger if the call returns it).
>
> Also, I don't accept dev_err() if the error is ignored for patches in
> my scope of responsibility.
>
> Guenter
Thanks for the suggestion. Our plan is to upstream this patch first.
And then we will merge it into the kernel after the firmware is
updated. Is it feasible? (I'm not sure whether there is the better way
if I want to update EC and the kernel at the same time.)

I think calling EC_CODEC_I2S_RX_DISABLE does not make sense because it
checks the value of i2s_rx_enabled first. If i2s_rx_enabled is false,
it will skip the function. However, we don't need to reset while the
i2s_rx_enabled is already false.

In addition, since it is a sub-command, it will return
EC_RES_INVALID_PARAM but not ENOTSUPP if the command is not supported.
And then EC_RES_INVALID_PARAM will turn into -EPROTO finally so it's
difficult to do other operators basing on the return value.

Thanks,
Yu-Hsuan

>
> > >       platform_set_drvdata(pdev, priv);
> > >
> > >       ret =3D devm_snd_soc_register_component(dev, &i2s_rx_component_=
driver,
> > >
