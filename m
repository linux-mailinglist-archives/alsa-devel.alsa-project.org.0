Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A71DC048
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 22:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9831723;
	Wed, 20 May 2020 22:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9831723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590006968;
	bh=m3xtljKJkjHX7fyWRL1j4LEQJrvjqF3Ni+I/G0Gm35M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lt2PyXeQOkaI/a/YzkDJfIt9QaiVernRCkcmnNeIqZeSkSUKN4zOyTZjF6E5Rjnb2
	 G8Nqnq+WWU5tC4ITYTU//Z2DYoPVja6ATqcWmv5F5Q3HuU4lHdDGWaPhv3QWemImTp
	 hsNv0k7qSQiblrxs7+KDcpwn4d31Ht9FJ3xIzEVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A60F80213;
	Wed, 20 May 2020 22:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07877F801F9; Wed, 20 May 2020 22:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 9D6A8F80090
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 22:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D6A8F80090
Received: (qmail 23997 invoked by uid 1000); 20 May 2020 16:34:17 -0400
Date: Wed, 20 May 2020 16:34:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rik van Riel <riel@surriel.com>
Subject: Re: XHCI vs PCM2903B/PCM2904 part 2
Message-ID: <20200520203417.GA23602@rowland.harvard.edu>
References: <273cc1c074cc4a4058f31afe487fb233f5cf0351.camel@surriel.com>
 <20200520163840.GA11084@rowland.harvard.edu>
 <667d8d156fa5d8420ef1c3b1d08b94a10d2398cc.camel@surriel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <667d8d156fa5d8420ef1c3b1d08b94a10d2398cc.camel@surriel.com>
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

On Wed, May 20, 2020 at 03:21:44PM -0400, Rik van Riel wrote:
> On Wed, 2020-05-20 at 12:38 -0400, Alan Stern wrote:
> > On Wed, May 20, 2020 at 07:26:57AM -0400, Rik van Riel wrote:
> > > After a few more weeks of digging, I have come to the tentative
> > > conclusion that either the XHCI driver, or the USB sound driver,
> > > or both, fail to handle USB errors correctly.
> > > 
> > > I have some questions at the bottom, after a (brief-ish)
> > > explanation
> > > of exactly what seems to go wrong.
> > > 
> > > TL;DR: arecord from a misbehaving device can hang forever
> > > after a USB error, due to poll on /dev/snd/timer never returning.
> > > 
> > > The details: under some mysterious circumstances, the PCM290x
> > > family sound chips can send more data than expected during an
> > > isochronous transfer, leading to a babble error. Those
> > 
> > Do these chips connect as USB-3 devices or as USB-2?  (I wouldn't
> > expect 
> > an audio device to use USB-3; it shouldn't need the higher
> > bandwidth.)
> 
> USB-2

Okay.  In that case, xhci-hcd should appear to act just like a USB-2 
host controller.

> > In general, errors such as babble are not supposed to stop
> > isochronous 
> > endpoints.
> 
> However, it seems that they do. The urb never
> gets an answer after snd_complete_urb refiles
> it with usb_submit_urb.
> 
> > > However, the USB sound driver seems to have no idea that this
> > > error happened. The function retire_capture_urb looks at the
> > > status of each isochronous frame, but seems to be under the
> > > assumption that the sound device just keeps on running.
> > 
> > This is appropriate, for the reason mentioned above.
> 
> Having arecord get stuck forever does not seem like
> the right behavior, though :)

No, it isn't.

> > > This leads me to a few questions:
> > > - should retire_capture_urb call snd_pcm_stop_xrun,
> > >   or another function like it, if it sees certain
> > >   errors in the iso frame in the URB?
> > 
> > No.  Isochronous endpoints are expected to encounter errors from time
> > to 
> > time; that is the nature of isochronous communications.  You're
> > supposed 
> > to ignore the errors (skip over any bad data) and keep going.
> 
> ...
> 
> > The notion of "stopped state" is not part of USB-2.  As a result, it 
> > should be handled entirely within the xhci-hcd driver.
> 
> Interesting. That makes me really curious why things are
> getting stuck, now...

This could be a bug in xhci-hcd.  Perhaps the controller's endpoint 
state needs to be updated after one of these errors occurs.  Mathias 
will know all about that.

> > > - how should the USB sound driver recover from these
> > >   occasional and/or one-off errors? stop the sound
> > >   stream, or try to reinitialize the device and start
> > >   recording again?
> > 
> > As far as I know, it should do its best to continue (perhaps fill in 
> > missing data with zeros).
> 
> That was my first intuition as well, given the documented
> behavior of isochronous frames.
> 
> However, given that the device appears to stop sending
> frames after that error, at least usbmon is not seeing
> any, I am not sure what needs to happen in order to get
> that behavior.

The device won't send any data unless the host controller tells it to.  
If something is wrong with the host controller then usbmon won't see any 
data.

Alan Stern
