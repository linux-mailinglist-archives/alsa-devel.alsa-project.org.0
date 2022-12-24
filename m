Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63D8655A7B
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 16:31:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362BDB91E;
	Sat, 24 Dec 2022 16:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362BDB91E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671895861;
	bh=Xp2f3PUnKi22P2W1jLYDRdXdGkcYxRmzjO74KJu9BRQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Nbe1pyjBsC0jJxFbMn6sSQJ4SWjC+MnnQvqAV6rpApsuolWv7MVDTnU8slgu8GmOc
	 wB9m+dvKvIVBlhvmI06FiZ83QwJAfLFflQLVZOwfmhUSH1MIJPj32JbIFth4K0tsEf
	 mbCLX1ww0/WGP1dQU9/dGf1XIcdcjQVzz8aT9tsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BFDF80423;
	Sat, 24 Dec 2022 16:30:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A30EF8032B; Sat, 24 Dec 2022 16:30:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 760ADF80245
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 16:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 760ADF80245
Received: (qmail 176898 invoked by uid 1000); 24 Dec 2022 10:29:52 -0500
Date: Sat, 24 Dec 2022 10:29:52 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 06/14] usb: core: hcd: Introduce USB HCD APIs for
 interrupter management
Message-ID: <Y6ca8IKLK9g497Qv@rowland.harvard.edu>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-7-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-7-quic_wcheng@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 23, 2022 at 03:31:52PM -0800, Wesley Cheng wrote:
> For USB HCDs that can support multiple USB interrupters, expose functions
> that class drivers can utilize for setting up secondary interrupters.
> Class drivers can pass this information to its respective clients, i.e.
> a dedicated DSP.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/core/hcd.c  | 86 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h     |  7 ++++
>  include/linux/usb/hcd.h | 16 +++++++-
>  3 files changed, 108 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 8300baedafd2..90ead90faf1d 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c

> +/**
> + * usb_hcd_stop_endpoint - Halt USB EP transfers
> + * @udev: usb device
> + * @ep: usb ep to stop
> + *
> + * Stop pending transfers on a specific USB endpoint.
> + **/
> +int usb_hcd_stop_endpoint(struct usb_device *udev,
> +					struct usb_host_endpoint *ep)
> +{
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	int ret = 0;
> +
> +	if (hcd->driver->stop_endpoint)
> +		ret = hcd->driver->stop_endpoint(hcd, udev, ep);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(usb_hcd_stop_endpoint);

You know, there already is a function that does this.  It's named 
usb_hcd_flush_endpoint().  No need to add another function that does the 
same thing.

Alan Stern
