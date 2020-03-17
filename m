Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C3187E45
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 11:27:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D6AF1818;
	Tue, 17 Mar 2020 11:27:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D6AF1818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584440878;
	bh=sBwYqO5OPqcK+fs8c5L5CAjX4m9xSAmL1uxlbMTZ13o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRy4EOkRfAGp6Y+W1p+kPLsGgEaNVXZLca5jXv383n+XYT/v4sQJ/D+UN3T+44wVi
	 /p4CjhDLaPrSGPhy9/a+qn5zybuKkN20GjbdIiNWL3FEvwm4WmXoxA6tTliTthnUiG
	 Ti0fKiEiC3by/6WrgR8NLSaeGjG7XvXSZ+YKLj4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 518D0F80058;
	Tue, 17 Mar 2020 11:26:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833BAF8022B; Tue, 17 Mar 2020 11:26:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [IPv6:2a01:4f8:212:88::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8CDDF800C0
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 11:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CDDF800C0
Received: from [10.1.2.107] (unknown [94.101.37.79])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id AA72957A657F;
 Tue, 17 Mar 2020 11:26:10 +0100 (CET)
Subject: Re: [PATCH 1/3] ALSA USB MIDI: Fix port starvation
To: Andreas Steinmetz <ast@domdv.de>
References: <c9aed355adc93d5de0cc4c740d16d19e3e210f79.camel@domdv.de>
 <36c09bfb-7d28-84c5-acba-9c74ad153a83@ladisch.de>
 <4f3995a9c08c41bb0a5170e78941f47e6ac33d0f.camel@domdv.de>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <2c80b1eb-cf19-0882-5ec2-3f95cf253a51@ladisch.de>
Date: Tue, 17 Mar 2020 11:26:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4f3995a9c08c41bb0a5170e78941f47e6ac33d0f.camel@domdv.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.101.4 at webclient5
X-Virus-Status: Clean
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

Andreas Steinmetz wrote:
> On Mon, 2020-03-16 at 13:03 +0100, Clemens Ladisch wrote:
>> Andreas Steinmetz wrote:
>>> the snd_usbmidi_transmit_byte helper had to be converted to
>>> return output notification to allow for the 'repeat' shortcut.
>>
>> Why not simply handle one MIDI byte per port in each iteration?  It
>> could be argued that single-byte MIDI commands are likely to be real-
>> time messages and deserve to go first.
>
> Actually the patch does exactly this. As soon as the helper signals
> that a message is complete the next port is processed. The "repeat"
> loop is just necessary to get a complete class compliant message for
> transfer as the helper processes one byte at a time.

Why is it necessary to immedately get a complete class-compliant message?

> The range optimization is there to prevent O(2) performance cost if
> possible.

Do you mean O(n^2)?  For what n?

>> My original idea for that FIXME was to use round robin until the packet
>> is filled (or all ports are empty), and to store the next port index
>> (where to start for the next packet) in the endpoint.  This would be
>> able to distribute the balancing over multiple packets.
>
> The problem with "round robin until the packet is filled" is that in
> case of a large wMaxPacketSize there's then a huge latency.

This mechanism does not require using the original packet size.
The point is that we should not restart with the first port in each
packet.


Regards,
Clemens
