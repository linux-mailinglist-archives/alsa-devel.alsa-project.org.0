Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D72A8261
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 16:41:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D5351681;
	Thu,  5 Nov 2020 16:40:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D5351681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604590862;
	bh=BK6UyQbmVZaBa7NHXAUIlJ5OUAFt3Xj/7AwhJMn1cVw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HMv5KcEsXtlpzZpi9oq7Kc8AKM3E/BH6wfB8kMPoTPTcvxJ45t75kQIBC82VMrC5C
	 VT5oNs4w0j+VPCTxarimUFgAnLwVoEeyH1sTKqoK4r84EZU//BlocLlkTC0ttADgZy
	 6TQB0brPU9rtOsFK7Ib6n4ieQAlf7JdvIw+c3ge0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3151F80171;
	Thu,  5 Nov 2020 16:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83F91F80171; Thu,  5 Nov 2020 16:39:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B857F800EC;
 Thu,  5 Nov 2020 16:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B857F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AkYgF9uK"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C49220782;
 Thu,  5 Nov 2020 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604590752;
 bh=BK6UyQbmVZaBa7NHXAUIlJ5OUAFt3Xj/7AwhJMn1cVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AkYgF9uKJZZtRdT8X6LKIae1sySM/N/v47rI7VnsqRSz7TZv0zNqnEJo071ui7RTF
 EOrtVRvV7JZgzKu7nJoVrdFkVQTKVQdeXchIZB6Lg7cy1QnCd/+Qc/WKr+iuH3vNut
 gCm/vjMoy7Icxu7PJsjWZub89kcW6akJzo98iLck=
Date: Thu, 5 Nov 2020 16:40:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Build error with 5.9.5 in sound/soc/sof/intel/hda-codec.c (was:
 [PATCH AUTOSEL 5.9 039/147] ASoC: SOF: fix a runtime pm issue in SOF when
 HDMI codec doesn't work)
Message-ID: <20201105154001.GA1166450@kroah.com>
References: <20201026234905.1022767-1-sashal@kernel.org>
 <20201026234905.1022767-39-sashal@kernel.org>
 <f254331d-7ae2-e26f-3e1b-33a870349126@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f254331d-7ae2-e26f-3e1b-33a870349126@leemhuis.info>
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

On Thu, Nov 05, 2020 at 02:48:33PM +0100, Thorsten Leemhuis wrote:
> Lo! I just tried to compile 5.9.5 and ran into a build error with below
> patch. I only did a quick look (I have to leave the keyboard soon), but
> seems the patch quoted below that was added to 5.9.5 depends on 11ec0edc6408
> (git.kernel.org/linus/11ec0edc6408) which wasn't backported.
> 
> The build error can be found here:
> https://kojipkgs.fedoraproject.org//work/tasks/8246/54978246/build.log
> 
> Relevant part:
> 
> + make -s 'HOSTCFLAGS=-O2 -flto=auto -ffat-lto-objects -fexceptions -g
> -grecord-gcc-switches -pipe -Wall -Werror=format-security
> -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS
> -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong
> -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -fcommon -m64 -mtune=generic
> -fasynchronous-unwind-tables -fstack-clash-protection'
> 'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,now
> -specs=/usr/lib/rpm/redhat/redhat-hardened-ld ' ARCH=x86_64 'KCFLAGS= '
> WITH_GCOV=0 -j48 modules
> sound/soc/sof/intel/hda-codec.c: In function 'hda_codec_probe':
> sound/soc/sof/intel/hda-codec.c:177:4: error: label 'error' used but not
> defined
>   177 |    goto error;
>       |    ^~~~
> make[4]: *** [scripts/Makefile.build:283: sound/soc/sof/intel/hda-codec.o]
> Error 1
> make[3]: *** [scripts/Makefile.build:500: sound/soc/sof/intel] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:500: sound/soc/sof] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [scripts/Makefile.build:500: sound/soc] Error 2
> make: *** [Makefile:1784: sound] Error 2
> make: *** Waiting for unfinished jobs....
> + exit 1
> 
> Looks like the compiler is right from a quick look at
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/soc/sof/intel/hda-codec.c?h=linux-5.9.y&id=43836fdc9e318a11233cf19c5ee7ffb04e8e5d8f
> 
> But as I said, I lack the time for a closer look.

Thanks, people are looking at it already:
	https://lore.kernel.org/r/1f0c6a62-5208-801d-d7c2-725ee8da19b2@linux.intel.com
