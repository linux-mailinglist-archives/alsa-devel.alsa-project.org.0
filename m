Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404217D707C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 17:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B94C91E7;
	Wed, 25 Oct 2023 17:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B94C91E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698246852;
	bh=qG0Y2Ghox01DubYjKMylpuit6aghA5t5cZDXXmTDT/4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WAG+ybxrQtQrdq9fYtDWKNPeOyk4XK3lRt8XHUxPawuK0oS/4SQXvtyL9P4L55yhI
	 vEEtWTLWB1qBSYD6Ic1rMNXIXY3Bb/vtuvbDNd6YgEZ/BnJE5RYpqn2tbJdlE2Bl0A
	 ujdJC7yb/54r1nVA8QZiJHcWvg6u6J9VVkgeEObg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C804F80165; Wed, 25 Oct 2023 17:13:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89212F80165;
	Wed, 25 Oct 2023 17:13:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9258CF8010B; Wed, 25 Oct 2023 17:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51BDFF8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 17:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51BDFF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I8LX7F7i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698246797; x=1729782797;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=qG0Y2Ghox01DubYjKMylpuit6aghA5t5cZDXXmTDT/4=;
  b=I8LX7F7i2t3CqT9QWxvFtsC1r4LkARnZ2XWdOv71PfsiKeCzYqXua2Eu
   tIZxseuac2lUWsHe4vWZD++kN515bsWrf0XaSR2c6WDGeAH4blLd+Uk9H
   yKl2OOFUQLonjhBwfAwbTlKMlveidtdJqe6/FjzqDjAMNJ2MjvtXJLiZS
   hBqrNmoBeOgafyx+B4Zm4aRD6p31id3Ecx6g4uMDnARPnreEcqxwDQnfj
   XHWX7WZBLptA3xuIDrTOWq5n2Q2ptSKgT1mxXvgA0+KPokVcTiLJ289P4
   XEVeLcS+rHcreM2lFmG8ypTG4nzVqnB+9I/ivyNpSKbpbDDO5UHEJD9dV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="5943363"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200";
   d="scan'208";a="5943363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829259469"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200";
   d="scan'208";a="829259469"
Received: from rswenton-mobl.amr.corp.intel.com (HELO [10.212.132.169])
 ([10.212.132.169])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:13:06 -0700
Message-ID: <3c6e3877-1bb6-403d-a67e-fdda0aef548e@linux.intel.com>
Date: Wed, 25 Oct 2023 10:08:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soundwire: qcom: set owner device of runtime stream
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
 <20231025144601.268645-2-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231025144601.268645-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F5RGG7YG44SJMBUU7RVE62V5O5YUK57Y
X-Message-ID-Hash: F5RGG7YG44SJMBUU7RVE62V5O5YUK57Y
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5RGG7YG44SJMBUU7RVE62V5O5YUK57Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/25/23 09:46, Krzysztof Kozlowski wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Store the pointer to struct device of Soundwire controller owning this
> runtime stream.  This can be later used by Soundwire devices, to check
> if their DAI prepare callback is called for the same bus, in cases where
> multiple Soundwire buses are used in same soundcard codec list.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/soundwire/qcom.c      | 1 +
>  include/linux/soundwire/sdw.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index fe65c26c5281..a95f39563b47 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1298,6 +1298,7 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
>  		goto err_alloc;
>  	}
>  
> +	sruntime->dev = ctrl->bus.dev;
>  	ctrl->sruntime[dai->id] = sruntime;
>  
>  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 4f3d14bb1538..650334adc261 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -1023,6 +1023,7 @@ struct sdw_stream_params {
>   * master_list can contain only one m_rt per Master instance
>   * for a stream
>   * @m_rt_count: Count of Master runtime(s) in this stream
> + * @dev: SoundWire controller owning this runtime stream

A stream connects multiple managers and multiple peripherals. The
definition above does not make a lot of sense and doesn't work in
general since there's no 'owner' really.

And nothing prevents the use of multiple controllers, there are not
restrictions in the MIPI DisCo spec that prevent a stream from relying
on different controllers.

>   */
>  struct sdw_stream_runtime {
>  	const char *name;
> @@ -1031,6 +1032,7 @@ struct sdw_stream_runtime {
>  	enum sdw_stream_type type;
>  	struct list_head master_list;
>  	int m_rt_count;
> +	struct device *dev;
>  };
>  
>  struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name);
