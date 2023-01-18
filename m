Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C983671E58
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 14:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34147489D;
	Wed, 18 Jan 2023 14:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34147489D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674049835;
	bh=FeABRWZG/7wT2V4yotl0KXOF5NebpsvSF1ap6am3g1M=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ngahFSX2lvyul9lYouBQqCDNRE0bEw82pwrdWnoPD5k4q06VbSbZpzFxhZ60YOdlz
	 mSSzk/2wO6JX/dUSD4eKe6aAvAoP5zs+OFjwkwAiukUnORunKO3+dcth57uSUNf/AU
	 lGpawtSyRfmRysviRbm37Dw/RZaxJ7e3lM7U4vHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D7DF80083;
	Wed, 18 Jan 2023 14:49:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 554CCF80083; Wed, 18 Jan 2023 14:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4CEDF80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4CEDF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R4OL9AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674049774; x=1705585774;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FeABRWZG/7wT2V4yotl0KXOF5NebpsvSF1ap6am3g1M=;
 b=R4OL9AADPkOfM9tXQrNstEZ2u3uEpnzEbSpfX12hPL1Q3lBw/QsGgCdO
 5C5Z10NffxH4uiESLCQCIMhF++2r7Ua1ggxlMUgN32zlmK0PO5/qCxHr1
 FU6M3uFOdV1ReN1bxs0wAaUORHoEh+9P0haVknvVzNbmGPMra7PEbK15h
 cN++Eo8XHeXjasNSD98VQE7FwrmLRAV5AefVHRBMDcwlJhnZDbbYj5U3j
 zh8tu+6CIzMIevNtFxk8Qfy/iXWP1oK6yexwh6aRP3BP+7C6jDmuQJ9J0
 BhZpin54WhKOz2C6NGHkyJvwIxb9owEGsLrJ9oFFVO/QAFNV/Hc5/lh9k Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="411221687"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411221687"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:49:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988549431"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="988549431"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:49:27 -0800
Message-ID: <5da005dd-e34e-ff08-7a97-8a37b231ed5e@linux.intel.com>
Date: Wed, 18 Jan 2023 14:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/4] ASoC: ts3a227e: add set_jack and
 get_jack_supported_type
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230118125226.333214-1-astrid.rost@axis.com>
 <20230118125226.333214-4-astrid.rost@axis.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230118125226.333214-4-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/18/2023 1:52 PM, Astrid Rost wrote:
> Add set_jack and get_jack_supported_type
> to allow simple-card-utils to add a jack for it.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>   sound/soc/codecs/ts3a227e.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
> index 2305a472d132..212dfd2b60ed 100644
> --- a/sound/soc/codecs/ts3a227e.c
> +++ b/sound/soc/codecs/ts3a227e.c
> @@ -258,7 +258,22 @@ int ts3a227e_enable_jack_detect(struct snd_soc_component *component,
>   }
>   EXPORT_SYMBOL_GPL(ts3a227e_enable_jack_detect);
>   
> -static struct snd_soc_component_driver ts3a227e_soc_driver;
> +static int ts3a227e_set_jack(struct snd_soc_component *component,
> +			     struct snd_soc_jack *jack, void *data)
> +{
> +	return ts3a227e_enable_jack_detect(component, jack);
> +}

Patch looks ok, but it seems that ts3a227e_enable_jack_detect() doesn't 
check if jack is NULL, before calling snd_jack_set_key() I guess this 
should be also fixed, as _set_jack can be called with jack being NULL to 
disable jack detection. Optionally, while set_jack is being added I 
would also just get rid of 
EXPORT_SYMBOL_GPL(ts3a227e_enable_jack_detect); and convert all other 
users to snd_soc_component_set_jack as it currently serves as bad example.

> +
> +static int ts3a227e_get_supported_jack_type(struct snd_soc_component *component)
> +{
> +	return TS3A227E_JACK_MASK;
> +}
> +
> +static const struct snd_soc_component_driver ts3a227e_soc_driver = {
> +	.name = "ti,ts3a227e",
> +	.set_jack = ts3a227e_set_jack,
> +	.get_jack_supported_type = ts3a227e_get_supported_jack_type,
> +};
>   
>   static const struct regmap_config ts3a227e_regmap_config = {
>   	.val_bits = 8,

