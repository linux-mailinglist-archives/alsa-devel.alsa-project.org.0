Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B110FB7D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 11:14:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0F786F;
	Tue,  3 Dec 2019 11:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0F786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575368046;
	bh=pFP2TaLMdgDG4O6//gSorBa35Js9sj9dEaYGBcUhhBg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H13ckH1fTK50DnzP4tlhU9KeJqkL35fbey3Y1NEENyrIiBrySGhvoYncxQr957mtq
	 YDLvZwfkAXRBCSOCGxs+h5wa6oYtptL79f6ZMyT0p3Nz8s8z/uyC1oZjlKESBW3TX+
	 yx+LVR9Q4VfzjQy+feEw56DUKsSeu44EFzFqsamE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2257CF80228;
	Tue,  3 Dec 2019 11:12:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01FE5F80227; Tue,  3 Dec 2019 11:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5935FF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 11:12:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5935FF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ztWgqAvc"
Received: from localhost (unknown [106.201.96.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3092C206E0;
 Tue,  3 Dec 2019 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575367932;
 bh=dOMQIQz0QgvFCe7p2f1Bz/JSRfOF/hEJPKHbNrAfmsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ztWgqAvcYREN0o4ao1Bx8n6i9eonvT4ZDFAAO7R8QkGN4RphJB8W1P3XWS2NZvFhQ
 aoiE52q2N43rm5Gl2EjTxQ6kNC1PSgAsFtRIi+jEsQ6ivh2wIxT8N9sp9igQAq6/ma
 L9sVm80ENWpntt+yA8Yp/PyAub136KXTbUFYXg0M=
Date: Tue, 3 Dec 2019 15:42:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20191203101203.GZ82508@vkoul-mobl>
References: <20191119112625.GD82508@vkoul-mobl>
 <20191119124302.GE82508@vkoul-mobl>
 <85e86218-6766-82a9-059c-c4a169178c26@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85e86218-6766-82a9-059c-c4a169178c26@perex.cz>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [ANNOUNCE] fcplay: compressed audio test utility
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

On 26-11-19, 11:27, Jaroslav Kysela wrote:
> Dne 19. 11. 19 v 13:43 Vinod Koul napsal(a):
> > On 19-11-19, 16:56, Vinod Koul wrote:
> > > Hello,
> > > 
> > > I have forked the cplay test app into fcplay which is a different repo
> > > [1] licensed as LGPLv2.1. The reason for fork was me getting sick of
> > > seeing the tool miss sync word for mp3 and no support for other formats
> > > which I wanted to test. But I was lazy to start exploring all media
> > > formats and write a parser for them so I have used libavcodec to the job
> > > for me which is GPL.
> > > 
> > > The fcplay links to libavcodec to get compressed audio parameters and
> > > then uses tinycompress to send data to sound card.
> > > 
> > > It supports mp3 (no more complaints about sync words) and Flac. I will
> > > add more formats, wma etc are in the list along with gapless audio
> > > playback and support for new changes coming to gapless audio playback
> > > as discussed in audio meeting at Lyon.
> > > 
> > > As usual patches are welcome.
> > > 
> > > Jaroslav, can we add to alsa-project github as well?
> > 
> > Here is the missing link!
> > 
> > [1]: git@github.com:vinodkoul/fcplay.git
> > https://github.com/vinodkoul/fcplay/
> 
> I would probably add this to the tinycompress package, too. The mixed
> licence is not an issue, I think.

That depends on who you talk to :-) Some folks seem to be averse to
anything *GPL*! so adding this to tinycompress can have issues for them.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
