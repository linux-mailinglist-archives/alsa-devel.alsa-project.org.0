Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 096DD655981
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 09:56:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C562A98D;
	Sat, 24 Dec 2022 09:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C562A98D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671872178;
	bh=viKmcZzp/wbu7S0+5GGw6FGqvwbKp//GP5BtC8Z10i4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YtpTzFPFYB+9eZkS4TAauzUaRNh+4xmnELrl3Q/2i7xd09FClqnouZmRqa9w0zwXr
	 0OvS2/WzUl4EIYZdBlrG5BZmDamdMXCluelY3dwj0e3stIbd4tSnarsb61nlRRi3iP
	 ZrNG8VkwRHGxCiMRnnDarcf9XFJEsd1tFZQ58fMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C0F3F80496;
	Sat, 24 Dec 2022 09:55:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21268F80423; Sat, 24 Dec 2022 09:55:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB5FBF80423
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 09:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB5FBF80423
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ZIGB8jc0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D99576020F;
 Sat, 24 Dec 2022 08:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AA0C433EF;
 Sat, 24 Dec 2022 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1671872120;
 bh=viKmcZzp/wbu7S0+5GGw6FGqvwbKp//GP5BtC8Z10i4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIGB8jc0yvSmiOk9c8oe4uC1zDW6silh0FxTmk15X8AA3AEpWqb57gAbmeKB4bsb8
 GeALnFg45+4CrqaPmZiDvzF+sImgyOaApGiXGhqKDCmCwtJyVR+Eqlepi36rnuH2Op
 xnSqdAYzBZK0e6kUlG09ozOUFwzj0eWOjJyyfdgY=
Date: Sat, 24 Dec 2022 09:55:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 07/14] usb: host: xhci: Add XHCI secondary
 interrupter support
Message-ID: <Y6a+daSIEZaHhz6b@kroah.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-8-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223233200.26089-8-quic_wcheng@quicinc.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Dec 23, 2022 at 03:31:53PM -0800, Wesley Cheng wrote:
> Implement the XHCI operations for allocating and requesting for a secondary
> interrupter.  The secondary interrupter can allow for events for a
> particular endpoint to be routed to a separate event ring.  The event
> routing is defined when submitting a transfer descriptor to the USB HW.
> There is a specific field which denotes which interrupter ring to route the
> event to when the transfer is completed.
> 
> An example use case, such as audio packet offloading can utilize a separate
> event ring, so that these events can be routed to a different processor
> within the system.  The processor would be able to independently submit
> transfers and handle its completions without intervention from the main
> processor.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/host/xhci-mem.c  | 219 ++++++++++++++++++++++++++++-------
>  drivers/usb/host/xhci-plat.c |   2 +
>  drivers/usb/host/xhci.c      | 169 ++++++++++++++++++++++++++-
>  drivers/usb/host/xhci.h      |  15 +++
>  4 files changed, 363 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 81ca2bc1f0be..d5cb4b82ad3d 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1835,6 +1835,7 @@ void xhci_free_erst(struct xhci_hcd *xhci, struct xhci_erst *erst)
>  void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  {
>  	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
> +	struct xhci_sec *sec, *tmp;
>  	int i, j, num_ports;
>  
>  	cancel_delayed_work_sync(&xhci->cmd_timer);
> @@ -1846,6 +1847,16 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  	xhci->event_ring = NULL;
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed event ring");
>  
> +	list_for_each_entry_safe(sec, tmp, &xhci->xhci_sec_list, list) {
> +		list_del(&sec->list);
> +		if (sec->event_ring) {
> +			xhci_ring_free(xhci, sec->event_ring);
> +			xhci_dbg_trace(xhci, trace_xhci_dbg_init,
> +						"Freed secondary ring %d", sec->intr_num);

Odd indentation :(

