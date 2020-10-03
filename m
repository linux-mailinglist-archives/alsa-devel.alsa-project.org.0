Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7928231A
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C721E191C;
	Sat,  3 Oct 2020 11:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C721E191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601717160;
	bh=kL1oT9jESZhdHr78QJxp6JYT0/KTUQ2i0XtO3OHsZp0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eb9nDTVuMy1YXuOXNSC6+HGV+NlQ6ImsMahJ5GE+xJp+dUhXDL3bJZr7kEoWmVGMu
	 UovS8qFgMXi2a6SpnVlfRGvQVHTC7vatrUmZ0e3gN+JT+VO4go560EmdZIMCVgMYCK
	 PMg5CbHbaf7Ee2ymg5MkjdJTDE/Eedb7Ul7ZmT6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF94AF800BB;
	Sat,  3 Oct 2020 11:24:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38232F801F5; Sat,  3 Oct 2020 11:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EB45F800E5
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 11:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB45F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a2pJ7ORP"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48E5F206CA;
 Sat,  3 Oct 2020 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601717052;
 bh=kL1oT9jESZhdHr78QJxp6JYT0/KTUQ2i0XtO3OHsZp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a2pJ7ORPNftPezUtGNDEo3IdF+22iGYUbdI48c71wE2Bl7X3PX2d1E2Lf8SWD5kjT
 d3m5SeRIm/MbiiobKPxgT9GQmXlTtncOpRjQRHQueXRMYvo5ZfW9tt7Q85qCa8zDeZ
 sv/wTeiiprt2oRHGkiHuF4E+6OZX2Tt5QacDkr3A=
Date: Sat, 3 Oct 2020 12:24:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201003092407.GG3094@unreal>
References: <20201001050534.890666-1-david.m.ertman@intel.com>
 <20201003090452.GF3094@unreal> <20201003091036.GA118157@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003091036.GA118157@kroah.com>
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

On Sat, Oct 03, 2020 at 11:10:36AM +0200, Greg KH wrote:
> On Sat, Oct 03, 2020 at 12:04:52PM +0300, Leon Romanovsky wrote:
> > Hi Dave,
> >
> > I don't know why did you send this series separately to every mailing
> > list, but it is not correct thing to do.
> >
> > RDMA ML and discussion:
> > https://lore.kernel.org/linux-rdma/20201001050534.890666-1-david.m.ertman@intel.com/T/#t
> > Netdev ML (completely separated):
> > https://lore.kernel.org/netdev/20201001050851.890722-1-david.m.ertman@intel.com/
> > Alsa ML (separated too):
> > https://lore.kernel.org/alsa-devel/20200930225051.889607-1-david.m.ertman@intel.com/
>
> Seems like the goal was to spread it around to different places so that
> no one could strongly object or review it :(

It took me time to realize why I was alone expressing my thoughts :).

BTW, I'm looking on ALSA thread and happy to see that people didn't like
"ancillary" name. It is far from intuitive name for any non-English speaker.

Thanks

>
> greg k-h
