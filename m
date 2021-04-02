Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243FB352ED5
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 19:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B354E16CC;
	Fri,  2 Apr 2021 19:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B354E16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617386343;
	bh=bgWvyp4NWCfYXfG0Hm8o+YMqPvpl1dahhItIpS576HQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r527PkX0fBKFBNsJFc0ak44I2jbbmyx6CUnc+sNPSAwpggqiKAQIPKiWwnaRt1HKr
	 eyPls7pWNZHqMVxmMuxk3wZRHECA9Tl2whjqEryzZ2NBrq5d9Ce8fDBsRm/z3nWS2z
	 Z7Jg7/+R0vaz67AWbbgggvb4uWZTN3Kitrbq22PU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE24EF80229;
	Fri,  2 Apr 2021 19:57:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C785F8016E; Fri,  2 Apr 2021 19:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F30F2F800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 19:57:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A592BA0046;
 Fri,  2 Apr 2021 19:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A592BA0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617386245; bh=RVleIpY/mLf83IbsmzQeD3t+vKouLd0KP0S9kGC+PyI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZO3ELAp+9aTtTlksGGNOMC/vhBK/6WQIH3zM4exTvo7pDYqIUbjsSpO4VrY32CnCv
 R3o2OI9le8BGs/DOeWGDSakT0tphzDuP+/CrVk2tNmvNhUq7zlLFTe2YVbrzHCfb5l
 c0sKHQT/ybGAeSH6V0QCFNzRtFAuIDduZNdL5auQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  2 Apr 2021 19:57:21 +0200 (CEST)
Subject: Re: [PATCH 1/2] ALSA: control - fix a leak in snd_ctl_led_init()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YGcDETcdqVUIl1+y@mwanda>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ec7285f6-a257-d7a4-5cae-b36c95ef9efd@perex.cz>
Date: Fri, 2 Apr 2021 19:57:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGcDETcdqVUIl1+y@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

Dne 02. 04. 21 v 13:42 Dan Carpenter napsal(a):
> This unwind loop needs to free snd_ctl_leds[0] as well.
> 
> Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/core/control_led.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index d4fb8b873f34..202b475d0bf3 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -712,7 +712,7 @@ static struct snd_ctl_layer_ops snd_ctl_led_lops = {
>  static int __init snd_ctl_led_init(void)
>  {
>  	struct snd_ctl_led *led;
> -	unsigned int group;
> +	int group;
>  
>  	device_initialize(&snd_ctl_led_dev);
>  	snd_ctl_led_dev.class = sound_class;
> @@ -730,7 +730,7 @@ static int __init snd_ctl_led_init(void)
>  		dev_set_name(&led->dev, led->name);
>  		if (device_add(&led->dev)) {
>  			put_device(&led->dev);
> -			for (; group > 0; group--) {
> +			for (; group >= 0; group--) {
>  				led = &snd_ctl_leds[group];

It's not correct. This assignent should be 'led = &snd_ctl_leds[group - 1];'
without other changes, because the put_device() is enough when device_add() fails.

Could you resend the correction?

					Jaroslav

>  				device_del(&led->dev);
>  			}
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
