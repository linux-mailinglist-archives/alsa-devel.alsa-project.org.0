Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A194744C14
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36F4A18D2;
	Thu, 13 Jun 2019 21:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36F4A18D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453836;
	bh=QfymLKK6wDnaFUzYvMR3XRigM5xP6UVQ4gPryvoWd5U=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xk+OUEA/8C+ieUAN0Q78K+rr17pQUV6p5uSDd8t3cR9VPiNRUt5kDqbYSTUw6jgH7
	 iOnE0fh35iKdmAdBhDuVIVD2TLFAVfTEI6ZudP0vzZDoPhiVBNWbhu+SrzgMYL7Vv0
	 8a1mevwaPssl0OqogjO/rkiraGZkfbYyOCcQeyJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0FDFF89703;
	Thu, 13 Jun 2019 21:19:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25262F89703; Thu, 13 Jun 2019 21:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1935F8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:19:15 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BDE0EA003F;
 Thu, 13 Jun 2019 21:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BDE0EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1560453554; bh=kAse4+Fc3TOaB8VQ+5Saa1vwq4K0GnEjKpdMRxdSuC8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=mma7aq/EOX+UTH0PEHjysKxPIKDiUoUSUdds3/tBeUTwNoK6zHOA89D0VZKIQSuSx
 vS36/Kn/M1gH777V4DmuotoFQwpnqroGZKsvk3JxxFEe8QcjymE2TxiwA0Aek7QBLi
 KLTorWyiz8Vjzsf3U9H7owg88rglLZHV3WppM1DM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 13 Jun 2019 21:19:12 +0200 (CEST)
To: Ralf Beck <musical_snake@gmx.de>, alsa-devel@alsa-project.org
References: <trinity-bf4e0eb4-e575-4dfc-9315-bc322b7b7f19-1560405271802@3c-app-gmx-bs72>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6a284390-a7b1-2be5-c848-48aae9119254@perex.cz>
Date: Thu, 13 Jun 2019 21:19:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 13. 06. 19 v 7:54 Ralf Beck napsal(a):
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
> 
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

You can create a new mmap type for the ALSA API and add the support code to
the ALSA PCM kernel and ALSA library to optimize the data handling for this
"special" hardware cases. It just moves the sample layout conversion from the
driver to the user space (ALSA library).

							Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
