Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAA98D64CA
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 16:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3677E868;
	Fri, 31 May 2024 16:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3677E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717166979;
	bh=MG4XTF460ME3QysgJdn6KSQKbYDcjfrewhgJYyzES+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N/SU/KAPZuLXufjssg6kS7dYLyKMIpF63pkJBZR0OvHC2F87CcP4pMHqNc+s7D4Bz
	 lOhjU3jBsvHR3AVieIGYh0grg8FhieXMGSyeYO0XO/ELqHOHn6KSlcD3CPXjmDpnK+
	 upeolUPouq48OHw3U8V252KknfK7/2aqt7ma7Fkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31E9DF80580; Fri, 31 May 2024 16:49:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FD1CF805A0;
	Fri, 31 May 2024 16:49:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 149B7F8047C; Fri, 31 May 2024 16:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABEA4F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 16:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABEA4F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kEamQRLc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717166939; x=1748702939;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MG4XTF460ME3QysgJdn6KSQKbYDcjfrewhgJYyzES+8=;
  b=kEamQRLcPIaRgcpnBwoQXTWXRp5HRbvs6Ub+22zARPxI9pqvoRNhhZZu
   SpTIiCBO6gCj2zgzcHxzuGiM/3WCMuT4X9ecszH1QP7gTDEFpgUDoTBzO
   Wx0choO6P3ZVOzuI/EKVx4jfD9neD62nHak5hXMuQsCqCKrWTgNhmDJxm
   xGVE2b6DMY3igPl5a/AUjJ4FCr2uH+9v/zwDXDs3Y8MYhOVj9XumqzzT6
   WJCPy5AIUzqmXXZSNAEew3BFE+Ukg13acb9txPQRzcfvc3YAnWLYG2tsK
   1E0WcGzVSfZy53MzEz8KQnAKv5k5Q8CNBu5Dgks7kX4iQLNlz0C2d0yTM
   g==;
X-CSE-ConnectionGUID: vL3Zo2JOQY6hFVykn392Qw==
X-CSE-MsgGUID: 9p8b/E0ITwmwdrMYmTexmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24288611"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="24288611"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:47:59 -0700
X-CSE-ConnectionGUID: eiuozHKnS2iAMwXvlG0LLQ==
X-CSE-MsgGUID: ztnHMCkNRxanqV1Z1AVwhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="59361042"
Received: from ibganev-desk.amr.corp.intel.com (HELO [10.125.108.40])
 ([10.125.108.40])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:47:56 -0700
Message-ID: <f1b6d4d8-1d17-4d1f-ba9d-8b59393a6676@linux.intel.com>
Date: Fri, 31 May 2024 09:46:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoc: tas2781: Enable RCA-based playback without DSP
 firmware download
To: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 13916275206@139.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
 linux-kernel@vger.kernel.org, j-chadha@ti.com, liam.r.girdwood@intel.com,
 jaden-yue@ti.com, yung-chuan.liao@linux.intel.com, dipa@ti.com,
 yuhsuan@google.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
 Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
 cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
 savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com, jesse-ji@ti.com
References: <20240531052636.565-1-shenghao-ding@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240531052636.565-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CPZISJQNQC4CHQYS7HZ74AOFAUO6JOYG
X-Message-ID-Hash: CPZISJQNQC4CHQYS7HZ74AOFAUO6JOYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPZISJQNQC4CHQYS7HZ74AOFAUO6JOYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


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

I appreciate the effort to document the states, but for the RCA cases we
can have two 'success' states?

> -	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
> +	tas_priv->fw_state = TASDEVICE_RCA_FW_OK;
>  	scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
>  		tas_priv->dev_name);
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

from this code, it seems that the RCA case goes from RCA_FW_OK to
TASDEVICE_DSP_FW_ALL_OK, so there's a difference between the two states, no?


> @@ -466,14 +474,14 @@ static int tasdevice_startup(struct snd_pcm_substream *substream,
>  {
>  	struct snd_soc_component *codec = dai->component;
>  	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
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

maybe keep the error logs?

