Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67675E4D52
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 15:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78ED180A;
	Fri, 25 Oct 2019 15:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78ED180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572011984;
	bh=VMaMelGYF04ugl0TtKV3ZnL+zZub++ZFUAmd4E1U+Ug=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cNHr5uCdptIpc/bJScwaE8xCCUtqeyxnJUBVWm77mfKGNnDmKiYYPMN387fVGoEzW
	 BxdHgipPqMVkfS4ro+agkyUVHNQg7TcwLGFUeMbYq+NHcbcwa2OIfM+SVowoCalF2q
	 2eGIyZp5tnHAtaXtp9aCZP7RzS22Yb8lA+dyyYmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BCDF80393;
	Fri, 25 Oct 2019 15:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E268AF8036F; Fri, 25 Oct 2019 15:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C0FFF802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 15:57:54 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5B8C8A0042;
 Fri, 25 Oct 2019 15:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5B8C8A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572011874; bh=ORPRIpD0eDekAWKV+8rGdUQlVHCbYY3ixdUuXfBlVA8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=h2T1lL2kTExuQ0RYLQ/RN901SFAKxG7m0fervew2mA9jJStu94R1qQKKZsjIN21AZ
 3vrg1VnjturiupFPb9b1pVBKR3D8QfdP8nTtngWvgqsEGLWzyeX8/E41Yz/Sz3SKTE
 Mzc85Om5Ne5dkLsFiivjNmNDl1hGUHb8HkKsq92s=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 25 Oct 2019 15:57:50 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <20191025123038.19728-1-perex@perex.cz>
 <s5hk18tuhio.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <bce57a56-99d0-62d7-1d53-099a75349341@perex.cz>
Date: Fri, 25 Oct 2019 15:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5hk18tuhio.wl-tiwai@suse.de>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
 pcm=' Jack control names
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

Dne 25. 10. 19 v 14:38 Takashi Iwai napsal(a):
> On Fri, 25 Oct 2019 14:30:38 +0200,
> Jaroslav Kysela wrote:
>>
>> There is an inconsistency in the names for the HDMI/DP Jack control
>> names between some ASoC drivers and the HDA HDMI driver which
>> introduced this naming in 2011.
>>
>> There might be an impact for the user space (UCM). I will fix
>> the UCM configurations when this patch is applied.
>>
>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Yes, that's a known problem, and I left them so far just for keeping
> the already existing stuff working.
> 
> Won't this break the current Chromebooks user-space?

I would really expect to upgrade UCM configs for the recent kernels in this 
case. I believe, those sort of issues are better to fix early than lately. I 
know, the transition might cause a little issues, but usually "do upgrade 
answer" will help. I don't think that we speak about a large group of users here.

						Jaroslav

> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>   Documentation/sound/designs/control-names.rst   | 5 +++--
>>   sound/soc/intel/boards/bxt_da7219_max98357a.c   | 2 +-
>>   sound/soc/intel/boards/bxt_rt298.c              | 2 +-
>>   sound/soc/intel/boards/glk_rt5682_max98357a.c   | 2 +-
>>   sound/soc/intel/boards/kbl_da7219_max98357a.c   | 2 +-
>>   sound/soc/intel/boards/kbl_da7219_max98927.c    | 2 +-
>>   sound/soc/intel/boards/kbl_rt5660.c             | 2 +-
>>   sound/soc/intel/boards/kbl_rt5663_max98927.c    | 2 +-
>>   sound/soc/intel/boards/skl_hda_dsp_common.c     | 2 +-
>>   sound/soc/intel/boards/skl_nau88l25_max98357a.c | 2 +-
>>   sound/soc/intel/boards/skl_nau88l25_ssm4567.c   | 2 +-
>>   sound/soc/intel/boards/skl_rt286.c              | 2 +-
>>   sound/soc/intel/boards/sof_rt5682.c             | 2 +-
>>   13 files changed, 15 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/sound/designs/control-names.rst b/Documentation/sound/designs/control-names.rst
>> index 7fedd0f33cd9..a5f6e3842df8 100644
>> --- a/Documentation/sound/designs/control-names.rst
>> +++ b/Documentation/sound/designs/control-names.rst
>> @@ -50,7 +50,7 @@ Internal	internal
>>   
>>   SOURCE
>>   ~~~~~~
>> -===================	=================================================
>> +===================	===================================================
>>   Master
>>   Master Mono
>>   Hardware Master
>> @@ -92,7 +92,8 @@ SPDIF			output only
>>   SPDIF In
>>   Digital In
>>   HDMI/DP			either HDMI or DisplayPort
>> -===================	=================================================
>> +HDMI/DP,pcm=<num>       either HDMI or DisplayPort with the PCM device link
>> +===================	===================================================
>>   
>>   Exceptions (deprecated)
>>   -----------------------
>> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>> index ac1dea5f9d11..b49028c6fd10 100644
>> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
>> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
>> @@ -618,7 +618,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &broxton_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
>> index adf416a49b48..caaf2f2af287 100644
>> --- a/sound/soc/intel/boards/bxt_rt298.c
>> +++ b/sound/soc/intel/boards/bxt_rt298.c
>> @@ -530,7 +530,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &broxton_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
>> index bd2d371f2acd..5474f28e0c31 100644
>> --- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
>> +++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
>> @@ -548,7 +548,7 @@ static int glk_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &geminilake_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
>> index 537a88932bb6..367415efed9b 100644
>> --- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
>> +++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
>> @@ -548,7 +548,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &skylake_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
>> index 829f95fc4179..b30c2148d1f4 100644
>> --- a/sound/soc/intel/boards/kbl_da7219_max98927.c
>> +++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
>> @@ -977,7 +977,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &kabylake_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
>> index 74fe1f3a5479..0965d1f02b2c 100644
>> --- a/sound/soc/intel/boards/kbl_rt5660.c
>> +++ b/sound/soc/intel/boards/kbl_rt5660.c
>> @@ -470,7 +470,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &skylake_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
>> index 7cefda341fbf..9f420e978459 100644
>> --- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
>> +++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
>> @@ -888,7 +888,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &skylake_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
>> index 58409b6e476e..f717b1d179bd 100644
>> --- a/sound/soc/intel/boards/skl_hda_dsp_common.c
>> +++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
>> @@ -139,7 +139,7 @@ int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			 "HDMI/DP, pcm=%d Jack", pcm->device);
>> +			 "HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					    SND_JACK_AVOUT, &pcm->hdmi_jack,
>>   					    NULL, 0);
>> diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>> index 3ce8efbeed12..b009e2df25d3 100644
>> --- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>> +++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
>> @@ -607,7 +607,7 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT,
>>   					&skylake_hdmi[i],
>> diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>> index 1a7ac8bdf543..0a6e650dc698 100644
>> --- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>> +++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
>> @@ -648,7 +648,7 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT,
>>   					&skylake_hdmi[i],
>> diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
>> index 231349a47cc9..56ee4b55dce9 100644
>> --- a/sound/soc/intel/boards/skl_rt286.c
>> +++ b/sound/soc/intel/boards/skl_rt286.c
>> @@ -489,7 +489,7 @@ static int skylake_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			"HDMI/DP, pcm=%d Jack", pcm->device);
>> +			"HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					SND_JACK_AVOUT, &skylake_hdmi[i],
>>   					NULL, 0);
>> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
>> index 4f6e58c3954a..862a7e35cb5c 100644
>> --- a/sound/soc/intel/boards/sof_rt5682.c
>> +++ b/sound/soc/intel/boards/sof_rt5682.c
>> @@ -277,7 +277,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
>>   	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
>>   		component = pcm->codec_dai->component;
>>   		snprintf(jack_name, sizeof(jack_name),
>> -			 "HDMI/DP, pcm=%d Jack", pcm->device);
>> +			 "HDMI/DP,pcm=%d Jack", pcm->device);
>>   		err = snd_soc_card_jack_new(card, jack_name,
>>   					    SND_JACK_AVOUT, &sof_hdmi[i],
>>   					    NULL, 0);
>> -- 
>> 2.20.1
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
