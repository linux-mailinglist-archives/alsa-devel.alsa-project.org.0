Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3427C186C23
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 14:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9C018C4;
	Mon, 16 Mar 2020 14:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9C018C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584365646;
	bh=ELF/lXoRsi2enGfhO9lOh6p+qdBwerbLhAA7JSNUzrc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oIkE9ZJu5yW41cETni9H9dnWVMvN1KkCfT09DK6GJC1H7tEqchNXhH+lRUcWKoK5p
	 khycRXZmtcNxF2sFsvu7uxMtPKHzpos4/mLI2iyK+fdldppDfXm+2n7iJLiSkdvxQv
	 l61A9Qt5aOf9eGnDGR+QGX+RLGVcMcs5/MD9eeD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 729DDF80162;
	Mon, 16 Mar 2020 14:32:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55CA8F8015B; Mon, 16 Mar 2020 14:32:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB4D3F800CD
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 14:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB4D3F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="B1zP6j60"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rbo5TeMTu8kqvV5VawYZAzHgcmjQtJzwppPdrPWyO9Q=; b=B1zP6j60FIYAwP1U1F5zMjb+EM
 ubN9Gtt9gqDvNJvje8AZS19qbx6IAMWpXebOldjgfE54+tGVzW6kVYRYjVQTgdbEod19fW/rcPDnk
 V1nc9RpL0Gtf+RYYL1rz0ywr2XnV7kJNN8aY9EmOhHumMBklWmlBn6nrscgSRvzym5tE=;
Received: from [fd06:8443:81a1:74b0::212] (port=2856 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jDpps-0003HF-Kh; Mon, 16 Mar 2020 14:31:16 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jDpps-0003LF-DM; Mon, 16 Mar 2020 14:31:16 +0100
Message-ID: <4f3995a9c08c41bb0a5170e78941f47e6ac33d0f.camel@domdv.de>
Subject: Re: [PATCH 1/3] ALSA USB MIDI: Fix port starvation
From: Andreas Steinmetz <ast@domdv.de>
To: Clemens Ladisch <clemens@ladisch.de>
Date: Mon, 16 Mar 2020 14:31:15 +0100
In-Reply-To: <36c09bfb-7d28-84c5-acba-9c74ad153a83@ladisch.de>
References: <c9aed355adc93d5de0cc4c740d16d19e3e210f79.camel@domdv.de>
 <36c09bfb-7d28-84c5-acba-9c74ad153a83@ladisch.de>
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

On Mon, 2020-03-16 at 13:03 +0100, Clemens Ladisch wrote:
> Andreas Steinmetz wrote:
> > the snd_usbmidi_transmit_byte helper had to be converted to
> > return output notification to allow for the 'repeat' shortcut.
> 
> Why not simply handle one MIDI byte per port in each iteration?  It
> could be argued that single-byte MIDI commands are likely to be real-
> time messages and deserve to go first.
> 

Actually the patch does exactly this. As soon as the helper signals
that a message is complete the next port is processed. The "repeat"
loop is just necessary to get a complete class compliant message for
transfer as the helper processes one byte at a time.
The range optimization is there to prevent O(2) performance cost if
possible.

> > Current multi port MIDI interfaces do
> > typically have 2^n output ports and 2^x as wMaxPacketSize where
> > x>n.
> 
> The USB specification requires bulk endpoints to have a
> wMaxPacketSize
> value of 8/16/32/64 for full speed, or exactly 512 for high speed.
> 
> > For the patch to properly work the wMaxPacketSize of the device
> > must be
> > large enough to allow for at least one MIDI event per port in a
> > URB.
> 
> There are devices that handle only the first four bytes of a received
> packet (because Windows used to send only small packets), and one of
> them, the ESI M4U, actually has more than one port.
> 

Again no problem as the patch is designed to prefer quirks over user
settings to prevent malfunctioning devices. Quirk processing and thus
size restrictions are processed after user selection.

> My original idea for that FIXME was to use round robin until the
> packet
> is filled (or all ports are empty), and to store the next port index
> (where to start for the next packet) in the endpoint.  This would be
> able to distribute the balancing over multiple packets.
> 

The problem with "round robin until the packet is filled" is that in
case of a large wMaxPacketSize there's then a huge latency.
I just got for further internal testing an USB3 8x8 interface that uses
a wMaxPacketSize of 512.
In such a case a port doing a sysex transfer will delay another port
then sending a realtime message by a minimum of 123ms per queued URB.
Make that 7 URBs and you have a sysex queue of 860ms until the realtime
message can be transmitted.
> 
> Regards,
> Clemens
-- 
Andreas Steinmetz

