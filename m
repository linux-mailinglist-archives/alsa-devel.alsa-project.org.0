Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD8223E16
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 16:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8609D1662;
	Fri, 17 Jul 2020 16:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8609D1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594996472;
	bh=NXnncGhtO0QzNaW4QS7pCRbN37898e+1BQP/RwRTcQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFC5QS5AtcLi9dRHV9O08IwRUOWuDRezUhkNvIdVZryXf7nF4KjZQO9pG033Lbphw
	 lMwDTygBEDJj66v0k92rHJWM4WD2DaL1CFda/S9azSxHzsj/drRBcwR1ggKNNdLP9j
	 iWCO9oTYWDJa5yMQlkGHFolzZNqCXQne5QoheQyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC13F80110;
	Fri, 17 Jul 2020 16:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE58F80217; Fri, 17 Jul 2020 16:32:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C7C9F80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 16:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C7C9F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="jtQUJdXb"
Received: by mail-ej1-x642.google.com with SMTP id w6so11076368ejq.6
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zW8Tx5F9J8OHnFWh/HH8a3bm9XWpmViZ4XegdyqY93E=;
 b=jtQUJdXblGi/ryS3Z6ju0NFNquil2t7oPz+mOIhqRlB4n+GfCiVVFAt70VBEuVEOem
 cPhV/I5KS+5BsUt7ORCFroCirTq5B5yUvVKEMue3guU8lcD2N5dTh/MxIJK5U52DB5hW
 zjsODvitaaWNmUA4vh1bWfvs0gJmBas/XDonDhN9kLnbFY0TwUVVi9Te1XV0iaOVKG/0
 6qZO9eBqXauhvJS+buYBg6K54EUu7JI19FodzDRNpFYeGhK/SHRQbxxbYaNTvnArQOkW
 AhD4ngtgayXc8OeJSgQiHBnOGgt6uxlfcTkElwzfr3sm9mr6QnDsxRU/Vif4CImCz5Rw
 XoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zW8Tx5F9J8OHnFWh/HH8a3bm9XWpmViZ4XegdyqY93E=;
 b=plGAC/E+aLJ+iEfvtK6k/Et2fil1sBDYEa6Q6lQaMa1yW+H/QWosHoy2LsRQjnxC4r
 h2duLDmae+5SfKVBYgcWMP9XhiMlXjhF2LKrAMJtrp7tndxtymCpgYyeXLwPPD/l0lA1
 URkd2Ms+yGlPnb65DCv21paVnbtY/odp1B2FWh5vi9y9QASl0LLhZtErFXkLV4WdSqid
 23dRQZKRxNbb50NesBaI6R9oCu1JdECQfI55hGFYPpefSUEB+FVaQG0bfFalUqMc7Tm+
 tr01PT9lZwDDfquYdv26acwbUQ21s6cW+jgf1H9V1d4AcsobZCTC7CnCDBsYnx193Efz
 CTag==
X-Gm-Message-State: AOAM531y24nimXzEhZ59FQ6qoaJOzVhLqrMl0TVr0RNxNu0ajE3n/vFa
 VqTmOHTUWDUjZOemIk0bvMmg+LiZwc3yheubGrAX/w==
X-Google-Smtp-Source: ABdhPJz41kh9hSIhYD17HeWveunMqSPLym8stDGAavsGB1Z7MZ1iLP/s0rm/f8zSOq7UO1YjQjTwaiiMKoIgd5jKgiE=
X-Received: by 2002:a17:907:41dc:: with SMTP id
 og20mr9208765ejb.183.1594996356749; 
 Fri, 17 Jul 2020 07:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200716170914.3623060-1-yuhsuan@chromium.org>
 <CABXOdTffo_PoFytXTR0DthRgxrp9SLkTrg2Wp6dMDXXj060KFw@mail.gmail.com>
 <f53d5f7b-6d9a-af68-7a48-fbb411625336@collabora.com>
In-Reply-To: <f53d5f7b-6d9a-af68-7a48-fbb411625336@collabora.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 17 Jul 2020 07:32:25 -0700
Message-ID: <CABXOdTf2x4zK9n0WN2djLxCbfQynF4p5v_opwB-DsEyRnRAd4g@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
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

On Thu, Jul 16, 2020 at 10:47 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi,
>
> On 16/7/20 19:23, Guenter Roeck wrote:
> > On Thu, Jul 16, 2020 at 10:09 AM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
> >>
> >> It is not guaranteed that I2S RX is disabled when the kernel booting.
> >> For example, if the kernel crashes while it is enabled, it will keep
> >> enabled until the next time EC reboots. Reset I2S RX when probing to
> >> fix this issue.
> >>
> >> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> >> ---
> >>  drivers/platform/chrome/cros_ec_proto.c        | 7 ++++++-
> >>  include/linux/platform_data/cros_ec_commands.h | 1 +
> >>  sound/soc/codecs/cros_ec_codec.c               | 9 +++++++++
> >>  3 files changed, 16 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> >> index 3e745e0fe092c..2c60690d7147c 100644
> >> --- a/drivers/platform/chrome/cros_ec_proto.c
> >> +++ b/drivers/platform/chrome/cros_ec_proto.c
> >> @@ -572,7 +572,12 @@ int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
> >>                 return -ENOTSUPP;
> >>         } else if (msg->result != EC_RES_SUCCESS) {
> >>                 dev_dbg(ec_dev->dev, "Command result (err: %d)\n", msg->result);
> >> -               return -EPROTO;
> >> +               switch (msg->result) {
> >> +               case EC_RES_INVALID_PARAM:
> >> +                       return -EINVAL;
> >
> > As we have learned, this may impact other callers of
> > cros_ec_cmd_xfer_status() which only accept -EPROTO as error return
> > value. In addition to that, the code is odd:
> >
> >     if (msg->result == EC_RES_INVALID_VERSION) {
> >         ...
> >     } else if (msg->result != EC_RES_SUCCESS) {
> >         switch (msg->result) {
> >         ....
> >         }
> >     }
> >
>
> Ack, this is odd.
>
> > I really dislike the notion of changing error return values of
> > cros_ec_cmd_xfer_status() one by one. That can only cause ongoing
> > trouble with callers expecting specific error return codes (as we have
> > already seen).
> >
>
> Hmm, that's a good point. Ok.
>
> Let's apply the Guenter's patch that maps the errors *and* fix the callers of
> cros_ec_cmd_xfer_status which only accept -EPROTO (there are few).
>
> Yu-Hsuan, can you take care of this and send a patch series with all the
> required patches? If not, I can work on this next week.
>

I can look into it as well. Let me know - I don't want to duplicate work.

Guenter

> Thanks,
>   Enric
>
> > Guenter
> >
> >> +               default:
> >> +                       return -EPROTO;
> >> +               }
> >>         }
> >>
> >>         return ret;
> >> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> >> index 69210881ebac8..11ce917ca924c 100644
> >> --- a/include/linux/platform_data/cros_ec_commands.h
> >> +++ b/include/linux/platform_data/cros_ec_commands.h
> >> @@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
> >>         EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
> >>         EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
> >>         EC_CODEC_I2S_RX_SET_BCLK = 0x4,
> >> +       EC_CODEC_I2S_RX_RESET = 0x5,
> >>         EC_CODEC_I2S_RX_SUBCMD_COUNT,
> >>  };
> >>
> >> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> >> index f23956cf4ed84..b5ff30b7f1aa8 100644
> >> --- a/sound/soc/codecs/cros_ec_codec.c
> >> +++ b/sound/soc/codecs/cros_ec_codec.c
> >> @@ -1034,6 +1034,15 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
> >>         }
> >>         priv->ec_capabilities = r.capabilities;
> >>
> >> +       /* Reset EC codec I2S RX. */
> >> +       p.cmd = EC_CODEC_I2S_RX_RESET;
> >> +       ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> >> +                                  (uint8_t *)&p, sizeof(p), NULL, 0);
> >> +       if (ret == -EINVAL)
> >> +               dev_info(dev, "Missing reset command. Please update your EC firmware.\n");
> >> +       else if (ret)
> >> +               dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
> >> +
> >>         platform_set_drvdata(pdev, priv);
> >>
> >>         ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
> >> --
> >> 2.27.0.389.gc38d7665816-goog
> >>
