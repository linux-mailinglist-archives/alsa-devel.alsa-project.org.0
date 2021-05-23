Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFA38DAAA
	for <lists+alsa-devel@lfdr.de>; Sun, 23 May 2021 11:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F28816C3;
	Sun, 23 May 2021 11:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F28816C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621761271;
	bh=RTFSUyfNUzFDBKdN5A9s/WtIAC0evDdWnLeekxDJBzk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLbRhovkseBUwysCr29M/8H/UyhaJFVRq9qNeLnMX4FWKkxDdfSW7LJ8dFJ+ST1Bw
	 SYFjystRfAQyjP++0vHcXKsx0NgzA2owbg8EdDQTkn/gZ6Z0vcBH/7m21KyxYLU2Ts
	 ZqmCXE2m1wlntcUOy1KubQjPhzV4xzITg+8RmX5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECA0AF802DB;
	Sun, 23 May 2021 11:13:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EB5F80212; Sun, 23 May 2021 11:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACEB0F80137
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 11:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACEB0F80137
Received: by m.b4.vu (Postfix, from userid 1000)
 id 5A693612FB33; Sun, 23 May 2021 18:43:28 +0930 (ACST)
Date: Sun, 23 May 2021 18:43:28 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH sound] ALSA: usb-audio: scarlett2:
 snd_scarlett_gen2_controls_create() can be static
Message-ID: <20210523091328.GA121197@m.b4.vu>
References: <202105230212.9rlkrDHb-lkp@intel.com>
 <20210522180900.GA83915@f59a3af2f1d9>
 <20210523090326.GA121080@m.b4.vu> <s5hv979ery9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hv979ery9.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Sun, May 23, 2021 at 11:10:22AM +0200, Takashi Iwai wrote:
> On Sun, 23 May 2021 11:03:26 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > Hi Takashi,
> > 
> > This patch seems legitimate to me (although I would adjust whitespace
> > so the second line doesn't go over 80 chars). Do you want to just
> > apply it as-is, or do you want me to send a second version of my patch
> > without this problem or send a new patch similar to this one?
> 
> As it's an obviously correct patch, I already applied as is.

Thank you!
