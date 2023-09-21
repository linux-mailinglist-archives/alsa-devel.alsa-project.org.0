Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCFB7A94CD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B39EC1;
	Thu, 21 Sep 2023 15:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B39EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302966;
	bh=YFNNyBmiEk3rLroLYnamlhN/dyD1rbf5jeUM8GnGhtU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mMgIIotDsQSkVDCF6KB8s/2hwAneGpjZitIFC1wER4v/YikGGPwq7bGITgH0AALx6
	 mh+bTswSCc5h5SR1evhlFUYTrwQGYipbjL9lJXJ77YCtB90R+KIozMvdXPSPlNmKlT
	 S7FU3ACOAMHKm4uS88olN0iKHLdCKcFGvODj75uU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 558C0F8047D; Thu, 21 Sep 2023 15:28:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCE0F8025A;
	Thu, 21 Sep 2023 15:28:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3BEBF80494; Thu, 21 Sep 2023 15:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89051F801F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 15:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89051F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=e4IUGIBx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9Z4adN7p
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 690E6338A8;
	Thu, 21 Sep 2023 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695302888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TS3D+7Noi/ekM5Do3sWjHaf4aVYAbdJpk5SpStfjSjo=;
	b=e4IUGIBxWuD0/AkunF7JdM5NTJ0RRW3PhXXUz+HXwMiarod8FPEF92EQRTfvGsLlPnzY+v
	mv37dd0PrsMfFutaK74VpeLRGd7B9pRw0spvcNoPQ1rjbCQ9xuFSJwMmW6llxkwIpo+0Z0
	Cg1ztwfdm4p10lZpMnrbEMXCiTcB4eY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695302888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TS3D+7Noi/ekM5Do3sWjHaf4aVYAbdJpk5SpStfjSjo=;
	b=9Z4adN7psTvw+/3+rl5LzfIMvN5CvJm+uZFWWhS9pAj8fA5SVthBr4fH3RLfuHiHKnL5ov
	/n53GGuf0Iss2BCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3BBCC134B0;
	Thu, 21 Sep 2023 13:28:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id elmJDehEDGWhOAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 21 Sep 2023 13:28:08 +0000
Date: Thu, 21 Sep 2023 15:28:07 +0200
Message-ID: <87jzsjzme0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH] ASoC: hdac_hda: fix HDA patch loader support
In-Reply-To: <20230921064317.2120452-1-yung-chuan.liao@linux.intel.com>
References: <20230921064317.2120452-1-yung-chuan.liao@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: DB65TTFC6TZ22SLQFYIICUTD2TZUGKNE
X-Message-ID-Hash: DB65TTFC6TZ22SLQFYIICUTD2TZUGKNE
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DB65TTFC6TZ22SLQFYIICUTD2TZUGKNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 08:43:17 +0200,
Bard Liao wrote:
> 
> The array size is irrelevant with SNDRV_CARDS. dev_index is from
> codec address and the available codec number is HDA_MAX_CODECS.
> Also, hda_pvt->fw is for a temporary use, no need to add a new extra
> field in hdac_hda_priv{}.
> 
> Fixes: 842a62a75e70 ("ASoC: hdac_hda: add HDA patch loader support")
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> ---
>  sound/soc/codecs/hdac_hda.c | 15 ++++++++-------
>  sound/soc/codecs/hdac_hda.h |  3 ---
>  2 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
> index 8f5d97949d3d..355f30779a34 100644
> --- a/sound/soc/codecs/hdac_hda.c
> +++ b/sound/soc/codecs/hdac_hda.c
> @@ -37,10 +37,10 @@
>  				 SNDRV_PCM_RATE_192000)
>  
>  #ifdef CONFIG_SND_HDA_PATCH_LOADER
> -static char *loadable_patch[SNDRV_CARDS];
> +static char *loadable_patch[HDA_MAX_CODECS];
>  
>  module_param_array_named(patch, loadable_patch, charp, NULL, 0444);
> -MODULE_PARM_DESC(patch, "Patch file for Intel HD audio interface.");
> +MODULE_PARM_DESC(patch, "Patch file array for Intel HD audio interface. The array index is the codec address.");
>  #endif
>  
>  static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
> @@ -434,20 +434,21 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
>  
>  #ifdef CONFIG_SND_HDA_PATCH_LOADER
>  	if (loadable_patch[hda_pvt->dev_index] && *loadable_patch[hda_pvt->dev_index]) {
> +		const struct firmware *fw;
> +
>  		dev_info(&hdev->dev, "Applying patch firmware '%s'\n",
>  			 loadable_patch[hda_pvt->dev_index]);
> -		ret = request_firmware(&hda_pvt->fw, loadable_patch[hda_pvt->dev_index],
> +		ret = request_firmware(&fw, loadable_patch[hda_pvt->dev_index],
>  				       &hdev->dev);
>  		if (ret < 0)
>  			goto error_no_pm;
> -		if (hda_pvt->fw) {
> -			ret = snd_hda_load_patch(hcodec->bus, hda_pvt->fw->size, hda_pvt->fw->data);
> +		if (fw) {
> +			ret = snd_hda_load_patch(hcodec->bus, fw->size, fw->data);
>  			if (ret < 0) {
>  				dev_err(&hdev->dev, "failed to load hda patch %d\n", ret);
>  				goto error_no_pm;
>  			}
> -			release_firmware(hda_pvt->fw);
> -			hda_pvt->fw = NULL;
> +			release_firmware(fw);
>  		}
>  	}
>  #endif
> diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
> index b7a12aea8d32..d03a5d4e7288 100644
> --- a/sound/soc/codecs/hdac_hda.h
> +++ b/sound/soc/codecs/hdac_hda.h
> @@ -27,9 +27,6 @@ struct hdac_hda_priv {
>  	struct hdac_hda_pcm pcm[HDAC_DAI_ID_NUM];
>  	bool need_display_power;
>  	int dev_index;
> -#ifdef CONFIG_SND_HDA_PATCH_LOADER
> -	const struct firmware *fw;
> -#endif
>  };
>  
>  struct hdac_ext_bus_ops *snd_soc_hdac_hda_get_ops(void);
> -- 
> 2.25.1
> 
