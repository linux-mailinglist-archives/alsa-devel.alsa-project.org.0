Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 691182F44C3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 08:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B93D16AE;
	Wed, 13 Jan 2021 07:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B93D16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610521238;
	bh=fPZTyGGOTMOeP7C3URbw6UNxa32EUWD2u5Rvh9LLfAE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGmywTVb2y1bIaBMIEG7vJNZygf/34h1YApTAhE/9m0QL4tlmcfPR5r8mmiGI0yMr
	 QrxNu30gaowGjzbIC2svg9B8ej9Rfksgr0B2qHFr+IKR4SSH9u/+GfnCeMVnAnJw3M
	 OYj1H1O18tj5SEPUi0HdGnZ+0MzBAMBKzV0l1n2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A118AF80254;
	Wed, 13 Jan 2021 07:59:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0729F801ED; Wed, 13 Jan 2021 07:59:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC2F1F8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 07:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2F1F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CnqsXl9U"
Received: by mail-wm1-x32e.google.com with SMTP id a6so541504wmc.2
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 22:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HwL4VtEmHEKSYqG0Wvuo3dQa7ufy0vjsTEWXXFOnu14=;
 b=CnqsXl9UR6w85yvNdQL0vLBU7n+ka9WgCSzhuPnh63gS7svyKH9TbaWEdN008kdcgm
 nEhgm615vMhPE76ZyPVOrwE1graAlb0iSk8+QF2z9FoyUOnNSZvm4A5M7eqEtPSFu0nO
 tYbs95sfEvBTrTQ9QrnG4FegciWkcfnaCaa1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HwL4VtEmHEKSYqG0Wvuo3dQa7ufy0vjsTEWXXFOnu14=;
 b=k2dokKzGhSq0kDDWbobTm3UU3r9lbqxQ6G28WUjG9TjCEgP8QKupKSA9+EcHeNIxwv
 pcLGtJJwSc6rfQpJZs0VE99z096yChe+A6dv3WRKUtAVF/2aTAXC3ah4pYDoJj3uSVoC
 FzGOOhF9YiwOv0R8uSk13vXyiNSpyrHeCywY3zGt69PhOz0lr3vpBSo5iMVm/BbsVIul
 tKUUPj4RokmViX49SLCBkL7DrqYXUaKJoh1/KMokvQHq2QRqAjdenS4AK06x3sB5kcBe
 j7tN0AeecFC7GfWirjvP7DnW79AIiL9JKeuveIyBgEKq683hh+RKnA/f/K1rzXjCEYqd
 gG7Q==
X-Gm-Message-State: AOAM5305U3SeOPAYQfvbHV54MYvf01JTmPN51jp3Z6n8TtSmCWcOnz6D
 Pp8MsZutb6f/FjisCkHZaD276DNb/QIUs0x02fgaxA==
X-Google-Smtp-Source: ABdhPJxJ2zKxWypWcN01Y4eovqmIhyQQ3G4CzLNK/AUV76xJBTd5zeoVZVdAEIhClMuvvC9i5OrUSe+LmtrXR8YHkck=
X-Received: by 2002:a1c:a145:: with SMTP id k66mr694572wme.18.1610521131935;
 Tue, 12 Jan 2021 22:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
 <20210107085942.2891525-2-yuhsuan@chromium.org>
 <e6c33a5f-1765-7cb6-8479-ff049992f2b7@collabora.com>
In-Reply-To: <e6c33a5f-1765-7cb6-8479-ff049992f2b7@collabora.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Wed, 13 Jan 2021 14:58:41 +0800
Message-ID: <CAGvk5Ppm_+twECMf2x6P4U24vkcwn7WPOCZtnjwNHG=CtmOenA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Guenter Roeck <groeck@chromium.org>,
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

Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2021=E5=B9=
=B41=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:34=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> Hi Yu-Hsuan,
>
> Thank you for the patch.
>
> On 7/1/21 9:59, Yu-Hsuan Hsu wrote:
> > It is not guaranteed that I2S RX is disabled when the kernel booting.
> > For example, if the kernel crashes while it is enabled, it will keep
> > enabled until the next time EC reboots. Reset I2S RX when probing to
> > fix this issue.
> >
> > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
>
> If I am not mistaken this is the four version of this patchset (see [1]).=
 Please
> prefix your patches with the proper version and maintain a changelog for =
them,
> otherwise makes difficult to follow all the discussions already done.
>
> [1]
> v1: https://lkml.org/lkml/2020/7/8/173
> v2: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-July/17093=
3.html
> v3:
> https://patchwork.kernel.org/project/alsa-devel/patch/20210106050559.1459=
027-1-yuhsuan@chromium.org/
> v4: https://patchwork.kernel.org/project/alsa-devel/list/?series=3D410441
Sorry that I forgot to add version. Will add v5 in the next patch. Thanks!
>
> > ---
> >  sound/soc/codecs/cros_ec_codec.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_e=
c_codec.c
> > index f33a2a9654e7..28b3e2c48c86 100644
> > --- a/sound/soc/codecs/cros_ec_codec.c
> > +++ b/sound/soc/codecs/cros_ec_codec.c
> > @@ -1011,6 +1011,13 @@ static int cros_ec_codec_platform_probe(struct p=
latform_device *pdev)
> >       }
> >       priv->ec_capabilities =3D r.capabilities;
> >
> > +     /* Reset EC codec i2s rx. */
> > +     p.cmd =3D EC_CODEC_I2S_RX_RESET;
> > +     ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S=
_RX,
> > +                                (uint8_t *)&p, sizeof(p), NULL, 0);
> > +     if (ret)
> > +             dev_warn(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
> > +
>
> My comment in the first version is still valid, I guess. This command was
> introduced later and with an old firmware I suspect this message will app=
ear on
> every boot, right? So, to solve the issue and get rid of this warn you're=
 forced
> to upgrade the firmware. Would make sense to handle returned error value =
to warn
> when the firmware needs to be updated and error and break when is really =
an error?
>
> We have mapped ec error codes to linux error codes. So, it should be poss=
ible now.
Oh, I didn't notice it. Thanks for the remind. I will work on it.
>
> Thanks,
>  Enric
>
> >       platform_set_drvdata(pdev, priv);
> >
> >       ret =3D devm_snd_soc_register_component(dev, &i2s_rx_component_dr=
iver,
> >
