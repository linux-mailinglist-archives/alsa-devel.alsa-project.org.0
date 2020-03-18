Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A872189FFB
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 16:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A48331743;
	Wed, 18 Mar 2020 16:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A48331743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584546827;
	bh=hN/N4GyWd8KmlfH95IjA/tksw/vqImpkVRjRDftDnFc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWOTF6F9AGxFoM30B4gNJTxhriYZp+een9O0rYJ57vgwO79h9Svs4bTfX4XcQPccz
	 FTSzaxvfun6CQdw7eI/NMOMvgAHj/zPhdETvlgVXE+c3orszXdubZxfFmYXviwG/o4
	 vCtaFcYAJiSTcEVc7xzgTPnIlttxSeI9Kp7GqJSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD3FF80058;
	Wed, 18 Mar 2020 16:52:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1071CF80139; Wed, 18 Mar 2020 16:52:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24495F800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 16:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24495F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="K63GbWrG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wtibOczMLEGk0FXx+nm0uFru0RcM2JpC/0WMrscQfcw=; b=K63GbWrGnwE4w+APup4LL7RAQk
 Ztq99e59pJDhc/vDZIfgmh1tV5NV1kIEYbqAdJbpBi5xdqKEp+cX6rb0FSNTOOK/bKq8xoqreV+4Q
 d8guvswZ2S0vXbAvBMfUAooVA1TOj22SWvForTa9SFE4cwzHbWD6L0oegV7JTQcsN29I=;
Received: from [fd06:8443:81a1:74b0::212] (port=2934 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jEay4-00060N-J4; Wed, 18 Mar 2020 16:50:52 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jEay4-0003UN-Dw; Wed, 18 Mar 2020 16:50:52 +0100
Message-ID: <cc4e5431ed8a74b9c24f727834e7923931b1e2c0.camel@domdv.de>
Subject: Re: [PATCH 1/3] ALSA USB MIDI: Fix port starvation
From: Andreas Steinmetz <ast@domdv.de>
To: Clemens Ladisch <clemens@ladisch.de>
Date: Wed, 18 Mar 2020 16:50:51 +0100
In-Reply-To: <2601eab3-9f73-f628-3f2f-24d4686916f9@ladisch.de>
References: <c9aed355adc93d5de0cc4c740d16d19e3e210f79.camel@domdv.de>
 <36c09bfb-7d28-84c5-acba-9c74ad153a83@ladisch.de>
 <4f3995a9c08c41bb0a5170e78941f47e6ac33d0f.camel@domdv.de>
 <2c80b1eb-cf19-0882-5ec2-3f95cf253a51@ladisch.de>
 <0a66efeb806871d82bd750ff6219c516e48be66f.camel@domdv.de>
 <2601eab3-9f73-f628-3f2f-24d4686916f9@ladisch.de>
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

On Wed, 2020-03-18 at 10:35 +0100, Clemens Ladisch wrote:
> Andreas Steinmetz wrote:
> > On Tue, 2020-03-17 at 11:26 +0100, Clemens Ladisch wrote:
> > > Why is it necessary to immedately get a complete class-compliant
> > > message?
> > 
> > Maybe that's a misunderstanding caused by me using 'message'
> > instead of
> > 'event'. We need a complete MIDI event (or up to 3 sysex bytes) to
> > form
> > the class compliant 4 byte USB event. That's what the 'repeat'
> > shortcut
> > is for. And after one such event is collected to the URB the code
> > switches to the next port.
> 
> Why is it necessary to get a complete USB event before switching to
> the
> next port?  Why not just process one byte in each loop iteration?
> 

Because of fairness. Let's assume a keyboard sends 6 note on messages,
that's 6 3 byte events on a port, while another port just sends channel
pressure which is two bytes and with running status only one byte.
Instead of fair scheduling the new notes will be delayed by the channel
pressure when doing only one byte per iteration. So the grouped
together note on events would be torn apart further than necessary
which may be audible.

> > > The point is that we should not restart with the first port in
> > > each
> > > packet.
> > 
> > I was thinking about that but in practice I do not know any class
> > compliant interface that does have a number of outputs that is not
> > equal to 2^n, i.e. 1, 2, 4, 8, 16.
> > 
> > Then wMaxPacketSize is also always a 2^m value (16, 64, 512).
> > 
> > With m>=n+2 (I don't believe that there is any class compliant
> > interface for which this is not true)
> 
> At least ESI M4U has n=2, m=2.  It's for devices like this that the
> driver uses multiple packets.  (I do not know if this (revision of
> the) device is still used.)
> 

Well, in this rare case the patch wouldn't do any harm. The only thing
is that there would be no improvement in behaviour to the previous code
version for this special device.

Please note that I did take especially care to not increase cpu usage
(on x86_64) because I wanted to make sure that (hopefully) there is no
load increase for slow embedded systems.

> It's certainly true that using the full packet size and 7 packets is
> excessive in most situations.  The driver should _automatically_
> reduce these values when it is safe.  (I'm not saying that module
> parameters are completely superfluous, but they should never be
> necessary if the driver can avoid it.)
> 

If automatic tuning is possible, fine. Manual override should still be
possible, though, for the case the user knows better than an automatism
for the use case of the user.

> 
> I think the lowest-hanging fruit are the hardcoded 0x10, and that
> port->active is not a single bitfield; the latter will make
> searching for active ports easier.  I'll create patches for this.

I'm very interested.

Cheers
-- 
Andreas Steinmetz

