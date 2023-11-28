Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 159097FC0B7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:55:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58BCCAE9;
	Tue, 28 Nov 2023 18:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58BCCAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701194120;
	bh=oDaVISZ4GC9Vx7bYPRhNfZMARfbZEazvuxrRBu0LJLE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=unjSieVzhAt9qc5eo27Fb4Vd34LHXe8zN0aTNy218zHt6PIBiSiPxzVjeuD/3kJPY
	 K0GcAkdY++c4GYqGSKx+6VrYye6rUjrlqXH2CcgDzhJuEHNs8EvaQEiQQJIGzljjs9
	 zubgYGDmFlUFBr2TYfASATeQCJodT81n9jb9Weyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1BE7F805F2; Tue, 28 Nov 2023 18:54:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECEB9F80602;
	Tue, 28 Nov 2023 18:54:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E428F805D2; Tue, 28 Nov 2023 18:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B22CBF80166
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B22CBF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nKRVt4B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194043; x=1732730043;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=oDaVISZ4GC9Vx7bYPRhNfZMARfbZEazvuxrRBu0LJLE=;
  b=nKRVt4B4rMCRR1xevDEjqM5l0nv9i9MMUi5z+bC53HkRyWVlm2dLo9yL
   PatoxWzxY3iJZ6m969UIBrKvGNv6ACN/xnhy0vspZLPHh1LbcP/wzHX55
   gbMvDVG2p8GRV6QqexkkI1LdKkk0Jx0NvmRtsLt4uzsdq0ITJ7XbRZ67a
   EdV4ADAYGajh1NqlvFp8G+N3vHsKUg0RLVeYWXcxyc/aitHsDwcIhlm8k
   Q+PAL92V5WU3LO0W5IZmIoyqjp2Sema/ISTy/cmEAxA2NSPNUB9+TAFQW
   a9lk/tYPV9GKtyBsP57KuIgbrk3cF1D4qiRLh8Nbw/dVu9r0kONr3qmng
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127098"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="424127098"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715321"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="834715321"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208])
 ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:53:57 -0800
Message-ID: <ce46c729-48de-4b71-ace3-9b88f95e8e28@linux.intel.com>
Date: Tue, 28 Nov 2023 11:39:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: Add helper for allocating Soundwire
 stream runtime
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
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JXPNVLJLSMJUBWSKHR3QC262YVHJLVIN
X-Message-ID-Hash: JXPNVLJLSMJUBWSKHR3QC262YVHJLVIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXPNVLJLSMJUBWSKHR3QC262YVHJLVIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct sdw_stream_runtime *sruntime;
> +	struct snd_soc_dai *codec_dai;
> +	int ret, i;
> +
> +	sruntime = sdw_alloc_stream(cpu_dai->name);
> +	if (!sruntime)
> +		return -ENOMEM;
> +
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
> +					     substream->stream);
> +		if (ret < 0 && ret != -ENOTSUPP) {

I know this is existing code moved into a helper, but out of curiosity
why is -ENOTSUPP ignored? Isn't this problematic?

> +			dev_err(rtd->dev, "Failed to set sdw stream on %s\n",
> +				codec_dai->name);
> +			goto err_set_stream;
> +		}
> +	}

Also should the CPU DAIs also be used to set the stream information?
it's not clear to me why only the CODEC DAIs are used.

> +	return 0;
> +
> +err_set_stream:
> +	sdw_release_stream(sruntime);
> +
> +	return ret;
> +}
