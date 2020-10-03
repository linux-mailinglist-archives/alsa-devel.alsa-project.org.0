Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC8282333
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D6491926;
	Sat,  3 Oct 2020 11:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D6491926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601717655;
	bh=xU/4mSQjKnUMoLFgi6LJYOmtfQOkTKaMQDIAmid+Ko8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n5NNgGaEo9tfxA/xkGkR8kCk9JxrjirCxKb6Jb+iRN1RlSiw9/+fp7TQ4Q2KEcHnx
	 KPB9oPx3BuJtwXSQg+6Mw3quvAf3pJbFdGKOmyGJ2X2ovem09xJIC/b7InC0vqefc0
	 gMbYUW4H9JQfEZ116f2mihWX7B08/fxaUz4e23j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE4AF800E5;
	Sat,  3 Oct 2020 11:32:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71466F8020C; Sat,  3 Oct 2020 11:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46936F800E5
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 11:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46936F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ItGdtEzD"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 688492067C;
 Sat,  3 Oct 2020 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601717544;
 bh=xU/4mSQjKnUMoLFgi6LJYOmtfQOkTKaMQDIAmid+Ko8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ItGdtEzDTFAaLFlAE3CdSqpEKn4R9J0w2TqimOhLyvNpxUOY5fSD2TNxWi37HOJvu
 lDkvKibokV1r0HHb4s+a/1U83R54zusIGzcngvN4pm7ak4qW2pJaMQr86DJoG99DvZ
 Bmf5c8btZw4500eq1ccFObN+x96PzQzOk2/pRfPc=
Date: Sat, 3 Oct 2020 11:32:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201003093220.GA127713@kroah.com>
References: <20201001050534.890666-1-david.m.ertman@intel.com>
 <20201003090452.GF3094@unreal> <20201003091036.GA118157@kroah.com>
 <20201003092407.GG3094@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003092407.GG3094@unreal>
Cc: linux-rdma@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 alsa-devel@alsa-project.org, linux-netdev <netdev@vger.kernel.org>
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

On Sat, Oct 03, 2020 at 12:24:07PM +0300, Leon Romanovsky wrote:
> On Sat, Oct 03, 2020 at 11:10:36AM +0200, Greg KH wrote:
> > On Sat, Oct 03, 2020 at 12:04:52PM +0300, Leon Romanovsky wrote:
> > > Hi Dave,
> > >
> > > I don't know why did you send this series separately to every mailing
> > > list, but it is not correct thing to do.
> > >
> > > RDMA ML and discussion:
> > > https://lore.kernel.org/linux-rdma/20201001050534.890666-1-david.m.ertman@intel.com/T/#t
> > > Netdev ML (completely separated):
> > > https://lore.kernel.org/netdev/20201001050851.890722-1-david.m.ertman@intel.com/
> > > Alsa ML (separated too):
> > > https://lore.kernel.org/alsa-devel/20200930225051.889607-1-david.m.ertman@intel.com/
> >
> > Seems like the goal was to spread it around to different places so that
> > no one could strongly object or review it :(
> 
> It took me time to realize why I was alone expressing my thoughts :).
> 
> BTW, I'm looking on ALSA thread and happy to see that people didn't like
> "ancillary" name. It is far from intuitive name for any non-English speaker.

It's not intuitive for a native-english speaker either :)

greg k-h
