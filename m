Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF66905408
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 15:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ECE4DFA;
	Wed, 12 Jun 2024 15:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ECE4DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718199882;
	bh=x0rl/iXkWmbds57DCqfteL3m3Cp5tq8IMlq2/EUKoI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yw7z6PE7rVSVJZmA8SOrRDnyuWI4SFUDq/KjP+F4k7eqoJ051ZGV7S2jCw90FpzNd
	 rOSDlz+IQoudCBmUGSOGH0DgN+zGsS695/TmW0TQkJdk0q+80VdsZqVfBYzfQIahOu
	 0+GslMEdEjpIJM46KJN8daF/pqUv/ClwTKoVdBvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30807F8058C; Wed, 12 Jun 2024 15:44:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC35CF8058C;
	Wed, 12 Jun 2024 15:44:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C1B7F8057A; Wed, 12 Jun 2024 15:44:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19CA1F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 15:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19CA1F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FLHljO6Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718199834; x=1749735834;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=x0rl/iXkWmbds57DCqfteL3m3Cp5tq8IMlq2/EUKoI0=;
  b=FLHljO6Y7uETNjYL47IOnlg3ELlU6JjliYK9Gsc5NaZSo8nMYTjd55gE
   K8K/qxM6tH8YVcgjL21A8sOzjhVTLlRgnseo764mArBhCUDHFPBLE4r2s
   kvgEmv6Bsx4pS2uJ31v65sNTg0bKAC0tx/0OYzT2Rk6QjF4pTNmXkaObl
   UBOJG15Yb+PM/5RcOCHzCeyxQZOltUoIQpgfVscVAT8bARsPPhElyKl8+
   AdyAtZyuWOj0OBDDvE6TV2P8UK21iPVP3lmw+6l50vDhG8eNiM3iRQx3H
   C5jzL0DRXNfo6+f2mmualk8lDHeAc3Zy5bn77JBoRWCt8OIw8tUTKk4qV
   A==;
X-CSE-ConnectionGUID: Zz4LydjoSx+DxLAdXUpo3Q==
X-CSE-MsgGUID: 8bN5hxxhSSWHdb8kq7xcMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18790158"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="18790158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 06:43:48 -0700
X-CSE-ConnectionGUID: LtTVVT6vTV+JqMX0f/pNdQ==
X-CSE-MsgGUID: arbLcujOQqqG3dASF3YCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="40490395"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO [10.245.246.56])
 ([10.245.246.56])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 06:43:39 -0700
Message-ID: <1aad588c-c3b8-46a9-bf70-03028d28350f@linux.intel.com>
Date: Wed, 12 Jun 2024 15:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [RESEND PATCH v4] ASoc: tas2781: Enable RCA-based
 playback without DSP firmware download
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>, "13916275206@139.com" <13916275206@139.com>,
 "zhourui@huaqin.com" <zhourui@huaqin.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Salazar, Ivan" <i-salazar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Chadha, Jasjot Singh" <j-chadha@ti.com>,
 "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
 "Yue, Jaden" <jaden-yue@ti.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "Rao, Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
 "Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
 "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
 "judyhsiao@google.com" <judyhsiao@google.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 "cujomalainey@google.com" <cujomalainey@google.com>,
 "Kutty, Aanya" <aanya@ti.com>, "Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
 "savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
 "flaviopr@microsoft.com" <flaviopr@microsoft.com>,
 "Ji, Jesse" <jesse-ji@ti.com>,
 "darren.ye@mediatek.com" <darren.ye@mediatek.com>
References: <20240606124105.1492-1-shenghao-ding@ti.com>
 <146da765-c53f-4eb4-874e-53625daeb03e@linux.intel.com>
 <c56ec5c5bd7349a788251230deead24a@ti.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c56ec5c5bd7349a788251230deead24a@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SIUPNVPRWAX2ZBBOUJTMWQ4TL6O6ZML6
X-Message-ID-Hash: SIUPNVPRWAX2ZBBOUJTMWQ4TL6O6ZML6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIUPNVPRWAX2ZBBOUJTMWQ4TL6O6ZML6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>> Or this this saying that the baseline is the RCA case, and then the code
>> attempts to load firmware but in case of failures just keep going, i.e.
>> failing to load firmware is NOT an error?
> Correct.
>>
>> That would be somewhat different to the commit title that says 'without DSP
>> firmware download'.
>>
>> Would you mind clarifying the steps please?
> There's two bin files for tas2781, one is register settings(RCA bin file), the other is the dsp firmware and filter coeff.
> If no RCA bin file is load, the tas2781 can't work, it will be TASDEVICE_DSP_FW_FAIL.
> If only RCA bin file load, the tas2781 will work in bypass mode, which dsp do not work, neither spk protection nor acoustic 
> algorithm is enabled 
> (TASDEVICE_RCA_FW_OK).
> If both RCA bin and dsp firmware are loaded, that is TASDEVICE_DSP_FW_ALL_OK, tas2781 work in dsp mode, both spk protection
> and acoustic algorithm are enabled


Now I get it, and I guess I was thrown off by the title of your commit
message and previous comments that the DSP_FW_FAIL state is used for the
HDaudio mode.

It's not that the RCA mode is enabled by this patch. It was present
already in the existing driver code. This patch allows this RCA mode to
become a fallback if the DSP firmware load fails, but the DSP_FW_FAIL is
still used on RCA bin load problems.

So you may want to clarify the commit title and message, but from a code
perspective things looks ok:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


>>>  		tasdevice_dsp_remove(tas_priv);
>>>  	}
>>>  	mutex_unlock(&tas_priv->codec_lock);
>>> @@ -466,14 +474,14 @@ static int tasdevice_startup(struct
>>> snd_pcm_substream *substream,  {
>>>  	struct snd_soc_component *codec = dai->component;
>>>  	struct tasdevice_priv TASDEVICE_RCA_FW_OK*tas_priv =
>> snd_soc_component_get_drvdata(codec);
>>> -	int ret = 0;
>>>
>>> -	if (tas_priv->fw_state != TASDEVICE_DSP_FW_ALL_OK) {
>>> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
>>> -		ret = -EINVAL;
>>> +	switch (tas_priv->fw_state) {
>>> +	case TASDEVICE_RCA_FW_OK:
>>> +	case TASDEVICE_DSP_FW_ALL_OK:
>>> +		return 0;
>>> +	default:
>>> +		return -EINVAL;
>>>  	}
>>> -
>>> -	return ret;
>>>  }
>>>
>>>  static int tasdevice_hw_params(struct snd_pcm_substream *substream,
