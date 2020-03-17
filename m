Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9046718896F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 16:50:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2608517D0;
	Tue, 17 Mar 2020 16:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2608517D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584460234;
	bh=bMoa1c/JNWDjBIjnzmII5DXqip18Ndrbo/2dmqnH5tY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ml6hCEd9Kd3qQ8Q0a+ZVgYk8+rBXuIPh906/IyDAlhLmQQm72Q9bbW/eYWxXJIhX8
	 ICe0Mn+/Q2Ho4rSrJWo0E/G7R9Wpx5mTKTfcWHgxr4YzIwOD/u8ztnDL+zXNShMdJk
	 YSEhuspSNKtx31JXRIYt2/BVrA1wIg+mruhOnAEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6F2EF80232;
	Tue, 17 Mar 2020 16:48:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79D22F8022B; Tue, 17 Mar 2020 16:48:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE44FF800C0
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 16:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE44FF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="IexEZklu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FBLdkxrDooRqoLcPEEFtrWtJ9/MQQj96jXFP8xrrNJo=; b=IexEZklu41nqwZjT2hUZCMr4vk
 TLJIPhkLkM5Lm3RTR2Rvrx3sYoy04nI0ODTpMDIfwZuKj6y4QBqJEh7ezh39Oe+vCt0Ag1viEtrKJ
 PrJD/D05uGuGgmPzK8MQVgQ6CUbwGA+R3KtMpG5ndIypgfSYeeJRjps6/k4Zo2+Q03KU=;
Received: from [fd06:8443:81a1:74b0::212] (port=4984 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jEERO-0007rT-8f; Tue, 17 Mar 2020 16:47:38 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jEERO-00085G-2z; Tue, 17 Mar 2020 16:47:38 +0100
Message-ID: <0a66efeb806871d82bd750ff6219c516e48be66f.camel@domdv.de>
Subject: Re: [PATCH 1/3] ALSA USB MIDI: Fix port starvation
From: Andreas Steinmetz <ast@domdv.de>
To: Clemens Ladisch <clemens@ladisch.de>
Date: Tue, 17 Mar 2020 16:47:37 +0100
In-Reply-To: <2c80b1eb-cf19-0882-5ec2-3f95cf253a51@ladisch.de>
References: <c9aed355adc93d5de0cc4c740d16d19e3e210f79.camel@domdv.de>
 <36c09bfb-7d28-84c5-acba-9c74ad153a83@ladisch.de>
 <4f3995a9c08c41bb0a5170e78941f47e6ac33d0f.camel@domdv.de>
 <2c80b1eb-cf19-0882-5ec2-3f95cf253a51@ladisch.de>
Organization: D.O.M. Datenverarbeitung GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 2020-03-17 at 11:26 +0100, Clemens Ladisch wrote:
> Andreas Steinmetz wrote:
> > On Mon, 2020-03-16 at 13:03 +0100, Clemens Ladisch wrote:
> > > Andreas Steinmetz wrote:
> > > > the snd_usbmidi_transmit_byte helper had to be converted to
> > > > return output notification to allow for the 'repeat' shortcut.
> > > 
> > > Why not simply handle one MIDI byte per port in each
> > > iteration?  It
> > > could be argued that single-byte MIDI commands are likely to be
> > > real-
> > > time messages and deserve to go first.
> > 
> > Actually the patch does exactly this. As soon as the helper signals
> > that a message is complete the next port is processed. The "repeat"
> > loop is just necessary to get a complete class compliant message
> > for
> > transfer as the helper processes one byte at a time.
> 
> Why is it necessary to immedately get a complete class-compliant
> message?
> 

Maybe that's a misunderstanding caused by me using 'message' instead of
'event'. We need a complete MIDI event (or up to 3 sysex bytes) to form
the class compliant 4 byte USB event. That's what the 'repeat' shortcut
is for. And after one such event is collected to the URB the code
switches to the next port.

> > The range optimization is there to prevent O(2) performance cost if
> > possible.
> 
> Do you mean O(n^2)?  For what n?
> 

What I do mean is that in case of only one port being active we would
do 16 full outer iterations over all ports to collect 1 event. And we
need to do this for all events of that port. Even if we use the hint
from port->active as a shortcut its always the full set of iterations.

Memorizing the first and the last port of the previous loop and then
restricting to this set makes a full 16 port run in the first iteration
and then only the active port for all subsequent iterations.

And yes, in the worst case of a 16x16 interface with ports 1 and 16
being active we're back to processing 16 ports for every iteration - I
do, however, see this scenario as being quite theoretical in practice.

> > > My original idea for that FIXME was to use round robin until the
> > > packet
> > > is filled (or all ports are empty), and to store the next port
> > > index
> > > (where to start for the next packet) in the endpoint.  This would
> > > be
> > > able to distribute the balancing over multiple packets.
> > 
> > The problem with "round robin until the packet is filled" is that
> > in
> > case of a large wMaxPacketSize there's then a huge
> > latency.
> 
> This mechanism does not require using the original packet size.
> The point is that we should not restart with the first port in each
> packet.

I was thinking about that but in practice I do not know any class
compliant interface that does have a number of outputs that is not
equal to 2^n, i.e. 1, 2, 4, 8, 16.

Then wMaxPacketSize is also always a 2^m value (16, 64, 512).

With m>=n+2 (I don't believe that there is any class compliant
interface for which this is not true) we can always start at the first
port while doing fair scheduling (when a new URB is filled all ports
get an equal change if they do have events pending).

Implementing a restart based on the last packet scheduled for the very
rare possibility of the above being not true just adds unnecessary
complexity.

> 
> 
> Regards,
> Clemens
Regards
-- 
Andreas Steinmetz

