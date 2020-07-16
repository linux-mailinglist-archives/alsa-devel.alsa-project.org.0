Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ECE222A00
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 281DC165E;
	Thu, 16 Jul 2020 19:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 281DC165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594920760;
	bh=Nq2yPXLDb2hQwuR0z7UFFMNvHAvMTRJtIySTNmtmf+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JimahJgK3VLpQs5cvB/Z2xsRnOa5tAeViP2ee14+f728cZng14S0Mg0/Ya5HGkLqs
	 NsOyObDH2q1vTUYbvtAGDC8fGovkXZjPBD6nzWyo9jwnQ1o9vaDzUEbjm1XhpTRJ/X
	 yS/C3mwYaGuP1AuHpfELGiVmS8aaS0+ZBDjF8lp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31AABF801EC;
	Thu, 16 Jul 2020 19:23:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96890F802BE; Thu, 16 Jul 2020 19:23:55 +0200 (CEST)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 993D3F8016F
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 993D3F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="S6DDIKAe"
Received: by mail-ej1-x642.google.com with SMTP id lx13so7444737ejb.4
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ap6sCeX+vfsgknYFWUWzqHRMYIsUrhYyQY0OJzIHClo=;
 b=S6DDIKAesPw5Cjx89b0HuzwbTsFk9QhmWPt5VzTZ6wA2Uh4QVf36cFYxTJql64zLQA
 FLaSC6H2+WAaj2PpaonR0HyxRuPDL0NnUTJEY6UiUZ714K0v+omvP7NnEiex0K8R8B13
 F2CaY9/LU+DAdSIHZe1+/K45Rg3SIpYjxFlwNXp8wBNjT02Z3Gqhr19q4ptq39uYL196
 uE9UCQkcTzrI/LgOHoEeGt/diY69YXNked59X49Dh9ODuonOtSNYY/1TwCgELzM5YgwB
 wm64dM1NMTBfZJnZE0T/apcsaKb5ybLGpLp4bCw3RTjsNIpQrIzA07yUMfyVIlYTqTJ+
 ZfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ap6sCeX+vfsgknYFWUWzqHRMYIsUrhYyQY0OJzIHClo=;
 b=ZaTWOBuDOIiWWXjlv9wzt8WAdaeJmmgW9saLijCtQL/70KPVL0VvTMtjVGYu0O5ebJ
 BpaBRyFWiQSKKf1uBc25PP7x0LyLEUp6e/NBV/+ZhWx/elt3YIDlL08GM5tma5IosP6L
 vDyzWUKxqoGc/20cvuc7cUdAcn/CkUvFv0NYGKkfec76GfJorWBDvw2ugUi9040Udobv
 dfJfaWKarlFu8o59icc0XJGaeWaY7+WooDfDs7V0ZN+IjrqjOuXGoWgn22b4cp90EKAQ
 G6VHpbhWIQ5Rji1H0+YARr98SCbzf4puXZBQvDj2qps+dZzKD43g89Db4IQDVy4yYTb/
 dLIQ==
X-Gm-Message-State: AOAM530fJCe0XoPMzq36P6FAo+OC+dnOBIm6ZwaSZ2D26zEKzbD1Knc9
 PmRpa/4e/t2GeOi7lvh9qOmKkg0+Kkr3UuD1uX+CQg==
X-Google-Smtp-Source: ABdhPJx3Pr28goyATfKkhOboW9Yf3AuRpjqoPz5JRPqzOhfVY8Y15cuRcXN2WVSUOIPVUxZ8eX4WUlS+upYmdNP/ZEU=
X-Received: by 2002:a17:906:29d8:: with SMTP id
 y24mr4685468eje.212.1594920223732; 
 Thu, 16 Jul 2020 10:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200716170914.3623060-1-yuhsuan@chromium.org>
In-Reply-To: <20200716170914.3623060-1-yuhsuan@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 16 Jul 2020 10:23:32 -0700
Message-ID: <CABXOdTffo_PoFytXTR0DthRgxrp9SLkTrg2Wp6dMDXXj060KFw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Jul 16, 2020 at 10:09 AM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
>
> It is not guaranteed that I2S RX is disabled when the kernel booting.
> For example, if the kernel crashes while it is enabled, it will keep
> enabled until the next time EC reboots. Reset I2S RX when probing to
> fix this issue.
>
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c        | 7 ++++++-
>  include/linux/platform_data/cros_ec_commands.h | 1 +
>  sound/soc/codecs/cros_ec_codec.c               | 9 +++++++++
>  3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
> index 3e745e0fe092c..2c60690d7147c 100644
> --- a/drivers/platform/chrome/cros_ec_proto.c
> +++ b/drivers/platform/chrome/cros_ec_proto.c
> @@ -572,7 +572,12 @@ int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
>                 return -ENOTSUPP;
>         } else if (msg->result != EC_RES_SUCCESS) {
>                 dev_dbg(ec_dev->dev, "Command result (err: %d)\n", msg->result);
> -               return -EPROTO;
> +               switch (msg->result) {
> +               case EC_RES_INVALID_PARAM:
> +                       return -EINVAL;

As we have learned, this may impact other callers of
cros_ec_cmd_xfer_status() which only accept -EPROTO as error return
value. In addition to that, the code is odd:

    if (msg->result == EC_RES_INVALID_VERSION) {
        ...
    } else if (msg->result != EC_RES_SUCCESS) {
        switch (msg->result) {
        ....
        }
    }

I really dislike the notion of changing error return values of
cros_ec_cmd_xfer_status() one by one. That can only cause ongoing
trouble with callers expecting specific error return codes (as we have
already seen).

Guenter

> +               default:
> +                       return -EPROTO;
> +               }
>         }
>
>         return ret;
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 69210881ebac8..11ce917ca924c 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
>         EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
>         EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
>         EC_CODEC_I2S_RX_SET_BCLK = 0x4,
> +       EC_CODEC_I2S_RX_RESET = 0x5,
>         EC_CODEC_I2S_RX_SUBCMD_COUNT,
>  };
>
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index f23956cf4ed84..b5ff30b7f1aa8 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -1034,6 +1034,15 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
>         }
>         priv->ec_capabilities = r.capabilities;
>
> +       /* Reset EC codec I2S RX. */
> +       p.cmd = EC_CODEC_I2S_RX_RESET;
> +       ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> +                                  (uint8_t *)&p, sizeof(p), NULL, 0);
> +       if (ret == -EINVAL)
> +               dev_info(dev, "Missing reset command. Please update your EC firmware.\n");
> +       else if (ret)
> +               dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
> +
>         platform_set_drvdata(pdev, priv);
>
>         ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
> --
> 2.27.0.389.gc38d7665816-goog
>
