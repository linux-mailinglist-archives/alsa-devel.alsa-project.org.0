Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A71B6351
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 20:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C9A5169B;
	Thu, 23 Apr 2020 20:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C9A5169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587666375;
	bh=U4iOCggwr08IlCK0p6WzDd/L+LwU0xm0GqyOcYXvukk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDnMMqmtN4CvdN48PL5cVXB6esRlkqLuX2SlWRuLvE8ZxnagEQDPWfzNA4Fvsg3Hy
	 l0JXY4KkzFLb82FcCjY8DoNW6BGcUN4fwr85CXasCkNdWfS4yapRp12T56we+wNvc4
	 F+FtE733V9cllFGkvZNVX2BWufWSbdQOATXjUuDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80E97F800F2;
	Thu, 23 Apr 2020 20:24:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9681F8014A; Thu, 23 Apr 2020 20:24:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AF51F80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 20:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF51F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="FLAfhu7n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=DkCIpxeE1qckMdUC4ykuoGildI0DGC3fXdg110TAukM=; b=FLAfhu7nP5ZXd+Dts4LyIAPFzf
 0O7HBwjybJ6+zFcNrZEy61dJvStcRNTWBrSDOLet1Z8MBgOj0E7QAYRudpuVjec990DpA6L5xYIX+
 cprHyCyV35LNSwMAxwqLnEfnmCd9c11TVxrd4b3/u38BmHF009XXEPqRg18ztzRZHV84=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jRgWM-00023Z-H4; Thu, 23 Apr 2020 21:24:22 +0300
Message-ID: <ac1a28783cfc4e6f5d2109da411a1372158f3ad7.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett
 2i4 2nd gen
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 23 Apr 2020 21:24:19 +0300
In-Reply-To: <s5hr1wet8a6.wl-tiwai@suse.de>
References: <7190177d62f349eea7a5d1056924a63fc4270d43.camel@tsoy.me>
 <20200422185522.3347-1-grpintar@gmail.com>
 <a45d18d7922d780f29f89cff855eb30fbdd1fce8.camel@tsoy.me>
 <s5heesfxo2o.wl-tiwai@suse.de>
 <c0cb78664e3acd94f07e59f3a4216c16ab9f497d.camel@tsoy.me>
 <s5hy2qmwts3.wl-tiwai@suse.de> <s5heesewip1.wl-tiwai@suse.de>
 <470d034599514e83454663f389bad30fd98ad3e2.camel@tsoy.me>
 <99bb394ff162a16442fd83c0ab56a9d8c0055877.camel@tsoy.me>
 <s5htv1at8kb.wl-tiwai@suse.de> <s5hr1wet8a6.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gregor Pintar <grpintar@gmail.com>, alsa-devel@alsa-project.org
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

В Чт, 23/04/2020 в 19:35 +0200, Takashi Iwai пишет:
> On Thu, 23 Apr 2020 19:29:08 +0200,
> Takashi Iwai wrote:
> > On Thu, 23 Apr 2020 18:57:34 +0200,
> > Alexander Tsoy wrote:
> > > And some further notes:
> > > 
> > > - I removed locking from snd_usb_endpoint_next_packet_size() and
> > > this
> > > seems completely fixed an issue with large URBs I reported here:
> > > 
> > > https://bugzilla.kernel.org/show_bug.cgi?id=199327#c28
> > > 
> > > So playing at 96 kHz, driver packs 48 frames per URB and no more
> > > audio
> > > discontinuities.
> > 
> > Hmm, that's weird.
> > 
> > If removing the lock from snd_usb_endpoint_next_packet_size()
> > really
> > fixes the problem, it implies the lock contention.  But as far as I
> > see the code performed in this lock isn't conflicting so much.  The
> > URB processing shouldn't happen in parallel for the same EP.
> 
> BTW, one potential racy code I found while looking at the code is the
> list management in queue_pending_output_urbs().  The fix patch is
> below.

OK, it seems like it was just a luck. I'm still getting clicking
artifacts with and without your patch, with and without locking. Will
investigate further.

