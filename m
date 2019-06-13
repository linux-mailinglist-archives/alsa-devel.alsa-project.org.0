Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F443EB4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 17:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B0C1809;
	Thu, 13 Jun 2019 17:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B0C1809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560441186;
	bh=RNf0O6KNlnCzE74KXLLWueJSCY7/IDAfjWeBcgybCU0=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Meq72989UDDHcP1aNyhUCZ6R9GSEmjIG9J7kjYjlECw98OwCa64tJfnuNQ1NrvETr
	 +nBxNh5lRABYLcCd260b95H1OEd9f9C0yiOBLJ1MTe+8G2D8AaAwIFUCuTQ8ScQws5
	 +v7K8lhmwL0C8EhKWycXVWxus9kMrIHbjiun4QW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AA3BF80794;
	Thu, 13 Jun 2019 17:51:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57A0EF8076F; Thu, 13 Jun 2019 17:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E486F8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 17:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E486F8076F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 08:51:09 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 13 Jun 2019 08:51:09 -0700
Received: from aurena-mobl.amr.corp.intel.com (unknown [10.254.19.21])
 by linux.intel.com (Postfix) with ESMTP id A6F815801A8;
 Thu, 13 Jun 2019 08:51:08 -0700 (PDT)
To: Ralf Beck <musical_snake@gmx.de>, alsa-devel@alsa-project.org
References: <trinity-bf4e0eb4-e575-4dfc-9315-bc322b7b7f19-1560405271802@3c-app-gmx-bs72>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a00b46af-30c6-fba5-096b-62d88f66ae37@linux.intel.com>
Date: Thu, 13 Jun 2019 10:51:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <trinity-bf4e0eb4-e575-4dfc-9315-bc322b7b7f19-1560405271802@3c-app-gmx-bs72>
Content-Language: en-US
Subject: Re: [alsa-devel] (no subject)
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/13/19 12:54 AM, Ralf Beck wrote:
> 
> Jaroslav Kysela wrote:
>> I just don't think that the mmap transfer mode is the culprit of the problems.
>> The problem is that the PCI cards off-loads the DMA transfers completely
>> without the extra framing required for those serial hardware interfaces which
>> are handled in the audio driver and the other kernel stacks (USB etc.).
> 
> The source of all evil is the ring buffer.
> It prevents all devices that require packet headers (Firewire/network based solutions) or that
> use a variable amount of frames per packet (all asynchronous devices, especially asynchronous USB ISO endpoints)
> from mapping their data directly into userspas memory without ever touching the audio data in it.
> 
> While this doesn't hurt performance to much with devices that offer only a few channels,
> it has a massive effect on network based devices with possibly hundreds of channels of which only
> a small number is used (e.g. record enabled) at a time.
> 
> The ringbuffer should be replaced by a buffer that holds the packets and a descriptor for how to find the data in it. Btw, alsa uses something similar already for the mmap handling.
> 
> The descriptor should consist of
> x periods, containing y chunks with a max size, containing z channels, each of the channel described by a start address and step value within that chunk.

You're assuming a reliable network where not a single packet is missing. 
I can bet that if you start adding support for packet-based audio some 
folks are going to want to support timestamps and missing packets, which 
would throw a large size monkey-wrench in your ideas of time reporting 
below.
Also note that you could rely on the compressed API to deal with packets 
as an interface between your applications and your hardware - even if 
the actual data is PCM. It's still based on a ring buffer but it doesn't 
have the built-in bytes-to-time relationship that the ALSA PCM API 
relies on.

> Examples:
> PCI device; 2 periods, 1 chunks per period, max size 64 frames per chunk, 2 channels per chunk
> USB device: 2 periods, 8 chunks (microframes) max size 8 frames (if at 44.1/48kHz), 2 channels per chunk,
> Same for Firewire, AVB (each chunk possibly containing several AVB streams, i.e. ethernet packets), etc.
> 
> Period elapsed => the number of chunks forming a period have been received
> 
> snd_pcm_avail(_update) => return the sum of actual frames of the period
> 
> snd_pcm_mmap_commit => return the descriptor for one chunk, the number of frames of the chunk and a channel map for the chunk. The reason for the latter is that on ethernet based devices (AVB) there is bo guarantee that streams of different endpoints are received in the same order (but in the same interval window).
> Alsa clients should then loop until they have processed all frames thar have been reported by snd_pcm_avail (instead of a period size number of frames).
> 
> Ah, and AM824 raw audio format, used by firewire and AVB, should by added to the list of audio formats, so conversion can be done in userspace.
> 
> Ralf
> 
> 
>   
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
