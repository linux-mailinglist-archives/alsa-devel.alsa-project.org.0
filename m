Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E15028BC33
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 16:56:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68FF21680;
	Tue, 13 Aug 2019 16:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68FF21680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565708161;
	bh=TneyMNIyLCRwrCUTMvqGn+uisHlvwXlk94Cx5IFYE3Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CegTLOumlyMzBQYBLCUgBwBpyVTeVPbQkMXoEf7kUPMKt+Fdmad8NfOg1hWDfaDdC
	 Z4Jav83KU9JXZfBS1KIb0Z8vxcQuITjuGdfe04Hy9XHfFhCuGlpRGgJKNxMrr6QpVe
	 ZLd8CAhmQLrDRnUAaOQZfKYeltoRC+RQmtKZZEMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBC1F805E2;
	Tue, 13 Aug 2019 16:53:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 769C7F805AA; Tue, 13 Aug 2019 16:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6193EF8049A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 16:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6193EF8049A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 07:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="200501646"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2019 07:53:10 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
 by linux.intel.com (Postfix) with ESMTP id CDF6E580238;
 Tue, 13 Aug 2019 07:53:09 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
Date: Tue, 13 Aug 2019 09:44:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 8/13/19 3:35 AM, Srinivas Kandagatla wrote:
> On platforms which have smart speaker amplifiers connected via
> soundwire and modeled as aux devices in ASoC, in such usecases machine
> driver should be able to get sdw master stream from dai so that it can
> use the runtime stream to setup slave streams.

using the _set_sdw_stream? I don't fully get the sequence with the 
wording above.

> 
> soundwire already as a set function, get function would provide more
> flexibility to above configurations.

I am not clear if you are asking for both to be used, or get only or set 
only?

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   include/sound/soc-dai.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index dc48fe081a20..1e01f4a302e0 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -202,6 +202,7 @@ struct snd_soc_dai_ops {
>   
>   	int (*set_sdw_stream)(struct snd_soc_dai *dai,
>   			void *stream, int direction);
> +	void *(*get_sdw_stream)(struct snd_soc_dai *dai, int direction);
>   	/*
>   	 * DAI digital mute - optional.
>   	 * Called by soc-core to minimise any pops.
> @@ -410,4 +411,13 @@ static inline int snd_soc_dai_set_sdw_stream(struct snd_soc_dai *dai,
>   		return -ENOTSUPP;
>   }
>   
> +static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai,
> +					       int direction)
> +{
> +	if (dai->driver->ops->get_sdw_stream)
> +		return dai->driver->ops->get_sdw_stream(dai, direction);
> +	else
> +		return ERR_PTR(-ENOTSUPP);
> +}
> +
>   #endif
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
