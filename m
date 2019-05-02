Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 414BE11366
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 08:33:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4A2C16E4;
	Thu,  2 May 2019 08:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4A2C16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556778814;
	bh=CYWcMtpATWvYpvmflM/y8bDl7wOB7z9Q5NG4+IecynY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGq6+QAcKB14fleXIwLa31dj4FuwmtyRpHGFEvb/Gv0s7/5SgO8as79IgL8ieEfXh
	 dHRouhjnuukhb9ZWHhswQWhXwyGRfhAiBmOXrsMBdh+3jpFW1Cxfdlh+z2X/sq8ba+
	 xUxeFPmVduWtfhTW1RNXUg5n2SzDCL2PbEQRcB60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B203F896C7;
	Thu,  2 May 2019 08:31:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D788F896C7; Thu,  2 May 2019 08:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6499F89693
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 08:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6499F89693
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bRpPFrI+"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4559B20873;
 Thu,  2 May 2019 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556778701;
 bh=9kQfTgRbn7BgX36DKuhOlMTBnMrgYJ3lA2q1ZFCe0Oc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRpPFrI+nLqoXGHxtKnq8xxjxssnaGXPV0SqZzMNBnpUjrEtuMM6kuRllc4mN/1yD
 MJVeEpkfeFnh/1e6fmotR7ygT2ys5GIDJyLzqhfGbcYmN7PLYFjwMRaNNslvNpGwSW
 e7C3rdU2qD9OIzh2nZn/+6rRRdpXycWWxZGHlEXY=
Date: Thu, 2 May 2019 08:31:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190502063139.GA14347@kroah.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-3-pierre-louis.bossart@linux.intel.com>
 <20190502051440.GA3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502051440.GA3845@vkoul-mobl.Dlink>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 02/22] soundwire: fix SPDX license for
	header files
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

On Thu, May 02, 2019 at 10:46:49AM +0530, Vinod Koul wrote:
> On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> > No C++ comments in .h files
> > 
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > ---
> >  drivers/soundwire/bus.h            | 4 ++--
> >  drivers/soundwire/cadence_master.h | 4 ++--
> >  drivers/soundwire/intel.h          | 4 ++--
> 
> As I said previously this touches subsystem header as well as driver
> headers which is not ideal.

What?  Who knows that?  Who cares?

This is doing "one logical thing" to all of the needed files.  Your
split of "this is a driver" vs. "this is a subsystem" split is _VERY_
arbritary.

That's just too picky and assumes a subsystem-internal-knowledge much
deeper than anyone submitting a normal cleanup patch would ever know.

I think you have swung too far to the "too picky" side, you might want
to dial it back.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
