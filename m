Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C784189801
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 10:37:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A822F1755;
	Wed, 18 Mar 2020 10:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A822F1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584524236;
	bh=wp7I0SQ/kpiHTjm4djy4aCrovgVsE/S7HulxSL/b8RE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oVVyAkrHMiVicryUDU13rSMOS7y7aJA3RArDEWLCrLLpmIqArgOSiZzisQ1nSt7d4
	 cIJHWR8vltWTLg6asckpjqbBsaoJPHilXw5l9m2zLpLVjjmmeN+rH31NyL6TAeomgs
	 Zl4itnkH7jM83A/6qeLaGAzANs+8vlJvb1R/Npcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7781FF8015B;
	Wed, 18 Mar 2020 10:35:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53347F80139; Wed, 18 Mar 2020 10:35:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webclient5.webclient5.de (webclient5.webclient5.de
 [136.243.32.184])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0817BF800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 10:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0817BF800C0
Received: from [10.1.2.107] (unknown [94.101.37.79])
 by webclient5.webclient5.de (Postfix) with ESMTPSA id 9B00557457F9;
 Wed, 18 Mar 2020 10:35:25 +0100 (CET)
Subject: Re: [PATCH 1/3] ALSA USB MIDI: Fix port starvation
To: Andreas Steinmetz <ast@domdv.de>
References: <c9aed355adc93d5de0cc4c740d16d19e3e210f79.camel@domdv.de>
 <36c09bfb-7d28-84c5-acba-9c74ad153a83@ladisch.de>
 <4f3995a9c08c41bb0a5170e78941f47e6ac33d0f.camel@domdv.de>
 <2c80b1eb-cf19-0882-5ec2-3f95cf253a51@ladisch.de>
 <0a66efeb806871d82bd750ff6219c516e48be66f.camel@domdv.de>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <2601eab3-9f73-f628-3f2f-24d4686916f9@ladisch.de>
Date: Wed, 18 Mar 2020 10:35:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0a66efeb806871d82bd750ff6219c516e48be66f.camel@domdv.de>
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
> On Tue, 2020-03-17 at 11:26 +0100, Clemens Ladisch wrote:
>> Why is it necessary to immedately get a complete class-compliant
>> message?
>
> Maybe that's a misunderstanding caused by me using 'message' instead of
> 'event'. We need a complete MIDI event (or up to 3 sysex bytes) to form
> the class compliant 4 byte USB event. That's what the 'repeat' shortcut
> is for. And after one such event is collected to the URB the code
> switches to the next port.

Why is it necessary to get a complete USB event before switching to the
next port?  Why not just process one byte in each loop iteration?

>> The point is that we should not restart with the first port in each
>> packet.
>
> I was thinking about that but in practice I do not know any class
> compliant interface that does have a number of outputs that is not
> equal to 2^n, i.e. 1, 2, 4, 8, 16.
>
> Then wMaxPacketSize is also always a 2^m value (16, 64, 512).
>
> With m>=n+2 (I don't believe that there is any class compliant
> interface for which this is not true)

At least ESI M4U has n=2, m=2.  It's for devices like this that the
driver uses multiple packets.  (I do not know if this (revision of
the) device is still used.)

It's certainly true that using the full packet size and 7 packets is
excessive in most situations.  The driver should _automatically_
reduce these values when it is safe.  (I'm not saying that module
parameters are completely superfluous, but they should never be
necessary if the driver can avoid it.)


I think the lowest-hanging fruit are the hardcoded 0x10, and that
port->active is not a single bitfield; the latter will make
searching for active ports easier.  I'll create patches for this.


Regards,
Clemens
