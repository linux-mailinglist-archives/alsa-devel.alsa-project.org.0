Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4858D3A71
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 17:15:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2398950;
	Wed, 29 May 2024 17:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2398950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716995740;
	bh=+5PvPZmLOmnshPNPKSLTEOoqrHNii4uujhjt1IhjMqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dqRQ6EtB6Z5f6q57NRU9XsAf8uD8olcYurCiXSHvc/m+zS7tipBj+AAI3gbdsz7LE
	 v5kpuNAyRubB25lsYMGm8XTat0zHrbeGjpWhU2bYunS5MznNkFIsM3iZQ2BxpfrvEy
	 0NrYNMZLpTNwLI71U6sHe3Hbonb0ME/fknKzA3I8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34778F805AA; Wed, 29 May 2024 17:15:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E33EEF80578;
	Wed, 29 May 2024 17:15:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AD80F80149; Wed, 29 May 2024 17:15:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA39BF800BA
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 17:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA39BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MuXU0MBa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716995699; x=1748531699;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+5PvPZmLOmnshPNPKSLTEOoqrHNii4uujhjt1IhjMqQ=;
  b=MuXU0MBa79pAw8+s3mYO/qoPlHLp7mXfH3zyAZAnxyQ4xuH6ANBsw0u+
   8sioraTZdjczCCEhpniSK6Xxhpv/WfCPXLrsjYgv3S97n28VQNOJFETsg
   F/KRysuAahRUHp8Nc77EpYu6NG1tqEq9Va5WP9Fqyg7tx1SLcn0N9g6jE
   /8U7wpIyk3qiJyi2bRkcIa9rwmXzE7cGN6aaiBYGyrowbniHKTvxsqPwM
   Hsh3RlOC0ycogSYbTiFRBLsdK2ABhcZGcl+Yo/l201Bw2SfEOX2KWDhVy
   nQaqheY3S6zFmE5NdU/sF59qX7LvG/pWoqJqTEVwZiSTAWua1NTOcktHW
   w==;
X-CSE-ConnectionGUID: hNA3NegoTxWjrsbXX76nXA==
X-CSE-MsgGUID: 5Q0XzvKOQWSN2nNr/bBoaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13356158"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000";
   d="scan'208";a="13356158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 08:14:55 -0700
X-CSE-ConnectionGUID: pVfW9CPiQYG+ybnwT0wnIA==
X-CSE-MsgGUID: J8vlnD7eSByTEwjwOndNIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000";
   d="scan'208";a="39892434"
Received: from unknown (HELO [10.125.111.89]) ([10.125.111.89])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 08:14:52 -0700
Message-ID: <de2d3908-e424-4449-9ee5-c1b783d73a9d@linux.intel.com>
Date: Wed, 29 May 2024 09:23:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoc: tas2781: Enable RCA-based playback without DSP
 firmware download
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 kevin-lu@ti.com, yuhsuan@google.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com
References: <20240529103543.2089-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240529103543.2089-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V3QG6A4YUQAHHSHS3BSPNSYP35T5RRFZ
X-Message-ID-Hash: V3QG6A4YUQAHHSHS3BSPNSYP35T5RRFZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3QG6A4YUQAHHSHS3BSPNSYP35T5RRFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> In only RCA(Reconfigurable Architecture) binary case, no DSP program will
> be working inside tas2563/tas2781, that is dsp-bypass mode, do not support
> speaker protection, and audio acoustic algorithms in this mode.

The commit title and body are much better, thank you!


> -enum tasdevice_dsp_fw_state {
> +enum tasdevice_fw_state {
>  	TASDEVICE_DSP_FW_NONE = 0,
>  	TASDEVICE_DSP_FW_PENDING,
>  	TASDEVICE_DSP_FW_FAIL,
> +	TASDEVICE_RCA_FW_OK,
>  	TASDEVICE_DSP_FW_ALL_OK,

You should really add a description of what the state machine looks
like, and why FW_PENDING/FAIL remain but are not used.

>  };
>  
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
> index 265a8ca25cbb..5db1a0ac6036 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -2324,14 +2324,19 @@ void tasdevice_tuning_switch(void *context, int state)
>  	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
>  	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
>  
> -	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> +	/*
> +	 * Only RCA-based Playback can still work with no dsp program running
> +	 * inside the chip?
> +	 */
> +	if (!(tas_priv->fw_state == TASDEVICE_RCA_FW_OK ||
> +		tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)) {
> +		dev_err(tas_priv->dev, "No firmware loaded\n");
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
> index 9350972dfefe..9b85a44511c2 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -380,23 +380,33 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
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
> +	/*
> +	 * If no dsp-related kcontrol created, the dsp resource will be freed.
> +	 */
> +	ret = tasdevice_dsp_create_ctrls(tas_priv);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "dsp controls error\n");
> +		goto out;
> +	}
>  
>  	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
>  
> @@ -417,9 +427,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
>  	tasdevice_prmg_load(tas_priv, 0);
>  	tas_priv->cur_prog = 0;
>  out:
> -	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> -		/*If DSP FW fail, kcontrol won't be created */
> -		tasdevice_config_info_remove(tas_priv);
> +	if (tas_priv->fw_state == TASDEVICE_RCA_FW_OK) {
> +		/*If DSP FW fail, DSP kcontrol won't be created */

please add spaces on each side of a comment.

>  		tasdevice_dsp_remove(tas_priv);

So the state "FW_OK" means a fail now? It's not clear if this branch
will work in all cases, including the original configuration where RCA
was NOT used.

Your previous explanation on the states is very hard to follow

>> It looks like you're no longer using PENDING and FAIL states?
> The state machine is becoming really hard to follow.
PENDING and FAIL states have been used in HDA-based tas2563/tas2781 driver

Not following why the DSP boot state would depend on what interface is
used to load firmware?

If this is because the definition is included in two separate drivers,
is this ok to add an intermediate state on one side but not the other?
Is there any merit to a shared definition if the states are completely
different?


>  	}
>  	mutex_unlock(&tas_priv->codec_lock);
> @@ -466,14 +475,14 @@ static int tasdevice_startup(struct snd_pcm_substream *substream,
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
