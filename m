Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2652F5E91
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 11:21:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEFA11688;
	Thu, 14 Jan 2021 11:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEFA11688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610619705;
	bh=yFR58EgYR9+HTi73A6NqAUbtpNrljdvindxUleWTo28=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eb9We/tgQqFrzmNU05g+hmwLQY8oHvVw+J0EcKSn2vyuty2DsHNMk+ENcRCH7oiz/
	 dMTeDar2zIc+I3PyiaN+znWIO4zpJx/pl0NRmDIuBX5BASx1txvzdN2Rcc6r6Zxczd
	 OEEYF9Zv7QY6MbVa+j3t5YPiJXVbZn6trU8vLek8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38317F8026F;
	Thu, 14 Jan 2021 11:20:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA23F8025E; Thu, 14 Jan 2021 11:20:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D58FAF80118
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 11:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D58FAF80118
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 14D231F459A1
Subject: Re: [PATCH v6 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20210114065401.3498725-1-yuhsuan@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d91f6d8d-e108-eff9-4fc0-992c82cf8aac@collabora.com>
Date: Thu, 14 Jan 2021 11:19:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114065401.3498725-1-yuhsuan@chromium.org>
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

Hi,

On 14/1/21 7:54, Yu-Hsuan Hsu wrote:
> Add the new command EC_CODEC_I2S_RX_RESET in ec_codec_i2s_rx_subcmd,
> which is used for resetting the EC codec.
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>

For if Mark wants to take this patch through his tree.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  include/linux/platform_data/cros_ec_commands.h | 1 +
>  1 file changed, 1 insertion(+)
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
> 
