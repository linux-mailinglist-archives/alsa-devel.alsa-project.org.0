Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849DF2A63BE
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 12:59:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2761C15DC;
	Wed,  4 Nov 2020 12:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2761C15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604491144;
	bh=goCd/FsixsuhFDQdIYZUh9ms1ET37ZuEkEzXEWKQDgY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oFpaTzGNJHWIRYPpVbqYncbMMjLqOjCq6ucQG15S3bQDwaD1pA4jsh4YdlpSlkxpD
	 eLpn3FbbcrFRIQJLtPRloP6Yj8jGHeLZpqD+uC6kLs7l/Nx4KKdMR8WTnjIfZ1i0Vt
	 G5+sL1bGEFnhR7MfsNW9vmFBBs6hF73r1HHcX1W4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87CB4F80247;
	Wed,  4 Nov 2020 12:57:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58AB6F8023E; Wed,  4 Nov 2020 12:57:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62436F8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 12:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62436F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gBW/wRXV"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2641220759;
 Wed,  4 Nov 2020 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604491039;
 bh=goCd/FsixsuhFDQdIYZUh9ms1ET37ZuEkEzXEWKQDgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gBW/wRXVSiC3ZN6j4jEa4wzxZdeawe1Jr5n7hg1AfVtBWXSQ4PgdUePxIxKaFFmqd
 BYrL61Hsw718XoSK/cieL5MBCZzyqXcuaca9+r161xvqJwKKntBjZzedVzuSvsLGY8
 K6Oc10fjc7M1RmAwTVBIbPB5loOBd47cQ4e5yzF8=
Date: Wed, 4 Nov 2020 12:58:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
Message-ID: <20201104115810.GA1694250@kroah.com>
References: <20201103141047.15053-1-mateusz.gorski@linux.intel.com>
 <20201103153541.GC3267686@kroah.com>
 <d6006431-420f-55c7-0f78-977507e11fcf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6006431-420f-55c7-0f78-977507e11fcf@linux.intel.com>
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Wed, Nov 04, 2020 at 12:46:36PM +0100, Gorski, Mateusz wrote:
> 
> > > [ Upstream commit 1b290ef023b3eeb4f4688b582fecb773915ef937 ]
> > > 
> > > Add alternative topology binary file name based on used machine driver
> > > and fallback to use this name after failed attempt to load topology file
> > > with name based on NHLT.
> > > This change addresses multiple issues with current mechanism, for
> > > example - there are devices without NHLT table, and that currently
> > > results in tplg_name being empty.
> > > 
> > > Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> > > Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> > > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Link: https://lore.kernel.org/r/20200427132727.24942-2-mateusz.gorski@linux.intel.com
> > > Signed-off-by: Mark Brown <broonie@kernel.org>
> > > ---
> > > 
> > > This functionality is merged on upstream kernel and widely used. Merging
> > > it to LTS kernel would improve the user experience and resolve some of the
> > > problems regarding topology naming that the users are facing.
> > What problems are people facing, and what kernel(s) are you asking for
> > this to be ported to, and why can't people just use 5.8 or newer if they
> > have this new hardware?
> > 
> > thanks,
> > 
> > greg k-h
> 
> I forgot to add - I wanted this change to be merged to stable 5.4 kernel.
> Please let me know if I should resend this patch with this information
> included.
> 
> As for the user issues - topology binary file name is currently created
> according to information from NHLT. The problem is, that some laptops (for
> example Dell XPS 13) do not have NHLT at all. This results in topology
> binary name being empty (" ").
> This patch adds alternative name based on loaded machine driver.
> 
> It applies not only to new hardware, please note that the mentioned Dell XPS
> 13 is based on Kabylake. This issue existed on upstream from the beginning
> of Skylake driver and was only recently addressed.

When was that laptop released and is this the only change that is needed
in order for the 5.4.y kernel to work properly on it?

thanks,

greg k-h
