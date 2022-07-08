Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8C56B3F4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 10:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE2E41DB;
	Fri,  8 Jul 2022 10:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE2E41DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657267353;
	bh=LzbKmXmv7B7il/FKmq7QEq+6QN2jxgs/LXih2F4BwGU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pb7LSDesiApuwIFTbgv1MPf77lrHa0xONAvK82wdyDfjHT8nTsgImH6MwHU5XqTb0
	 v5HV3gH/IG2RoaDNdsDlkh5FK28+TPHjK1RIId5enKCPzK/4EGPb5DfJl9qn2zqUBz
	 QUyabPLNbDIb4JzGFYGBdICLZ6FP31pXHTlGskUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DDB3F800C5;
	Fri,  8 Jul 2022 10:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F682F80167; Fri,  8 Jul 2022 10:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E89DCF800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 10:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E89DCF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="CjlJ+P8s"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A78266019D0;
 Fri,  8 Jul 2022 09:01:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657267283;
 bh=LzbKmXmv7B7il/FKmq7QEq+6QN2jxgs/LXih2F4BwGU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CjlJ+P8svhBRvMCG/0a0sKlb5G4gVagcN/c7sYzlGDV0AlznmiMr22htGcxjwHECC
 qQKaGh5T9bsmqD1OCaP/ly9krlA961L8r7Vu6g3wK7WhMBZd/l2h6zWEITQvyY1HSP
 rkgWbC1mffjvVsLGu75tZ+i1cjUMlDE5YjgTp7j9RcIZ5bO3TvMZQobsjxRX4updi8
 t4+wGN2LqTvio2dWsk6hpC8E6lK3TyL9VrS3I6Wn+Z6pTXts220TGrWcDEWbZqlA/g
 RVXOV22Ogoe45YCF+hIepEM7jvRx/nF7jW5KBqGZZXZcSh8K8S7F8Sk+2ud4ypjBc1
 /JN5dK6+CBpFQ==
Message-ID: <ee0d9788-b742-21bb-9cc5-7b729897408b@collabora.com>
Date: Fri, 8 Jul 2022 10:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Remove condition with no effect
Content-Language: en-US
To: Zhongjun Tan <hbut_tan@163.com>, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.c, tiwai@suse.com, matthias.bgg@gmail.com,
 jiaxin.yu@mediatek.com, tanzhongjun@coolpad.com, colin.king@intel.com
References: <20220708024651.42999-1-hbut_tan@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708024651.42999-1-hbut_tan@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Il 08/07/22 04:46, Zhongjun Tan ha scritto:
> From: Zhongjun Tan <tanzhongjun@coolpad.com>
> 
> Remove condition with no effect
> 
> Signed-off-by: Zhongjun Tan <tanzhongjun@coolpad.com>
> ---
>   sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> index db71b032770d..6be6d4f3b585 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> @@ -295,8 +295,6 @@ static int mtk_adda_pad_top_event(struct snd_soc_dapm_widget *w,
>   	case SND_SOC_DAPM_PRE_PMU:
>   		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
>   			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x39);
> -		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
> -			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);

I think that this needs some clarification from MediaTek: was 0x31 a typo here?

Regards,
Angelo

>   		else
>   			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x31);
>   		break;


