Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4DE218905
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE0B1684;
	Wed,  8 Jul 2020 15:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE0B1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594215013;
	bh=Fu+r+fbjbtz08bgxHNl0fWXGEhA901qPXLT9Yo2YhFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r1d1cZd2v7F39Sd8ojFXp9DVfSJXgOZ9NNRqzdwB3mwf/MiwkmjTfWNFHxxCY8GUQ
	 le0FeVBXIvGMpjh1wa3/j4g3zoQPxGAkSxSzt/1OTB4WfEHoWLtwzKeyJAOe6s/5E2
	 mxFKfsRvVUMmbdy1piaiBjVoVUrV+HfEcGq80K4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 195F0F8015C;
	Wed,  8 Jul 2020 15:28:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F09E8F8015A; Wed,  8 Jul 2020 15:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 404B7F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404B7F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sjhiUnqO"
Received: by mail-ed1-x543.google.com with SMTP id d15so41846636edm.10
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLdXECLtQR/Jw6PnNJBO5O7DiN9iPSyCU6LSlGREUDY=;
 b=sjhiUnqOgyku9GLu3mmz/Um7HUrzDAYJqAJxMNLm0sRIJhmQ7LHp4nt2gEXQd5wcHr
 XS4x1CQFpjLShiftGsXNL53GxV0RnsCMTevOP8ikkGWzQDS30K6+2IX4ZqV7u0jME2Ba
 dILkafio6QobeRnjg3uuNJuzZIyJS00+nCI7OAtYb9uft6T/mg+5OMqrqtVMyFkPrjxf
 CLK2tp9cL/LjyHla1IXqhYbRvMl5HX0mJV+6GTtZgmqiW9UWXNS+BdFdYsKd2vqXou5V
 PxoBaAzoLKBw2x4gJsFyxmcleZAn2GGdrLOuuHOBIA10QNDeMzxXg2Zx35tnuOfP+H/a
 +ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLdXECLtQR/Jw6PnNJBO5O7DiN9iPSyCU6LSlGREUDY=;
 b=UFaltYuC//9FgHPRq4wtYxse1i5oQiEvFs2lIWoc2j6AfmdLWcf+VPCHpmm4Bt7Bm9
 Y8rJlPinTgtX4y7Pogso8kitRSSCFjcpjYE0stgTLGQm+OcEABXBaJ988154Djok5QVI
 BK/PrCfwOTs+AWR0tzWEo/Eivvjl38QnfKFH4UydVQwJf1jQMyOIKU3fpjeAfxKZeVUj
 pOn0UfcjPdt+ygQhDHPe1Ob8EK0UYeirDNlXhSHFFYIjtE5Q0aUOgR4J1IMsJtbh76iI
 50FvuirVBL/TzMRb/hVHJtKdiDXohpHRYC6qxtkaV+3aGkziMOi8pHhpaNNbIJK93RuH
 wXyw==
X-Gm-Message-State: AOAM5314s81kjiFXXK5xpAh9T8q/1Z5z59TzdU/aS/BZsPI5/MWN637N
 AcstuCQBnTCcWs0GzHmikTFsyDEiF7odVJmJHaY+HQ==
X-Google-Smtp-Source: ABdhPJx6BwBt/gJQ+AbYP2vcFUIQWAatTLW9ZAv8b7hfj0jRUd4HM83MoBiFzEowxIEE9I2S2ENP9XB/jZd+6e6YTp8=
X-Received: by 2002:a50:ed15:: with SMTP id j21mr41499564eds.246.1594214893469; 
 Wed, 08 Jul 2020 06:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200708071117.3070707-1-yuhsuan@chromium.org>
 <f6a0ea44-3805-5901-9864-72d4a3a4562e@collabora.com>
In-Reply-To: <f6a0ea44-3805-5901-9864-72d4a3a4562e@collabora.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 8 Jul 2020 06:28:02 -0700
Message-ID: <CABXOdTfV_oGgZWbyP3o07obMuYGOLY87fou2h3_gowQkV7QVNw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Gwendal Grignou <gwendal@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Yicheng Li <yichengli@chromium.org>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Lee Jones <lee.jones@linaro.org>, Benson Leung <bleung@chromium.org>,
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

On Wed, Jul 8, 2020 at 3:16 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Yu-Hsuan,
>
> Thank you for your patch.
>
> On 8/7/20 9:11, Yu-Hsuan Hsu wrote:
> > It is not guaranteed that I2S RX is disabled when the kernel booting.
> > For example, if the kernel crashes while it is enabled, it will keep
> > enabled until the next time EC reboots. Reset I2S RX when probing to
> > fix this issue.
> >
> > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > ---
> >  include/linux/platform_data/cros_ec_commands.h | 1 +
> >  sound/soc/codecs/cros_ec_codec.c               | 7 +++++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> > index 69210881ebac8..11ce917ca924c 100644
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
> >       EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
> >       EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
> >       EC_CODEC_I2S_RX_SET_BCLK = 0x4,
> > +     EC_CODEC_I2S_RX_RESET = 0x5,
>
> Is this a new command not available in the firmware that is already in the field?
>
>
> >       EC_CODEC_I2S_RX_SUBCMD_COUNT,
> >  };
> >
> > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> > index 8d45c628e988e..5495214e73e68 100644
> > --- a/sound/soc/codecs/cros_ec_codec.c
> > +++ b/sound/soc/codecs/cros_ec_codec.c
> > @@ -1034,6 +1034,13 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
> >       }
> >       priv->ec_capabilities = r.capabilities;
> >
> > +     /* Reset EC codec I2S RX. */
> > +     p.cmd = EC_CODEC_I2S_RX_RESET;
> > +     ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> > +                                (uint8_t *)&p, sizeof(p), NULL, 0);
> > +     if (ret)
> > +             dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
> > +
>
> With an old firmware I suspect this message will appear on every boot, right?
> So, to solve the issue and get rid of this error you're forced to upgrade the
> firmware. Is that true?
>

It might possibly make more sense to fail this silently and to send
EC_CODEC_I2S_RX_DISABLE as backup if it is not supported (-ENOTSUPP
can possibly be used as trigger if the call returns it).

Also, I don't accept dev_err() if the error is ignored for patches in
my scope of responsibility.

Guenter

> >       platform_set_drvdata(pdev, priv);
> >
> >       ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
> >
