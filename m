Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C070F224359
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 20:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3987B1665;
	Fri, 17 Jul 2020 20:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3987B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595011993;
	bh=C8NPmaPSLhQEQ2MrBt//g1/gMhwFbG1plyYx4c+dn+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d27AwzQbH8RmyzzUyqfrzitAGCT64tZH9YkxI6YLUgRITx0tt9AXpMVO9ukx5xExl
	 nUApQ1/MAUiuonu2w425LCAAwaoJnf1OHkBTgZ2o1nt0TN+rqOEyzYxfGBIW3cAvS+
	 kVRT4UpMpFHNPMAILMfyN6ZnsjWBtjaojTTvUDZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53D35F800E4;
	Fri, 17 Jul 2020 20:51:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F8A8F80217; Fri, 17 Jul 2020 20:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2C0AF800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 20:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C0AF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DuaNck28"
Received: by mail-wr1-x442.google.com with SMTP id f2so12151198wrp.7
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 11:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W0XV4dFr3RYjtEBiF3D3e3s9h66bEDl3lyG1fgXEHCs=;
 b=DuaNck28/9ga/FaLy4maDgdZnfSieEs3loiDk9AN98/zgCO6TlbSYre/tqEVJ5gMK6
 0uj1OJc6MkSjrHnxMYjTbaQssOWldOVQoUzOVlAFoL5Zm82up8qvzMa5SfSs56sfQDIr
 SUvdpXthtVQAyjeBLF/C543xgCX8KH0Ij357o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W0XV4dFr3RYjtEBiF3D3e3s9h66bEDl3lyG1fgXEHCs=;
 b=FeuV56U+yBbVXdE5TJ7SVmoW2uGj2gexwwsLFsMNiUlgsyYIuwAHVY4USKkxUARw+8
 sQ2ihcxyLat9llu4FgM4fgB0EA/HmCtDuMV3l4deXtk0p7Ba/O+414aT9FGQwJKAvT9f
 pBl15/9iN47vKTOSHLTjXOB7gk9vezMEDyAUCHW0knpbFLqz7IUgU1q+S2EYuaz3ZowQ
 Q+yFSi/C80pvqhrR6odyfIpFH1pIk56+U14uKfgimaNpSaVuy6xVgWBzdBiUeivqyOmP
 rEAcYoY4BSxhgVPr1oGeAQhblOV/ZDiqvTwhBHEo+d4uOyiCelAr6gwQkvxl2wiIDwlf
 Z37w==
X-Gm-Message-State: AOAM533dG6mFGYfbqmewn9OqKJLAC3DjDcAl/b0GImJ5BzTA6sAUDw29
 l5dDzSztyIoQ9FDAG8nOktOU4a13y8KNQmGDjtHVyw==
X-Google-Smtp-Source: ABdhPJwvUddcWMyhSzUmm3XImox0bWFW8PaTWfgIJMpo12uCcNdigo/4j+4QOdUAPCNLJT54SIRpaaqiuoGLYUJw3zI=
X-Received: by 2002:a5d:6846:: with SMTP id o6mr11746430wrw.370.1595011879368; 
 Fri, 17 Jul 2020 11:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200716170914.3623060-1-yuhsuan@chromium.org>
 <CABXOdTffo_PoFytXTR0DthRgxrp9SLkTrg2Wp6dMDXXj060KFw@mail.gmail.com>
 <f53d5f7b-6d9a-af68-7a48-fbb411625336@collabora.com>
 <CABXOdTf2x4zK9n0WN2djLxCbfQynF4p5v_opwB-DsEyRnRAd4g@mail.gmail.com>
In-Reply-To: <CABXOdTf2x4zK9n0WN2djLxCbfQynF4p5v_opwB-DsEyRnRAd4g@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sat, 18 Jul 2020 02:51:08 +0800
Message-ID: <CAGvk5Prz_62Gzu98eZFDotzQOz5tMN72PB4UA9m315-PVfrsNQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Guenter Roeck <groeck@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=8817=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Jul 16, 2020 at 10:47 AM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
> >
> > Hi,
> >
> > On 16/7/20 19:23, Guenter Roeck wrote:
> > > On Thu, Jul 16, 2020 at 10:09 AM Yu-Hsuan Hsu <yuhsuan@chromium.org> =
wrote:
> > >>
> > >> It is not guaranteed that I2S RX is disabled when the kernel booting=
.
> > >> For example, if the kernel crashes while it is enabled, it will keep
> > >> enabled until the next time EC reboots. Reset I2S RX when probing to
> > >> fix this issue.
> > >>
> > >> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > >> ---
> > >>  drivers/platform/chrome/cros_ec_proto.c        | 7 ++++++-
> > >>  include/linux/platform_data/cros_ec_commands.h | 1 +
> > >>  sound/soc/codecs/cros_ec_codec.c               | 9 +++++++++
> > >>  3 files changed, 16 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platf=
orm/chrome/cros_ec_proto.c
> > >> index 3e745e0fe092c..2c60690d7147c 100644
> > >> --- a/drivers/platform/chrome/cros_ec_proto.c
> > >> +++ b/drivers/platform/chrome/cros_ec_proto.c
> > >> @@ -572,7 +572,12 @@ int cros_ec_cmd_xfer_status(struct cros_ec_devi=
ce *ec_dev,
> > >>                 return -ENOTSUPP;
> > >>         } else if (msg->result !=3D EC_RES_SUCCESS) {
> > >>                 dev_dbg(ec_dev->dev, "Command result (err: %d)\n", m=
sg->result);
> > >> -               return -EPROTO;
> > >> +               switch (msg->result) {
> > >> +               case EC_RES_INVALID_PARAM:
> > >> +                       return -EINVAL;
> > >
> > > As we have learned, this may impact other callers of
> > > cros_ec_cmd_xfer_status() which only accept -EPROTO as error return
> > > value. In addition to that, the code is odd:
> > >
> > >     if (msg->result =3D=3D EC_RES_INVALID_VERSION) {
> > >         ...
> > >     } else if (msg->result !=3D EC_RES_SUCCESS) {
> > >         switch (msg->result) {
> > >         ....
> > >         }
> > >     }
> > >
> >
> > Ack, this is odd.
> >
> > > I really dislike the notion of changing error return values of
> > > cros_ec_cmd_xfer_status() one by one. That can only cause ongoing
> > > trouble with callers expecting specific error return codes (as we hav=
e
> > > already seen).
> > >
> >
> > Hmm, that's a good point. Ok.
> >
> > Let's apply the Guenter's patch that maps the errors *and* fix the call=
ers of
> > cros_ec_cmd_xfer_status which only accept -EPROTO (there are few).
> >
> > Yu-Hsuan, can you take care of this and send a patch series with all th=
e
> > required patches? If not, I can work on this next week.
> >
>
> I can look into it as well. Let me know - I don't want to duplicate work.
>
> Guenter
Hi Guenter,
Really thanks for your assistance! Could you help me on those patches?
Since you wrote that patch, I think it should be the most efficient
way to make them merged.

Thanks,
Yu-Hsuan

>
> > Thanks,
> >   Enric
> >
> > > Guenter
> > >
> > >> +               default:
> > >> +                       return -EPROTO;
> > >> +               }
> > >>         }
> > >>
> > >>         return ret;
> > >> diff --git a/include/linux/platform_data/cros_ec_commands.h b/includ=
e/linux/platform_data/cros_ec_commands.h
> > >> index 69210881ebac8..11ce917ca924c 100644
> > >> --- a/include/linux/platform_data/cros_ec_commands.h
> > >> +++ b/include/linux/platform_data/cros_ec_commands.h
> > >> @@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
> > >>         EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH =3D 0x2,
> > >>         EC_CODEC_I2S_RX_SET_DAIFMT =3D 0x3,
> > >>         EC_CODEC_I2S_RX_SET_BCLK =3D 0x4,
> > >> +       EC_CODEC_I2S_RX_RESET =3D 0x5,
> > >>         EC_CODEC_I2S_RX_SUBCMD_COUNT,
> > >>  };
> > >>
> > >> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cro=
s_ec_codec.c
> > >> index f23956cf4ed84..b5ff30b7f1aa8 100644
> > >> --- a/sound/soc/codecs/cros_ec_codec.c
> > >> +++ b/sound/soc/codecs/cros_ec_codec.c
> > >> @@ -1034,6 +1034,15 @@ static int cros_ec_codec_platform_probe(struc=
t platform_device *pdev)
> > >>         }
> > >>         priv->ec_capabilities =3D r.capabilities;
> > >>
> > >> +       /* Reset EC codec I2S RX. */
> > >> +       p.cmd =3D EC_CODEC_I2S_RX_RESET;
> > >> +       ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODE=
C_I2S_RX,
> > >> +                                  (uint8_t *)&p, sizeof(p), NULL, 0=
);
> > >> +       if (ret =3D=3D -EINVAL)
> > >> +               dev_info(dev, "Missing reset command. Please update =
your EC firmware.\n");
> > >> +       else if (ret)
> > >> +               dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", r=
et);
> > >> +
> > >>         platform_set_drvdata(pdev, priv);
> > >>
> > >>         ret =3D devm_snd_soc_register_component(dev, &i2s_rx_compone=
nt_driver,
> > >> --
> > >> 2.27.0.389.gc38d7665816-goog
> > >>
