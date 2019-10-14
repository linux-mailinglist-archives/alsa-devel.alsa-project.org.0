Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1EFD6663
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 17:46:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E2811671;
	Mon, 14 Oct 2019 17:45:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E2811671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571068004;
	bh=d3Xuu7vb0Uv6lyWSwcbUpCO5z5R42ApwHTrQht9w3ZM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzFU2K0Jm61bQ0J5SpIz/1t/FZiAPTewhzvVlQhMH3P56443S/WJ/VmeC6Kv5LzfK
	 5dfrw7De8CvoSeLe/85KCaIdG3zd4ywMC0r65eF1FS93uaB5pmXhl+Goz3Q5ZHMSbY
	 v+wC06J2AP2FfSDUqbmBw+0Y0vnN2hFJIk9tUH1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2175AF80322;
	Mon, 14 Oct 2019 17:44:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58C53F80362; Mon, 14 Oct 2019 17:44:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59184F80138
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 17:44:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59184F80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 08:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="225112710"
Received: from rtnitta-mobl1.amr.corp.intel.com (HELO [10.251.134.135])
 ([10.251.134.135])
 by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2019 08:44:47 -0700
To: YueHaibing <yuehaibing@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 jaska.uimonen@linux.intel.com, yang.jie@linux.intel.com,
 yung-chuan.liao@linux.intel.com
References: <20191014091308.23688-1-yuehaibing@huawei.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3222f3a0-f3cf-b1b9-df23-ec392f7dae4f@linux.intel.com>
Date: Mon, 14 Oct 2019 10:36:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014091308.23688-1-yuehaibing@huawei.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: Fix randbuild error
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



On 10/14/19 4:13 AM, YueHaibing wrote:
> When LEDS_TRIGGER_AUDIO is m and SND_SOC_SOF is y,
> 
> sound/soc/sof/control.o: In function `snd_sof_switch_put':
> control.c:(.text+0x587): undefined reference to `ledtrig_audio_set'
> control.c:(.text+0x593): undefined reference to `ledtrig_audio_set'
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 5d43001ae436 ("ASoC: SOF: acpi led support for switch controls")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for the fix.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/control.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
> index 41551e8..2c4abd4 100644
> --- a/sound/soc/sof/control.c
> +++ b/sound/soc/sof/control.c
> @@ -36,10 +36,12 @@ static void update_mute_led(struct snd_sof_control *scontrol,
>   
>   	scontrol->led_ctl.led_value = temp;
>   
> +#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
>   	if (!scontrol->led_ctl.direction)
>   		ledtrig_audio_set(LED_AUDIO_MUTE, temp ? LED_OFF : LED_ON);
>   	else
>   		ledtrig_audio_set(LED_AUDIO_MICMUTE, temp ? LED_OFF : LED_ON);
> +#endif
>   }
>   
>   static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
