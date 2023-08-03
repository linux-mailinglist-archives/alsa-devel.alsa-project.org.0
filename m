Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152D76E2EB
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 10:25:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5FE1829;
	Thu,  3 Aug 2023 10:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5FE1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691051106;
	bh=rp9/2JVvPkY4DgcgUhtQzb7rv506eUs97Qg8bysS3KU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tId9WdxSpew1zw38s2dBx9NhuAblc14vpvgl/o7F51rVc5QFrpzSpmP0Ow3WCRE0g
	 i10g+mtY3ZSw3xpQVCOknsKqKl7gFVugx8IPb/63Kvrf1/cZj95zuJUdhKetZGwGjH
	 JKm1uXxnQipdjNYGIxvshlG103Siq2zJl9cP6REg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 921EFF80557; Thu,  3 Aug 2023 10:23:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C9E9F80549;
	Thu,  3 Aug 2023 10:23:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C432F80551; Thu,  3 Aug 2023 10:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D098F80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 10:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D098F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=CV2IVZiZ
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B5A76607194;
	Thu,  3 Aug 2023 09:23:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691051004;
	bh=rp9/2JVvPkY4DgcgUhtQzb7rv506eUs97Qg8bysS3KU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CV2IVZiZqASjHDEVihub0lIJ2F7x/U+GR0EFJjHonsqsLU/yoqDEuQLYLSn9cjcqN
	 mN8/2lrZlBq6U4VUGOUVaVIoy3+5biU6JscM83SJCdprPieE55PMVxQHoB4JBj+H5M
	 sXNOSSQmZhSyuNZ90ewGYz7Rv63L+HJCpTXGGf0gF7F78mlxGqf3Wi0HgTmG84UHsi
	 OrOEePp2TmLHGazGpc+Zz6j2JQsiHoniJPOEdu8TNjCreaPDZbBG7ls5r3tDPGKa2a
	 29hBVzAObGdc4jCGtX+grmbQlqTfvyAdbGVAfHgLinLSvNvtO4HKP8Lom+dZqE0jV3
	 OfC8/T5YHxRlA==
Message-ID: <b363f992-9e70-cf10-6b21-801aa266ec68@collabora.com>
Date: Thu, 3 Aug 2023 10:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] ASoC: mediatek: common: revise SOF common code
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230803052607.25843-1-trevor.wu@mediatek.com>
 <20230803052607.25843-3-trevor.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230803052607.25843-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OTZ5YORT242I6AQ2DGMMCM6YPSOG46AM
X-Message-ID-Hash: OTZ5YORT242I6AQ2DGMMCM6YPSOG46AM
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTZ5YORT242I6AQ2DGMMCM6YPSOG46AM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 03/08/23 07:26, Trevor Wu ha scritto:
> Originally, normal dai link fixup callback is overwritten by sof fixup
> callback on mtk_sof_card_late_probe and it relies on the mapping defined
> on struct sof_conn_stream.
> 
> It's not flexible. When a new hardware connection is adopted, user needs
> to update struct sof_conn_stream defined in machine driver which is used
> to specify the mapping relationship of normal BE and SOF BE.
> 
> In the patch, mtk_sof_check_tplg_be_dai_link_fixup() is introduced for
> all normal BEs. In mtk_sof_late_probe, back up normal BE fixup if it
> exists and then overwrite be_hw_params_fixup by the new callback.
> 
> There are two cases for FE and BE connection.
> 
> case 1:
> SOF FE -> normal BE
>         -> SOF_BE
> 
> case 2:
> normal FE -> normal BE
> 
> In the new fixup callback, it tries to find SOF_BE which connects to the
> same FE, and then reuses the fixup of SOF_BE. If no SOF_BE exists,
> it must be case 2, so rollback to the original fixup if it exists.
> 
> As a result, the predefined relation is not needed anymore. Hardware
> connection can be controlled by the mixer control for AFE interconn.
> Then, DPCM finds the BE mapping at runtime.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   .../soc/mediatek/common/mtk-dsp-sof-common.c  | 106 +++++++++++++++---
>   .../soc/mediatek/common/mtk-dsp-sof-common.h  |   8 ++
>   2 files changed, 99 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
> index 6fef16306f74..3fb193c1f0d9 100644
> --- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
> +++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
> @@ -54,6 +54,8 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
>   {
>   	int i;
>   	struct snd_soc_dai_link *dai_link;
> +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
> +	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
>   
>   	/* Set stream_name to help sof bind widgets */
>   	for_each_card_prelinks(card, i, dai_link) {
> @@ -61,10 +63,74 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
>   			dai_link->stream_name = dai_link->name;
>   	}
>   
> +	INIT_LIST_HEAD(&sof_priv->dai_link_list);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_sof_card_probe);
>   

static int mtk_sof_find_tplg_be_dai_link(struct snd_soc_pcm_runtime *rtd,
					 struct snd_soc_dai_link **sof_dai_link)
{
	... variables here...

	for_each_pcm_streams() {
		fe = NULL;

		.....

		if (!strcmp(...)) {
			sof_dai_link = ....
			return 0;
		}
	}
	return -ENOENT (or something else error);
}

P.S.: otherwise just make this function return a snd_soc_dai_link pointer...

> +/* fixup the BE DAI link to match any values from topology */
> +static int mtk_sof_check_tplg_be_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
> +						struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
> +	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
> +	struct snd_soc_pcm_runtime *fe;
> +	struct snd_soc_pcm_runtime *be;
> +	struct snd_soc_dai_link *sof_dai_link = NULL;
> +	struct mtk_dai_link *dai_link;
> +	struct snd_soc_dpcm *dpcm;
> +	int i, stream;
> +	int ret = 0;
> +
> +	for_each_pcm_streams(stream) {
> +		fe = NULL;
> +		for_each_dpcm_fe(rtd, stream, dpcm) {
> +			fe = dpcm->fe;
> +			if (fe)
> +				break;
> +		}
> +
> +		if (!fe)
> +			continue;
> +
> +		for_each_dpcm_be(fe, stream, dpcm) {
> +			be = dpcm->be;
> +			if (be == rtd)
> +				continue;
> +
> +			for (i = 0; i < sof_priv->num_streams; i++) {
> +				const struct sof_conn_stream *conn = &sof_priv->conn_streams[i];
> +
> +				if (!strcmp(be->dai_link->name, conn->sof_link)) {
> +					sof_dai_link = be->dai_link;
> +					goto FIXUP;
> +				}
> +			}
> +		}
> +	}
> +
> +FIXUP:

Please, lowercase labels... or you can avoid gotos entirely:

	ret = mtk_sof_find_tplg_be_dai_link(...)
	if (ret == 0 && sof_dai_link) {
		if (sof_priv->sof_dai_link_fixup)
			return sof_priv->sof_dai_link_fixup(rtd, params);
		else if (sof_dai_link->be_hw_params_fixup)
			return sof_dai_link->be_hw_params_fixup(be, params);	
	} else {
		list_for_each_entry(dai_link, &sof_priv->dai_link_list, list) {
			if (strcmp(dai_link->name, rtd->dai_link->name) == 0) {
				if (dai_link->be_hw_params_fixup)
					return dai_link->be_hw_params_fixup(rtd, params);
				else
					break;
			}
		}
	}

	return 0;
}

P.S.: I'm truly sorry for not noticing that before!

Regards,
Angelo

> +	if (sof_dai_link) {
> +		if (sof_priv->sof_dai_link_fixup)
> +			ret = sof_priv->sof_dai_link_fixup(rtd, params);
> +		else if (sof_dai_link->be_hw_params_fixup)
> +			ret = sof_dai_link->be_hw_params_fixup(be, params);
> +	} else {
> +		list_for_each_entry(dai_link, &sof_priv->dai_link_list, list) {
> +			if (strcmp(dai_link->name, rtd->dai_link->name) == 0) {
> +				if (dai_link->be_hw_params_fixup)
> +					ret = dai_link->be_hw_params_fixup(rtd, params);
> +
> +				break;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>   int mtk_sof_card_late_probe(struct snd_soc_card *card)
>   {
>   	struct snd_soc_pcm_runtime *rtd;
> @@ -72,6 +138,8 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
>   	struct mtk_soc_card_data *soc_card_data =
>   		snd_soc_card_get_drvdata(card);
>   	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
> +	struct snd_soc_dai_link *dai_link;
> +	struct mtk_dai_link *mtk_dai_link;
>   	int i;
>   
>   	/* 1. find sof component */
> @@ -86,25 +154,37 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
>   		return 0;
>   	}
>   
> -	/* 2. add route path and fixup callback */
> +	/* 2. overwrite all BE fixups, and backup the existing fixup */
> +	for_each_card_prelinks(card, i, dai_link) {
> +		if (dai_link->be_hw_params_fixup) {
> +			mtk_dai_link = devm_kzalloc(card->dev,
> +						    sizeof(*mtk_dai_link),
> +						    GFP_KERNEL);
> +			if (!mtk_dai_link)
> +				return -ENOMEM;
> +
> +			mtk_dai_link->be_hw_params_fixup = dai_link->be_hw_params_fixup;
> +			mtk_dai_link->name = dai_link->name;
> +
> +			list_add(&mtk_dai_link->list, &sof_priv->dai_link_list);
> +		}
> +
> +		if (dai_link->no_pcm)
> +			dai_link->be_hw_params_fixup = mtk_sof_check_tplg_be_dai_link_fixup;
> +	}
> +
> +	/* 3. add route path and SOF_BE fixup callback */
>   	for (i = 0; i < sof_priv->num_streams; i++) {
>   		const struct sof_conn_stream *conn = &sof_priv->conn_streams[i];
>   		struct snd_soc_pcm_runtime *sof_rtd = NULL;
> -		struct snd_soc_pcm_runtime *normal_rtd = NULL;
>   
>   		for_each_card_rtds(card, rtd) {
>   			if (!strcmp(rtd->dai_link->name, conn->sof_link)) {
>   				sof_rtd = rtd;
> -				continue;
> -			}
> -			if (!strcmp(rtd->dai_link->name, conn->normal_link)) {
> -				normal_rtd = rtd;
> -				continue;
> -			}
> -			if (normal_rtd && sof_rtd)
>   				break;
> +			}
>   		}
> -		if (normal_rtd && sof_rtd) {
> +		if (sof_rtd) {
>   			int j;
>   			struct snd_soc_dai *cpu_dai;
>   
> @@ -131,13 +211,9 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
>   				}
>   			}
>   
> +			/* overwrite SOF BE fixup */
>   			sof_rtd->dai_link->be_hw_params_fixup =
>   				sof_comp->driver->be_hw_params_fixup;
> -			if (sof_priv->sof_dai_link_fixup)
> -				normal_rtd->dai_link->be_hw_params_fixup =
> -					sof_priv->sof_dai_link_fixup;
> -			else
> -				normal_rtd->dai_link->be_hw_params_fixup = mtk_sof_dai_link_fixup;
>   		}
>   	}
>   
> diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.h b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
> index dd38c4a93574..4bc5e1c0c8ed 100644
> --- a/sound/soc/mediatek/common/mtk-dsp-sof-common.h
> +++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
> @@ -18,11 +18,19 @@ struct sof_conn_stream {
>   	int stream_dir;
>   };
>   
> +struct mtk_dai_link {
> +	const char *name;
> +	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
> +				  struct snd_pcm_hw_params *params);
> +	struct list_head list;
> +};
> +
>   struct mtk_sof_priv {
>   	const struct sof_conn_stream *conn_streams;
>   	int num_streams;
>   	int (*sof_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
>   				  struct snd_pcm_hw_params *params);
> +	struct list_head dai_link_list;
>   };
>   
>   int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,

