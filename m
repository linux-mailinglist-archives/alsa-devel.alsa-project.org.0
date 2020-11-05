Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8452A754A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 03:14:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFE01673;
	Thu,  5 Nov 2020 03:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFE01673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604542479;
	bh=Pyhj9YWCkvgX0pkTnLeVBzr2+HYQp59ghUB04ZW72FU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=picNWSpGxD7IzdAyFjY3olG9ndLIpop1fJwBcUEBSXisRqld9MozLyRboC9JUaPfm
	 x0GovGoFZ0uv8dTzZX21vqNMBPyma8b0s+Xj60h1jWwkXCE7TwvqD6fqXNoQq8WNEK
	 C+blRQ52cPNdpEu/Eqbe+WMw6W8ETFj7sCxrFhq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C13F8023E;
	Thu,  5 Nov 2020 03:13:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66B17F80234; Thu,  5 Nov 2020 03:13:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from b4.vu (b4.vu [203.16.231.147])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75941F80229
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 03:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75941F80229
Received: from b4.vu (localhost.localdomain [127.0.0.1])
 by b4.vu (8.13.8/8.13.8) with ESMTP id 0A52CoiL021586;
 Thu, 5 Nov 2020 12:42:50 +1030
Received: (from g@localhost) by b4.vu (8.13.8/8.13.8/Submit) id 0A52CmRt021585;
 Thu, 5 Nov 2020 12:42:48 +1030
Date: Thu, 5 Nov 2020 12:42:48 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for MODX
Message-ID: <20201105021248.GA21537@b4.vu>
References: <20201104120705.GA19126@b4.vu> <s5hlffhjk6w.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hlffhjk6w.wl-tiwai@suse.de>
User-Agent: Mutt/1.4.2.2i
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

On Wed, Nov 04, 2020 at 03:00:39PM +0100, Takashi Iwai wrote:
> On Wed, 04 Nov 2020 13:07:05 +0100,
> Geoffrey D. Bennett wrote:
> > 
> > This patch fixes audio distortion on playback for the Yamaha MODX.
> > 
> > Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> > Tested-by: Frank Slotta <frank.slotta@posteo.de>
> 
> Thanks, applied now.

Thanks. Did you see my similar patch that I sent in a few minutes
before that one for the A&H Qu-16?

Geoffrey.
