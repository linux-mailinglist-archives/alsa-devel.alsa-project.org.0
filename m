Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A652F470C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 10:05:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E640E16C3;
	Wed, 13 Jan 2021 10:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E640E16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610528716;
	bh=cn0uFD3/E9RSlfgVn+XI8ejaQ0irehXz2vuWGpYyA0A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=daJZZ3ty+YmyLVZieeXUPza6DOn2Q+YyC/fFrcS1j0sxzrBV1Sswqb9iWVkYGc76V
	 1rxMGTepdzp5B+wArK6E8xkrvBLlsIBVaWbEUjuDqFGLc7lgmVkoic4mk+CFDtjNza
	 nLOLsb9ztwfmr0sFt+JsVJ9QA/RHKfUv+6fXnMH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F75FF8014D;
	Wed, 13 Jan 2021 10:03:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB99F8016D; Wed, 13 Jan 2021 10:03:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6111CF8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 10:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6111CF8014D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6EE6E1F44790
Subject: Re: [PATCH v5] ASoC: cros_ec_codec: Reset I2S RX when probing
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20210113081745.2543882-1-yuhsuan@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d5a36f72-82a1-450c-3763-a27df31b8da4@collabora.com>
Date: Wed, 13 Jan 2021 10:03:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113081745.2543882-1-yuhsuan@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
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

Hi Yu-Hsun,

Thank you for your patch. Some comments below.


On 13/1/21 9:17, Yu-Hsuan Hsu wrote:
> It is not guaranteed that I2S RX is disabled when the kernel booting.
> For example, if the kernel crashes while it is enabled, it will keep
> enabled until the next time EC reboots. Reset I2S RX when probing to
> fix this issue.
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
> This patch checks the return value. If it is -ENOPROTOOPT
> (EC_RES_INVALID_VERSION), it will ask clients to update EC firmware.
> 
> Previous patches
> 
> v1: https://patchwork.kernel.org/project/alsa-devel/patch/20200708071117.3070707-1-yuhsuan@chromium.org/
> 
> v2: https://patchwork.kernel.org/project/alsa-devel/patch/20200716170914.3623060-1-yuhsuan@chromium.org/
> 
> v3: https://patchwork.kernel.org/project/alsa-devel/patch/20210106050559.1459027-1-yuhsuan@chromium.org/
> 
> v4: https://patchwork.kernel.org/project/alsa-devel/patch/20210107085942.2891525-2-yuhsuan@chromium.org/
> 
>  include/linux/platform_data/cros_ec_commands.h |  1 +

Sorry if I confused you with my last comments, but this should be a separate patch.

>  sound/soc/codecs/cros_ec_codec.c               | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 86376779ab31..95889ada83a3 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -4600,6 +4600,7 @@ enum ec_codec_i2s_rx_subcmd {
>  	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
>  	EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
>  	EC_CODEC_I2S_RX_SET_BCLK = 0x4,
> +	EC_CODEC_I2S_RX_RESET = 0x5,
>  	EC_CODEC_I2S_RX_SUBCMD_COUNT,
>  };
>  
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index f33a2a9654e7..d35c57724b45 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -1011,6 +1011,17 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
>  	}
>  	priv->ec_capabilities = r.capabilities;
>  
> +	/* Reset EC codec i2s rx. */
> +	p.cmd = EC_CODEC_I2S_RX_RESET;
> +	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> +				   (uint8_t *)&p, sizeof(p), NULL, 0);
> +	if (ret == -ENOPROTOOPT) {
> +		dev_info(dev,
> +			 "Command not found. Please update the EC firmware.\n");
> +	} else if (ret) {
> +		dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);

On an error you should return the error and don't continue.

Thanks,
  Enric

> +	}
> +
>  	platform_set_drvdata(pdev, priv);
>  
>  	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
> 
