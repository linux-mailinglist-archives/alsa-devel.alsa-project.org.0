Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FD7D7085
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 17:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903BF868;
	Wed, 25 Oct 2023 17:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903BF868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698246909;
	bh=4AB1mlCoTUhDm9/eS/vpI2QL7TeGXM3DYMZnJsK9evs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ek8h1Xfyj55nPnY7MOHKD1nmTYi9igtL3MdsTS5IvJ66Q27ajZwEZik7rjovSqQc+
	 4lonLAhJ0SlrF/i+5s+SGCyeOyIYkCmfA+9wof8nwfBpnokAawU+eraPF0OYVX/o2s
	 P/mJvjuH/M1KGgpu6zAH7vlt+7+fdpdyicns1mSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4678F8057F; Wed, 25 Oct 2023 17:13:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E715F80571;
	Wed, 25 Oct 2023 17:13:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01236F80152; Wed, 25 Oct 2023 17:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED531F8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 17:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED531F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DVGnuwxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698246801; x=1729782801;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=4AB1mlCoTUhDm9/eS/vpI2QL7TeGXM3DYMZnJsK9evs=;
  b=DVGnuwxBp1Sw1mYi1vQfWzF9y4TQTH8lznfIqvu6Xp1gfLsKMmpz/YBT
   uPwDF+iGprADo8HdDm+QSB1QddcXouVuzKlEyGgxPS2j6AaqeGJXloiS7
   mF7ZYcrlb7hcKhoc2DqX/C/sbI2hy0yTvKPmA5q7eFzWsUDrlb7S4elY/
   HfIMiUP/L0TDglP5yXEgW/gPaHYaYGLxbJBgxG0C+Cqf2uvSTHqsO9hpu
   9VLLYCwNU/oKefm0X66oza/EINExb9d8BvN523TQNfgVrm/cIYxMd3iwG
   XcOHT8h3H8LS6eWFEXzvQwB5JBNczGkQ1Jp3AHZ8zGMySjTFHhWCizS4g
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="5943378"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200";
   d="scan'208";a="5943378"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829259475"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200";
   d="scan'208";a="829259475"
Received: from rswenton-mobl.amr.corp.intel.com (HELO [10.212.132.169])
 ([10.212.132.169])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:13:08 -0700
Message-ID: <322002af-09e8-4d4c-bc85-81654c6b5f9d@linux.intel.com>
Date: Wed, 25 Oct 2023 10:12:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soundwire: qcom: drop unneeded DAI .set_stream
 callback
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NRATUTXTWFIU5ZPLASFJOPSCTY3ANREO
X-Message-ID-Hash: NRATUTXTWFIU5ZPLASFJOPSCTY3ANREO
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/25/23 09:45, Krzysztof Kozlowski wrote:
> Qualcomm Soundwire controller drivers do not support multi-link setups,
> so DAI .set_stream() callback will not be used.  What's more, if called
> it will overwrite the sdw_stream_runtime runtime set in DAI .startup
> (qcom_swrm_startup()) causing issues (unsupported multi-link error) when
> two Soundwire controllers are passed as codec DAIs.

This last sentence is confusing at best.

A controller can have one or more managers, each of whom can have one or
more peripherals.

only peripherals should expose codec DAIs, managers should expose CPU DAIs.

Put differently, the controller is the host part while the peripheral is
the codec part. "controllers passed as codec DAIs" is not really
possible, or this was a typo?

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f1b8d6ac5140..fe65c26c5281 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1267,16 +1267,6 @@ static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> -static int qcom_swrm_set_sdw_stream(struct snd_soc_dai *dai,
> -				    void *stream, int direction)
> -{
> -	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> -
> -	ctrl->sruntime[dai->id] = stream;
> -
> -	return 0;
> -}
> -
>  static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
>  {
>  	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> @@ -1349,7 +1339,6 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
>  	.hw_free = qcom_swrm_hw_free,
>  	.startup = qcom_swrm_startup,
>  	.shutdown = qcom_swrm_shutdown,
> -	.set_stream = qcom_swrm_set_sdw_stream,
>  	.get_stream = qcom_swrm_get_sdw_stream,
>  };
>  
