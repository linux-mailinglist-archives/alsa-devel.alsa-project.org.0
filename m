Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43025AA2F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DAE21836;
	Wed,  2 Sep 2020 13:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DAE21836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599045928;
	bh=6871uyoLbxXuD9dG4YMsnYo5tL6qsxpyYMdRcdfO8kc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBXyDGCzarcJ6uVfX7iQrq+P1QAHgY3fTpAXC5FFFk0WFBcUrdUs6BJ0I+17Get1f
	 RjlXem6YZlSTNTrnL8z2XVHRp0vs/tLYLklDRm2xwtWAR7NEL9sQLavAqaD57CzxrM
	 oYXv/kGTexdWE+Ih3IfJhniTVGhWaGaVgXDJdQZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 618F6F801DA;
	Wed,  2 Sep 2020 13:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E388F8024A; Wed,  2 Sep 2020 13:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7179CF801DA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7179CF801DA
IronPort-SDR: uZfUrekEX6o5h6VZY/Az+AbVSnbuSeNAxe16blmrfR+XfqY8h7i6DaKzD+30jHnw/mA7bh067f
 LW9FlGxEEfRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="218916958"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="218916958"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 04:23:31 -0700
IronPort-SDR: OqNCIjSk4VpEk9lplIyXWdoWV7hgkGe5Iq51Opx0ujwSKJuJVa80CDtRvjRjmjAzIKCfjyV5JS
 kPXG16VU6E3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="331402380"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2020 04:23:28 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kDQrN-00Dhr3-5n; Wed, 02 Sep 2020 14:23:25 +0300
Date: Wed, 2 Sep 2020 14:23:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 03/10] USB: core: message.c: use usb_control_msg_send()
 in a few places
Message-ID: <20200902112325.GL1891694@smile.fi.intel.com>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
 <20200902110115.1994491-4-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902110115.1994491-4-gregkh@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, johan.hedberg@gmail.com,
 linux-kernel@vger.kernel.org, marcel@holtmann.org, linux-usb@vger.kernel.org,
 tiwai@suse.com, stern@rowland.harvard.ed, linux-bluetooth@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, dvyukov@google.com,
 himadrispandya@gmail.com
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

On Wed, Sep 02, 2020 at 01:01:05PM +0200, Greg Kroah-Hartman wrote:
> There are a few calls to usb_control_msg() that can be converted to use
> usb_control_msg_send() instead, so do that in order to make the error
> checking a bit simpler.

Makes sense. Others will take this as a good example of API in use.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/core/message.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 6aa49b237717..dfd079485c76 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1081,7 +1081,7 @@ int usb_set_isoch_delay(struct usb_device *dev)
>  	if (dev->speed < USB_SPEED_SUPER)
>  		return 0;
>  
> -	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> +	return usb_control_msg_send(dev, 0,
>  			USB_REQ_SET_ISOCH_DELAY,
>  			USB_DIR_OUT | USB_TYPE_STANDARD | USB_RECIP_DEVICE,
>  			dev->hub_delay, 0, NULL, 0,
> @@ -1203,13 +1203,13 @@ int usb_clear_halt(struct usb_device *dev, int pipe)
>  	 * (like some ibmcam model 1 units) seem to expect hosts to make
>  	 * this request for iso endpoints, which can't halt!
>  	 */
> -	result = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> -		USB_REQ_CLEAR_FEATURE, USB_RECIP_ENDPOINT,
> -		USB_ENDPOINT_HALT, endp, NULL, 0,
> -		USB_CTRL_SET_TIMEOUT);
> +	result = usb_control_msg_send(dev, 0,
> +				      USB_REQ_CLEAR_FEATURE, USB_RECIP_ENDPOINT,
> +				      USB_ENDPOINT_HALT, endp, NULL, 0,
> +				      USB_CTRL_SET_TIMEOUT);
>  
>  	/* don't un-halt or force to DATA0 except on success */
> -	if (result < 0)
> +	if (result)
>  		return result;
>  
>  	/* NOTE:  seems like Microsoft and Apple don't bother verifying
> @@ -1558,9 +1558,10 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
>  	if (dev->quirks & USB_QUIRK_NO_SET_INTF)
>  		ret = -EPIPE;
>  	else
> -		ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> -				   USB_REQ_SET_INTERFACE, USB_RECIP_INTERFACE,
> -				   alternate, interface, NULL, 0, 5000);
> +		ret = usb_control_msg_send(dev, 0,
> +					   USB_REQ_SET_INTERFACE,
> +					   USB_RECIP_INTERFACE, alternate,
> +					   interface, NULL, 0, 5000);
>  
>  	/* 9.4.10 says devices don't need this and are free to STALL the
>  	 * request if the interface only has one alternate setting.
> @@ -1570,7 +1571,7 @@ int usb_set_interface(struct usb_device *dev, int interface, int alternate)
>  			"manual set_interface for iface %d, alt %d\n",
>  			interface, alternate);
>  		manual = 1;
> -	} else if (ret < 0) {
> +	} else if (ret) {
>  		/* Re-instate the old alt setting */
>  		usb_hcd_alloc_bandwidth(dev, NULL, alt, iface->cur_altsetting);
>  		usb_enable_lpm(dev);
> @@ -1718,11 +1719,10 @@ int usb_reset_configuration(struct usb_device *dev)
>  		mutex_unlock(hcd->bandwidth_mutex);
>  		return retval;
>  	}
> -	retval = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> -			USB_REQ_SET_CONFIGURATION, 0,
> -			config->desc.bConfigurationValue, 0,
> -			NULL, 0, USB_CTRL_SET_TIMEOUT);
> -	if (retval < 0)
> +	retval = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
> +				      config->desc.bConfigurationValue, 0,
> +				      NULL, 0, USB_CTRL_SET_TIMEOUT);
> +	if (retval)
>  		goto reset_old_alts;
>  	mutex_unlock(hcd->bandwidth_mutex);
>  
> @@ -2103,10 +2103,10 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  	}
>  	kfree(new_interfaces);
>  
> -	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
> -			      USB_REQ_SET_CONFIGURATION, 0, configuration, 0,
> -			      NULL, 0, USB_CTRL_SET_TIMEOUT);
> -	if (ret < 0 && cp) {
> +	ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
> +				   configuration, 0, NULL, 0,
> +				   USB_CTRL_SET_TIMEOUT);
> +	if (ret && cp) {
>  		/*
>  		 * All the old state is gone, so what else can we do?
>  		 * The device is probably useless now anyway.
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


