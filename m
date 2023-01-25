Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8877767B3FC
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 15:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF6C1827;
	Wed, 25 Jan 2023 15:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF6C1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674656033;
	bh=I2bmj9RQtk4j7XTXY4tF5RnFzK70rASd/GtJZmZn4kg=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=twjfh0n6wMSunnya9aydQ0qKb6qH7b1bP9fC61lkoAurO2wtzdQuFKVZP1kuahR9H
	 ftAjCjpI6/KXK3sFROazTr2ucjPSIfFv1/JGvxn4trN7kCiJY7MO3T39ngUIH1S/ts
	 UV2zdvgjTubzRG30VbC0ZZv/SIP1RXr9hJ+HcpnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A35F800AE;
	Wed, 25 Jan 2023 15:12:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6693DF80424; Wed, 25 Jan 2023 15:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2726DF800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 15:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2726DF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cPz3UcEH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674655971; x=1706191971;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=I2bmj9RQtk4j7XTXY4tF5RnFzK70rASd/GtJZmZn4kg=;
 b=cPz3UcEHNY3WKsUi8qtYWyrX5aaof7mTFybci0fqW0/A2oNqXq5nH3d5
 ozm97hLvUDfjAI0w/1r7WxeK7ZRZ8eXnM/ptmzwwH4WWtW2sXZjclcjtb
 77tAe3pBjvl9PtJvfcbzWgNT1I5bnGC2Sb4fhGLNhdsw2fejcrpNOBQce
 augl06q7IDNSZu/LRgYSZ4Jy+qWorujvVIKfJMdaMBEru1W3U7AssjL1V
 R6FchwpboqCVjUDHrn8A1FjSuwxxAFcXz1mTbsVwrR8+HE6uGO32m4/OL
 bpBYthEwRd5HPFqBbN4yrpYCYLbmB3DsYZoYsKVo9qcNGEJkH4ONynEC1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="314464684"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="314464684"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 06:12:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="664465013"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="664465013"
Received: from kpotent-mobl.ger.corp.intel.com (HELO [10.252.30.21])
 ([10.252.30.21])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 06:12:38 -0800
Message-ID: <498a8fb8-89a8-6e36-ed54-2cdcf866d1c1@linux.intel.com>
Date: Wed, 25 Jan 2023 16:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH] ASoC: ipc4-topology: use different channel mask for each
 sdw amp feedback
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org
References: <20230125141016.29487-1-peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230125141016.29487-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 25/01/2023 16:10, Peter Ujfalusi wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>

The subject line is missing "SOF", sending v2 right away, sorry.

> Currently, we use the same channel mask for aggregated speakers.
> It works fine for playback because we duplicate the audio data for all
> aggregated speakers. But we need to get audio data from each aggregated
> speaker and combine them to the captured audio. So we need to set
> non-overlapping channel mask for aggregated ALH DAIs.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  sound/soc/sof/ipc4-topology.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index 59f4d42f9011..34586cbb461f 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -1203,8 +1203,11 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
>  			struct sof_ipc4_copier_data *alh_data;
>  			struct sof_ipc4_copier *alh_copier;
>  			struct snd_sof_widget *w;
> +			u32 ch_count = 0;
>  			u32 ch_mask = 0;
>  			u32 ch_map;
> +			u32 step;
> +			u32 mask;
>  			int i;
>  
>  			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
> @@ -1214,11 +1217,15 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
>  			/* Get channel_mask from ch_map */
>  			ch_map = copier_data->base_config.audio_fmt.ch_map;
>  			for (i = 0; ch_map; i++) {
> -				if ((ch_map & 0xf) != 0xf)
> +				if ((ch_map & 0xf) != 0xf) {
>  					ch_mask |= BIT(i);
> +					ch_count++;
> +				}
>  				ch_map >>= 4;
>  			}
>  
> +			step = ch_count / blob->alh_cfg.count;
> +			mask =  GENMASK(step - 1, 0);
>  			/*
>  			 * Set each gtw_cfg.node_id to blob->alh_cfg.mapping[]
>  			 * for all widgets with the same stream name
> @@ -1233,7 +1240,22 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
>  				alh_copier = (struct sof_ipc4_copier *)dai->private;
>  				alh_data = &alh_copier->data;
>  				blob->alh_cfg.mapping[i].alh_id = alh_data->gtw_cfg.node_id;
> -				blob->alh_cfg.mapping[i].channel_mask = ch_mask;
> +				/*
> +				 * Set the same channel mask for playback as the audio data is
> +				 * duplicated for all speakers. For capture, split the channels
> +				 * among the aggregated DAIs. For example, with 4 channels on 2
> +				 * aggregated DAIs, the channel_mask should be 0x3 and 0xc for the
> +				 * two DAI's.
> +				 * The channel masks used depend on the cpu_dais used in the
> +				 * dailink at the machine driver level, which actually comes from
> +				 * the tables in soc_acpi files depending on the _ADR and devID
> +				 * registers for each codec.
> +				 */
> +				if (w->id == snd_soc_dapm_dai_in)
> +					blob->alh_cfg.mapping[i].channel_mask = ch_mask;
> +				else
> +					blob->alh_cfg.mapping[i].channel_mask = mask << (step * i);
> +
>  				i++;
>  			}
>  			if (blob->alh_cfg.count > 1) {

-- 
Péter
