Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBD8FE734
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454CAAE8;
	Thu,  6 Jun 2024 15:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454CAAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717679423;
	bh=UdIASnxSyzifbmV5AhtmKjM701NiVtnzUbuXyj3DwEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JvOwmyLekp8g/Rt1GPGpDGNoavyZbOH76pJG4WDBJLh3vX35BRiW8DkrwNyus4L/5
	 g0UKBQcI6YCI632iUf5AXvyq/AWTf5ZyPLPv6mESO6rn9/TFz9SWErK3WN6krkG9Eh
	 iqZx/Uyjp1lc7+vV65FbPYDZH7p8VNRJBi8M9YUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B643F805AA; Thu,  6 Jun 2024 15:09:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E86F80589;
	Thu,  6 Jun 2024 15:09:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A540FF8025A; Thu,  6 Jun 2024 15:09:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F195AF80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F195AF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aY6cpOII
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717679378; x=1749215378;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UdIASnxSyzifbmV5AhtmKjM701NiVtnzUbuXyj3DwEg=;
  b=aY6cpOIIGZuMonpEAWd7j2Mrm5BARC8zFR4hdgf+lzWdfU59C5uKCQLE
   gJ31PpU/so2/Zl/ofNQ4cF0dmT9SzpovemRThnaVGs1ODapoqTXDe2AA+
   4V1iKTrTqyU3h90JFgHq8daZHQNqvDm4jUxDpnMvF3nMUC7YidK50+e3k
   F/Dlu2Ynsd/bccVPHd5eUFQD1k+Mhmw79JXk5VCrfoP9Y2oZ7WejTZ2gK
   5+mHJZwi8qf/ksJ06HFnQIpfwWXB/bsrxpOZB/n2O9ao4cotsEJK8Fjko
   dcIgbCUdX80AfYKNA15UbAHhyiIQmL1NmBZ4BRcE0FR4GUpAFY/DYFZpc
   w==;
X-CSE-ConnectionGUID: 9lzGnH9PQIuUH0/WUghshQ==
X-CSE-MsgGUID: 870XF2+ZTymFyCWVmA1VFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14497866"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000";
   d="scan'208";a="14497866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:09:33 -0700
X-CSE-ConnectionGUID: z21AS0lJQDCamOm6pqPLcA==
X-CSE-MsgGUID: sPiIrrc4TLyOrDwQx04CvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000";
   d="scan'208";a="42890050"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.20])
 ([10.245.246.20])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:09:24 -0700
Message-ID: <146da765-c53f-4eb4-874e-53625daeb03e@linux.intel.com>
Date: Thu, 6 Jun 2024 15:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4] ASoc: tas2781: Enable RCA-based playback
 without DSP firmware download
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, zhourui@huaqin.com, alsa-devel@alsa-project.org,
 i-salazar@ti.com, linux-kernel@vger.kernel.org, j-chadha@ti.com,
 liam.r.girdwood@intel.com, jaden-yue@ti.com,
 yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
 henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
 Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com,
 darren.ye@mediatek.com
References: <20240606124105.1492-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240606124105.1492-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ANC7GHYDTFVLYKARXTNW75HI5ID7IN6I
X-Message-ID-Hash: ANC7GHYDTFVLYKARXTNW75HI5ID7IN6I
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ANC7GHYDTFVLYKARXTNW75HI5ID7IN6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I am afraid there are still circular logic issues, or the code/comments
don't capture what you are trying to do....


> diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
> index 7fba7ea26a4b..3cda9da14f6d 100644
> --- a/include/sound/tas2781-dsp.h
> +++ b/include/sound/tas2781-dsp.h
> @@ -117,10 +117,17 @@ struct tasdevice_fw {
>  	struct device *dev;
>  };
>  
> -enum tasdevice_dsp_fw_state {
> -	TASDEVICE_DSP_FW_NONE = 0,
> +enum tasdevice_fw_state {
> +	/* Driver in startup mode, not load any firmware. */
>  	TASDEVICE_DSP_FW_PENDING,
> +	/* DSP firmware in the system, but parsing error. */
>  	TASDEVICE_DSP_FW_FAIL,
> +	/*
> +	 * Only RCA (Reconfigurable Architecture) firmware load
> +	 * successfully.
> +	 */
> +	TASDEVICE_RCA_FW_OK,
> +	/* Both RCA and DSP firmware load successfully. */
>  	TASDEVICE_DSP_FW_ALL_OK,
>  };
>  
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
> index 265a8ca25cbb..838d29fead96 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -2324,14 +2324,21 @@ void tasdevice_tuning_switch(void *context, int state)
>  	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
>  	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
>  
> -	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> +	/*
> +	 * Only RCA-based Playback can still work with no dsp program running
> +	 * inside the chip.
> +	 */
> +	switch (tas_priv->fw_state) {
> +	case TASDEVICE_RCA_FW_OK:
> +	case TASDEVICE_DSP_FW_ALL_OK:

[1] so according to both the comment and code the RCA_FW_OK is fine and
the device 'works', but ...

> +		break;
> +	default:
>  		return;
>  	}
>  
>  	if (state == 0) {
> -		if (tas_priv->cur_prog < tas_fmw->nr_programs) {
> -			/*dsp mode or tuning mode*/
> +		if (tas_fmw && tas_priv->cur_prog < tas_fmw->nr_programs) {
> +			/* dsp mode or tuning mode */
>  			profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
>  			tasdevice_select_tuningprm_cfg(tas_priv,
>  				tas_priv->cur_prog, tas_priv->cur_conf,
> @@ -2340,9 +2347,10 @@ void tasdevice_tuning_switch(void *context, int state)
>  
>  		tasdevice_select_cfg_blk(tas_priv, profile_cfg_id,
>  			TASDEVICE_BIN_BLK_PRE_POWER_UP);
> -	} else
> +	} else {
>  		tasdevice_select_cfg_blk(tas_priv, profile_cfg_id,
>  			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
> +	}
>  }
>  EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch,
>  	SND_SOC_TAS2781_FMWLIB);
> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
> index 9350972dfefe..9c3c89cb36de 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -380,23 +380,32 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
>  	mutex_lock(&tas_priv->codec_lock);
>  
>  	ret = tasdevice_rca_parser(tas_priv, fmw);
> -	if (ret)
> +	if (ret) {
> +		tasdevice_config_info_remove(tas_priv);
>  		goto out;
> +	}
>  	tasdevice_create_control(tas_priv);
>  
>  	tasdevice_dsp_remove(tas_priv);
>  	tasdevice_calbin_remove(tas_priv);
> -	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
> +	tas_priv->fw_state = TASDEVICE_RCA_FW_OK;
>  	scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
>  		tas_priv->dev_name);
>  	ret = tasdevice_dsp_parser(tas_priv);
>  	if (ret) {
>  		dev_err(tas_priv->dev, "dspfw load %s error\n",
>  			tas_priv->coef_binaryname);
> -		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;

... in this branch the fw_state remains TASDEVICE_RCA_FW_OK,
so



>  		goto out;
>  	}
> -	tasdevice_dsp_create_ctrls(tas_priv);
> +
> +	/*
> +	 * If no dsp-related kcontrol created, the dsp resource will be freed.
> +	 */
> +	ret = tasdevice_dsp_create_ctrls(tas_priv);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "dsp controls error\n");
> +		goto out;
> +	}

... we never reach this line ...

>  
>  	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
>  
> @@ -417,9 +426,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
>  	tasdevice_prmg_load(tas_priv, 0);
>  	tas_priv->cur_prog = 0;
>  out:
> -	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> -		/*If DSP FW fail, kcontrol won't be created */
> -		tasdevice_config_info_remove(tas_priv);
> +	if (tas_priv->fw_state == TASDEVICE_RCA_FW_OK) {
> +		/* If DSP FW fail, DSP kcontrol won't be created. */

... and here this TASDEVICE_RCA_FW_OK really means a fail.

so how can [1] consider TASDEVICE_RCA_FW_OK as a success case?

Or this this saying that the baseline is the RCA case, and then the code
attempts to load firmware but in case of failures just keep going, i.e.
failing to load firmware is NOT an error?

That would be somewhat different to the commit title that says 'without
DSP firmware download'.

Would you mind clarifying the steps please?


>  		tasdevice_dsp_remove(tas_priv);
>  	}
>  	mutex_unlock(&tas_priv->codec_lock);
> @@ -466,14 +474,14 @@ static int tasdevice_startup(struct snd_pcm_substream *substream,
>  {
>  	struct snd_soc_component *codec = dai->component;
>  	struct tasdevice_priv TASDEVICE_RCA_FW_OK*tas_priv = snd_soc_component_get_drvdata(codec);
> -	int ret = 0;
>  
> -	if (tas_priv->fw_state != TASDEVICE_DSP_FW_ALL_OK) {
> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> -		ret = -EINVAL;
> +	switch (tas_priv->fw_state) {
> +	case TASDEVICE_RCA_FW_OK:
> +	case TASDEVICE_DSP_FW_ALL_OK:
> +		return 0;
> +	default:
> +		return -EINVAL;
>  	}
> -
> -	return ret;
>  }
>  
>  static int tasdevice_hw_params(struct snd_pcm_substream *substream,
