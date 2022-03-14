Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D704D7FB5
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 11:19:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D92F17DD;
	Mon, 14 Mar 2022 11:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D92F17DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647253163;
	bh=nQGCEaQV4SSt7P7Vs4H6IutV6PQurOMGF3CTakySQ4Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdZrKAJ6/yAKpsn4clqwnlZVpPf5my02/5m4R/zRbbj4M4HMciw1MzthpPQrnw/gc
	 WKP4BpN3JUaNroyg3vfYr3MxTHXN5Nx6us65B7TcV0JDegrUk0nTAzgKxbu5zSfBah
	 quQHanlmRijRKn/lKV34S75CDblcrhWEnAf3y4Pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB91EF801EC;
	Mon, 14 Mar 2022 11:18:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 856A8F80139; Mon, 14 Mar 2022 11:18:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78DD4F80100
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 11:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DD4F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="dZPSbnMF"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 503631F43E42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647253086;
 bh=nQGCEaQV4SSt7P7Vs4H6IutV6PQurOMGF3CTakySQ4Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dZPSbnMF4ru8XqiTI61+q3Z0UEJ7yUYvUGIdlnPn8gD/ZAKNSSa9xQKI6cEe39jCT
 yEn5aSAbkzH4PgPoFNVjWXMx09Knhf/u9WT41z1wMPWXxjAl4e34+gi2RL4gFrD4ZF
 sm5PKK1jQRFrwxhYg95pzkz9pL9aQgrB/SAjl1aAfSA7ClNhLIOX0G2TNkoHbmfr5s
 hckhD84BpWv2LmD71gMNYe8wiqVfNke5nffD8VZHRQIGarIxuTViBB3NTIBi+8iTt2
 aFhq4s1Rrx2Iby/cyGUWO9kkNZaaRVmFoMBdHRzILvvqZNzd5njH38XEpiJU3I0H9V
 jiA5EFb9NLzHQ==
Message-ID: <a497b403-5b20-9a2f-498e-b43727b26675@collabora.com>
Date: Mon, 14 Mar 2022 11:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 19/19] ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-20-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-20-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> This fixes the following build errors when mt6358 is configured as module:
> 
>>> ERROR: modpost: "mt6358_set_mtkaif_protocol"
>>> [sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.ko] undefined!
>>> ERROR: modpost: "mt6358_set_mtkaif_protocol"
>>> [sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.ko] undefined!
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Hello Jiaxin,

Can you please add a Fixes tag to this patch and send it separately from
the MT8186 series?

After adding the Fixes tag:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks,
Angelo

> ---
>   sound/soc/codecs/mt6358.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
> index 1fdd2f8cf877..61f2a7632fd4 100644
> --- a/sound/soc/codecs/mt6358.c
> +++ b/sound/soc/codecs/mt6358.c
> @@ -107,6 +107,7 @@ int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
>   	priv->mtkaif_protocol = mtkaif_protocol;
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_protocol);
>   
>   static void playback_gpio_set(struct mt6358_priv *priv)
>   {
> @@ -273,6 +274,7 @@ int mt6358_mtkaif_calibration_enable(struct snd_soc_component *cmpnt)
>   			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_enable);
>   
>   int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
>   {
> @@ -296,6 +298,7 @@ int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
>   	capture_gpio_reset(priv);
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_disable);
>   
>   int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
>   					int phase_1, int phase_2)
> @@ -310,6 +313,7 @@ int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
>   			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_calibration_phase);
>   
>   /* dl pga gain */
>   enum {

