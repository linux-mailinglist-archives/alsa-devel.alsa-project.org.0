Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621C550944
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jun 2022 10:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845641F1D;
	Sun, 19 Jun 2022 10:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845641F1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655625884;
	bh=YkkOGoe9V9wW9g2ztsckcgCVJ3/X/tqgnK6KFGe6juc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rmKXuoKQKoMrxbuFP3LogJcA2uOVvhxVvO4Su9KUa8ZUhSqnGqmHUWN0ow6mdK/Xr
	 omkPW3ht0eSheH5x8bo1brQXyi7LhWQnpfDWlW3ygU5u5qafR/301R6UerRMtvQllT
	 mdQ081TaG2Pz92HxtlqwVNoi15kaFNRwHxLbup5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 069B8F80245;
	Sun, 19 Jun 2022 10:03:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FF4EF8020D; Sun, 19 Jun 2022 10:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 666EFF800E4
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 10:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666EFF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="bDDlpf79"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="IPAZHPvd"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id F1862A1A3D405;
 Sun, 19 Jun 2022 10:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655625816; bh=YkkOGoe9V9wW9g2ztsckcgCVJ3/X/tqgnK6KFGe6juc=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=bDDlpf79R1eI4rIwjThPJQDe9Jzy4cK9e1Dh7pJ53ttYBlc9Vo4TskxdJJDfiQt4s
 RJ76o11ChMnTlbzjqbbPU4GQU7QUSPQrvZDR7h5F0UXs3avHyb1eotjvM6pGKmRBrH
 B/zTj7Sac4n5n1L8Ir6PYc89tHhe3cVtpX7GiqsA=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FuekVjOdYvax; Sun, 19 Jun 2022 10:03:30 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 5E1D2A1A3D403;
 Sun, 19 Jun 2022 10:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655625810; bh=YkkOGoe9V9wW9g2ztsckcgCVJ3/X/tqgnK6KFGe6juc=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=IPAZHPvdVUDhOoAK/jMpD4bOLTqQC1XNQ8DTZsotb8oA/P95FPI0IBvI56q8FyD56
 uhdAbFUJxBoXenTHaqbF2xupFmvZoBil+yOw8mVMEBTPq6jWN80g1LqlxZl0M/3gzL
 w1s4BuVASpzRjv5ODKRZqpEfyw+Gd5CyzDkt0E+Q=
Message-ID: <f576bbc3-a556-6af8-520c-9eba7892c326@ivitera.com>
Date: Sun, 19 Jun 2022 10:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Enabling tstamp in proc status file externally
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <9892a324-a549-c411-9d2c-0a10c580422d@ivitera.com>
 <Yq47ISgw2fWTELwi@workstation>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <Yq47ISgw2fWTELwi@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi Takashi,

Dne 18. 06. 22 v 22:52 Takashi Sakamoto napsal(a):
> Hi Pavel,
> 
> On Thu, Jun 09, 2022 at 02:38:58PM +0200, Pavel Hofman wrote:
>> Hi,
>>
>> Please is there any way to enable the tstamp in stream status without
>> modifying the client calling the alsa-lib API? I wanted to measure
>> samplerate ratio between soundcards using data in their status proc files
>> (comparing advancement of tstamp vs. hw_ptr). The method seems to work quite
>> good, but some clients enable the stream status tstamp (e.g. pulseaudio) and
>> some don't (e.g. sox, aplay), resulting in zeros in the status proc file.
>>
>> Thanks a lot for any help or hint.
> 
> One night sleep after posting my comment to your patch for aplay[1] brings
> me an idea to use tracepoints events for your purpose (it's 5:00 am at
> UTC+07:00).
> 
> ALSA PCM core supports some kinds of tracepoints events[2]. They are
> categorized to two parts; the history of hwptr/applptr and hardware
> parameters of PCM substream. I think the former category of tracepoints
> events are available for your work to invent diagnostics tools since all
> of tracepoints events can be retrieved by user space application with
> system time stamp. I think the type of time stamp is selectable by
> options when retrieving records of tracepoints events. Furthermore the
> time stamp is essentially the same as the ones of trigger/current/driver
> time stamps in ALSA PCM interface.
> 
> I did not add enough description about the category of tracepoints when
> committed to document [2], but roughly describe here:
> 
> - hwptr
>   - the position for audio frame transmission (e.g. DMA).
> - applptr
>   - the position for user space application to read/write audio frame
>     except for operations over mmapped buffer (but depending on audio
>     hardware)
> 
> This is call graph when operating the procfs node:
> 
> (sound/core/pcm.c)
> ->snd_pcm_substream_proc_status_read()
>    (sound/core/pcm_native.c)
>    ->snd_pcm_status64()
>      (sound/core/pcm_lib.c)
>      ->snd_pcm_update_hw_ptr()
>        (sound/core/pcm_trace.h)
>        ->trace_hwptr()
> 
> You can see hwptr event is triggered as well. Actually, trace_hwptr() is
> called more frequently by usual ALSA PCM applications; e.g. ioctl(2)
> with PCM hwptr request.
> 
> We have some ways to retrieve the tracepoints events in user space:
>   - tracefs
>   - perf system call
>   - bpf


Thanks a lot for your detailed explanation. Please correct me if I am 
wrong but IIUC the snd_pcm_update_hw_ptr does not update the timestamp 
if it's not enabled. I already have access to the timestamp via the 
procfs status file, but if the client does not enable the timestamp 
specifically, the struct field will not be updated. That's why I added 
the timestamp-enable code to the alsa clients aplay/axfer.

Can the tracepoints modify the status struct and enable the timestamping 
from aside?

Thanks a lot,

Pavel.
