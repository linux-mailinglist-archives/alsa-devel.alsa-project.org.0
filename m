Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F81FF5F4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 16:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19EF017A4;
	Thu, 18 Jun 2020 16:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19EF017A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592492349;
	bh=qUFLtbzLa7BQHttBPEHcC0wMoBLEp83tx2S4k1kLG3k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nh6MZOJoD7aproZ3nfVicxMsbtiphzDO8JiQAleXpQCEZEWVpuEgtLeAh3sDs4ACN
	 djPEFzMW6eoLRfT8mfWjCLY3H8jFAOgjEKsyAUgzCAkpIlWmNayCYP+eaoAKfseW8D
	 XYCR+Bm5CtAC35DiZ2O+BZVZA9qkwYi7ewx0AYiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42374F801ED;
	Thu, 18 Jun 2020 16:56:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FFD8F80101; Thu, 18 Jun 2020 16:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97ACFF80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 16:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97ACFF80101
IronPort-SDR: 6ikbQm1zr/pbHJMquDnmABX0eefsISegojcUOyl83c33JJwHI0Di75NE3Dgkj1v5jSbE+6kBs1
 rNxSynNa97pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="131000243"
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="131000243"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 07:56:27 -0700
IronPort-SDR: NEx0GOaMn7OvG1Et1Z3rmhL2o3vxYosQnEPvgEEQoBzIU1av8cbFXZ6IsBIpSxA+94iSjx64Dh
 kvfC5ZH29okg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="477268207"
Received: from richard2-mobl.amr.corp.intel.com (HELO [10.254.109.110])
 ([10.254.109.110])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jun 2020 07:56:25 -0700
Subject: Re: [PATCH] ANDROID: sound: usb: Add vendor's hooking interface
To: JaeHun Jung <jh0801.jung@samsung.com>, tiwai@suse.de
References: <CGME20200617022554epcas2p214a49f03a15e504d8faa28148e06e796@epcas2p2.samsung.com>
 <1592360304-29621-1-git-send-email-jh0801.jung@samsung.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d37660f8-3bb6-5f3a-8ac1-c0d6d5a08468@linux.intel.com>
Date: Thu, 18 Jun 2020 07:27:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592360304-29621-1-git-send-email-jh0801.jung@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 6/16/20 9:18 PM, JaeHun Jung wrote:
> In mobile, a co-processor is used when using USB audio
> to improve power consumption.
> hooking is required for sync-up when operating
> the co-processor. So register call-back function.
> The main operation of the call-back function is as follows:
> - Initialize the co-processor by transmitting data
>    when initializing.
> - Change the co-processor setting value through
>    the interface function.
> - Configure sampling rate
> - pcm open/close

Thank you for this patch. With the removal of the 3.5mm jack on a number 
of platforms, and improvements to reduce power consumption on a variety 
of hosts there's indeed a need to enhance sound/usb in the kernel.

> 
> Bug: 156315379
> 
> Change-Id: I32e1dd408e64aaef68ee06c480c4b4d4c95546dc
> Signed-off-by: JaeHun Jung <jh0801.jung@samsung.com>

You probably want to remove bug references and Change-Id if they are not 
publicly visible

> @@ -891,6 +897,15 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
>   	struct usb_interface *iface;
>   	int ret;
>   
> +	if (usb_audio_ops && usb_audio_ops->vendor_set_pcmbuf) {
> +		ret = usb_audio_ops->vendor_set_pcmbuf(subs->dev);
> +
> +		if (ret < 0) {
> +			dev_err(&subs->dev->dev, "pcm buf transfer failed\n");
> +			return ret;
> +		}
> +	}
> +
>   	if (! subs->cur_audiofmt) {
>   		dev_err(&subs->dev->dev, "no format is specified!\n");
>   		return -ENXIO;
> @@ -924,6 +939,15 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
>   		if (ret < 0)
>   			goto unlock;
>   
> +		if (usb_audio_ops && usb_audio_ops->vendor_set_rate) {
> +			subs->need_setup_ep = false;
> +			usb_audio_ops->vendor_set_rate(
> +					subs->cur_audiofmt->iface,
> +					subs->cur_rate,
> +					subs->cur_audiofmt->altsetting);
> +			goto unlock;
> +		}
> +
>   		ret = configure_endpoint(subs);
>   		if (ret < 0)
>   			goto unlock;
> @@ -1333,6 +1357,9 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>   	struct snd_usb_substream *subs = &as->substream[direction];
>   	int ret;
>   
> +	if (usb_audio_ops && usb_audio_ops->vendor_pcm_con)
> +		usb_audio_ops->vendor_pcm_con(true, direction);
> +
>   	subs->interface = -1;
>   	subs->altset_idx = 0;
>   	runtime->hw = snd_usb_hardware;
> @@ -1361,12 +1388,18 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>   	struct snd_usb_substream *subs = &as->substream[direction];
>   	int ret;
>   
> +	if (usb_audio_ops && usb_audio_ops->vendor_pcm_con)
> +		usb_audio_ops->vendor_pcm_con(false, direction);
> +

can you elaborate on the PCM streaming parts? if you allocate a buffer 
for the co-processor to deal with PCM data, will you end-up copying data 
from the existing ring buffers allocated with vmalloc() into your 
coprocessor?

I was instead thinking of having a different 'mode' where the PCM 
buffers are not allocated by sound/usb, but instead allocated by the 
driver taking care of the low-power USB path, so that apps can directly 
write into ring buffers that are handled by the coprocessor/offload unit.

Thanks
-Pierre
