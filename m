Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5A1DB9DA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 18:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C13317FA;
	Wed, 20 May 2020 18:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C13317FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589992830;
	bh=LZOGKwLI3IWtFd9wd6qu3MEDiLjckvl8XQSWR0je3tQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTbYydN7+2ILBbi2awhXMiaoZvaDO/SdGM3ffBdirPPsyg+/dzQXSzdqqTkzVNgG7
	 byUQPkDZ/FyqJboR49AXqEgsIlEmOsrByb2sT70KWuqBDLOcKE1iOjlwWwiAJn2/E8
	 PeBL00hkg+KPBee4EYilKlclDiWMTHUf2pD62jE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 315B1F80213;
	Wed, 20 May 2020 18:38:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CCDFF80132; Wed, 20 May 2020 18:38:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 4BFE6F80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 18:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BFE6F80132
Received: (qmail 12889 invoked by uid 1000); 20 May 2020 12:38:40 -0400
Date: Wed, 20 May 2020 12:38:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rik van Riel <riel@surriel.com>
Subject: Re: XHCI vs PCM2903B/PCM2904 part 2
Message-ID: <20200520163840.GA11084@rowland.harvard.edu>
References: <273cc1c074cc4a4058f31afe487fb233f5cf0351.camel@surriel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273cc1c074cc4a4058f31afe487fb233f5cf0351.camel@surriel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

On Wed, May 20, 2020 at 07:26:57AM -0400, Rik van Riel wrote:
> After a few more weeks of digging, I have come to the tentative
> conclusion that either the XHCI driver, or the USB sound driver,
> or both, fail to handle USB errors correctly.
> 
> I have some questions at the bottom, after a (brief-ish) explanation
> of exactly what seems to go wrong.
> 
> TL;DR: arecord from a misbehaving device can hang forever
> after a USB error, due to poll on /dev/snd/timer never returning.
> 
> The details: under some mysterious circumstances, the PCM290x
> family sound chips can send more data than expected during an
> isochronous transfer, leading to a babble error. Those

Do these chips connect as USB-3 devices or as USB-2?  (I wouldn't expect 
an audio device to use USB-3; it shouldn't need the higher bandwidth.)

> circumstances seem to in part depend on the USB host controller
> and/or the electrical environment, since the chips work just
> fine for most people.
> 
> Receiving data past the end of the isochronous transfer window
> scheduled for a device results in the XHCI controller throwing
> a babble error, which moves the endpoint into halted state.
> 
> This is followed by the host controller software sending a
> reset endpoint command, and moving the endpoint into stopped
> state, as specified on pages 164-165 of the XHCI specification.

In general, errors such as babble are not supposed to stop isochronous 
endpoints.

> However, the USB sound driver seems to have no idea that this
> error happened. The function retire_capture_urb looks at the
> status of each isochronous frame, but seems to be under the
> assumption that the sound device just keeps on running.

This is appropriate, for the reason mentioned above.

> The function snd_complete_urb seems to only detect that the
> device is not running if usb_submit_urb returns a failure.
> 
>         err = usb_submit_urb(urb, GFP_ATOMIC);
>         if (err == 0)
>                 return;
> 
>         usb_audio_err(ep->chip, "cannot submit urb (err = %d)\n", err);
> 
>         if (ep->data_subs && ep->data_subs->pcm_substream) {
>                 substream = ep->data_subs->pcm_substream;
>                 snd_pcm_stop_xrun(substream);
>         }
> 
> However, the XHCI driver will happily submit an URB to a
> stopped device.

Do you mean "stopped device" or "stopped endpoint"?

>  Looking at the call trace usb_submit_urb ->
> xhci_urb_enqueue -> xhci_queue_isoc_tx_prepare -> prepare_ring,
> you can see this code:
> 
>         /* Make sure the endpoint has been added to xHC schedule */
>         switch (ep_state) {
> ...
>         case EP_STATE_HALTED:
>                 xhci_dbg(xhci, "WARN halted endpoint, queueing URB anyway.\n");
>         case EP_STATE_STOPPED:
>         case EP_STATE_RUNNING:
>                 break;
> 
> This leads me to a few questions:
> - should retire_capture_urb call snd_pcm_stop_xrun,
>   or another function like it, if it sees certain
>   errors in the iso frame in the URB?

No.  Isochronous endpoints are expected to encounter errors from time to 
time; that is the nature of isochronous communications.  You're supposed 
to ignore the errors (skip over any bad data) and keep going.

> - should snd_complete_urb do something with these
>   errors, too, in case they happen on the sync frames
>   and not the data frames?
> - does the XHCI code need to ring the doorbell when
>   submitting an URB to a stopped device, or is it
>   always up to the higher-level driver to fully reset
>   the device before it can do anything useful?

In this case it is not up to the higher-level driver.

> - if a device in stopped state does not do anything
>   useful, should usb_submit_urb return an error?

The notion of "stopped state" is not part of USB-2.  As a result, it 
should be handled entirely within the xhci-hcd driver.

(A non-isochronous endpoint can be in the "halted" state.  But obviously 
this isn't what you're talking about.)

> - how should the USB sound driver recover from these
>   occasional and/or one-off errors? stop the sound
>   stream, or try to reinitialize the device and start
>   recording again?

As far as I know, it should do its best to continue (perhaps fill in 
missing data with zeros).

Alan Stern

> I am willing to write patches and can test with my
> setup, but both the sound code and the USB code are
> new to me so I would like to know what direction I
> should go in :)
