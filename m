Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5242A88D6
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 22:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87571167E;
	Thu,  5 Nov 2020 22:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87571167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604611194;
	bh=SiPs4KSaKHdBWtT4nmaEVLzOSnE21fo/MjwvZImQfFg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pnrregYsI9UU6YyZThxynD/Xq4lJ0hL9qWrOwSP+9WdwO5GCa0ZTh3nmmhI/wmTBQ
	 abKN0vEFumNTmOhjQMYYPfJRC0YFru027sEeIAra+Kzt3iS1uaOy71pdJVJWwIYn84
	 qpyNz2Pug5gKmLoagljoCyz6AmyfgOXMtBKME26Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2A88F800EC;
	Thu,  5 Nov 2020 22:18:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0538FF80171; Thu,  5 Nov 2020 22:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAD86F80150;
 Thu,  5 Nov 2020 22:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD86F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rKSgOpwH"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B08A20724;
 Thu,  5 Nov 2020 21:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604611090;
 bh=SiPs4KSaKHdBWtT4nmaEVLzOSnE21fo/MjwvZImQfFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rKSgOpwHGHJYV+h/xrw3BuI++ALXn5O3i3lz09N/9N7sesqHyGStMzkEeLhODnmHU
 NfFMyoscODRNj9StLtvTMcCJ2byM3bi/+PNybrLH7wcBvN7gmEY8qZE6jG0ZFQU6RD
 2dJCijbk3IwpVYNcVXGeKPsxGJyNv7+VpjUZMr2Y=
Date: Thu, 5 Nov 2020 22:18:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Build error with 5.9.5 in sound/soc/sof/intel/hda-codec.c (was:
 [PATCH AUTOSEL 5.9 039/147] ASoC: SOF: fix a runtime pm issue in SOF when
 HDMI codec doesn't work)
Message-ID: <20201105211858.GA2123793@kroah.com>
References: <20201026234905.1022767-1-sashal@kernel.org>
 <20201026234905.1022767-39-sashal@kernel.org>
 <f254331d-7ae2-e26f-3e1b-33a870349126@leemhuis.info>
 <20201105154001.GA1166450@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105154001.GA1166450@kroah.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Thu, Nov 05, 2020 at 04:40:01PM +0100, Greg KH wrote:
> On Thu, Nov 05, 2020 at 02:48:33PM +0100, Thorsten Leemhuis wrote:
> > Lo! I just tried to compile 5.9.5 and ran into a build error with below
> > patch. I only did a quick look (I have to leave the keyboard soon), but
> > seems the patch quoted below that was added to 5.9.5 depends on 11ec0edc6408
> > (git.kernel.org/linus/11ec0edc6408) which wasn't backported.
> > 
> > The build error can be found here:
> > https://kojipkgs.fedoraproject.org//work/tasks/8246/54978246/build.log
> > 
> > Relevant part:
> > 
> > + make -s 'HOSTCFLAGS=-O2 -flto=auto -ffat-lto-objects -fexceptions -g
> > -grecord-gcc-switches -pipe -Wall -Werror=format-security
> > -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS
> > -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong
> > -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -fcommon -m64 -mtune=generic
> > -fasynchronous-unwind-tables -fstack-clash-protection'
> > 'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,now
> > -specs=/usr/lib/rpm/redhat/redhat-hardened-ld ' ARCH=x86_64 'KCFLAGS= '
> > WITH_GCOV=0 -j48 modules
> > sound/soc/sof/intel/hda-codec.c: In function 'hda_codec_probe':
> > sound/soc/sof/intel/hda-codec.c:177:4: error: label 'error' used but not
> > defined
> >   177 |    goto error;
> >       |    ^~~~
> > make[4]: *** [scripts/Makefile.build:283: sound/soc/sof/intel/hda-codec.o]
> > Error 1
> > make[3]: *** [scripts/Makefile.build:500: sound/soc/sof/intel] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > make[2]: *** [scripts/Makefile.build:500: sound/soc/sof] Error 2
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [scripts/Makefile.build:500: sound/soc] Error 2
> > make: *** [Makefile:1784: sound] Error 2
> > make: *** Waiting for unfinished jobs....
> > + exit 1
> > 
> > Looks like the compiler is right from a quick look at
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/soc/sof/intel/hda-codec.c?h=linux-5.9.y&id=43836fdc9e318a11233cf19c5ee7ffb04e8e5d8f
> > 
> > But as I said, I lack the time for a closer look.
> 
> Thanks, people are looking at it already:
> 	https://lore.kernel.org/r/1f0c6a62-5208-801d-d7c2-725ee8da19b2@linux.intel.com

Should now be fixed in 5.9.6.

thanks,

greg k-h
