Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D986B1FB4E5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 16:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4D0167A;
	Tue, 16 Jun 2020 16:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4D0167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592318927;
	bh=z/y1mFEtxIQoQ0Vh76ciLVXovamrDcStOe36cUnxHzE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=es39ZJ/xWTe7mJCrl6dDyly+xHL/Wb+eB8J4wmkaCzp+g6GNIyc0haUkBlUXuxI8m
	 hetA0ksvMEtV1P+Rku9Icf/9/Lz4FmEIeI82G3BdNH1exdUWp+tfIuEBQOoatAq9w8
	 QZUG2XIcQ/TaAEAG0aFuyGMQG304nGszlfNmpGNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8211DF80232;
	Tue, 16 Jun 2020 16:47:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26E76F8022B; Tue, 16 Jun 2020 16:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75BA7F80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 16:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75BA7F80114
IronPort-SDR: zgz5CRkwdwKba6kD/uayr95v9fNgwEy+AR+unNhhNQSW/1C5aFWgchn+3loOFyTVKMQk34Lmfa
 4CoNh4etgYBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 07:46:50 -0700
IronPort-SDR: WwbXhZ1HoaJYYhVW6PpaO2ikWbhHViShTm1fUkV/laotTH/QW+MIG21NdUtIMx7JuWnmixP1Pw
 fwMms/9ywKfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="261445145"
Received: from nafrose-mobl.amr.corp.intel.com (HELO [10.254.107.226])
 ([10.254.107.226])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2020 07:46:49 -0700
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
To: Stephan Gerhold <stephan@gerhold.net>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net> <20200616090210.GA111206@gerhold.net>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
Date: Tue, 16 Jun 2020 09:23:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616090210.GA111206@gerhold.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 6/16/20 4:02 AM, Stephan Gerhold wrote:
> On Tue, Jun 16, 2020 at 10:54:17AM +0200, Stephan Gerhold wrote:
>> Hi Pierre,
>>
>> On Mon, Jun 08, 2020 at 02:44:12PM -0500, Pierre-Louis Bossart wrote:
>>> Recent changes in the ASoC core prevent multi-cpu BE dailinks from
>>> being used. DPCM does support multi-cpu DAIs for BE Dailinks, but not
>>> for FE.
>>
>> First I want to apologize for introducing this regression.
>> Actually when I made the "Only allow playback/capture if supported"
>> patch I did not realize it would also be used for BE DAIs. :)

No need to apologize, it helped identify configuration issues none of us 
identified. That's progress for me.

>>> Handle the FE checks first, and make sure all DAIs support the same
>>> capabilities within the same dailink.
>>>
>>> BugLink: https://github.com/thesofproject/linux/issues/2031
>>> Fixes: 9b5db059366ae2 ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
>>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>> Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
>>> ---
>>>   sound/soc/soc-pcm.c | 44 ++++++++++++++++++++++++++++++++++----------
>>>   1 file changed, 34 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>>> index 276505fb9d50..2c114b4542ce 100644
>>> --- a/sound/soc/soc-pcm.c
>>> +++ b/sound/soc/soc-pcm.c
>>> @@ -2789,20 +2789,44 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>>>   	struct snd_pcm *pcm;
>>>   	char new_name[64];
>>>   	int ret = 0, playback = 0, capture = 0;
>>> +	int stream;
>>>   	int i;
>>>   
>>> +	if (rtd->dai_link->dynamic && rtd->num_cpus > 1) {
>>> +		dev_err(rtd->dev,
>>> +			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>>   	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
>>> -		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>>> -		if (rtd->num_cpus > 1) {
>>> -			dev_err(rtd->dev,
>>> -				"DPCM doesn't support Multi CPU yet\n");
>>> -			return -EINVAL;
>>> +		if (rtd->dai_link->dpcm_playback) {
>>> +			stream = SNDRV_PCM_STREAM_PLAYBACK;
>>> +
>>> +			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
>>> +				if (!snd_soc_dai_stream_valid(cpu_dai,
>>> +							      stream)) {
>>> +					dev_err(rtd->card->dev,
>>> +						"CPU DAI %s for rtd %s does not support playback\n",
>>> +						cpu_dai->name,
>>> +						rtd->dai_link->stream_name);
>>> +					return -EINVAL;
>>
>> Unfortunately the "return -EINVAL" here and below break the case where
>> dpcm_playback/dpcm_capture does not exactly match the capabilities of
>> the referenced CPU DAIs. To quote from my commit message:
>>
>>      At the moment, PCM devices for DPCM are only created based on the
>>      dpcm_playback/capture parameters of the DAI link, without considering
>>      if the CPU/FE DAI is actually capable of playback/capture.
>>
>>      Normally the dpcm_playback/capture parameter should match the
>>      capabilities of the CPU DAI. However, there is no way to set that
>>      parameter from the device tree (e.g. with simple-audio-card or
>>      qcom sound cards). dpcm_playback/capture are always both set to 1.
>>
>> The basic idea for my commit was to basically stop using
>> dpcm_playback/capture for the device tree case and infer the
>> capabilities solely based on referenced DAIs. The DAIs expose if they
>> are capable of playback/capture, so I see no reason to be required to
>> duplicate that into the DAI link setup (unless you want to specifically
>> restrict a DAI link to one direction for some reason...)
>>
>> With your patch probe now fails with:
>>
>>     7702000.sound: CPU DAI MultiMedia1 for rtd MultiMedia1 does not support capture
>>
>> because sound/soc/qcom/common.c sets dpcm_playback = dpcm_capture = 1
>> even though that FE DAI is currently configured to be playback-only.
>>
>> I believe Srinivas fixed that problem for the BE DAIs in
>> commit a2120089251f ("ASoC: qcom: common: set correct directions for dailinks")
>> (https://lore.kernel.org/alsa-devel/20200612123711.29130-2-srinivas.kandagatla@linaro.org/)
>>
>> For the QCOM case it may be feasible to set dpcm_playback/dpcm_capture
>> appropriately because it is basically only used with one particular
>> DAI driver. But simple-audio-card is generic and used with many
>> different drivers so hard-coding a call into some other driver like
>> Srinivas did above won't work in that case.

Doesn't simple-card rely on DT blobs that can also be updated?

>> I wonder if we should downgrade your dev_err(...) to a dev_dbg(...),
>> and then simply avoid setting playback/capture = 0.
> 
> Hmm, I wanted to write "avoid setting playback/capture = 1" here
> of course. If dpcm_playback/capture is set but not actually supported
> don't error out but just ignore it. That would essentially make
> dpcm_playback/capture just a restriction of the CPU DAI capabilities.
> 
> Not sure if there is even a usecase for such a restriction,
> maybe dpcm_playback/capture could even be removed entirely...

I'd rather keep the error and fix those bad configurations, and in a 
second step unify dpcm_capture/dpcm_playback/playback_only/capture_only. 
We have too many flags to identify directions and when given too many 
choices it's likely we are going to have corner cases for a while.
