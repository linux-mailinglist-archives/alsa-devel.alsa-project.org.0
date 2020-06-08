Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC21F1B39
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 16:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 457811612;
	Mon,  8 Jun 2020 16:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 457811612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591627496;
	bh=BJZJxxaRkMLUQBIxGO+NiYA+sW7U9YGmFMaemwNjH2Q=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4otHe8cmEppb81EqF2doKpHkQabp710V+4XLn5Ozzr2sKW4KtFvB1BIYYzKVqM1t
	 bEKQI1ekQAeXmZp20nZJFKMCZHglvxOCpmoqwalW6jGo43SmMjdvgt4b2MxLOPviBw
	 3EA+DF+Lk/EcTMPpbB+Lx5CHrV4i/ZEfPT+sPdCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D85CF801F7;
	Mon,  8 Jun 2020 16:43:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E97F801F7; Mon,  8 Jun 2020 16:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODYSUB_17,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83A74F80125
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 16:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83A74F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="Zf4tDaox"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=gtQpnUgQN2WVwtc3DccZwv/MTM4DgOgUy5fClenoYKI=; b=Zf4tDaox7ce8cBHcO3DY0PbwXu
 3wgk72qV+0kkDFM11fZtXRDQf7F3a+B8sGj2s26mphMGZg9SgiXLO3pw9FB2X5/xcXESxhuTD/PlB
 rm1WYVO+5Nr6g8FO2XYs03gFHBBWvyJkGik2JaJWLvu732rmOSHW6EACDAxw1do9RPNU=;
Received: from [2a00:1370:8125:149e:544f:45f1:13c3:fd2c] (helo=home)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1jiIzS-0000DE-Ut; Mon, 08 Jun 2020 17:43:07 +0300
Message-ID: <d74af0e9a3074c3c9104cac7407185c825378de5.camel@tsoy.me>
Subject: Re: Clock sync problem?
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, Thomas Ebeling <penguins@bollie.de>, 
 Laurence Tratt <laurie@tratt.net>
Date: Mon, 08 Jun 2020 17:43:05 +0300
In-Reply-To: <s5htuzl4r4f.wl-tiwai@suse.de>
References: <20200607133959.kmljpqdwefuio3mk@overdrive.tratt.net>
 <s5hk10i58io.wl-tiwai@suse.de>
 <14f91307-c121-a9f8-4045-1319ee0ca49e@bollie.de>
 <s5htuzl4r4f.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

В Пн, 08/06/2020 в 15:35 +0200, Takashi Iwai пишет:
> On Mon, 08 Jun 2020 10:32:24 +0200,
> Thomas Ebeling wrote:
> > 
> > On 08.06.20 09:19, Takashi Iwai wrote:
> > > On Sun, 07 Jun 2020 15:39:59 +0200,
> > > Laurence Tratt wrote:
> > > > Hello,
> > > > 
> > > > I've found an interesting issue with an SSL2+ audio interface
> > > > -- it plays and
> > > > records fine (and, for the money, the sound quality is
> > > > excellent!), but
> > > > recording slowly but surely drifts over time. For example, if I
> > > > record a
> > > > click track in Audacity (or Ardour), play it through the
> > > > interface and record
> > > > it, and then line up the start of the recorded click track with
> > > > the original,
> > > > the two tracks will be around 5ms out of alignment after 30s.
> > > > Interestingly,
> > > > this problem does not happen with OpenBSD, where the two tracks
> > > > line up
> > > > precisely.
> > > > 
> > > The recent change in USB-audio might help for a case like yours.
> > > Try my sound git tree (for-linus branch) or Linus' tree.  The
> > > former
> > > should be pullable onto 5.7 kernel cleanly.
> > 
> > Since I recently had clock drift issues with Audient devices, I'm
> > intrigued by this. @Takashi Can you quickly elaborate, what you
> > think,
> > Laurance's issue might be and what has changed in that tree that
> > might
> > help him fix it? Is there some general issue with the current
> > (stable)
> > sound/usb implementation?
> 
> The frame size calculation in USB-audio driver wasn't accurate enough
> because of the computation in Q16.16 format.  It works OK for async
> mode, but for others, it can accumulate rounding errors.  The recent
> change corrected it for a more precise way.

I believe that SSL and Audient devices operates in async mode. Would be
nice to see "lsusb -v" output for them.

