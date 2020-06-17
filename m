Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242AF1FCB8F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 12:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EA31675;
	Wed, 17 Jun 2020 12:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EA31675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592391589;
	bh=JyDqzpyx5v5b61FVlxI0tP+9Kr/0if5KjCWCXy/K5BA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bBzRTVA3uHewW3xSn44bjEkndAJpdNvSQSmfCUPydLRU+2ah6bag9iQozsunaSHkc
	 oFcfBiIHeYfnxlVhSvZP9i+qTmCYlT3ANwrVqI1QRVRDN0/WImsNmtYfM+3ONpigoc
	 zklnrHIPGcpJvyzszVmeetVFfak1QphcytDmST6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC599F80101;
	Wed, 17 Jun 2020 12:58:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1B1EF80171; Wed, 17 Jun 2020 12:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0E0DF80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 12:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E0DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="I82GaF8O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yu6wY5AVWRK4zwAkKXY1NK3iDTVAwzIDs9MA74H/y8U=; b=I82GaF8Oajmp2dtUkAXvpySHVx
 QGQ0u1e/jXBMCatvr3shVJITV59MWqdKuBrZj98txMVr+7HHV67cMejJ/aJQT84i13KQCCB9vXznt
 L7lrpSXx6z8KTwDGbTg2U6h0qAE8C4ihAg39EwLsEEEersi4WAFfOjGgpiU79/m2CQJAAYesX8ge3
 uja0hBgwHiSTqEuwOqhTEP2ar/TNdb9RBYWnaZTa0OGZJNLnRQaM4VOHqggefVlQdR93GBlMvb9NQ
 K8YsjfpgRJQB1alPD8/IgR9rvV9uxx/HoTWpIaGc0JKBJa+YZ+f4Tye80XCIfauIJ1usx4h8QBlgB
 6iwSdfdQ==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jlVlV-000P46-HQ; Wed, 17 Jun 2020 11:57:57 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jlVlV-0000xZ-AB; Wed, 17 Jun 2020 11:57:57 +0100
Date: Wed, 17 Jun 2020 11:57:57 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Giuliano Pochini <pochini@shiny.it>
Subject: Re: [PATCH 3/3] echoaudio: Address bugs in the interrupt handling
In-Reply-To: <20200616214603.71cfe49b@wc1>
Message-ID: <2006171151300.2561@stax.localdomain>
References: <2006161409060.30751@stax.localdomain>
 <20200616131743.4793-3-mark@xwax.org> <20200616214603.71cfe49b@wc1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Tue, 16 Jun 2020, Giuliano Pochini wrote:

> On Tue, 16 Jun 2020 14:17:43 +0100
> Mark Hills <mark@xwax.org> wrote:
> 
> > Distorted audio appears occasionally, affecting either playback
> > or capture and requiring the affected substream to be closed by
> > all applications and re-opened.
> 
> Yes, it also happens here very rarely (one time every some months) and I 
> failed to reproduce the problem.

It frustrated me for years, but I had other work I needed to do. 
Eventually I was working around it several times a day :-/
 
[...]
> > * Check for progress using the counter from the hardware, not after
> >   it has been truncated to the buffer.
> > 
> >   There appears to be a possible bug if a whole ringbuffer advances
> >   between interrupts, it goes unnoticed.
> 
> In that case the stream must be restarted anyway due to xrun.

Yes, but I think it will go unnoticed, so you don't know to re-start.

[...]
> > * Remove the accessing of pipe->dma_counter twice in the interrupt
> >   handler:
> 
> Why twice?

Yes, the interrupt handler calls pcm_pointer() directly to make a 
decision. Then it calls snd_pcm_period_elapsed(), which itself goes on to 
make another call to pcm_pointer(), by this time the bus mastering of the 
interface has adjusted the counter.

The new code processes the counter only once, and this is easier to 
rationalise whether there are bugs.

-- 
Mark
