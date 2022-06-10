Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8E25462B6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 11:47:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A303B18E3;
	Fri, 10 Jun 2022 11:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A303B18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654854455;
	bh=O+6mt5NPVCdnNloAAIt9KwcZ6oSa5hx936vmqlXF8TE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=McWPNgiurbwG+X+dN15Cc4y4FnjntFyhSjNrW0OWXaRXBlfQFWVN7dEY+AswIm9Qs
	 Ue3JmBjC/2+KFHz3Vc4an/eqJf49bwJfPUDHQtMXtD+ltuLxrW4l4kqJ5Df14eXsn/
	 kodrM0kC7+Roj1aKOvU1BTLcEyY0uHS8QG8uwZdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AAC8F804D8;
	Fri, 10 Jun 2022 11:46:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31800F804D2; Fri, 10 Jun 2022 11:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3785F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 11:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3785F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mC6VFaHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654854390; x=1686390390;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O+6mt5NPVCdnNloAAIt9KwcZ6oSa5hx936vmqlXF8TE=;
 b=mC6VFaHQNRsz39tk0n9oZEyo7p+OllIMqZf9FxdFgYU2zqvmm08VNpl4
 RV56Btp4j21ug5Xa8XLGeoEulKHDQsYaatjCk2giJL39vePHX57It/z6l
 aeFTNbFs3KdF6U/xx75B5LtQRHHCRmIy1AJbVU+sLJielHE5vtaHiT/OY
 TpGvzYf2Gsa+4bE+h+kMQ3Rfecxe+dLc+H0EQJf99n19TvMM+kHN2TKI6
 4dXf7gUKaSq7EVIZOnec7pMlA1sbzImH6d7qoLdb7yV5qT46HyUNt95RC
 6wC1vnNK73yNUYKyLwwvMyIrR8hmf8F38uvC1JhTm9eJMUc75OGi2dyDt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302953948"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302953948"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 02:46:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638050840"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.158])
 ([10.99.241.158])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 02:46:21 -0700
Message-ID: <7a13211b-524c-f92e-8c80-a03660cdfd01@linux.intel.com>
Date: Fri, 10 Jun 2022 11:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 11/11] ASoC: codecs: rt298: Fix jack detection
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-12-amadeuszx.slawinski@linux.intel.com>
 <YqIJxPFwwsbAPJ14@sirena.org.uk>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <YqIJxPFwwsbAPJ14@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 6/9/2022 4:55 PM, Mark Brown wrote:
> On Thu, Jun 09, 2022 at 03:35:41PM +0200, Amadeusz Sławiński wrote:
>> On our RVP platforms using rt298 with combojack we've seen issues with
>> controls being in incorrect state after suspend/resume cycle. This is
>> caused by codec driver not setting pins to correct state and causing
>> codec suspend method to not be called. Which on resume caused codec
>> registers to be in undefined state. Fix this by setting pins correctly
>> in jack detect function.
> 
> Again fixes should go before cleanups.  Could you be more specific about
> what was wrong with the existing code and how this fixes it?
> 
>>   static int rt298_mic_detect(struct snd_soc_component *component,
>>   			    struct snd_soc_jack *jack, void *data)
>>   {
>> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
>>   	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
>> -	struct snd_soc_dapm_context *dapm;
>> -	bool hp = false;
>> -	bool mic = false;
>> -	int status = 0;
>>   
>>   	rt298->jack = jack;
>>   
>> -	/* If jack in NULL, disable HS jack */
>> -	if (!jack) {
>> +	if (jack) {
>> +		/* enable IRQ */
>> +		if (rt298->jack->status & SND_JACK_HEADPHONE)
>> +			snd_soc_dapm_force_enable_pin(dapm, "LDO1");
>> +		if (rt298->jack->status & SND_JACK_MICROPHONE) {
>> +			snd_soc_dapm_force_enable_pin(dapm, "HV");
>> +			snd_soc_dapm_force_enable_pin(dapm, "VREF");
>> +		}
>> +		regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
>> +		enable_irq(rt298->i2c->irq);
>> +		snd_soc_jack_report(rt298->jack, rt298->jack->status,
>> +				    SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
> 
> It looks rt298_jack_detect() already forces the pins on?  It's not clear
> to me what the relationship between this code and the existing code is.

This aligns the code to be similar to other two rt2xx drivers and fixes 
a problem on our side.

Original code doesn't reach rt298_jack_detect() when jack == NULL, so it 
never disables those pins in this case.

I could probably fix this by moving rt298_jack_detect() call, but as 
drivers for rt2xx codecs are quite similar to each other I opted to fix 
the issue by minimizing the differences between them.
