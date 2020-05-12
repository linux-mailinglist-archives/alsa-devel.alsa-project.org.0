Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB771CF93F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 17:33:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035F416BD;
	Tue, 12 May 2020 17:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035F416BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589297620;
	bh=W3sDD6Gy6g67J1ZsYaN6hJb3kHpgx9mx0gUrzTFdWlE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOS7zZTJJgYQED2hkJZRTL2umweInRS7sOnk3sZF+3v1aYZCG465gLRFDDTPBULWf
	 fXP6VLbTnFixwdDkbVKIwu0zp51aMpCPvpVOlK/WxceiWIuQZfBDaKBHqvSE3jUEkF
	 7y14SjVumHwiv1Z20Eu+UoQ6sTk/qZj4Gwg5SNWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3600F8021D;
	Tue, 12 May 2020 17:31:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FC27F801DB; Tue, 12 May 2020 17:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 483FCF800B7
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 17:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 483FCF800B7
IronPort-SDR: k4fZfVxQ7J8RYg3ChaL9povMCAQMyYqWSoCznwDAd+WCKG54KXdM8aUVm5yOPRuFNEzEM9T2ta
 BKFklfSlUNOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 08:30:25 -0700
IronPort-SDR: AXVuYG1IjvxJa6xxZeYehNKyz44LyGf3sNmw4fVGrn0CsBR12hnljRKrJPnV6GwPYpFO6LkdUF
 G4hNByeF7eug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; d="scan'208";a="409336637"
Received: from bmtannen-mobl.amr.corp.intel.com (HELO [10.255.228.231])
 ([10.255.228.231])
 by orsmga004.jf.intel.com with ESMTP; 12 May 2020 08:30:23 -0700
Subject: Re: [PATCH] ASoC: soc-dai: pull out be_hw_params_fixup from
 snd_soc_dai_hw_params
To: Gyeongtaek Lee <gt82.lee@samsung.com>, broonie@kernel.org
References: <CGME20200511033107epcas2p2465bc53295b38d2723c4bc351da77c5e@epcas2p2.samsung.com>
 <000001d62744$9b631670$d2294350$@samsung.com>
 <1fd436c2-373e-a332-02e6-c7b919a8fd0c@linux.intel.com>
 <000001d62818$66cc9ce0$3465d6a0$@samsung.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5f6da055-9cd3-3fd8-a7c9-1fea06cad79d@linux.intel.com>
Date: Tue, 12 May 2020 10:06:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <000001d62818$66cc9ce0$3465d6a0$@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 lgirdwood@gmail.com, tiwai@suse.com, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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



On 5/11/20 11:47 PM, Gyeongtaek Lee wrote:
> On 5/12/20 03:47 AM, Pierre-Louis Bossart wrote:
>> On 5/10/20 10:31 PM, Gyeongtaek Lee wrote:
>>> When dpcm_be_dai_hw_params() called, be_hw_params_fixup() callback is
>>> called with same arguments 3times.
>>> It is called in be_hw_params_fixup() itself and in soc_pcm_hw_params()
>>> for cpu dai and codec dai.
>>> Tested in 5.4.
>>>
>>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>>> Cc: stable@vger.kernel.org
>>> ---
>>>    sound/soc/soc-dai.c  | 12 ------------
>>>    sound/soc/soc-dapm.c | 11 +++++++++++
>>>    2 files changed, 11 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
>>> index 31c41559034b..4785cb6b336f 100644
>>> --- a/sound/soc/soc-dai.c
>>> +++ b/sound/soc/soc-dai.c
>>> @@ -257,20 +257,8 @@ int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
>>>    			  struct snd_pcm_substream *substream,
>>>    			  struct snd_pcm_hw_params *params)
>>>    {
>>> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>>    	int ret;
>>>    
>>> -	/* perform any topology hw_params fixups before DAI  */
>>> -	if (rtd->dai_link->be_hw_params_fixup) {
>>> -		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
>>> -		if (ret < 0) {
>>> -			dev_err(rtd->dev,
>>> -				"ASoC: hw_params topology fixup failed %d\n",
>>> -				ret);
>>> -			return ret;
>>> -		}
>>> -	}
>>> -
>>
>> Sorry I don't get this change.
>>
>> If the be_hw_params_fixup() callback is called three times, it's because
>> the soc_soc_dai_hw_params() routine is called three times, so what is
>> the problem here?
>>
>> Also the comment is explicit about doing fixups before calling the dai
>> hw_params() callback, so that is not longer the case with this change?
>> Even if the change was legit, the comment is no longer relevant and
>> should be updated.
>>
> Sorry, the comment was too short and inexact to explain the intention of the patch.
> When dpcm_be_dai_hw_params() called, be_hw_params_fixup() is called three times
> with same substream and params in dpcm_be_dai_hw_params() and
> snd_soc_dai_hw_params() in soc_pcm_hw_params() for cpu dai and codec dai.
> Calling same code three times may not be a problem in most systems, but in some
> system which has limited computing power and changes audio routing frequently,
> couple of milliseconds are consumed and make the system a little bit slower to
> audio response.
> If the be_hw_params_fixup() could be pull out from soc_soc_dai_hw_params(),
> and make it call once at pcm start or routing change, response time can be increased.

I accept the argument that be_hw_params_fixup() is called from two 
locations, and in the second one there is a iteration to deal with 
capture and playback. We should indeed check if calling the same 
function from two places is legit or not, you pointed to a legitimate 
issue. We currently use this fixup in SOF to make sure the BE 
configuration matches what the topology provides, and doing this match 3 
times is not very useful indeed.

That said, this is supposed to be a fixup, meaning just a change to the 
hw_params structure with no access to hardware. I believe that even if 
we reduce the number of calls you are not going to see any improvement 
in responses time, the actual time is still going to be spend in the 
hw_params() itself.

> In my search, the only point that calls snd_soc_dai_hw_params() without
> calling be_hw_params_fixup() callback directly is snd_soc_dai_link_event_pre_pmu().
> So, I proposed pulling out be_hw_params_fixup() from snd_soc_dai_hw_params() and then
> add direct call to be_hw_params_fixup() callback in snd_soc_dai_link_event_pre_pmu()
> not to harm current working process.

This change leaves the calls in soc-pcm, so you still have 3 calls to 
the same callback - and the same odd pattern where in one case the fixup 
is called in a direction-agnostic manner while in the two others it is 
called in a loop that's direction-based.

In other words my take on this is: valid problem, but let's try to see 
if we can remove redundant calls rather than move one around.

>>>    	if (dai->driver->ops->hw_params) {
>>>    		ret = dai->driver->ops->hw_params(substream, params, dai);
>>>    		if (ret < 0) {
>>> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
>>> index e2632841b321..d86c1cd4e8fa 100644
>>> --- a/sound/soc/soc-dapm.c
>>> +++ b/sound/soc/soc-dapm.c
>>> @@ -3886,6 +3886,17 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
>>>    	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max
>>>    		= config->channels_max;
>>>    
>>> +	/* perform any topology hw_params fixups before DAI  */
>>> +	if (rtd->dai_link->be_hw_params_fixup) {
>>> +		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
>>> +		if (ret < 0) {
>>> +			dev_err(rtd->dev,
>>> +				"ASoC: hw_params topology fixup failed %d\n",
>>> +				ret);
>>> +			return ret;
>>> +		}
>>> +	}
>>> +
>>>    	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
>>>    	snd_soc_dapm_widget_for_each_source_path(w, path) {
>>>    		source = path->source->priv;
>>>
>>> base-commit: f3643491bd079c973ac6c693da7966cd17506ca3
>>>
>>
> 
