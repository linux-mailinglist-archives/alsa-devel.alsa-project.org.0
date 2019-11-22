Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD23105DA7
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 01:26:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B55A17B8;
	Fri, 22 Nov 2019 01:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B55A17B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574382384;
	bh=7RhxjmUvtg/J0sJgC7iT11aB8hBJ1lavfSEJ7FThOKo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dkVd2FGZEwxVtZclIlD9oyY3lB6RhysP4394xOOEGCU5EoQ5WknLK3C3ftVyEBXUj
	 9jua/d2G59emMirZv3CMiBISK69tuYGvKKKj8ptfSLPtY3kGReTviF+BFSID1QXfPI
	 7CE6fNqOkGg4JVBRQz2OyUGj50h1bNvl6Z7U/drY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3FEF80145;
	Fri, 22 Nov 2019 01:24:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2619F80146; Fri, 22 Nov 2019 01:24:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from b4.vu (b4.vu [203.16.231.147])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC171F800C1
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 01:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC171F800C1
Received: from b4.vu (localhost.localdomain [127.0.0.1])
 by b4.vu (8.13.8/8.13.8) with ESMTP id xAM0OSHv022853;
 Fri, 22 Nov 2019 10:54:28 +1030
Received: (from g@localhost) by b4.vu (8.13.8/8.13.8/Submit) id xAM0OR1U022852;
 Fri, 22 Nov 2019 10:54:27 +1030
Date: Fri, 22 Nov 2019 10:54:27 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191122002427.GD18019@b4.vu>
References: <20191111054133.GA1817@b4.vu>
 <861b90c8-8878-c3be-bc8e-769a3638cc14@gmail.com>
 <s5hsgmh5i3x.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hsgmh5i3x.wl-tiwai@suse.de>
User-Agent: Mutt/1.4.2.2i
Cc: Markus Schroetter <project.m.schroetter@gmail.com>,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Fix Scarlett 6i6 Gen 2
	port data
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Nov 21, 2019 at 05:06:42PM +0100, Takashi Iwai wrote:
> On Thu, 21 Nov 2019 09:52:10 +0100,
> Markus Schroetter wrote:
> > 
> > > The s6i6_gen2_info.ports[] array had the Mixer and PCM port type
> > > entries in the wrong place. Use designators to explicitly specify the
> > > array elements being set.
> > >
> > > Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
> > > Signed-off-by: Geoffrey D. Bennett <g at b4.vu <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>>
> > > Reported-by: Jonas Berlin <kernel at xkr47.space <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>>
> > > Tested-by: Alex Fellows <alex.fellows at gmail.com <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>>
> > Tested-by: Markus Schroetter <project.m.schroetter@gmail.com>
> 
> Oh this wasn't taken yet.  Now merged for 5.5.

Thanks for that! Is it possible to get it included in 5.4.1 as well?
Without this patch, the 6i6 support is unusable.

Thanks,
Geoffrey.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
