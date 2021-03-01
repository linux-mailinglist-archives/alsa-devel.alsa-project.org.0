Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 398043281AC
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 16:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A04D16B3;
	Mon,  1 Mar 2021 16:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A04D16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614610990;
	bh=ieL+RtfKe+kGQE45vjKFQbGyfYkWWqrhazOyG9F+BsA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Br+kBvWNGfPsQWXVg+WwhaP9HOUMBWeg5t+slVGDJPZ4IwuP2kW3utwhl2Z1dLXsr
	 H+1GwKRNzlfOoXTmFcCsFI8YMJFJkbel8FSosB8DF+4rlFNFetNdAp5xJcDeQrGXV9
	 1XOyj55ORnEA78yQCK1hFt5L3nBF5G5aRbEdu5MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1554F8027D;
	Mon,  1 Mar 2021 16:01:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 451A8F80257; Mon,  1 Mar 2021 16:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4150F8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 16:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4150F8010B
IronPort-SDR: RT2YBy6YqF+4qwl3bSFXcFCGFl7RTegNlvKOlMUQmdUPetE4RWtDpaEjOji9FciKZVz7NLdQh4
 ZBHSt563XB1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="166365397"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="166365397"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 07:01:17 -0800
IronPort-SDR: KF2Avy2eAS2o+2sJug2/wUSV6fRdMARwcncPBqSE1narCLlG0Cy5Zn+D7vvtgZ4/eAXWhdx5y9
 4Fo+iBBVVCFA==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="406256458"
Received: from jli125-mobl.gar.corp.intel.com (HELO [10.255.229.226])
 ([10.255.229.226])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 07:01:16 -0800
Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
To: Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com,
 mgross@linux.intel.com, Mario.Limonciello@dell.com
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <98d8b015-c1d6-fd4c-ac94-3f9226b93436@linux.intel.com>
Date: Mon, 1 Mar 2021 08:30:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301093834.19524-1-Perry_Yuan@Dell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 3/1/21 3:38 AM, Perry Yuan wrote:
> From: Perry Yuan <perry_yuan@dell.com>
> 
> Some new Dell system is going to support audio internal micphone
> privacy setting from hardware level with micmute led state changing
> When micmute hotkey pressed by user, soft mute will need to be enabled
> firstly in case of pop noise, and codec driver need to react to mic
> mute event to EC(embedded controller) notifying that SW mute is completed
> Then EC will do the hardware mute physically within the timeout reached
> 
> This patch allow codec rt715 and rt715 sdca driver to change the local micmute
> led state. Dell privacy led trigger driver will ack EC when micmute key pressed
> through this micphone led control interface like hda_generic provided
> ACPI method defined in dell-privacy micmute led trigger will be called
> for notifying the EC that software mute has been completed, then hardware
> audio circuit solution controlled by EC will switch the audio input source off/on
> 
> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
> 
> --------
> v3 -> v4:
> * remove unused debug log
> * remove compile flag of DELL privacy
> * move the micmute_led to local from rt715_priv
> * when Jaroslav upstream his gerneric LED trigger driver,I will rebase
>    this patch,please consider merge this at first
>    https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-perex@perex.cz/
> v2 -> v3:
> * simplify the patch to reuse some val value
> * add more detail to the commit info
> v1 -> v2:
> * fix some format issue
> --------
> ---
>   sound/soc/codecs/rt715-sdca.c | 12 ++++++++++++

that file is not yet in Mark Brown's tree, so that patch wouldn't apply.

>   sound/soc/codecs/rt715.c      | 12 ++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
> index b43ac8559e45..816348ae11a1 100644
> --- a/sound/soc/codecs/rt715-sdca.c
> +++ b/sound/soc/codecs/rt715-sdca.c
> @@ -12,6 +12,7 @@
>   #include <linux/version.h>
>   #include <linux/kernel.h>
>   #include <linux/init.h>
> +#include <linux/leds.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm.h>
>   #include <linux/soundwire/sdw.h>
> @@ -269,6 +270,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>   	unsigned int reg = mc->reg;
>   	unsigned int max = mc->max;
>   	int err;
> +	bool micmute_led;
>   
>   	val = ucontrol->value.integer.value[0];
>   	if (invert)
> @@ -287,6 +289,16 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>   			return err;
>   	}
>   
> +	/* Micmute LED state changed by muted/unmute switch */
> +	if (mc->invert) {
> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
> +			micmute_led = LED_OFF;
> +		} else {
> +			micmute_led = LED_ON;
> +		}
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
> index cdcba70146da..db2c0d2ff9d2 100644
> --- a/sound/soc/codecs/rt715.c
> +++ b/sound/soc/codecs/rt715.c
> @@ -13,6 +13,7 @@
>   #include <linux/init.h>
>   #include <linux/delay.h>
>   #include <linux/i2c.h>
> +#include <linux/leds.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/pm.h>
>   #include <linux/soundwire/sdw.h>
> @@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
>   		RT715_SET_GAIN_MIX_ADC2_L};
>   	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>   	unsigned int read_ll, read_rl, i, j, loop_cnt;
> +	bool micmute_led;
>   
>   	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
>   		strstr(ucontrol->id.name, "Main Capture Volume"))
> @@ -95,6 +97,16 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
>   	else
>   		loop_cnt = 1;
>   
> +	/* Micmute LED state changed by muted/unmute switch */
> +	if (mc->invert) {
> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
> +			micmute_led = LED_OFF;
> +		} else {
> +			micmute_led = LED_ON;
> +		}
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
> +	}
> +
>   	for (j = 0; j < loop_cnt; j++) {
>   		/* Can't use update bit function, so read the original value first */
>   		if (loop_cnt == 1) {
> 
