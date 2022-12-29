Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A38C658872
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 02:43:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A9842;
	Thu, 29 Dec 2022 02:42:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A9842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672278188;
	bh=jc4LB8FoW2dQyJ+Qjjf++xZOWJdpDYK+cud9Ms+gPBw=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aWrOh68KuGIK+Nmfgx4/nGsqJ6IAm67gt7P5eOMSxjHaRwA3Hn6iavsFkHZdOVli+
	 MSxyTCK7G+zqbgptkaYAD0irl/aL1ufWQaF8HvEFEr5FIxmdeD/AJMxa17t0Y3W2+B
	 cYnzyDowLBCfHCjhA+Vup3/RGRcpcuUPjtxE56OM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B17A4F800F0;
	Thu, 29 Dec 2022 02:42:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A8AF80310; Thu, 29 Dec 2022 02:42:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 0EF24F80310
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 02:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF24F80310
Received: (qmail 291561 invoked by uid 1000); 28 Dec 2022 20:41:56 -0500
Date: Wed, 28 Dec 2022 20:41:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH 06/14] usb: core: hcd: Introduce USB HCD APIs for
 interrupter management
Message-ID: <Y6zwZOquZOTZfnvP@rowland.harvard.edu>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-7-quic_wcheng@quicinc.com>
 <Y6ca8IKLK9g497Qv@rowland.harvard.edu>
 <e1203849-01b4-b196-36f3-76d58dd7c724@quicinc.com>
 <bf1011a8-c746-c465-f161-f0293409d922@suse.com>
 <Y6xd1c3s2XPpOqfi@rowland.harvard.edu>
 <559030ff-112b-e0a8-b278-72f909724496@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <559030ff-112b-e0a8-b278-72f909724496@quicinc.com>
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
 Oliver Neukum <oneukum@suse.com>, lgirdwood@gmail.com, robh+dt@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 28, 2022 at 12:31:16PM -0800, Wesley Cheng wrote:
> Hi Alan,
> 
> On 12/28/2022 7:16 AM, Alan Stern wrote:
> > On Wed, Dec 28, 2022 at 09:59:03AM +0100, Oliver Neukum wrote:
> > > 
> > > 
> > > On 27.12.22 22:07, Wesley Cheng wrote:
> > > 
> > > > 
> > > > Hmmm...maybe I should change the name of the API then to avoid the confusion.  Yes, usb_hcd_flush_endpoint() does ensure that URBs submitted to the EP are stopped.  However, with this offloading concept, we aren't actually submitting URBs from the main processor, so the ep->urb_list will be empty.
> > > > 
> > > > This means the usb_hcd_flush_endpoint() API won't actually do anything.  What we need is to ensure that we send a XHCI stop ep command to the controller.
> > > 
> > > That is a concept specific to XHCI, yet you are adding a generic
> > > API. The namin should reflect that. usb_quiesce_endpoint() ?
> > 
> > Or even xhci_send_stop_ep_cmd(), which is what the routine is intended
> > to do.
> > 
> 
> Just to clarify, you're talking about renaming the API that was added in the
> XHCI driver, correct?

To be precise, we're talking about renaming your usb_hcd_stop_endpoint() 
function, although similar arguments probably apply to your 
usb_free_interrupter(), usb_set_interrupter(), and 
usb_hcd_get_transfer_resource() routines.

You wrote earlier:

	The XHCI driver is the one that maintains the list of 
	interrupters that are available, so the locking was placed in 
	the XHCI driver versus adding it in the core hcd layer.

The "stop ep" functionality and other interrupter management things you 
want to add seem a lot like this locking stuff.  Since you decided to 
put the locking in the xhci-hcd driver instead of the core HCD layer, it 
would be logical to do the same with the "stop ep" and other routines.  
Which means there shouldn't be any need to make changes to hcd.c or 
include/linux/usb/hcd.h.

Alan Stern
