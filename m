Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CB1974B7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 08:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31FA1660;
	Mon, 30 Mar 2020 08:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31FA1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585551186;
	bh=W3dzEVQwy4kN8V2y2/86lHamXuEpKOABwF7N97AVg58=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XnkIMX+kH65JRjzFXBuU57x+zDwXUHeKErKFqdtJFhVUsY23/5te9OtyDiPPFxGeQ
	 gbGg5ayamzh8VdtPLOn66jSrdibwO8HGEa7aeXC0KK6WsHg+ZmKW8ceVCGK0sG684A
	 LNRGcPvYX9Fh2PVIzmrz0q2jwz4f8xrGSWXRj7Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 840DAF8014A;
	Mon, 30 Mar 2020 08:51:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87D3BF8010C; Mon, 30 Mar 2020 08:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx.sdf.org (mx.sdf.org [205.166.94.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 712C4F8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 08:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 712C4F8010C
Received: from sdf.org (IDENT:lkml@sdf.lonestar.org [205.166.94.16])
 by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 02U6p8D4025450
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO);
 Mon, 30 Mar 2020 06:51:08 GMT
Received: (from lkml@localhost)
 by sdf.org (8.15.2/8.12.8/Submit) id 02U6p5rX014028;
 Mon, 30 Mar 2020 06:51:05 GMT
Date: Mon, 30 Mar 2020 06:51:05 +0000
From: George Spelvin <lkml@SDF.ORG>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH v1 13/50] Avoid some useless msecs/jiffies conversions
Message-ID: <20200330065105.GB9333@SDF.ORG>
References: <202003281643.02SGhBrh000992@sdf.org>
 <s5ho8sfd2dk.wl-tiwai@suse.de> <20200329121129.GC11951@SDF.ORG>
 <s5h7dz3ccea.wl-tiwai@suse.de> <20200329175032.GE4675@SDF.ORG>
 <1585505807.4510.1.camel@HansenPartnership.com>
 <s5hzhbybbnu.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hzhbybbnu.wl-tiwai@suse.de>
Cc: lkml@sdf.org, alsa-devel@alsa-project.org,
 Marek Lindner <mareklindner@neomailbox.ch>, linux-scsi@vger.kernel.org,
 Simon Wunderlich <sw@simonwunderlich.de>, linux-wireless@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Antonio Quartulli <a@unstable.cc>,
 linux-kernel@vger.kernel.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 b.a.t.m.a.n@diktynna.open-mesh.org, Hannes Reinecke <hare@suse.de>,
 Johannes Berg <johannes@sipsolutions.net>, Sven Eckelmann <sven@narfation.org>
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

On Mon, Mar 30, 2020 at 08:27:01AM +0200, Takashi Iwai wrote:
> On Sun, 29 Mar 2020 20:16:47 +0200, James Bottomley wrote:
>> We all assume that msecs_to_jiffies is properly optimized so there
>> should be no need to open code it like you're proposing.
> 
> Yes, it'd be best if the compiler can handle it properly.

I've tried, and can't figure out how to get the compiler to detect this 
special case and not invoke the general code.  In particular, for a 
variable x, __builtin_constant_p(x * 1000 % 1000) is false.  Even if x is 
signed and ANSI lets the compiler assume that overflow doesn't happen.

If you can do it, I'm most curious how!

> But also I meant to keep using the macro for consistency reason.
> IIRC, we wanted to eliminate the explicit use of HZ in the past, and
> it's how many lines have been converted with *_to_jiffies() calls.
> I don't know whether the eliminate of HZ is still wished, but
> reverting to the open code is a step backward for that.

Well, you could always add a secs_to_jiffies(x) wrapper.  But given
that it expands to basically x * HZ, some people might wonder why
you're bothering.

I assumed that open-coding x * HZ was the preferred style, so that's
what I did.
