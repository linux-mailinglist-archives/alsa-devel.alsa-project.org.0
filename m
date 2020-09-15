Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B922269AB9
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 02:52:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1646168A;
	Tue, 15 Sep 2020 02:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1646168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600131165;
	bh=KzuinrcQUIl08H1/piWa3D509mK7/2Jb9Nns7YiXlsw=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1Fbbk7n1vdPVLWW2/gCugO/F1jhSfQt2qQtn8Ahv7A+N8YtV9s7yRWYbGK8jsMlU
	 ZsdO8Kl0//pjiqWyBHQrdBxVOjfj06m8yVxbs70CSsof5DtZ2mce2RscmLO9gx3CUS
	 ZTTaxKdjNbVTCew2/2eSoXOLJSMD42owpgxj9iXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01FBAF8015D;
	Tue, 15 Sep 2020 02:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A650F80150; Tue, 15 Sep 2020 02:50:58 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFA1AF80150
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 02:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA1AF80150
Received: from [123.112.108.22] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kHz1b-0008CV-Oa; Tue, 15 Sep 2020 00:40:48 +0000
Subject: Re: [PATCH 1/2] leds: trigger: audio: Add audio jack plugging
 indicator led
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, pavel@ucw.cz
References: <20200914080655.14576-1-hui.wang@canonical.com>
Message-ID: <31db3c5a-a664-e01d-298d-2e3a02525b47@canonical.com>
Date: Tue, 15 Sep 2020 08:40:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914080655.14576-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: kai.heng.feng@canonical.com, linux-leds@vger.kernel.org
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

Please ignore this patchset,  our QA retested this led under Windows, 
the led was always on after booting no matter users plug in or plug out.

If the led could change under Windows in future, I will resend the patchset.

Thanks,

Hui.


On 2020/9/14 下午4:06, Hui Wang wrote:
> On the Lenovo P520 front panel, there is a headset plugging indicator
> led. According to LENOVO's requirement, this led should be on if the
> front headset audio jack is plugged, otherwise the led should be off.
>
> We tested with windows, if we plugged a headphone/headset in that
> jack, the led was on, if we removed the headphone/headset from that
> jack, the led was off.
>
> Here we add JACKPLUG led in the ledtrig_audio, then we could call
> ledtrig_audio_set() in the alsa driver to control that led.
>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   drivers/leds/trigger/Kconfig         | 4 ++--
>   drivers/leds/trigger/ledtrig-audio.c | 7 +++++--
>   include/linux/leds.h                 | 1 +
>   3 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index ce9429ca6dde..a61893a6e3e4 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -138,10 +138,10 @@ config LEDS_TRIGGER_PATTERN
>   	  If unsure, say N
>   
>   config LEDS_TRIGGER_AUDIO
> -	tristate "Audio Mute LED Trigger"
> +	tristate "Audio Mute and Jack Plugging LED Trigger"
>   	help
>   	  This allows LEDs to be controlled by audio drivers for following
> -	  the audio mute and mic-mute changes.
> +	  the audio mute, mic-mute and jack plugging changes.
>   	  If unsure, say N
>   
>   endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/ledtrig-audio.c b/drivers/leds/trigger/ledtrig-audio.c
> index f76621e88482..fa66bb982400 100644
> --- a/drivers/leds/trigger/ledtrig-audio.c
> +++ b/drivers/leds/trigger/ledtrig-audio.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   //
> -// Audio Mute LED trigger
> +// Audio Mute And Jack Plugging LED trigger
>   //
>   
>   #include <linux/kernel.h>
> @@ -29,6 +29,8 @@ static int __init ledtrig_audio_init(void)
>   				    &ledtrig_audio[LED_AUDIO_MUTE]);
>   	led_trigger_register_simple("audio-micmute",
>   				    &ledtrig_audio[LED_AUDIO_MICMUTE]);
> +	led_trigger_register_simple("audio-jackplug",
> +				    &ledtrig_audio[LED_AUDIO_JACKPLUG]);
>   	return 0;
>   }
>   module_init(ledtrig_audio_init);
> @@ -37,8 +39,9 @@ static void __exit ledtrig_audio_exit(void)
>   {
>   	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MUTE]);
>   	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_MICMUTE]);
> +	led_trigger_unregister_simple(ledtrig_audio[LED_AUDIO_JACKPLUG]);
>   }
>   module_exit(ledtrig_audio_exit);
>   
> -MODULE_DESCRIPTION("LED trigger for audio mute control");
> +MODULE_DESCRIPTION("LED trigger for audio mute and jack plugging control");
>   MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 6a8d6409c993..1858c2d30ecd 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -584,6 +584,7 @@ struct led_pattern {
>   enum led_audio {
>   	LED_AUDIO_MUTE,		/* master mute LED */
>   	LED_AUDIO_MICMUTE,	/* mic mute LED */
> +	LED_AUDIO_JACKPLUG,	/* audio jack plug indicator LED */
>   	NUM_AUDIO_LEDS
>   };
>   
