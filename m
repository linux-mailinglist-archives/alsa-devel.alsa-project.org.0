Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F877D7084
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 17:15:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C6A827;
	Wed, 25 Oct 2023 17:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C6A827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698246903;
	bh=xr4n31rJD52NyRm4bHFLlumfLPG97DcsrPmGLO2rBuc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bMi0IvNyUuNqHh2Q2hardWZ5yZSM1gyxUE4H8JL84oPl0zS4wE87yIc7zwTs+LXpz
	 xPOT/MmSAI1O3zMR1Pfpr1H+0Fn8uLXwrc/RQS4X4qiHDtHNx8mr7cf3MjLaUwKDYY
	 VZgBQQmdBSoeAra4jYe1cgQtaQM54pAs3fU1WGUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5081FF80564; Wed, 25 Oct 2023 17:13:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 758ABF80537;
	Wed, 25 Oct 2023 17:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7DF5F80165; Wed, 25 Oct 2023 17:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4ECBDF8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 17:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ECBDF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L5yo9KA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698246799; x=1729782799;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=xr4n31rJD52NyRm4bHFLlumfLPG97DcsrPmGLO2rBuc=;
  b=L5yo9KA2iwCSgOsVf159/SS1I74IHmllOtCk2NFubI3Ha+7szJwc5i0k
   7bhip4SXqxII3IxMZpZREySADCqhzBnjwk4MWtaYS7b2im/eccuY2khDD
   xHSkr9qhjh3Nj+m8VJzqBaoP1jzCsJV6blYYnvJbYHz+OIK4lZ6DL8LZU
   mO2JmXoQ/C3SNM2oL7/RPg2ZxU81GL9PQOAiRtYjaSywIVsB3HEflvXSD
   WDv/MQxJ06tlJFOyoSjIeIlA+8Kdl9tOBl66lw0p5BTJysDIkGAYNV9rF
   Muz2NnuZgE3HxkC1Fnpj6jUR0AE/i/N4ucFomRNMUZ0PsGi3RlHBBQBMI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="5943369"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200";
   d="scan'208";a="5943369"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829259467"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200";
   d="scan'208";a="829259467"
Received: from rswenton-mobl.amr.corp.intel.com (HELO [10.212.132.169])
 ([10.212.132.169])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:13:05 -0700
Message-ID: <8b9db87b-0f61-4824-acf1-6b5ebdf45e63@linux.intel.com>
Date: Wed, 25 Oct 2023 10:03:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wsa884x: check if set_stream is called
 for proper bus
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
 <20231025144601.268645-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231025144601.268645-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: POAVHRK7WMUJXENOWBA2FSHGXK5ZLIW2
X-Message-ID-Hash: POAVHRK7WMUJXENOWBA2FSHGXK5ZLIW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POAVHRK7WMUJXENOWBA2FSHGXK5ZLIW2/>
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
> If multiple WSA8840 speakers, from two separate Soundwire buses, are
> used in one codec DAI link, the set_stream() should ignore calls for
> setting stream from other Soundwire controller.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index bee6e763c700..91205e8c96f1 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1775,6 +1775,12 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
>  			      void *stream, int direction)
>  {
>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
> +	struct sdw_stream_runtime *sruntime = stream;
> +	struct sdw_slave *sdw = dev_to_sdw_dev(dai->dev);
> +
> +	/* Check if this belongs to same bus */
> +	if (sdw->bus->dev != sruntime->dev)
> +		return 0;

Sorry, maybe I am really thick or need coffee, but I can't figure out
why this is necessary. Each amplifier has its own "wsa884x_priv" context
and should have its own DAI, not following why the set_stream would
mix-up the two dais?

We've been using two buses for two amplifiers since CometLake (2019?)
and I don't see what's different?

>  
>  	wsa884x->sruntime = stream;
>  
