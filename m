Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658753CC9E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 17:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DFE181A;
	Fri,  3 Jun 2022 17:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DFE181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654271381;
	bh=c8FAA+GYtVK6waHC2Pi369IDxaTAAOyd+WAlU5SnEVs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dvft7ZNcyu43050hZG8SmI2ItpPNQS5XVKvTRkrvxOZuYo/5FnbUEm5Mpww5WNG49
	 11X7rA4mcz0H/wFxa2Og49Q+KhjQWC0w4vXH9zqh4MS96NQeXDRjFfwBTMdkGIMNXW
	 O+e5o1H/oh/lUmLm2CtBy4hxWl1GhtHKLcB4x7BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79CC6F804FC;
	Fri,  3 Jun 2022 17:48:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17A88F804CC; Fri,  3 Jun 2022 17:48:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87DE5F800F5;
 Fri,  3 Jun 2022 17:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87DE5F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hq3Ae4a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654271319; x=1685807319;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c8FAA+GYtVK6waHC2Pi369IDxaTAAOyd+WAlU5SnEVs=;
 b=Hq3Ae4a2KR7cDtbaCkN9Svt4/UbxTaNqe25Uyq7BZlm/M/rDTdZYkPBw
 or0fEA+9SvWLmWOyYXBKg9UFAZIgreMC5nzibRVKbcZxkhxlzNRz040lX
 nGlpih3ScnMlP1LPpRwJZB2GtTo0tMYhhyufoF82zB7ypv+DNozpumX2c
 qKmS6moAcXCc6mhLhjjKh4GE/ddHVZl2JLNnXAJSN5emHwDh0C5IeSGax
 Pn2KE++QCCvLyAq66t9JC2/2d6rVw/89sFOehs0xof+DEdarkrouGkjWC
 46Ig4mNY/TibTahgfcDnEQkrtS85RDdJJTq2nLjyGYIWNdj2MD+Uj9FZ8 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="263933836"
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="263933836"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 08:48:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,274,1647327600"; d="scan'208";a="824774387"
Received: from linwayn1-mobl1.amr.corp.intel.com (HELO [10.212.249.119])
 ([10.212.249.119])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 08:48:20 -0700
Message-ID: <571618d8-fdd8-eaab-a8e8-c26857e97580@linux.intel.com>
Date: Fri, 3 Jun 2022 10:48:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [Sound-open-firmware] jack detection via input/event on linux
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, hede <alsa426@der-he.de>
References: <d8b21eb11013b6dd1e90e425bd808951@der-he.de>
 <fe472e98-82b8-bba4-364a-930d8616b4e2@perex.cz>
 <31258284cefb38127e84b2d098f8e2aa@der-he.de>
 <cb35ce57-7696-3edb-459a-d2e8557a4748@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cb35ce57-7696-3edb-459a-d2e8557a4748@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 sound-open-firmware@alsa-project.org
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

[Adding alsa-devel, Mark and Takashi to this thread]

On 6/3/22 08:33, Jaroslav Kysela wrote:
> On 03. 06. 22 13:17, hede wrote:
>> Am 03.06.2022 11:34, schrieb Jaroslav Kysela:
>>> PA/PW use only ALSA controls at the moment - thus you should define
>>> JackControl as defined in use-case.h. But it seems that the driver
>>> does not create or publish the ALSA jack control (I see only
>>> "iface=CARD,name='HDMI/DP,pcm=2 Jack'" jack controls for HDMI).
>>>
>>>                     Jaroslav
>>
>> Ah, thank you Jaroslav. That's the hint I was searching for atm.
>> JackDev vs. JackControl. I had a vague guess on this but now you made it
>> certain.
>>
>> Maybe I should take a look into the driver directly.
> 
> It seems that many ASoC drivers do not create kctls - the argument pins
> is zero in the snd_soc_card_jack_new() call. The SND_JACK_HEADSET should
> be remapped to kctl in sound/soc/intel/boards/sof_rt5682.c, too.

Did you mean something like the patch below Jaroslav? If yes, most of
the Chromebook machine drivers are missing this remapping. That would
also explain why the jack detection didn't work on my GLK test device,
despite a UCM file that looked good...

diff --git a/sound/soc/intel/boards/sof_rt5682.c
b/sound/soc/intel/boards/sof_rt5682.c
index 5d67a2c87a1d4..1db17ebd26f63 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -85,6 +85,17 @@ struct sof_card_private {
 	bool idisp_codec;
 };

+static struct snd_soc_jack_pin sof_jack_pins[] = {
+	{
+		.pin    = "Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
 static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
 {
 	sof_rt5682_quirk = (unsigned long)id->driver_data;
@@ -295,11 +306,13 @@ static int sof_rt5682_codec_init(struct
snd_soc_pcm_runtime *rtd)
 	 * Headset buttons map to the google Reference headset.
 	 * These can be configured by userspace.
 	 */
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
-				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
-				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-				    SND_JACK_BTN_3,
-				    &ctx->sof_headset);
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3,
+					 &ctx->sof_headset,
+					 sof_jack_pins,
+					 ARRAY_SIZE(sof_jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
@@ -481,7 +494,7 @@ static int sof_card_late_probe(struct snd_soc_card
*card)
 }

 static const struct snd_kcontrol_new sof_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
@@ -489,7 +502,7 @@ static const struct snd_kcontrol_new sof_controls[] = {
 };

 static const struct snd_soc_dapm_widget sof_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
@@ -501,8 +514,8 @@ static const struct snd_soc_dapm_widget
dmic_widgets[] = {

 static const struct snd_soc_dapm_route sof_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
-	{ "Headphone Jack", NULL, "HPOL" },
-	{ "Headphone Jack", NULL, "HPOR" },
+	{ "Headphone", NULL, "HPOL" },
+	{ "Headphone", NULL, "HPOR" },

 	/* other jacks */
 	{ "IN1P", NULL, "Headset Mic" },
