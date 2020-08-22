Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DBE24E861
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Aug 2020 17:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9EC166B;
	Sat, 22 Aug 2020 17:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9EC166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598110168;
	bh=sGXBZ7fjUNAYT3PnpOm5v+iB6nA7dsTYZIb3jeHjIRY=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RW8uuw/ITD/K0vHKccvAuPyvPS2qb3ZqBLsC6rw1xSIO5fO1pfCkfTtQf5zApMB9t
	 i1NIzNIZoEXq+7NGKOVcZO+eNODfW0MYSbhkj214wqvJPgBeRO2w8lCvcJSFLYB2o9
	 uKNNPmtPJQ4cKU10PterhyqCyrw9MYvZ94g+JlvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24249F80228;
	Sat, 22 Aug 2020 17:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D4CF801F9; Sat, 22 Aug 2020 17:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 508EEF800C0
 for <alsa-devel@alsa-project.org>; Sat, 22 Aug 2020 17:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 508EEF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="YdOSXS5w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=Rpc2WeIQjRSQkNHJc2XaLoAncRIXq8AQL6Z/JE45IjM=; b=YdOSXS5wU6EfJAsEduP81C5VKS
 lyHnmxVe+XQoTuiZX3kRWB+7B+WgPnS2Mn8hUH3XyClIgBFK0JCLXMDispJWsCBoLazGw1AbnayEc
 Zx+9alNndW0w3nOjFdO9cdbPH2fN4VvOZhF49b4zWpDkn22NWoKaNYZxqAzTDYuj+4pw=;
Received: from [2a00:1370:8125:4e4::b41] (helo=home)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1k9VQe-0000gv-K4; Sat, 22 Aug 2020 18:27:36 +0300
Message-ID: <213664da6ebb6bf7f1382a93676f087236da412a.camel@tsoy.me>
Subject: Re: [PATCH 3/3] ALSA: usb-audio: Properly match with audio
 interface class
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Date: Sat, 22 Aug 2020 18:27:35 +0300
In-Reply-To: <20200817082140.20232-4-tiwai@suse.de>
References: <20200817082140.20232-1-tiwai@suse.de>
 <20200817082140.20232-4-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

В Пн, 17/08/2020 в 10:21 +0200, Takashi Iwai пишет:
> There are a few entries in the quirk table that set the device ID
> with
> USB_DEVICE() macro while having an extra bInterfaceClass field.  But
> bInterfaceClass field is never checked unless the proper match_flags
> is set, so those may match incorrectly with all interfaces.
> 
> Introduce another macro to match with the vid/pid pair and the audio
> class interface, and apply it to such entries, so that they can match
> properly.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/quirks-table.h | 55 +++++++++++++++++---------------------
> ----------
>  1 file changed, 19 insertions(+), 36 deletions(-)
> 
> diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> index 988bb9d00192..7a80ef31bbe4 100644
> --- a/sound/usb/quirks-table.h
> +++ b/sound/usb/quirks-table.h
> @@ -35,6 +35,14 @@
>  	.bInterfaceClass = USB_CLASS_AUDIO, \
>  	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL
>  
> +/* Another standard entry matching with vid/pid and the audio class
> */
> +#define USB_AUDIO_CLASS(vend, prod) \
> +	.match_flags = USB_DEVICE_ID_MATCH_DEVICE | \
> +		       USB_DEVICE_ID_MATCH_INT_CLASS, \
> +	.idVendor = vend, \
> +	.idProduct = prod, \
> +	.bInterfaceClass = USB_CLASS_AUDIO
> +
>  /* FTDI devices */
>  {
>  	USB_DEVICE(0x0403, 0xb8d8),
> @@ -68,34 +76,14 @@
>  	}
>  },
>  
> -{
> -	/* E-Mu 0202 USB */
> -	.match_flags = USB_DEVICE_ID_MATCH_DEVICE,
> -	.idVendor = 0x041e,
> -	.idProduct = 0x3f02,
> -	.bInterfaceClass = USB_CLASS_AUDIO,
> -},
> -{
> -	/* E-Mu 0404 USB */
> -	.match_flags = USB_DEVICE_ID_MATCH_DEVICE,
> -	.idVendor = 0x041e,
> -	.idProduct = 0x3f04,
> -	.bInterfaceClass = USB_CLASS_AUDIO,
> -},
> -{
> -	/* E-Mu Tracker Pre */
> -	.match_flags = USB_DEVICE_ID_MATCH_DEVICE,
> -	.idVendor = 0x041e,
> -	.idProduct = 0x3f0a,
> -	.bInterfaceClass = USB_CLASS_AUDIO,
> -},
> -{
> -	/* E-Mu 0204 USB */
> -	.match_flags = USB_DEVICE_ID_MATCH_DEVICE,
> -	.idVendor = 0x041e,
> -	.idProduct = 0x3f19,
> -	.bInterfaceClass = USB_CLASS_AUDIO,
> -},
> +/* E-Mu 0202 USB */
> +{ USB_AUDIO_CLASS(0x041e, 0x3f02) },
> +/* E-Mu 0404 USB */
> +{ USB_AUDIO_CLASS(0x041e, 0x3f04) },
> +/* E-Mu Tracker Pre */
> +{ USB_AUDIO_CLASS(0x041e, 0x3f0a) },
> +/* E-Mu 0204 USB */
> +{ USB_AUDIO_CLASS(0x041e, 0x3f19) },
>  
>  /*
>   * HP Wireless Audio
> @@ -2751,10 +2739,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
>  },
>  
>  /* KeithMcMillen Stringport */
> -{
> -	USB_DEVICE(0x1f38, 0x0001),
> -	.bInterfaceClass = USB_CLASS_AUDIO,
> -},
> +{ USB_AUDIO_CLASS(0x1f38, 0x0001) },
>  
>  /* Miditech devices */
>  {
> @@ -2977,10 +2962,7 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge",
> "HVR-950Q"),
>  },
>  {
>  	/* Tascam US122 MKII - playback-only support */
> -	.match_flags = USB_DEVICE_ID_MATCH_DEVICE,
> -	.idVendor = 0x0644,
> -	.idProduct = 0x8021,
> -	.bInterfaceClass = USB_CLASS_AUDIO,
> +	USB_AUDIO_CLASS(0x0644, 0x8021),
>  	.driver_info = (unsigned long) &(const struct
> snd_usb_audio_quirk) {
>  		.vendor_name = "TASCAM",
>  		.product_name = "US122 MKII",
> @@ -3612,3 +3594,4 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge",
> "HVR-950Q"),
>  
>  #undef USB_DEVICE_VENDOR_SPEC
>  #undef USB_AUDIO_DEVICE
> +#undef USB_AUDIO_CLASS

I don't know anything about KeithMcMillen Stringport, but all other
devices (US122 MKII and E-mu) seems to have Vendor-specific Class. And
since the driver should already match all compliant devices, the only
potentional use for USB_AUDIO_CLASS macro is for devices
with bInterfaceClass = USB_CLASS_AUDIO and with some invalid
bInterfaceSubClass.

