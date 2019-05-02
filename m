Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCDB11FF3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 18:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01F78180F;
	Thu,  2 May 2019 18:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01F78180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556813802;
	bh=WGMS8LwWG4ZshUr5zNDXIrcvzwwpXC4cvBzLOWntyLw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaroMMqh5Ddi60e0hNZyGRCK5lDdxl4kQNIlyVWL8TUrXXMX8+HqBsUXXkdLGIqZ3
	 Zi5bWaQacSPOFNYaHcGxTpSJWwkqGG/8fz8TH5JCDv+i/JvG3RQaQGID+/jARYHNFB
	 u5nwLhnOPVC3Ei8oPCtY/vqqRH9lzePqMaU3GeeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61D1AF89693;
	Thu,  2 May 2019 18:14:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18505F896AA; Thu,  2 May 2019 18:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96E56F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 18:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96E56F80722
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 09:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; d="scan'208";a="145466670"
Received: from mkverma-mobl1.amr.corp.intel.com (HELO [10.251.141.178])
 ([10.251.141.178])
 by fmsmga008.fm.intel.com with ESMTP; 02 May 2019 09:14:48 -0700
To: "mac.chiang@intel.com--cc=pierre-louis.bossart"@linux.intel.com,
 alsa-devel@alsa-project.org
References: <1556777524-7437-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4755e1e0-ffb4-66b7-4f72-63aad8d258cd@linux.intel.com>
Date: Thu, 2 May 2019 11:14:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556777524-7437-1-git-send-email-mac.chiang@intel.com>
Content-Language: en-US
Cc: mac.chiang@intel.com, broonie@kernel.org, chintan.m.patel@intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: kbl_da7219_max98357a: Map
 BTN_0 to KEY_PLAYPAUSE
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




> From: Mac Chiang <mac.chiang@intel.com>
> 
> On kbl_rt5663_max98927, commit 38a5882e4292
>      ("ASoC: Intel: kbl_rt5663_max98927: Map BTN_0 to KEY_PLAYPAUSE")
>      This key pair mapping to play/pause when playing Youtube
> 
> The Android 3.5mm Headset jack specification mentions that BTN_0 should
> be mapped to KEY_MEDIA, but this is less logical than KEY_PLAYPAUSE,
> which has much broader userspace support.
> 
> For example, the Chrome OS userspace now supports KEY_PLAYPAUSE to toggle
> play/pause of videos and audio, but does not handle KEY_MEDIA.
> 
> Furthermore, Android itself now supports KEY_PLAYPAUSE equivalently, as the
> new USB headset spec requires KEY_PLAYPAUSE for BTN_0.
> https://source.android.com/devices/accessories/headset/usb-headset-spec
> 
> The same fix is required on Chrome kbl_da7219_max98357a.
> 
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Mark, to be clear it's a resend of a patch initially submitted in 2018, 
see https://patchwork.kernel.org/patch/10493135/

> ---
>   sound/soc/intel/boards/kbl_da7219_max98357a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> index 38f6ab7..07491a0 100644
> --- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
> @@ -188,7 +188,7 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
>   
>   	jack = &ctx->kabylake_headset;
>   
> -	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_MEDIA);
> +	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
>   	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
>   	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
>   	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
