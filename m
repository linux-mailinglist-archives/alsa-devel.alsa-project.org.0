Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E51E7706
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 17:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 275522075;
	Mon, 28 Oct 2019 17:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 275522075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572281435;
	bh=/94ecxVjMcoM3ZM5c82KnjleglXUko0sDo42/G+RvC8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXRQaf9ZuY5sLqCTd4OcQc03N2zijFbi/pROFwZ64Wlo7XwswC+wiLRFpPwWQ5H1p
	 i4yoYN4M4ZuYrWvc2FPlo9+lhPDm8nhoVyCIzAzL3cyaz40j/oQMdLHIvY8yljU119
	 4IDHMvcRAeU86+kMZd0yTAjEqaPaoaoNoeDhzlQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97E25F80361;
	Mon, 28 Oct 2019 17:48:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C0D5F80361; Mon, 28 Oct 2019 17:48:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB3DAF80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 17:48:47 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 38017A0040;
 Mon, 28 Oct 2019 17:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 38017A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572281327; bh=5buj9cvnTcyPmoH1IECuYITVOJ0XvwY+sf06aN8gMuQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eNXMs5nuyZMddsXWDMQOtTKSjpJtz3QPZj2sGB99OHAwXicfTKUT3yhZ7+h5v/GEO
 CFwCHvDIbnLCY3bjG+jVuOEr9qwozf0JsoSKyfrp/gIpIhj/LU6sBbl68g6bisAZoC
 ropgcae89Wfxc/eHK5AR7NFa5kJSGu9OEPTh5iKk=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 28 Oct 2019 17:48:43 +0100 (CET)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191026074110.22196-1-perex@perex.cz>
 <df3ad9ab-9891-f49a-d238-851ba2b94540@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d3ad6e85-4782-b94a-ff6c-23381daa8244@perex.cz>
Date: Mon, 28 Oct 2019 17:48:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <df3ad9ab-9891-f49a-d238-851ba2b94540@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: intel - fix the card names
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

Dne 28. 10. 19 v 2:44 Pierre-Louis Bossart napsal(a):
> 
> 
> On 10/26/19 2:41 AM, Jaroslav Kysela wrote:
>> Those strings are exposed to the user space as the
>> card name thus used in the GUIs. The common
>> standard is to avoid '_' here. The worst case
>> is 'sof-skl_hda_card' string.
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> ---
>>    sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
>>    sound/soc/intel/boards/skl_hda_dsp_generic.c        | 2 +-
>>    sound/soc/intel/boards/sof_rt5682.c                 | 2 +-
>>    3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>> index 74dda8784f1a..d14ca327c684 100644
>> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
>> @@ -623,7 +623,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>>     * kabylake audio machine driver for  MAX98927 + RT5514 + RT5663
>>     */
>>    static struct snd_soc_card kabylake_audio_card = {
>> -	.name = "kbl_r5514_5663_max",
>> +	.name = "kbl-r5514-5663-max",
>>    	.owner = THIS_MODULE,
>>    	.dai_link = kabylake_dais,
>>    	.num_links = ARRAY_SIZE(kabylake_dais),
>> diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
>> index 1778acdc367c..5261f7bf0b3b 100644
>> --- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
>> +++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
>> @@ -90,7 +90,7 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
>>    }
>>    
>>    static struct snd_soc_card hda_soc_card = {
>> -	.name = "skl_hda_card",
>> +	.name = "skl-hda",
> 
> well, if we are going to rename the cards, we might as well drop the
> 'skl' reference.

I sent v2 with the "hda-dsp" name..

> 
>>    	.owner = THIS_MODULE,
>>    	.dai_link = skl_hda_be_dai_links,
>>    	.dapm_widgets = skl_hda_widgets,
>> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
>> index 4f6e58c3954a..fc4638b8e03b 100644
>> --- a/sound/soc/intel/boards/sof_rt5682.c
>> +++ b/sound/soc/intel/boards/sof_rt5682.c
>> @@ -370,7 +370,7 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
>>    
>>    /* sof audio machine driver for rt5682 codec */
>>    static struct snd_soc_card sof_audio_card_rt5682 = {
>> -	.name = "sof_rt5682",
>> +	.name = "sof-rt5682",
> 
> and the sof prefix is also a mistake. the card will end-up being named
> sof-sof-rt5682

Okay, removed in v2.

				Thanks,
					Jaroslav

> 
>>    	.owner = THIS_MODULE,
>>    	.controls = sof_controls,
>>    	.num_controls = ARRAY_SIZE(sof_controls),
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
