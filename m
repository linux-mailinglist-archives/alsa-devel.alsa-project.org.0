Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1B7FDFA2
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 19:47:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F009E0F;
	Wed, 29 Nov 2023 19:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F009E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701283623;
	bh=VesGDOaehDA9Fg1TH+ih/jgS5o/DVG5HPfhsdBxy2o8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=f938lr7p7oAo6Fm+C942pg1dBrUEwmzaPyagnwlQFcw13tgptVv018MEKBPvCPrDS
	 +AEUa6oOJXZdVIXU3pWyEthBNE1/JJEgGViUKGINtKuuG65In4nN0kgvviZcUqU/mf
	 UOIjYvNsoobutfQNNZT5yISmsORayct+acACV/FM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E4D3F805EC; Wed, 29 Nov 2023 19:46:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C3CF805D3;
	Wed, 29 Nov 2023 19:46:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65F6FF80588; Wed, 29 Nov 2023 19:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55AC3F8016E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 19:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55AC3F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PtYikKH7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701283548; x=1732819548;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=VesGDOaehDA9Fg1TH+ih/jgS5o/DVG5HPfhsdBxy2o8=;
  b=PtYikKH7eBqsRjJ9PTXMtVQTJ+6CIyGRDCFbkaRq2Or9tFDg+DhssG9w
   VhvAlbtKPnagQv5LHevomUNLdFd8z2wpQQmF4MvxzsrpDllawwSskturA
   W8ILZp4SolyfgyPQaYdCKwLu6ktvhrw3n5YwYE0zat7B91xHb+1UJyeX5
   iOJ1YyR6M89vDoqSkN3LWoiueIliasRaYrID7/NOTJSSgHIFtWo+pmV4v
   Brkmn5pKfzKQFHpHVWtdzvvvAswL1Ll+ekci8TAUBo9lV7UQUqtUKeq60
   E+/uwdbXmkv7sx7MiAKP1Sw1pAqznLYlMk9/UgYFl+2gaBqxGvdzXIxv3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383602796"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600";
   d="scan'208";a="383602796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="942421671"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600";
   d="scan'208";a="942421671"
Received: from caw1-mobl1.amr.corp.intel.com (HELO [10.255.229.136])
 ([10.255.229.136])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:45:42 -0800
Message-ID: <598015b0-68e1-434c-96d3-571040a3814e@linux.intel.com>
Date: Wed, 29 Nov 2023 10:46:52 -0600
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
 <ce46c729-48de-4b71-ace3-9b88f95e8e28@linux.intel.com>
 <5ffed1e6-ac60-42e1-8322-4f5e419ef86d@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5ffed1e6-ac60-42e1-8322-4f5e419ef86d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TNDOI4ZTGRFA4OYDQEVE53ENIIENBTX6
X-Message-ID-Hash: TNDOI4ZTGRFA4OYDQEVE53ENIIENBTX6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNDOI4ZTGRFA4OYDQEVE53ENIIENBTX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/29/23 10:35, Krzysztof Kozlowski wrote:
> On 28/11/2023 18:39, Pierre-Louis Bossart wrote:
>>
>>> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>> +{
>>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>> +	struct sdw_stream_runtime *sruntime;
>>> +	struct snd_soc_dai *codec_dai;
>>> +	int ret, i;
>>> +
>>> +	sruntime = sdw_alloc_stream(cpu_dai->name);
>>> +	if (!sruntime)
>>> +		return -ENOMEM;
>>> +
>>> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
>>> +		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
>>> +					     substream->stream);
>>> +		if (ret < 0 && ret != -ENOTSUPP) {
>>
>> I know this is existing code moved into a helper, but out of curiosity
>> why is -ENOTSUPP ignored? Isn't this problematic?
> 
> This is for all DAI links, so if some don't have set_stream callback, we
> assume it is not needed. For example few codecs do not need it because
> they are not on Soundwire bus at all and they don't care about the stream.

Humm, it was my understanding that the substream is mapped 1:1 with a
dailink, so not sure how SoundWire and non-SoundWire DAIs could be part
of the same dailink?

I am not saying this test is silly, just wondering if there is any case
where this error code is returned. Worst-case it's always false but
harmless.

>>
>>> +			dev_err(rtd->dev, "Failed to set sdw stream on %s\n",
>>> +				codec_dai->name);
>>> +			goto err_set_stream;
>>> +		}
>>> +	}
>>
>> Also should the CPU DAIs also be used to set the stream information?
>> it's not clear to me why only the CODEC DAIs are used.
> 
> I don't know, we never did. As you pointed out, I am just moving things
> around, so I don't really know the original intention.

Fair enough, I've been in your shoes :-)
Not always easy to grade 3+ yr code as 'miss', 'bug', 'optimization' or
'feature'...

