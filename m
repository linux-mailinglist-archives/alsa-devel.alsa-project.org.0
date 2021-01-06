Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C832EC180
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 17:54:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF3DC16A8;
	Wed,  6 Jan 2021 17:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF3DC16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609952054;
	bh=V0MVX3tlCPX0IOqurGA3tUUsRNf6uIeZviHomNc4mUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nWOIpCdzWu8LsD382MR/4KcE7apoZTw2FgQC2xVMj9n+BgawQuiq0Gc2CamomnWA+
	 EorMRfcxxKb/+ip2zXbEkViI9pdO5aQsXRZt5l0d9PHGIfbyO9W5e7KDOEWDptU5fg
	 8iD4pXAxq/B4LCluhyDt50TuG7pqx2hx7/vKqtak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B6CBF80167;
	Wed,  6 Jan 2021 17:52:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E4A2F800E3; Wed,  6 Jan 2021 17:52:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 073F9F800E3
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 17:52:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073F9F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iB9L2uQw"
Received: by mail-ej1-x62a.google.com with SMTP id b9so6022993ejy.0
 for <alsa-devel@alsa-project.org>; Wed, 06 Jan 2021 08:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x4VIqOKkg4FZyyvVU/MzjO+Nzwo04mdpov97TnQvRu0=;
 b=iB9L2uQw9+Wqr5MjpBQjRckcwr/LfjDGSEAaOzuNID92qiyySPqbqdMLjFB60DgLso
 sU1oy3RtWRV3tWpUipcwAXf94WNfj2F4TR7iiit8Bclc8qcjJvXorD3csiTWWbhs/fqX
 aOuulUr8lqLdtF9jtwQpiJ7VFaKyq2hiZt4Py+TenoDYSd9ApPXW92aVw4iFCoWAjIS9
 vXboJly9+Rw4tR/SrDUYNbDGh/Sntn1zg0/n7lHSbq1FsYuSqlgFaQKKEdSeADFy5xXj
 3YLQp9Ew+n6Y8TVkA7Fp+qicelzRpjogVRfPyY2Kd4IaijRXdDi3ARSC4K3iB+jeTLPg
 4MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x4VIqOKkg4FZyyvVU/MzjO+Nzwo04mdpov97TnQvRu0=;
 b=AanreyhYaSEELZdc1sTqDzoml9nn6+Gp+oBIRIkuWKyjeL2Tn/7NJcV8wVWipatVxj
 QNbH8t0hzGIYWhdaRl/Obf6IXjSK/PYEVLfAs/77y3FZisZpc1csXwK6NQARhnatA4Vx
 OoVBxut4JDBsSPpmvzMnUBe0h/b1bNNLuqSU87Ht7dPFVSBFKaJmbd1vrsqgWJjsypKQ
 wKAvCgONFG1kp8kb2fAxq5SUKwvMsS/fAE0hPYxys1hE5Vvk0LHadzWnmqzMAS08q+Sr
 SeHJpCac3ByVXMDmTQ7rfqA/hVsr2UYaLA2DQkiE+nHJSeRfSqtz1aIg+m2ItW4gYk9s
 ksUA==
X-Gm-Message-State: AOAM531cpIfuwkaKF/wQ7URow4sD9J50aZfexS95sCDIWP2iRi91TaaG
 fYhOKde1t1uMIf+eYgf4p8R6yHBrE3W9lt5LEdAYug==
X-Google-Smtp-Source: ABdhPJzeJODPmzJ/EN1ME2PHC/lYJRDnIhMA3S9LSacL0iJQY6jFKPsTl7Jymho/8Dt7GvFfW0rGy67CD+fUYtBhXKw=
X-Received: by 2002:a17:907:373:: with SMTP id
 rs19mr3234143ejb.298.1609951946883; 
 Wed, 06 Jan 2021 08:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20210106050559.1459027-1-yuhsuan@chromium.org>
In-Reply-To: <20210106050559.1459027-1-yuhsuan@chromium.org>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 6 Jan 2021 08:52:15 -0800
Message-ID: <CABXOdTdhGQ-FBe+9eEJFC7hQ=KJQQVbRamKHavHYuoUxqUm1oA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
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

On Tue, Jan 5, 2021 at 9:06 PM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:

> It is not guaranteed that I2S RX is disabled when the kernel booting.
> For example, if the kernel crashes while it is enabled, it will keep
> enabled until the next time EC reboots. Reset I2S RX when probing to
> fix this issue.
>
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
>  include/linux/platform_data/cros_ec_commands.h | 1 +
>  sound/soc/codecs/cros_ec_codec.c               | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/include/linux/platform_data/cros_ec_commands.h
> b/include/linux/platform_data/cros_ec_commands.h
> index 86376779ab31..95889ada83a3 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -4600,6 +4600,7 @@ enum ec_codec_i2s_rx_subcmd {
>         EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
>         EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
>         EC_CODEC_I2S_RX_SET_BCLK = 0x4,
> +       EC_CODEC_I2S_RX_RESET = 0x5,
>         EC_CODEC_I2S_RX_SUBCMD_COUNT,
>  };
>
>
I would prefer to see a separate patch to sync cros_ec_commands.h with the
version in EC code to reduce future conflicts.

Guenter


> diff --git a/sound/soc/codecs/cros_ec_codec.c
> b/sound/soc/codecs/cros_ec_codec.c
> index f33a2a9654e7..28b3e2c48c86 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -1011,6 +1011,13 @@ static int cros_ec_codec_platform_probe(struct
> platform_device *pdev)
>         }
>         priv->ec_capabilities = r.capabilities;
>
> +       /* Reset EC codec i2s rx. */
> +       p.cmd = EC_CODEC_I2S_RX_RESET;
> +       ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> +                                  (uint8_t *)&p, sizeof(p), NULL, 0);
> +       if (ret)
> +               dev_warn(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
> +
>         platform_set_drvdata(pdev, priv);
>
>         ret = devm_snd_soc_register_component(dev,
> &i2s_rx_component_driver,
> --
> 2.29.2.729.g45daf8777d-goog
>
>
