Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5631B9202
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 19:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C1DA1665;
	Sun, 26 Apr 2020 19:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C1DA1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587921271;
	bh=T6ML7LJuHfxjJ2TuAy9/ZNmGqUafir6GTNH4Ff5QcM4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YfG/sKqpKCBu7Q6y07HGSWG6XdKZOS3jwPNDBH3mBZ3z9xPgud82R8TFlpxQ3BmMm
	 61uazU+IH7BoQZ0mwVaW+/MIPOd7Mp49gxJiMTBdUxnT7sa+C1ZIOEH28ZIeZ+ZXHy
	 +OR/5TA3hUJy9uZa0Z7SjS7Qmj0xLUrHhd2JF/Kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47ED4F801EB;
	Sun, 26 Apr 2020 19:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C7F1F801DB; Sun, 26 Apr 2020 19:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75CD9F8010A
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 19:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CD9F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="Wf/Jdi2U"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=CisUH6eGkTeggNHF+/J5wuamJ1TVJe9GUisz+CNdN9I=; b=Wf/Jdi2UW7h4l9EiSET1qKzWeI
 kwhTFMOnqdMZb51iwGU7K0AJQW0hLY6HekplA+sW5YyYieDunlg8axEBV3j3fFxHeselhfWKt63zJ
 xTkudJb/BuYBG1AUDtIQ32ThssmEaV2yW/7bkoZ/G25eypD8ItiS9QC8CQ4MkEDl/FSM=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jSkpd-000AM0-W9; Sun, 26 Apr 2020 20:12:42 +0300
Message-ID: <55d78d082f97aa70cb9bb0b90c7a48b8de72f9c5.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett
 2i4 2nd gen
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Date: Sun, 26 Apr 2020 20:12:41 +0300
In-Reply-To: <ac1a28783cfc4e6f5d2109da411a1372158f3ad7.camel@tsoy.me>
References: <7190177d62f349eea7a5d1056924a63fc4270d43.camel@tsoy.me>
 <20200422185522.3347-1-grpintar@gmail.com>
 <a45d18d7922d780f29f89cff855eb30fbdd1fce8.camel@tsoy.me>
 <s5heesfxo2o.wl-tiwai@suse.de>
 <c0cb78664e3acd94f07e59f3a4216c16ab9f497d.camel@tsoy.me>
 <s5hy2qmwts3.wl-tiwai@suse.de> <s5heesewip1.wl-tiwai@suse.de>
 <470d034599514e83454663f389bad30fd98ad3e2.camel@tsoy.me>
 <99bb394ff162a16442fd83c0ab56a9d8c0055877.camel@tsoy.me>
 <s5htv1at8kb.wl-tiwai@suse.de> <s5hr1wet8a6.wl-tiwai@suse.de>
 <ac1a28783cfc4e6f5d2109da411a1372158f3ad7.camel@tsoy.me>
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

В Чт, 23/04/2020 в 21:24 +0300, Alexander Tsoy пишет:
> В Чт, 23/04/2020 в 19:35 +0200, Takashi Iwai пишет:
> > On Thu, 23 Apr 2020 19:29:08 +0200,
> > Takashi Iwai wrote:
> > > On Thu, 23 Apr 2020 18:57:34 +0200,
> > > Alexander Tsoy wrote:
> > > > And some further notes:
> > > > 
> > > > - I removed locking from snd_usb_endpoint_next_packet_size()
> > > > and
> > > > this
> > > > seems completely fixed an issue with large URBs I reported
> > > > here:
> > > > 
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=199327#c28
> > > > 
> > > > So playing at 96 kHz, driver packs 48 frames per URB and no
> > > > more
> > > > audio
> > > > discontinuities.
> > > 
> > > Hmm, that's weird.
> > > 
> > > If removing the lock from snd_usb_endpoint_next_packet_size()
> > > really
> > > fixes the problem, it implies the lock contention.  But as far as
> > > I
> > > see the code performed in this lock isn't conflicting so
> > > much.  The
> > > URB processing shouldn't happen in parallel for the same EP.
> > 
> > BTW, one potential racy code I found while looking at the code is
> > the
> > list management in queue_pending_output_urbs().  The fix patch is
> > below.
> 
> OK, it seems like it was just a luck. I'm still getting clicking
> artifacts with and without your patch, with and without locking. Will
> investigate further.

After more testing, it seems that with large URBs the transfer size is
too large for timer-based scheduling to work correctly in pulseaudio.
And looks like pulseaudio sometimes fail to adjust tsched watermark or
something like that. And it is not 100% reproducible.

