Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52A8D0216
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 15:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFDB2846;
	Mon, 27 May 2024 15:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFDB2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716817539;
	bh=Y4lg1w9PMKXk/DYDc4ftwcvGasjMUD1Xkcb1fEgP/BU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UJuyOuFKgZv5q5vsYPzAAKu7jj2vWTaasmfOAwqIrOtcuTbsZlZhFcLK7x8+DtPsQ
	 wquWWRnkJpS6TVvTPtVfQ01V/y/R5QssFgaRS14kXEL+Y/L//kmuOBUNADrClDATP+
	 8WfiHhZiyotvSGfdizh6YhCGSe7kRufecNB151k4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4637BF8051E; Mon, 27 May 2024 15:45:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBDB6F80580;
	Mon, 27 May 2024 15:45:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3969BF8026D; Mon, 27 May 2024 15:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C905F80051
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 15:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C905F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IXJQlHUi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716817455; x=1748353455;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y4lg1w9PMKXk/DYDc4ftwcvGasjMUD1Xkcb1fEgP/BU=;
  b=IXJQlHUih2YJNd1OrpuNYrKZXG+RA1Dessic7Efhx8OEYJBwWO4VC6yJ
   4AT9yjSHOyl4CmzI5U9WNQzlRiU+IHoqnJP/wxD2u8nAmdI5gOQHiYZbc
   6Xa9OkFhyJpoIYGbBVQvIxxv4qw78HgtHoUUXo8B9QOk2tYUAeOa/XYcu
   ZkMLkt6bQ1W+hHMTGATbq36GYApL7PRBhMvQvErfmkQCJdNsRoJEPXopQ
   +rD2uVjJ95gAwY5doRZisI6RBLRnjdyk4Pt4salTvsqLUB32JBnr2nkSg
   kcugtiwY0d5O2bLmYJDi/Lw7XGB3YcmQkSvkP9UeWiN9WY6rfikKZF1c8
   g==;
X-CSE-ConnectionGUID: 9cOnb6SdTPe+jpL3khdJJA==
X-CSE-MsgGUID: ukQfmaFBT8KBqrVo51fE6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24265229"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000";
   d="scan'208";a="24265229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:44:10 -0700
X-CSE-ConnectionGUID: +/Yk/RZZSai7ZanjM3CxDg==
X-CSE-MsgGUID: Hdj76MThTLiwanVCmdpq2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000";
   d="scan'208";a="39210524"
Received: from kinlongk-mobl1.amr.corp.intel.com (HELO [10.125.110.211])
 ([10.125.110.211])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 06:44:07 -0700
Message-ID: <6a8ab4f6-63be-4284-814a-d853faf000b5@linux.intel.com>
Date: Mon, 27 May 2024 08:44:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoc: tas2781: Playback can work when only RCA binary
 loading without dsp firmware loading
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 kevin-lu@ti.com, yuhsuan@google.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com
References: <20240525014727.197-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240525014727.197-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MXAPPYGG32EHIN3FEMYLAMIMT7PYKPQ3
X-Message-ID-Hash: MXAPPYGG32EHIN3FEMYLAMIMT7PYKPQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXAPPYGG32EHIN3FEMYLAMIMT7PYKPQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/24/24 20:47, Shenghao Ding wrote:
> In only RCA binary loading case, only default dsp program inside the
> chip will be work.

What does 'RCA' stand for?

Also clarify the commit title without double negatives, e.g.

"Enable RCA-based playback without DSP firmware download"
> -	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> +	/*
> +	 * Only RCA file loaded can still work with default dsp program inside
> +	 * the chip?

reword the commit and remove question mark.

> +	 */
> +	if (!(tas_priv->fw_state == TASDEVICE_RCA_FW_OK ||
> +		tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)) {
> +		dev_err(tas_priv->dev, "No firmware loaded\n");
>  		return;
>  	}
>  
>  	if (state == 0) {
> -		if (tas_priv->cur_prog < tas_fmw->nr_programs) {
> +		if (tas_fmw && tas_priv->cur_prog < tas_fmw->nr_programs) {
>  			/*dsp mode or tuning mode*/

spaces in comments

>  			profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
>  			tasdevice_select_tuningprm_cfg(tas_priv,
> @@ -2340,9 +2345,10 @@ void tasdevice_tuning_switch(void *context, int state)
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
> index 9350972dfefe..ccb9313ada9b 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -380,23 +380,30 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
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
> +
>  	ret = tasdevice_dsp_parser(tas_priv);
>  	if (ret) {
>  		dev_err(tas_priv->dev, "dspfw load %s error\n",
>  			tas_priv->coef_binaryname);
> -		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
>  		goto out;
>  	}
> -	tasdevice_dsp_create_ctrls(tas_priv);
> +
> +	ret = tasdevice_dsp_create_ctrls(tas_priv);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "dsp controls error\n");
> +		goto out;
> +	}

this seems unrelated to the boot process? Move to a different patch?

>  
>  	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
>  
> @@ -417,9 +424,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
>  	tasdevice_prmg_load(tas_priv, 0);
>  	tas_priv->cur_prog = 0;
>  out:
> -	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> -		/*If DSP FW fail, kcontrol won't be created */
> -		tasdevice_config_info_remove(tas_priv);
> +	if (tas_priv->fw_state == TASDEVICE_RCA_FW_OK) {
> +		/*If DSP FW fail, DSP kcontrol won't be created */

It looks like you're no longer using PENDING and FAIL states?
The state machine is becoming really hard to follow.

>  		tasdevice_dsp_remove(tas_priv);
>  	}
>  	mutex_unlock(&tas_priv->codec_lock);
> @@ -466,14 +472,14 @@ static int tasdevice_startup(struct snd_pcm_substream *substream,
>  {
>  	struct snd_soc_component *codec = dai->component;
>  	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
> -	int ret = 0;
>  
> -	if (tas_priv->fw_state != TASDEVICE_DSP_FW_ALL_OK) {
> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> -		ret = -EINVAL;
> +	if (!(tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK ||
> +		tas_priv->fw_state == TASDEVICE_RCA_FW_OK)) {
> +		dev_err(tas_priv->dev, "Bin file not loaded\n");
> +		return -EINVAL;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int tasdevice_hw_params(struct snd_pcm_substream *substream,
