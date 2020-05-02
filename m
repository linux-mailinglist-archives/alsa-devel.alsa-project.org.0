Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD01C2603
	for <lists+alsa-devel@lfdr.de>; Sat,  2 May 2020 16:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169A516A0;
	Sat,  2 May 2020 16:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169A516A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588428661;
	bh=MDyVjZWnm5EvNAHWJ1mOzIJ83FG+EVxuwwcCWJaro3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VnJAxwwNXPDCS+1Had8KLW1WdZPnB6IgH7p4owIHtLS1DGLmEJ2rWFwLkTZ0koIHE
	 418oU1B0VMpjLhsWAqJRikuAj/o8bLJlbaJlIAj9pfC0g+puCgtjpNvee7WojSresU
	 Wawo8KzWTggAbh0s5G6wDDwSWzBrmbuh960WELAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 327FAF801EB;
	Sat,  2 May 2020 16:09:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2A90F801F7; Sat,  2 May 2020 16:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3788EF80087
 for <alsa-devel@alsa-project.org>; Sat,  2 May 2020 16:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3788EF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UdYTtL0t"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 438FC21775;
 Sat,  2 May 2020 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588428551;
 bh=MDyVjZWnm5EvNAHWJ1mOzIJ83FG+EVxuwwcCWJaro3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdYTtL0tJm4pDAJdkk0jA2Pl4wn/Y0pmT0tkl+Ym73e1Y5SeNV26aAoSjnOADOGR3
 Z2CrMXCFV1jj8nOlb7huAU/Y1F0im1D9EjwqYX4t+p9Nh9IovYfLHgnjxvpKzLmFoM
 3enP6QhzvOZpKMji7n7/dc0Sempgkxa07zumwe7Y=
Date: Sat, 2 May 2020 16:09:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on
 meson-g12a-x96-max
Message-ID: <20200502140908.GA10998@kroah.com>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk>
 <20200502134721.GH13035@sasha-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502134721.GH13035@sasha-vm>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, kernelci@groups.io, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

On Sat, May 02, 2020 at 09:47:21AM -0400, Sasha Levin wrote:
> On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
> > On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
> > 
> > > The call stack is not the same as in the commit message found by
> > > the bisection, so maybe it only fixed part of the problem:
> > 
> > No, it is a backport which was fixing an issue that wasn't present in
> > v5.4.
> > 
> > > >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
> > 
> > As I said in reply to the AUTOSEL mail:
> > 
> > | > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
> > | > playback/capture if supported"), meson-axg cards which have codec-to-codec
> > | > links fail to init and Oops:
> > 
> > | This clearly describes the issue as only being present after the above
> > | commit which is not in v5.6.
> > 
> > Probably best that this not be backported.
> 
> Hrm... But I never queued that commit... I wonder what's up.

I saw the Fixes: tag, but missed the changelog text.  My fault.

I'll go drop it from everywhere, sorry about that.

greg k-h
