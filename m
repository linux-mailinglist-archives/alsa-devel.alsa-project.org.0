Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80A218E34
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 19:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF121654;
	Wed,  8 Jul 2020 19:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF121654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594229287;
	bh=d3lCT0Rar3yr8sWZR9LJI5DQOPmwdJPIqADW2VbTCRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NeX5ZV+IxE2vEsb9+pGzjtZ8BHL5l4OJlOqRQZ1nZzrl3wxPcpljpfiNogDRX5o6k
	 4HdmRu2+PxMV5ZhyrVZ5lKuw2mpSKcnRE/xktyiVer4pW4fN+SjOrlkjGgVLQEtFNv
	 5IQqO8Le/QctfBXJZKexljg+NImgotGFbE4ojDUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11ECDF8015C;
	Wed,  8 Jul 2020 19:26:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F2AF8015A; Wed,  8 Jul 2020 19:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F1BF80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 19:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F1BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bp+7dUOn"
Received: by mail-ej1-x644.google.com with SMTP id rk21so51399479ejb.2
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WYGcMzQopQZDl14XIf4O4aJ8BVHuo25BvGp6Q85HroM=;
 b=bp+7dUOnLcc5Oi0kcl0BX2Obs1NxiJlDg0C8uv+GcIGbI+HrfNnVyLLtLdkJBjtpDs
 Jd+7uOpv8tA3ruYnfx2BqlFdsX/EJXgVEMFOodZkUZwppigwcgshzQx/ISW6kWgrllhA
 a8ZtNTs/E47tyxx2jVnB9rL3SiUbCNQIPy/5yYc7StbQzbe3PTuHRWEY07GomGUD5gBl
 lVb+9OKBBcf9RW9e2AtaF3ug+7inYhr4QbhN1pj8dFV9muqRZwOqL/flBOekrGs7KVcD
 aMKpoIphe1iMnM9BnvH1O17VUOD2o4p+lX+RfQvRrZlFEGN4QLrMgLuNWdNuiuhBqbU4
 hGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WYGcMzQopQZDl14XIf4O4aJ8BVHuo25BvGp6Q85HroM=;
 b=UJNWvq1FrjIbq+pmZ3VbWTUv6Bv9zVW9Atfqv1EogAJ7IP5GPOAW9/QjU+GfKMTp6O
 zQwkHnEtqUonR2mvuJ4Ptt9g+ZbMJDAVqTZm5Qk3Opj8nyIyXzHja3vrb64m3ilYRNm+
 NNAzO3CQf2d9+2UAO+Qto2knuRO0883J9dz9jNKOFm4ndq8Q2myUQc58mlLwO9XTVq3V
 OeUchK3G7PSZLiWOozteSBB1eqrxDl0xLz4pRonwODVUNOziOpUrtZuMcSftEfwCLGy8
 v1nSu3eBeOnIX/YFhPJax7vg1nkNhEbPP2Y7i1/HyxP2QE+amMhGCM/4hBmmZHzF1k99
 Jr5g==
X-Gm-Message-State: AOAM531DomHV2loQ6O7Wg778SKrNn5PgCTnwiSICGNkDgV2qiV6WAb43
 OrUOz0O5URkA/Re7Txz1M1IZrYQZ7isnMLE9exgIsQ==
X-Google-Smtp-Source: ABdhPJwoV8t4uI2XTaRmyyeDgy9Qsz9XS2zDyH9zjWSg0c/g1+8CPRgzIj+mHgwez+VbOKXbzSXSV3JYOaGJVwNzRHg=
X-Received: by 2002:a17:906:8316:: with SMTP id
 j22mr51325891ejx.97.1594229165528; 
 Wed, 08 Jul 2020 10:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200708071117.3070707-1-yuhsuan@chromium.org>
 <f6a0ea44-3805-5901-9864-72d4a3a4562e@collabora.com>
 <CABXOdTfV_oGgZWbyP3o07obMuYGOLY87fou2h3_gowQkV7QVNw@mail.gmail.com>
 <CAGvk5Po=BcHZ8uQJAp10cYHJcvc6-x613o-0Jj00K23xpeQpaQ@mail.gmail.com>
In-Reply-To: <CAGvk5Po=BcHZ8uQJAp10cYHJcvc6-x613o-0Jj00K23xpeQpaQ@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jul 2020 10:25:54 -0700
Message-ID: <CABXOdTf1+nBtau7ujnUVTfNd68D-RijZBPU8XMv=ZQ-RLbpzAg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

On Wed, Jul 8, 2020 at 9:17 AM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
>
> Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=888=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:28=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Wed, Jul 8, 2020 at 3:16 AM Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> > >
> > > Hi Yu-Hsuan,
> > >
> > > Thank you for your patch.
> > >
> > > On 8/7/20 9:11, Yu-Hsuan Hsu wrote:
> > > > It is not guaranteed that I2S RX is disabled when the kernel bootin=
g.
> > > > For example, if the kernel crashes while it is enabled, it will kee=
p
> > > > enabled until the next time EC reboots. Reset I2S RX when probing t=
o
> > > > fix this issue.
> > > >
> > > > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > > > ---
> > > >  include/linux/platform_data/cros_ec_commands.h | 1 +
> > > >  sound/soc/codecs/cros_ec_codec.c               | 7 +++++++
> > > >  2 files changed, 8 insertions(+)
> > > >
> > > > diff --git a/include/linux/platform_data/cros_ec_commands.h b/inclu=
de/linux/platform_data/cros_ec_commands.h
> > > > index 69210881ebac8..11ce917ca924c 100644
> > > > --- a/include/linux/platform_data/cros_ec_commands.h
> > > > +++ b/include/linux/platform_data/cros_ec_commands.h
> > > > @@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
> > > >       EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH =3D 0x2,
> > > >       EC_CODEC_I2S_RX_SET_DAIFMT =3D 0x3,
> > > >       EC_CODEC_I2S_RX_SET_BCLK =3D 0x4,
> > > > +     EC_CODEC_I2S_RX_RESET =3D 0x5,
> > >
> > > Is this a new command not available in the firmware that is already i=
n the field?
> > >
> > >
> > > >       EC_CODEC_I2S_RX_SUBCMD_COUNT,
> > > >  };
> > > >
> > > > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cr=
os_ec_codec.c
> > > > index 8d45c628e988e..5495214e73e68 100644
> > > > --- a/sound/soc/codecs/cros_ec_codec.c
> > > > +++ b/sound/soc/codecs/cros_ec_codec.c
> > > > @@ -1034,6 +1034,13 @@ static int cros_ec_codec_platform_probe(stru=
ct platform_device *pdev)
> > > >       }
> > > >       priv->ec_capabilities =3D r.capabilities;
> > > >
> > > > +     /* Reset EC codec I2S RX. */
> > > > +     p.cmd =3D EC_CODEC_I2S_RX_RESET;
> > > > +     ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC=
_I2S_RX,
> > > > +                                (uint8_t *)&p, sizeof(p), NULL, 0)=
;
> > > > +     if (ret)
> > > > +             dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", re=
t);
> > > > +
> > >
> > > With an old firmware I suspect this message will appear on every boot=
, right?
> > > So, to solve the issue and get rid of this error you're forced to upg=
rade the
> > > firmware. Is that true?
> > >
> >
> > It might possibly make more sense to fail this silently and to send
> > EC_CODEC_I2S_RX_DISABLE as backup if it is not supported (-ENOTSUPP
> > can possibly be used as trigger if the call returns it).
> >
> > Also, I don't accept dev_err() if the error is ignored for patches in
> > my scope of responsibility.
> >
> > Guenter
> Thanks for the suggestion. Our plan is to upstream this patch first.
> And then we will merge it into the kernel after the firmware is
> updated. Is it feasible? (I'm not sure whether there is the better way
> if I want to update EC and the kernel at the same time.)
>
> I think calling EC_CODEC_I2S_RX_DISABLE does not make sense because it
> checks the value of i2s_rx_enabled first. If i2s_rx_enabled is false,
> it will skip the function. However, we don't need to reset while the
> i2s_rx_enabled is already false.
>
Exactly my point. If i2s_rx_enabled is false, nothing needs to be
done, and it doesn't hurt if the EC does nothing. If i2s_rx_enabled is
true, it needs to be set to false, which is accomplished by sending
EC_CODEC_I2S_RX_DISABLE.

> In addition, since it is a sub-command, it will return
> EC_RES_INVALID_PARAM but not ENOTSUPP if the command is not supported.
> And then EC_RES_INVALID_PARAM will turn into -EPROTO finally so it's
> difficult to do other operators basing on the return value.
>

You might have to convince Enric to permit another error code to
translate EC_RES_INVALID_PARAM. After all, that would meet his
requirement that the error code must be used in the kernel to accept a
translation.

Guenter

> Thanks,
> Yu-Hsuan
>
> >
> > > >       platform_set_drvdata(pdev, priv);
> > > >
> > > >       ret =3D devm_snd_soc_register_component(dev, &i2s_rx_componen=
t_driver,
> > > >
