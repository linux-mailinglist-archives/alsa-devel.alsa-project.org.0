Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B363298B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 17:32:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE1CE12;
	Mon, 21 Nov 2022 17:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE1CE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669048371;
	bh=8FGiF1j8BtAQjIKLXKAXyllFLSeCd7WtZVvISunk3Bw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eYdXe/iK36/dvs8WlGrBV4Ag9WDpGs3/CDxIXgJl5fRGituLtXODVBCjnH9TeREBW
	 HQiSte/bJhGcbcMogJZYsl7c7VPtv6W9U7d10+fTu91oClr4ha+CRHxh11/KwT/dlq
	 pQ2PrUz4waZWsOWPRh3eRKK7c4Xk6Ufm15fneZiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 033FEF80115;
	Mon, 21 Nov 2022 17:31:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB736F8028D; Mon, 21 Nov 2022 17:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 118BDF800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 17:31:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 118BDF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fgdIW/6Y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ALCdRLo008204; Mon, 21 Nov 2022 10:31:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=s5BfbzAlz8fZZbAjoyUbrrFgI6ZBMj5mkkHZtxaKUTI=;
 b=fgdIW/6YlRlkUQz71hxtPuZDCToxPN71C8hvZQNc6O32inetGNIrLI7vlweKDg4yo8+9
 UudY/tHlE0m3aunq9Wm7/LQeUjieEUrKXOCbheLDb2YlrzhcL/IHCt46fJbC6RjoWwzK
 p7WTKS0T0Gs16Vb6i31xIFeVKi7Gl6ZdY1464bDPiA6fFlNpvdpVBAKr+afqSrPe7LMf
 OUajRHa0rJt5koejYhCnqS2A8Fxd4CVvGEXG5GjH4qjLa1pvPRoBm+u/ihIFu/8mrBRx
 z3AdvLDrNAlikjsZvuziXm+Uxch9yg93p4HK6Ui/0d/ZnQB/hHEkjYp7TaNcH3z2VrgU Lw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6tcwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 10:31:45 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 10:31:43 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Mon, 21 Nov 2022 10:31:43 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D04F1468;
 Mon, 21 Nov 2022 16:31:42 +0000 (UTC)
Message-ID: <22df3cf2-ab22-59c9-106c-d06dc2a6060d@opensource.cirrus.com>
Date: Mon, 21 Nov 2022 16:31:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/9] ASoC: max98373-sdw: Switch to new
 snd_sdw_params_to_config helper
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, <tiwai@suse.com>,
 <broonie@kernel.org>
References: <20221121134608.3713033-1-ckeepax@opensource.cirrus.com>
 <20221121134608.3713033-2-ckeepax@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20221121134608.3713033-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 22824YeHitfuOJlpYNTNXF9CiVDT2bg_
X-Proofpoint-GUID: 22824YeHitfuOJlpYNTNXF9CiVDT2bg_
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
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

On 21/11/2022 13:46, Charles Keepax wrote:
> The conversation from hw_params to SoundWire config is pretty
s/conversation/conversion

> standard as such most of the conversation can be handled by the new
> snd_sdw_params_to_config helper function.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>   sound/soc/codecs/max98373-sdw.c | 31 +++++++++++--------------------
>   1 file changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
> index 899965b19d12d..3cd1be743d9ee 100644
> --- a/sound/soc/codecs/max98373-sdw.c
> +++ b/sound/soc/codecs/max98373-sdw.c
> @@ -10,6 +10,7 @@
>   #include <linux/slab.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
> +#include <sound/sdw.h>
>   #include <sound/soc.h>
>   #include <sound/tlv.h>
>   #include <linux/of.h>
> @@ -533,10 +534,8 @@ static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
>   	struct snd_soc_component *component = dai->component;
>   	struct max98373_priv *max98373 =
>   		snd_soc_component_get_drvdata(component);
> -
> -	struct sdw_stream_config stream_config;
> -	struct sdw_port_config port_config;
> -	enum sdw_data_direction direction;
> +	struct sdw_stream_config stream_config = {0};
> +	struct sdw_port_config port_config = {0};
>   	struct sdw_stream_data *stream;
>   	int ret, chan_sz, sampling_rate;
>   
> @@ -548,28 +547,20 @@ static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
>   	if (!max98373->slave)
>   		return -EINVAL;
>   
> +	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
> +
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		direction = SDW_DATA_DIR_RX;
>   		port_config.num = 1;
> +
> +		if (max98373->slot) {
> +			stream_config.ch_count = max98373->slot;
> +			port_config.ch_mask = max98373->rx_mask;
> +		}
>   	} else {
> -		direction = SDW_DATA_DIR_TX;
>   		port_config.num = 3;
> -	}
>   
> -	stream_config.frame_rate = params_rate(params);
> -	stream_config.bps = snd_pcm_format_width(params_format(params));
> -	stream_config.direction = direction;
> -
> -	if (max98373->slot && direction == SDW_DATA_DIR_RX) {
> -		stream_config.ch_count = max98373->slot;
> -		port_config.ch_mask = max98373->rx_mask;
> -	} else {
>   		/* only IV are supported by capture */
> -		if (direction == SDW_DATA_DIR_TX)
> -			stream_config.ch_count = 2;
Has this special case gone missing or is it already guaranteed by the
DAI config?

> -		else
> -			stream_config.ch_count = params_channels(params);
> -
> +		stream_config.ch_count = 2;
>   		port_config.ch_mask = GENMASK((int)stream_config.ch_count - 1, 0);
this is already done by snd_sdw_params_to_config()
