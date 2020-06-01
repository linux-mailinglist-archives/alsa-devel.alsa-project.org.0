Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E741EA7E5
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 18:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F87A16E1;
	Mon,  1 Jun 2020 18:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F87A16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591029572;
	bh=UyJbAYexcGhpnKCjKt3eUGiqVBwGopzeNLtGF6X9TRw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UMLXp/2YFdoPN3OMqSb/S50v8PmXGBdX/JEMSl0q4IStpBBFdE/ScBVWi3SsiGsFg
	 yoHxfvCagjaftHUMnt+OvfTUar/ueHKEAx2VfSb33wKg1QCiFvpuAg/kbfjdT7YSYF
	 m/fIHZerUz9EPHwkVWWIv1BNOkBJAUqPtFVkMblA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98976F800B8;
	Mon,  1 Jun 2020 18:37:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C19EF801ED; Mon,  1 Jun 2020 18:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C208DF80159
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 18:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C208DF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="Ei1Xra89"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=fyeWbAXZpotnbgyrcchlxVCJsEmrKLH86r3K+GuvsrM=; b=Ei1Xra89Ve7wDiv0Dn0Yweyylu
 vge0HhoepngnYRCf7RH7pVPHX1nNvw74xNomE8uuVpm0R8o9OT33f0Kebxzx+ijKdU/m2GBDOHzES
 2xOIF0POvhpYdx2xtJnGNKDV4OCdaAVAos/aO56U5SJ0IlciX16+/O+Ej4+zG0UjsHvs=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home)
 by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93.0.4) (envelope-from <puleglot@puleglot.ru>)
 id 1jfnRT-002eIm-Ef; Mon, 01 Jun 2020 19:37:39 +0300
Message-ID: <91ff53c08ddbb84ca0fcf9f16c86d890f8e06277.camel@tsoy.me>
Subject: Re: [PATCH] Add duplex sound support for USB devices using implicit
 feedback
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>, Erwin Burema <e.burema@freedom.nl>
Date: Mon, 01 Jun 2020 19:37:38 +0300
In-Reply-To: <s5ha71xwwxd.wl-tiwai@suse.de>
References: <2410739.SCZni40SNb@alpha-wolf>
 <6103f3aba91020ea345e9146da82e52823b7c298.camel@tsoy.me>
 <1674042.U9NR2fmVFg@alpha-wolf> <s5ha71xwwxd.wl-tiwai@suse.de>
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

В Вс, 24/05/2020 в 10:37 +0200, Takashi Iwai пишет:
> On Sat, 23 May 2020 20:09:31 +0200,
> Erwin Burema wrote:
> > On zaterdag 23 mei 2020 19:53:49 CEST Alexander Tsoy wrote:
> > > В Вс, 10/05/2020 в 20:29 +0200, Erwin Burema пишет:
> > > > For USB sound devices using implicit feedback the endpoint used
> > > > for
> > > > this feedback should be able to be opened twice, once for
> > > > required
> > > > feedback and second time for audio data. This way these devices
> > > > can
> > > > be put in duplex audio mode. Since this only works if the
> > > > settings of
> > > > the endpoint don't change a check is included for this.
> > > > 
> > > > This fixes bug 207023 ("MOTU M2 regression on duplex audio")
> > > > and
> > > > should also fix bug 103751 ("M-Audio Fast Track Ultra usb audio
> > > > device will not operate full-duplex")
> > > > 
> > > > Signed-off-by: Erwin Burema <e.burema@gmail.com>
> > > > ---
> > > 
> > > This patch seems to cause kernel panic on my system. This happens
> > > during boot when gdm (with pulseaudio) is starting up.
> > > 
> > 
> > That's interesting, not running gnome (and thus also not running
> > gdm, 
> > currently KDE with SDDM) here so would need to take some time
> > troubleshooting. 
> > Suspect I missed something in the check if both input and output
> > are similarly 
> > configured.
> > 
> > Will see if I can reproduce it and where exactly it goes wrong, in
> > the 
> > meantime would it be possible to test if 5.6 or later show the same
> > issue 
> > since I intially developed the patch against that release?
> 
> Judging from the point triggering the bug (memset()), this can be a
> leftover URB handling that is performed even after the capture stream
> is closed.  If so, the procedure would be:
>  - start capture
>  - start playback
>  - stop capture while keeping playback running
> 
> If my guess is correct, can the patch below work around the issue?

Unfortunately, I can no longer reproduce kernel panic, so can't really
test this patch. That's interesting, because it was 100% reproducible
on my hw a week ago.

