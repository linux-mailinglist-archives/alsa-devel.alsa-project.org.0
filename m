Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C41B1711
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 22:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C126F1689;
	Mon, 20 Apr 2020 22:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C126F1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587414479;
	bh=09SKGhHF8j93l8BWTtBZN+CKEqw55TGNdO+HurAGCcM=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PdQJcpXTp2sGGmIAOzATIAHtCcm6JJW/t8Yoc0zwfb4+ZtfjM5aiCE46Wc22fmnpf
	 npW3COI7zgybBdGKjOaRCrc0t74fEiOc1lDOIRDyeX8S7aBmC7BLOZuebOPX26Poyi
	 dBGbP7DOepTp7rT8JxPTxbaSy57czCf0iGJcWhh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E69F9F801D9;
	Mon, 20 Apr 2020 22:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BDC4F801D9; Mon, 20 Apr 2020 22:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C4EF800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 22:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C4EF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="hE3jjcIi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=ZKaz9g+0dN4EMZTssIuTURp7XdyfTbM9NKhYQlFDI6Q=; b=hE3jjcIicpBLRbfMdYwOm7k70P
 O5XW9hDIULhuBkjgZqgmGtvWgiB2l2dl/LygBV9Y2pixjriADPQEQMOsukOQjl2llEGEn3s33b9hA
 L1tr4wdWUQQpQ/WZnBvi2bhGzwdSwYSPjtrGnFOuQlLon4ZP/pxUlkLv2NfWbYKx70iI=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jQczO-0006SG-8n; Mon, 20 Apr 2020 23:25:58 +0300
Message-ID: <1c4b8a362761421eba0ded60bb4f0e11b7e42f3b.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Focusrite Scarlett 2i2
From: Alexander Tsoy <alexander@tsoy.me>
To: Gregor Pintar <grpintar@gmail.com>, tiwai@suse.com, perex@perex.cz
Date: Mon, 20 Apr 2020 23:25:56 +0300
In-Reply-To: <20200420201937.12634-1-grpintar@gmail.com>
References: <20200420201937.12634-1-grpintar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

В Пн, 20/04/2020 в 22:19 +0200, Gregor Pintar пишет:
> Force it to use asynchronous playback.

Can we use snd_usb_audioformat_attributes_quirk() for such fixes? See
the quirk for Griffin iMic as an example.

> 
> Same quirk has already been added for Focusrite Scarlett Solo (2nd
> gen)
> with a commit 46f5710f0b88 ("ALSA: usb-audio: Add quirk for Focusrite
> Scarlett Solo").
> 
> This also seems to prevent regular clicks when playing at 44100Hz
> on Scarlett 2i2 (2nd gen). I did not notice any side effects.
> 
> Signed-off-by: Gregor Pintar <grpintar@gmail.com>
> ---
>  sound/usb/quirks-table.h | 84
> ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index e009d584e..bc936bf79 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -2840,6 +2840,90 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  		}
>  	}
>  },
> +{
> +	/*
> +	 * Focusrite Scarlett 2i2 2nd generation
> +	 * Reports that playback should use Synch: Synchronous
> +	 * while still providing a feedback endpoint. Synchronous
> causes
> +	 * snapping on some sample rates.
> +	 * Force it to use Synch: Asynchronous.
> +	 */
> +	USB_DEVICE(0x1235, 0x8202),
> +	.driver_info = (unsigned long) &(const struct
> snd_usb_audio_quirk) {
> +		.ifnum = QUIRK_ANY_INTERFACE,
> +		.type = QUIRK_COMPOSITE,
> +		.data = (const struct snd_usb_audio_quirk[]) {
> +			{
> +				.ifnum = 1,
> +				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
> +				.data = &(const struct audioformat) {
> +					.formats =
> SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 2,
> +					.iface = 1,
> +					.altsetting = 1,
> +					.altset_idx = 1,
> +					.attributes = 0,
> +					.endpoint = 0x01,
> +					.ep_attr =
> USB_ENDPOINT_XFER_ISOC |
> +						USB_ENDPOINT_SYNC_ASYNC
> ,
> +					.protocol = UAC_VERSION_2,
> +					.rates = SNDRV_PCM_RATE_44100 |
> +						SNDRV_PCM_RATE_48000 |
> +						SNDRV_PCM_RATE_88200 |
> +						SNDRV_PCM_RATE_96000 |
> +						SNDRV_PCM_RATE_176400 |
> +						SNDRV_PCM_RATE_192000,
> +					.rate_min = 44100,
> +					.rate_max = 192000,
> +					.nr_rates = 6,
> +					.rate_table = (unsigned int[])
> {
> +						44100, 48000, 88200,
> +						96000, 176400, 192000
> +					},
> +					.clock = 41
> +				}
> +			},
> +			{
> +				.ifnum = 2,
> +				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
> +				.data = &(const struct audioformat) {
> +					.formats =
> SNDRV_PCM_FMTBIT_S32_LE,
> +					.channels = 2,
> +					.iface = 2,
> +					.altsetting = 1,
> +					.altset_idx = 1,
> +					.attributes = 0,
> +					.endpoint = 0x82,
> +					.ep_attr =
> USB_ENDPOINT_XFER_ISOC |
> +						USB_ENDPOINT_SYNC_ASYNC
> |
> +						USB_ENDPOINT_USAGE_IMPL
> ICIT_FB,
> +					.protocol = UAC_VERSION_2,
> +					.rates = SNDRV_PCM_RATE_44100 |
> +						SNDRV_PCM_RATE_48000 |
> +						SNDRV_PCM_RATE_88200 |
> +						SNDRV_PCM_RATE_96000 |
> +						SNDRV_PCM_RATE_176400 |
> +						SNDRV_PCM_RATE_192000,
> +					.rate_min = 44100,
> +					.rate_max = 192000,
> +					.nr_rates = 6,
> +					.rate_table = (unsigned int[])
> {
> +						44100, 48000, 88200,
> +						96000, 176400, 192000
> +					},
> +					.clock = 41
> +				}
> +			},
> +			{
> +				.ifnum = 3,
> +				.type = QUIRK_IGNORE_INTERFACE
> +			},
> +			{
> +				.ifnum = -1
> +			}
> +		}
> +	}
> +},
>  
>  /* Access Music devices */
>  {

