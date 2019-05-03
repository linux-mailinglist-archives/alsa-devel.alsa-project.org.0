Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE981265D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 04:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C136185D;
	Fri,  3 May 2019 04:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C136185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556851958;
	bh=XP/sAg6/U2MZ+f1XxvRbBbYAJO25llWH28jwQT/6SZw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t313YMMiVUbUTLD/pxeOuME8uHjx0696M0DzOBNPUJCdzaaGAKAAK/cN4D3DlCGxT
	 upkathddL8dtRnUOVXpQ+yw1YhZIAzHCienWHaidjdLAhHpOJrJIwG0IRiZ5OJFOwM
	 1uQwn8zZZdzwqvqxfnvT7FlM2wrV3TCzzdhfeN+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 106EEF896B6;
	Fri,  3 May 2019 04:50:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618EEF896B7; Fri,  3 May 2019 04:50:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74872F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 04:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74872F8075A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 19:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,424,1549958400"; d="scan'208";a="342933644"
Received: from kmsmsx157.gar.corp.intel.com ([172.21.138.134])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2019 19:50:42 -0700
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
 kmsmsx157.gar.corp.intel.com (172.21.138.134) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 3 May 2019 10:50:41 +0800
Received: from pgsmsx112.gar.corp.intel.com ([169.254.3.40]) by
 PGSMSX110.gar.corp.intel.com ([169.254.13.159]) with mapi id 14.03.0415.000;
 Fri, 3 May 2019 10:50:40 +0800
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: Intel: boards: kbl_da7219_max98927:
 add dai_trigger function
Thread-Index: AQHVALWQsuQ4s2BCW06TYtYLiudk2KZXeu8AgAEzN/A=
Date: Fri, 3 May 2019 02:50:40 +0000
Message-ID: <5B37778DAAD9B04DA049B4A421B9B3EE71E81D6F@PGSMSX112.gar.corp.intel.com>
References: <1556780786-23805-1-git-send-email-mac.chiang@intel.com>
 <9a1fd4d6-ac57-d27d-3aec-022c2c0cce12@linux.intel.com>
In-Reply-To: <9a1fd4d6-ac57-d27d-3aec-022c2c0cce12@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWUyYTgyZGEtNTk5Ni00NDk2LWEwN2ItMWZjNTFmMjJiYWYwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWUVnck9qWHoyWW1iZGFCRnNzaTh6THVOUTQxQ2RpQ2NCcmFlbWs5M1g0a0lpUE5zSnhsT3hMSjhoMzBRaGZGTiJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "broonie@kernel.org" <broonie@kernel.org>, "Patel,
 Chintan M" <chintan.m.patel@intel.com>, "Tc, Jenny" <jenny.tc@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: kbl_da7219_max98927:
 add dai_trigger function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

>> From: Mac Chiang <mac.chiang@intel.com>
>> 
>> amplifier feedback is not modeled as being dependent on any active 
>> output. Even when there is no playback happening, parts of the graph, 
>> specifically the IV sense->speaker protection->output remains active 
>> and this prevents the DSP from entering low-power states.
>> 
>> This patch suggest a machine driver level approach where the speaker 
>> pins are enabled/disabled dynamically depending on stream start/stop 
>> events. DPAM graph representations show the feedback loop is indeed 
>> disabled and low-power states can be reached.
>> 
>> Signed-off-by: Jenny TC <jenny.tc@intel.com>
>> Signed-off-by: Harshapriya.n <harshapriya.n@intel.com>
>> Signed-off-by: Mac Chiang <mac.chiang@intel.com>

> I am confused here.

> There was a first patch sent on March 1, then updates posted by Jenny TC with a v3 that I acked on March 8, but there's also a v4 on April 1.

> So is this the same as v4? if yes why did you drop the change log or not add a note it's a resend? If no, what has changed?

Yes, it's the same as v4. I pick up it directly and should notice the change log missing. Sorry for spam this, I just resend it[patch resend] with change log manually.

>> ---
>>   sound/soc/intel/boards/kbl_da7219_max98927.c | 73 +++++++++++++++++++++++++++-
>>   1 file changed, 71 insertions(+), 2 deletions(-)
>> 
>> diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c 
>> b/sound/soc/intel/boards/kbl_da7219_max98927.c
>> index f72a7bf..1efe7fd 100644
>> --- a/sound/soc/intel/boards/kbl_da7219_max98927.c
>> +++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
>> @@ -219,8 +219,60 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
>>   	return 0;
>>   }
>>   
>> +static int kabylake_ssp0_trigger(struct snd_pcm_substream *substream, 
>> +int cmd) {
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	int j, ret;
>> +
>> +	for (j = 0; j < rtd->num_codecs; j++) {
>> +		struct snd_soc_dai *codec_dai = rtd->codec_dais[j];
>> +		const char *name = codec_dai->component->name;
>> +		struct snd_soc_component *component = codec_dai->component;
>> +		struct snd_soc_dapm_context *dapm =
>> +				snd_soc_component_get_dapm(component);
>> +		char pin_name[20];
>> +
>> +		if (strcmp(name, MAX98927_DEV0_NAME) &&
>> +			strcmp(name, MAX98927_DEV1_NAME) &&
>> +			strcmp(name, MAX98373_DEV0_NAME) &&
>> +			strcmp(name, MAX98373_DEV1_NAME))
>> +			continue;
>> +
>> +		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
>> +			codec_dai->component->name_prefix);
>> +
>> +		switch (cmd) {
>> +		case SNDRV_PCM_TRIGGER_START:
>> +		case SNDRV_PCM_TRIGGER_RESUME:
>> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +			ret = snd_soc_dapm_enable_pin(dapm, pin_name);
>> +			if (ret) {
>> +				dev_err(rtd->dev, "failed to enable %s: %d\n",
>> +				pin_name, ret);
>> +				return ret;
>> +			}
>> +			snd_soc_dapm_sync(dapm);
>> +			break;
>> +		case SNDRV_PCM_TRIGGER_STOP:
>> +		case SNDRV_PCM_TRIGGER_SUSPEND:
>> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +			ret = snd_soc_dapm_disable_pin(dapm, pin_name);
>> +			if (ret) {
>> +				dev_err(rtd->dev, "failed to disable %s: %d\n",
>> +				pin_name, ret);
>> +				return ret;
>> +			}
>> +			snd_soc_dapm_sync(dapm);
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static struct snd_soc_ops kabylake_ssp0_ops = {
>>   	.hw_params = kabylake_ssp0_hw_params,
>> +	.trigger = kabylake_ssp0_trigger,
>>   };
>>   
>>   static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd, @@ 
>> -950,6 +1002,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>>   {
>>   	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(card);
>>   	struct kbl_hdmi_pcm *pcm;
>> +	struct snd_soc_dapm_context *dapm = &card->dapm;
>>   	struct snd_soc_component *component = NULL;
>>   	int err, i = 0;
>>   	char jack_name[NAME_SIZE];
>> @@ -976,9 +1029,25 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>>   	if (!component)
>>   		return -EINVAL;
>>   
>> -	return hdac_hdmi_jack_port_init(component, &card->dapm);
>>   
>> -	return 0;
>> +	err = hdac_hdmi_jack_port_init(component, &card->dapm);
>> +
>> +	if (err < 0)
>> +		return err;
>> +
>> +	err = snd_soc_dapm_disable_pin(dapm, "Left Spk");
>> +	if (err) {
>> +		dev_err(card->dev, "failed to disable Left Spk: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err = snd_soc_dapm_disable_pin(dapm, "Right Spk");
>> +	if (err) {
>> +		dev_err(card->dev, "failed to disable Right Spk: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	return snd_soc_dapm_sync(dapm);
>>   }
>>   
>>   /* kabylake audio machine driver for SPT + DA7219 */
>> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
