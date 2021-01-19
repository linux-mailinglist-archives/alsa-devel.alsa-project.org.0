Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4C2FB5B6
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 12:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9B1B188B;
	Tue, 19 Jan 2021 12:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9B1B188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611056229;
	bh=AB2YG3eGVhOfb0pTprl2r3/3U8/WY/KQ0mOdwV0dXG4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+dUuaduTeE2U4PyWO8INSar3Cu1ercvKsJ8Vt5Tx4insgfRaITEFd43iD4VANokH
	 D73b7HJ5g+obeCFfgs969+52iDyB/YVkup27qUghIcnwCD872EMqR5zAVLjb+i2vw6
	 /dWzuiKlkQB/m770AyG/r5tNEc0NaQLq6dca71kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 191A7F800FE;
	Tue, 19 Jan 2021 12:35:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68658F80255; Tue, 19 Jan 2021 12:35:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 639C7F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 12:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 639C7F800FE
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 1C9EA1F44E05
Subject: Re: [PATCH v7 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20210115075301.47995-1-yuhsuan@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <e95063be-e13a-c284-82dd-e0df579fee5d@collabora.com>
Date: Tue, 19 Jan 2021 12:35:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115075301.47995-1-yuhsuan@chromium.org>
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

Hi Yu-Hsuan,

On 15/1/21 8:53, Yu-Hsuan Hsu wrote:
> Add the new command EC_CODEC_I2S_RX_RESET in ec_codec_i2s_rx_subcmd,
> which is used for resetting the EC codec.
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>

Please carry the tags when sending newer versions if nothing changed. This patch
was already

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Mark I'm fine if both patches go through your tree.


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
