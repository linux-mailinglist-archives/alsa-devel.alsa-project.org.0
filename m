Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26212AAC65
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Nov 2020 18:01:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1621612;
	Sun,  8 Nov 2020 18:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1621612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604854908;
	bh=/3pNTmN6DjO114ELWmZPyPaEIJmZESt2gO8P0PPsx4I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vflYe8wg803wnFaJ/SxQW8Mptbx0zhnYYbYnv/rphqdM2YjfkgoIlkplKeWUTLI3K
	 fMRp9aAg1748F2Ll6NLkKgKpT7X0eFauz+M/taqzpq0pPPIOYv0p7FnoLW7DVJ1JDY
	 GCE/hrmOg0LUCjab8ZFUgJq2t7FkINHNjAbGDCjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85410F800D2;
	Sun,  8 Nov 2020 18:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A4DFF801D5; Sun,  8 Nov 2020 18:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BEA0F800BA
 for <alsa-devel@alsa-project.org>; Sun,  8 Nov 2020 18:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEA0F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FkSdDNil"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCAD820731;
 Sun,  8 Nov 2020 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604854798;
 bh=/3pNTmN6DjO114ELWmZPyPaEIJmZESt2gO8P0PPsx4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FkSdDNil3jhDNfIfQeFOAhCCLgGgclWaPVNlhSogK6IBnqAt0ofBL/f57dPc4oK+g
 YcPzilzdpWC1HWRxJ4MFnZrch/bBWg+UJT5N9BBJ8rB5CQ9mj+zfvQQAKxMH34DbnX
 MAGyWtvlhEPyZyao/0oTbIZ4jZda3YbcuR8gp5G4=
Date: Sun, 8 Nov 2020 18:00:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
Message-ID: <20201108170059.GA18354@kroah.com>
References: <20201103141047.15053-1-mateusz.gorski@linux.intel.com>
 <20201103153541.GC3267686@kroah.com>
 <d6006431-420f-55c7-0f78-977507e11fcf@linux.intel.com>
 <20201104115810.GA1694250@kroah.com>
 <0f6a673556974a289c2b81f3a8cc7536@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f6a673556974a289c2b81f3a8cc7536@intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Gorski,
 Mateusz" <mateusz.gorski@linux.intel.com>
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

On Sun, Nov 08, 2020 at 04:17:16PM +0000, Rojewski, Cezary wrote:
> On 2020-11-04 12:58 PM, Greg KH wrote:
> > On Wed, Nov 04, 2020 at 12:46:36PM +0100, Gorski, Mateusz wrote:
> >>
> >>>> [ Upstream commit 1b290ef023b3eeb4f4688b582fecb773915ef937 ]
> >>>>
> >>>> Add alternative topology binary file name based on used machine driver
> >>>> and fallback to use this name after failed attempt to load topology file
> >>>> with name based on NHLT.
> >>>> This change addresses multiple issues with current mechanism, for
> >>>> example - there are devices without NHLT table, and that currently
> >>>> results in tplg_name being empty.
> ...
> 
> >>> What problems are people facing, and what kernel(s) are you asking for
> >>> this to be ported to, and why can't people just use 5.8 or newer if they
> >>> have this new hardware?
> >>>
> >>
> >> I forgot to add - I wanted this change to be merged to stable 5.4 kernel.
> >> Please let me know if I should resend this patch with this information
> >> included.
> >>
> >> As for the user issues - topology binary file name is currently created
> >> according to information from NHLT. The problem is, that some laptops (for
> >> example Dell XPS 13) do not have NHLT at all. This results in topology
> >> binary name being empty (" ").
> >> This patch adds alternative name based on loaded machine driver.
> >>
> >> It applies not only to new hardware, please note that the mentioned Dell XPS
> >> 13 is based on Kabylake. This issue existed on upstream from the beginning
> >> of Skylake driver and was only recently addressed.
> > 
> > When was that laptop released and is this the only change that is needed
> > in order for the 5.4.y kernel to work properly on it?
> > 
> 
> Sorry for the late answer, Greg. To address your concerns and questions
> let me elaborate:
> 
> Indeed, this change is not the only one required to enable DMIC + HDA
> configuration for customers. The following series is essential:
> 
> [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
> https://lore.kernel.org/alsa-devel/20200305145314.32579-1-cezary.rojewski@intel.com/

Great, then they should just use a newer kernel version.  It's crazy to
think that you can go back in time and get older kernels working for
newer hardware :)

thanks,

greg k-h
