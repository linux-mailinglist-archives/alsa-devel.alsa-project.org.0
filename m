Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8443852EC2
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 12:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D2BB70;
	Tue, 13 Feb 2024 12:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D2BB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707822397;
	bh=saEEW2K86dM6FLv55BUHxbVrfwkcPU+hjYCqovDchuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QIBdDo76FQNuLY2d7UIwS9mpi14RDv+MYmqM9cleNME/d0jTqPeXgJwNNRCostCuJ
	 1O2K/FN5BckkusRb6o2GoWmeALnrAN9kDt5ePUGreTu+ciY+K7nPaXUeglKgk9lCf7
	 GWEpz78P8dJx3VAheJbVNI1gGWgr2+r1e2sCbNZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2067F80567; Tue, 13 Feb 2024 12:06:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AFDFF80104;
	Tue, 13 Feb 2024 12:06:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 447D0F80238; Tue, 13 Feb 2024 12:06:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0866F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 12:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0866F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=WWslb2Hf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C8BF9CE1A90;
	Tue, 13 Feb 2024 11:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99541C433F1;
	Tue, 13 Feb 2024 11:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707822350;
	bh=saEEW2K86dM6FLv55BUHxbVrfwkcPU+hjYCqovDchuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWslb2HfAr2jGZgmRghTVvSL5AEn56kpCKX3evrc60iEsvE4AjaW4BFwJjmNatY9Q
	 YOWGnFGCoYtz6OD7dQ9qU7wL/z6Xb2My0+oMtxmX3vhKil5rDh9UIPC2PlszYW3sH0
	 FhV2jViRZJUoRYZM6aHBIhveIufTmt87SNWxLIas=
Date: Tue, 13 Feb 2024 12:05:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nikolay Yakimov <root@livid.pp.ru>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: Re: [PATCH] USB: Always select config with the highest supported UAC
 version
Message-ID: <2024021353-reversing-waltz-7402@gregkh>
References: <20240212152848.44782-1-alexander@tsoy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212152848.44782-1-alexander@tsoy.me>
Message-ID-Hash: LPDGK4CUUDRIVHYXRGFHS7KNNNZFUFPH
X-Message-ID-Hash: LPDGK4CUUDRIVHYXRGFHS7KNNNZFUFPH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPDGK4CUUDRIVHYXRGFHS7KNNNZFUFPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> Config with the highest supported UAC version is always preferable because
> it usually provides more features.
> 
> Main motivation for this change is to improve support for several UAC2
> devices which have UAC1 config as the first one for compatibility reasons.
> UAC2 mode provides a wider range of supported sampling rates on these
> devices. Also when UAC4 support is implemented, it will need just one
> additional case line without changing the logic.
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> ---
>  drivers/usb/core/generic.c | 39 +++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index b134bff5c3fe..8aeb180e1cf9 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -48,9 +48,16 @@ static bool is_audio(struct usb_interface_descriptor *desc)
>  	return desc->bInterfaceClass == USB_CLASS_AUDIO;
>  }
>  
> -static bool is_uac3_config(struct usb_interface_descriptor *desc)
> +static bool is_supported_uac(struct usb_interface_descriptor *desc)
>  {
> -	return desc->bInterfaceProtocol == UAC_VERSION_3;
> +	switch(desc->bInterfaceProtocol) {
> +	case UAC_VERSION_1:
> +	case UAC_VERSION_2:
> +	case UAC_VERSION_3:
> +		return true;
> +	default:
> +		return false;
> +	}
>  }
>  
>  int usb_choose_configuration(struct usb_device *udev)
> @@ -135,22 +142,28 @@ int usb_choose_configuration(struct usb_device *udev)
>  		}
>  
>  		/*
> -		 * Select first configuration as default for audio so that
> -		 * devices that don't comply with UAC3 protocol are supported.
> -		 * But, still iterate through other configurations and
> -		 * select UAC3 compliant config if present.
> +		 * Iterate through audio configurations and select the first of
> +		 * the highest supported UAC versions. Select the first config
> +		 * if no supported UAC configs are found.
>  		 */
>  		if (desc && is_audio(desc)) {
> -			/* Always prefer the first found UAC3 config */
> -			if (is_uac3_config(desc)) {
> -				best = c;
> -				break;
> -			}
> +			struct usb_interface_descriptor	*best_desc = NULL;
> +
> +			if (best)
> +				best_desc = &best->intf_cache[0]->altsetting->desc;

Are you sure you always have a intf_cache[0] pointer?  What about
altsetting?  Remember, invalid descriptors happen all the time, and are
a known "attack vector" against the USB stack.

>  
> -			/* If there is no UAC3 config, prefer the first config */
> -			else if (i == 0)
> +			if (i == 0)
>  				best = c;
>  
> +			/* Assume that bInterfaceProtocol value is always
> +			 * growing when UAC versions are incremented, so that
> +			 * the direct comparison is possible. */

How do we know this assumption is always true?  What happens when it is not?

> +			else if (is_supported_uac(desc) && best_desc &&
> +				 (!is_supported_uac(best_desc) ||
> +				  (desc->bInterfaceProtocol >
> +				   best_desc->bInterfaceProtocol)))
> +					best = c;

I really can't understand this if logic, sorry, can you describe it
better so that we can maintain it over time?

thanks,

greg k-h
