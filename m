Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7E3D19FC
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 00:55:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785E716AE;
	Thu, 22 Jul 2021 00:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785E716AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626908139;
	bh=Tr0sB40ZmuHkf1lqQ7naJanQgq3ygVb2X1wA1ZcCqoY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UU0FIX3FjvH4kOZEkqo9qi5VExXma9Cq2M66B9q5rrOekBZ6bpIfgKfbrE2kformR
	 JJswlF+LOH4v730LX1MshwiZhQJJUlB7UtV37nc4jNx9lkoQpPOMKLLcfQdRV5hI/o
	 qTqyvwYntakhaNGxj8+HvFwYo/1eXK7rST1NRpAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1892F804AD;
	Thu, 22 Jul 2021 00:54:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 943EEF804AC; Thu, 22 Jul 2021 00:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6688EF800FD
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 00:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6688EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="ilEsz+qa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=l5gavYGWCNNkSf4D0AtbqobKA2EbEHe1iQ7BKMPzPvo=; b=ilEsz+qafV2MB944g4Kj9gR3pr
 cNr0V8+SHifImU8Qlhd3VnQ+KdQOjUhfQj5wHuNbfoQwMTjvsdT33G+b8Hk5nPE6ahJiCo/oDBJ80
 donOYE5tE3GRjjtWgK1Ws0bZvxkSob30MQ0sDxQ2dlZXycVBLYYwAYxWAlVuGMaGupDs=;
Received: from [10.8.10.223]
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <puleglot@puleglot.ru>)
 id 1m6L6D-0005i6-1M; Thu, 22 Jul 2021 01:53:55 +0300
Message-ID: <25121b3c1ac2f68d3ab60c9403975480fdde2121.camel@tsoy.me>
Subject: Re: mic not working on JBL Quantum series USB headsets
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Jul 2021 01:53:54 +0300
In-Reply-To: <927fdcf7d478c50c2d5fa67b69d9fdfd@ufiseru.cz>
References: <c95dd9ae3e38b8a9965785b6f2b94bcca8df21ea.camel@tsoy.me>
 <53ec08048f961a8a2564556e0daa78f0@ufiseru.cz>
 <927fdcf7d478c50c2d5fa67b69d9fdfd@ufiseru.cz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jakub =?UTF-8?Q?Fi=C5=A1er?= <jakub@ufiseru.cz>
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

В Ср, 21/07/2021 в 22:34 +0000, Jakub Fišer пишет:
> July 21, 2021 10:17 PM, "Alexander Tsoy" <alexander@tsoy.me> wrote:
> 
> > В Вт, 20/07/2021 в 18:00 +0000, Jakub Fišer пишет:
> > 
> > > My Quantum 800's microphone doesn't work and I found other reports
> > > suggesting
> > > this issue affects the whole Quantum product line.
> > 
> > This device consists of two interfaces. The first interface contains
> > a
> > single playback endpoint and the second interface contains playback
> > and
> > capture endpoints. So JBL Quantum probably needs a registration quirk
> > similar to Kingston HyperX devices. Please try the patch below:
> 
> The patch works! Thanks. Two new profiles appeared in Pulseaudio (via
> Pipewire) with "Mono input" and the profile "Pro Audio" gained the
> mono input as well. Both analog and digital profiles work for playback
> but only the "Pro Audio" profile exposes the second output as well.
> This
> profile is only available when using Pipewire (not in "plain" Pulse)
> but
> I guess this is not an Alsa-related issue.
> 
> The microphone works in all three profiles as expected, everything
> is there out-of-the-box with the patched kernel. What's the process to
> get this patch to mainline? Should I be involved in it somehow?

Thanks for testing. I'll submit this patch.

> 
> 
> Just FYI, the headset also claims to have support for DTS Surround and
> a 7.1 ultimate-something, the latter being explicitly a proprietary
> thing.
> 
> I guess DTS support is proprietary, too, but I couldn't find anything
> about
> it except that "it is there". In Windows both modes are only available
> via
> the proprietary application.

According to lsusb output [1] this device works in UAC 1.0 mode and
doesn't expose any of these capabilities. Presumably Windows driver is
switching the device into some proprietary vendor specific mode or it
is processing surround sound entirely in software.

[1]
https://github.com/linuxhw/LsUSB/blob/master/Desktop/Gigabyte%20Technology/B550/B550%20AORUS%20ELITE%20V2/C77F0DF57EA1/CLEAR-LINUX-OS-34320/5.10.18-1027.NATIVE/X86_64/6093659817

