Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E9A20FA90
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 19:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1780683B;
	Tue, 30 Jun 2020 19:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1780683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593538129;
	bh=w1O0Vu6XcyBKFYvlya6kXOlk3rD3UFeuUR3MK3huDZ0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XPJbkbbpzniffnqhDcrtrJwpcHxYry4acQfYs8VeYyA7SK6iFzvFt8tMiKteJkml0
	 H32Ks70M8ij+nhpeRcBJW2XAmD0hwFfX+xVbSLEOON1emoejHlaT2XWjQOv58uHYIJ
	 vutHKdvj5kMcAhE09RHgZ6iH336BirBeJZw7M+gU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46A31F80245;
	Tue, 30 Jun 2020 19:27:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B54A6F800EA; Tue, 30 Jun 2020 19:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D4A8F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 19:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D4A8F800EA
IronPort-SDR: gEhML7mUORQBUlAgGqLt5xHfKODzsQ1InJckIBDAMQOv/6JwzenY3F46jVWMSLlFjKStBR+LEY
 fQLzAjtweJdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231190508"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="231190508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:26:54 -0700
IronPort-SDR: NAstuiCUVlQGHNxXkQ2FxTLqs6zfTlwZYqkktIFIgfcMxPut9azCbPgqywpOIDNKa0p+iXR9MY
 NeR+sApAgfVg==
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="281307447"
Received: from dnoeunx-mobl.amr.corp.intel.com (HELO [10.254.77.113])
 ([10.254.77.113])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 10:26:52 -0700
Subject: Re: [PATCH] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1593498722-7074-1-git-send-email-brent.lu@intel.com>
 <DM6PR11MB4316CA5F11462D11D1751C6C976F0@DM6PR11MB4316.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e7bd9caf-1bf8-d57c-2b67-13a63d23ebf9@linux.intel.com>
Date: Tue, 30 Jun 2020 11:26:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <DM6PR11MB4316CA5F11462D11D1751C6C976F0@DM6PR11MB4316.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Song,
 Chao" <chao.song@intel.com>, "M, Naveen" <naveen.m@intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, "Zhi, Yong" <yong.zhi@intel.com>
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


>> diff --git a/sound/soc/intel/boards/Kconfig
>> b/sound/soc/intel/boards/Kconfig index 3d820e1..b3b863e 100644
>> --- a/sound/soc/intel/boards/Kconfig
>> +++ b/sound/soc/intel/boards/Kconfig
>> @@ -291,9 +291,17 @@ config
>> SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
>>   	select SND_SOC_DMIC
>>   	select SND_SOC_HDAC_HDMI
>>
>> +config SND_SOC_INTEL_DA7219_MAX98390_GENERIC
>> +	tristate
>> +	select SND_SOC_DA7219
>> +	select SND_SOC_MAX98390
>> +	select SND_SOC_DMIC
>> +	select SND_SOC_HDAC_HDMI
>> +
>>   config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
>>   	tristate
>>   	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
>> +	select SND_SOC_INTEL_DA7219_MAX98390_GENERIC

this doesn't look too good, the only difference is the addition of 
MAX98090 which should be added in SND_SOC_INTEL_DA7219_MAX98357A_GENERIC 
above.

>>
>>   if SND_SOC_INTEL_APL
>>
>> @@ -309,6 +317,18 @@ config
>> SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
>>   	   Say Y or m if you have such a device. This is a recommended option.
>>   	   If unsure select "N".
>>
>> +config SND_SOC_INTEL_BXT_DA7219_MAX98390_MACH
>> +	tristate "Broxton with DA7219 and MAX98390 in I2S Mode"
>> +	depends on I2C && ACPI && GPIOLIB
>> +	depends on MFD_INTEL_LPSS || COMPILE_TEST
>> +	depends on SND_HDA_CODEC_HDMI
>> +	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
>> +	help
>> +	   This adds support for ASoC machine driver for Broxton-P platforms
>> +	   with DA7219 + MAX98390 I2S audio codec.
>> +	   Say Y or m if you have such a device. This is a recommended option.
>> +	   If unsure select "N".
>> +

i don't think you need a different top-level config, just extend the 
existing one to say MAX98357A or MAX98390.

[...]

>>   	if (soc_intel_is_glk())
>>   		snd_soc_dapm_add_routes(&card->dapm, gemini_map,
>>   					ARRAY_SIZE(gemini_map));
>> @@ -631,17 +719,17 @@ static int bxt_card_late_probe(struct snd_soc_card
>> *card)
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>>   			"HDMI/DP, pcm=%d Jack", pcm->device);
>> -		err = snd_soc_card_jack_new(card, jack_name,
>> +		ret = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT,
>> &broxton_hdmi[i],
>>   					NULL, 0);
>>
>> -		if (err)
>> -			return err;
>> +		if (ret)
>> +			return ret;
>>
>> -		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>> +		ret = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
>>   						&broxton_hdmi[i]);
>> -		if (err < 0)
>> -			return err;
>> +		if (ret < 0)
>> +			return ret;

these look like unrelated changes?


>> --- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
>> +++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
>> @@ -15,8 +15,8 @@ static struct snd_soc_acpi_codecs rt1011_spk_codecs =
>> {  };
>>
>>   static struct snd_soc_acpi_codecs max98357a_spk_codecs = {
>> -	.num_codecs = 1,
>> -	.codecs = {"MX98357A"}
>> +	.num_codecs = 2,
>> +	.codecs = {"MX98357A", "MX98390"}

That looks just wrong?

It would be really odd to list two devices as prerequisites for loading 
a driver, when in practice they are mutually exclusive? Something's 
broken in coreboot if both are present.

see below what we used for JSL:

see static struct snd_soc_acpi_codecs jsl_7219_98373_codecs = {
	.num_codecs = 1,
	.codecs = {"MX98373"}
};

static struct snd_soc_acpi_codecs mx98360a_spk = {
	.num_codecs = 1,
	.codecs = {"MX98360A"}
};
