Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDDC35C435
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 12:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EA641614;
	Mon, 12 Apr 2021 12:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EA641614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618224098;
	bh=9zDSFsykQnv27VjLt/WD0Jy7SeGFeYERTwAW2jrHo/o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QOhd1MZILbJ5fUY75ujvtjtgf44ezQdJKWCr/q7PwbKcnTZYhytslBoM22pUhmVa3
	 jmQwD+9lATSYvHZRorLHtotOSWL96xO/e3rp5GDAf8j8zYpwFtx4eWGrG8WzbcpMDG
	 DqJVLpYf6DaJPmyz7kuQNWpftJ+EOWSohc8GGaOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF914F80271;
	Mon, 12 Apr 2021 12:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36426F80269; Mon, 12 Apr 2021 12:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 384EAF8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 12:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 384EAF8013D
IronPort-SDR: gQPb97wAdXTYfDR4lvS4hbFQUPOLtWgo0WelscPxIunROi4WnT6wwjssYtq5MfFNcTaxPiPdCW
 l8ei61miPrWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="173653498"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="173653498"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 03:39:56 -0700
IronPort-SDR: /yvyGcOvJ/lkRaqfRjqQJl81c6adRXAKxZ//MrdN1qhUUUtwShVc/C7BC16CQ/VecIj9Xcunsl
 5vhUFeIvI7Rw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423741123"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.105])
 ([10.237.12.105])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 03:39:52 -0700
Subject: Re: [PATCH v7 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
 pierre-louis.bossart@linux.intel.com, oder_chiou@realtek.com,
 perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com, mgross@linux.intel.com
References: <20210412091919.27608-1-Perry_Yuan@Dell.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <63b8dca1-83d0-09ab-3622-0baa68bbf776@linux.intel.com>
Date: Mon, 12 Apr 2021 12:39:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210412091919.27608-1-Perry_Yuan@Dell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 broonie@kernel.org, Dell.Client.Kernel@dell.com, mario.limonciello@outlook.com
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

On 4/12/2021 11:19 AM, Perry Yuan wrote:
> From: Perry Yuan <perry_yuan@dell.com>
> 

(...)

> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 70edc5bb3a14..e7ffc0b81208 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -31,6 +31,8 @@
>   #include "dell-rbtn.h"
>   #include "dell-smbios.h"
>   
> +#include "dell-privacy-wmi.h"
> +
>   struct quirk_entry {
>   	bool touchpad_led;
>   	bool kbd_led_not_present;
> @@ -90,6 +92,7 @@ static struct rfkill *wifi_rfkill;
>   static struct rfkill *bluetooth_rfkill;
>   static struct rfkill *wwan_rfkill;
>   static bool force_rfkill;
> +static bool has_privacy;
>   
>   module_param(force_rfkill, bool, 0444);
>   MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
> @@ -2206,10 +2209,16 @@ static int __init dell_init(void)
>   
>   	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>   	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
> -		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> -		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
> -		if (ret < 0)
> -			goto fail_led;
> +		if (dell_privacy_present())
> +			has_privacy = true;
> +		else
> +			has_privacy = false;

Bit, of nitpicking, but you can write above shorter:
has_privacy = dell_privacy_present();
