Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62931B5EC5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 17:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C2616A5;
	Thu, 23 Apr 2020 17:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C2616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587654740;
	bh=NAg8JUpM6dZYkwZjIVqeKS9OVq+IOKT/sar9OIblZJA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6BFERhAeF9gQLWFOCBwvL3+XxhnlgpZiKRaxiDmaQFgxJjS+CXKkZTtBjMbMJtIN
	 omz1KbBJ2of4PaNtMfOgJVKSjYwnB1m6n8EApGx5wfbmkW/31ecN8kzxubZnR3Q6vU
	 nNeSWoJhpAEsjGYUtuhgN0Z7VbvMMTukx63B8vOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4048FF8014A;
	Thu, 23 Apr 2020 17:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 096FBF80212; Thu, 23 Apr 2020 17:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B5DBF8014A
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 17:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B5DBF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="B+Ma9yTP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=Qr3Jdik2dewi5Xd/aCyl5suhjU5quT1U/NbmAeGBDEM=; b=B+Ma9yTP9yFHQPU2ZL253HzqJs
 74uTTCdsXHP8g+Cw6nIHSBki91lFXpdwIP4TDRfSP+LZGyivxCXkuZoujxx8aCoXJNFBvB/yLLHCs
 JgGlemfUxlLRbvgg90f5qZ/TzPK9bQQz4nvZ90I0Lvw6csrhw8yLtSBRBrQvt6u4Y9b8=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jRdUX-0001r5-HH; Thu, 23 Apr 2020 18:10:17 +0300
Message-ID: <470d034599514e83454663f389bad30fd98ad3e2.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett
 2i4 2nd gen
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 23 Apr 2020 18:10:16 +0300
In-Reply-To: <s5heesewip1.wl-tiwai@suse.de>
References: <7190177d62f349eea7a5d1056924a63fc4270d43.camel@tsoy.me>
 <20200422185522.3347-1-grpintar@gmail.com>
 <a45d18d7922d780f29f89cff855eb30fbdd1fce8.camel@tsoy.me>
 <s5heesfxo2o.wl-tiwai@suse.de>
 <c0cb78664e3acd94f07e59f3a4216c16ab9f497d.camel@tsoy.me>
 <s5hy2qmwts3.wl-tiwai@suse.de> <s5heesewip1.wl-tiwai@suse.de>
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

В Чт, 23/04/2020 в 13:22 +0200, Takashi Iwai пишет:
> On Thu, 23 Apr 2020 09:22:36 +0200,
> Takashi Iwai wrote:
> > On Thu, 23 Apr 2020 01:45:01 +0200,
> > Alexander Tsoy wrote:
> > > В Ср, 22/04/2020 в 22:28 +0200, Takashi Iwai пишет:
> > > > On Wed, 22 Apr 2020 21:26:23 +0200,
> > > > Alexander Tsoy wrote:
> > > > > В Ср, 22/04/2020 в 20:55 +0200, Gregor Pintar пишет:
> > > > > > On Wed, 22 Apr 2020 Alexander Tsoy wrote:
> > > > > > > В Вт, 21/04/2020 в 21:31 +0200, Takashi Iwai пишет:
> > > > > > > > I wonder, though, whether we can correct the rounding
> > > > > > > > error
> > > > > > > > in
> > > > > > > > the
> > > > > > > > driver code, too.
> > > > > > > 
> > > > > > > I'm not sure if it's possible with currently used Q16.16
> > > > > > > arithmetic.
> > > > > > 
> > > > > > Maybe calculate fixed correction shifts (like it would be
> > > > > > feedback)?
> > > > > > Something like leap year.
> > > > > > 
> > > > > > In endpoint.c:
> > > > > > static inline unsigned get_usb_high_speed_rate(unsigned int
> > > > > > rate)
> > > > > > {
> > > > > > 	return ((rate << 10) + 62) / 125;
> > > > > > }
> > > > > > I guess 62 tries to round it, but exact number is needed.
> > > > > > So
> > > > > > exact
> > > > > > value for
> > > > > > 44100 should be 361267.2. For 48000 it is 360448.
> > > > > > If only we can deliver that 0.2 by shifting rate somehow?
> > > > > > 
> > > > > > At least maybe it would be better to disable sample rates
> > > > > > that do
> > > > > > not
> > > > > > divide
> > > > > > by 1000 on SYNC playback endpoints, if there are others
> > > > > > sample
> > > > > > rates.
> > > > > > 
> > > > > > But I'm not familar with the code or USB.
> > > > > 
> > > > > I think instead of accumulating the fractional part of fs/fps
> > > > > in
> > > > > Q16.16
> > > > > format we should accumulating remainder of division fs/fps.
> > > > > 
> > > > > So for 44100 Hz and High Speed USB the calculations would be:
> > > > > 
> > > > > fs = 44100
> > > > > fps = 8000
> > > > > rem = 44100 % 8000 = 4100
> > > > > accum = 0
> > > > > packet_size_min = 44100 / 8000 = 5
> > > > > packet_size_max = 44100 + (8000 - 1) / 8000 = 6
> > > > > 
> > > > > 
> > > > > 1. accum += rem = 4100
> > > > >    accum < fps => packet_size = packet_size_min = 5
> > > > > 
> > > > > 2. accum += rem = 8200
> > > > >    accum >= fps => {
> > > > >        packet_size = packet_size_max = 6
> > > > >        accum -= fps = 200
> > > > >    }
> > > > > 
> > > > > 3. accum += rem = 4300
> > > > >    accum < fps => packet_size = packet_size_min = 5
> > > > > 
> > > > > ...
> > > > > 
> > > > > 80. accum += rem = 8000
> > > > >     accum >= fps => {
> > > > >         packet_size = packet_size_max = 6
> > > > >         accum -= fps = 0
> > > > >     }
> > > > > ...
> > > > 
> > > > Yeah, something like that is what I had in my mind.
> > > > It'd be greatly appreciated if someone can experiment it.
> > > > Unfortunately I have no proper USB-audio device now at hands...
> > > 
> > > OK, here is a quick hacky patch, that seems to work for me:
> > 
> > Awesome, thanks!
> > 
> > The patch looks good enough.  A minor fix would be reset
> > sample_accum
> > at snd_usb_pcm_prepare().
> 
> It should be rather in snd_usb_endpoint_start().

Yes, indeed. Thanks!

> 
> > If someone can test more and it shows the positive result, I'd
> > happy
> > take it.
> 
> ... and on the second thought, I wonder whether the new method can
> be simply applied to all cases.  Your code gives basically more
> accurate timing. 

I'm not sure. We are getting feedback data already in Q16.16 format so
the current code seems pretty good for its task.

Some additional notes:
- Locking inside snd_usb_endpoint_next_packet_size() is probably not
needed. It is needed in snd_usb_endpoint_slave_next_packet_size()
because snd_usb_handle_sync_urb() can modify ep->freqm. Or maybe I'm
missing something?
- Handling of ep->fill_max case looks broken. There is also a comment
in pcm.c stating that this mode is not supported yet.

> 
> If we are concerned about the possible regression by this, we can
> keep
> the old code and make it switchable via option or kconfig (if any).
> 
> 
> Takashi

