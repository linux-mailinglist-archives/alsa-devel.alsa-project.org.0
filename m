Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940AA196F2E
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 20:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 120731673;
	Sun, 29 Mar 2020 20:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 120731673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585505937;
	bh=rBvSkEZqenHlElaAoaY3uIGBSF/hz4P4ALj5BPOQHd8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqGJKa3TuHJB+wfr0DdBtwQVFgBRRixbWIDQbTqhY6nbDcECVCHU5co8IogEB9Ybf
	 W2PAxgmqSeiA6abvClPhF3W91z2++/jxj05DvzrUVLtxTgWsHMcgn/TL5TXKjRNrS2
	 HvuXKNG3yahc+GOX5NrsbjJEMKqa+PST2yHXaiNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F39F8014F;
	Sun, 29 Mar 2020 20:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5D35F80146; Sun, 29 Mar 2020 20:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU autolearn=disabled version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4759F800EB
 for <alsa-devel@alsa-project.org>; Sun, 29 Mar 2020 20:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4759F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="AwaSoiQm"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="scU+Uulm"
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 1A29F8EE3FB;
 Sun, 29 Mar 2020 11:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1585505810;
 bh=rBvSkEZqenHlElaAoaY3uIGBSF/hz4P4ALj5BPOQHd8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=AwaSoiQmg6hmeQbTt1xr9B09pgLQ+Iw5OlB8ltxyEVnlGLh4SbRra2jPM9eAS1c6S
 lfjJiFM0YxHdA2lBgT5uYEEyqRZWKIjYYyLFwYaLLc4bzYJYL9HJVgSv+NLuamKgUJ
 dxWeLxccmARVeoKF+pAsxaPsYfGYzRPTQS4U35EA=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 7D53_2EYtwap; Sun, 29 Mar 2020 11:16:49 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 148728EE109;
 Sun, 29 Mar 2020 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1585505809;
 bh=rBvSkEZqenHlElaAoaY3uIGBSF/hz4P4ALj5BPOQHd8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=scU+UulmbouSY9Sirt+FkSSwoV2JzDPqQb5aY8N7+68p+LrjSRWQBBN9KuxCOebLV
 +6mt2oJZ14HHJRPk5MJFc0M9sByCZGG5CpOYWRuhMzuQ3xO0YKMOTudmKzZKFQG25Y
 JENhpDxxEfju16KggGq6CkHEh1lNAM325v+r6Czg=
Message-ID: <1585505807.4510.1.camel@HansenPartnership.com>
Subject: Re: [RFC PATCH v1 13/50] Avoid some useless msecs/jiffies conversions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: George Spelvin <lkml@SDF.ORG>, Takashi Iwai <tiwai@suse.de>
Date: Sun, 29 Mar 2020 11:16:47 -0700
In-Reply-To: <20200329175032.GE4675@SDF.ORG>
References: <202003281643.02SGhBrh000992@sdf.org>
 <s5ho8sfd2dk.wl-tiwai@suse.de> <20200329121129.GC11951@SDF.ORG>
 <s5h7dz3ccea.wl-tiwai@suse.de> <20200329175032.GE4675@SDF.ORG>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Marek Lindner <mareklindner@neomailbox.ch>,
 linux-scsi@vger.kernel.org, Simon Wunderlich <sw@simonwunderlich.de>,
 linux-wireless@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Antonio Quartulli <a@unstable.cc>, linux-kernel@vger.kernel.org,
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

On Sun, 2020-03-29 at 17:50 +0000, George Spelvin wrote:
> On Sun, Mar 29, 2020 at 07:13:33PM +0200, Takashi Iwai wrote:
> > On Sun, 29 Mar 2020 14:11:29 +0200, George Spelvin wrote:
> > > On Sun, Mar 29, 2020 at 09:52:23AM +0200, Takashi Iwai wrote:
> > > > I thought the compiler already optimizes to the constant
> > > > calculation
> > > > for the above case?
> > > 
> > > It optimizes that if the entire argument, including "seconds", is
> > > a compile-time constant.
> > > 
> > > However, given "msecs_to_jiffies(hdev->rpa_timeout * 1000);",
> > > the computatin is non-trivial.
> > 
> > Fair enough.  But it's still a question whether an open code X * HZ
> > is
> > good at all...
> 
> I'm sorry, I don't understand what you mean by "good at all" here.
> The value computed is exactly the same.

I think he means what the compiler does with it.

We all assume that msecs_to_jiffies is properly optimized so there
should be no need to open code it like you're proposing.  So firstly
can you produce the assembly that shows the worse output from
msecs_to_jiffies?  If there is a problem, then we should be fixing it
in msecs_to_jiffies, not adding open coding.

James

