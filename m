Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 328847B558
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 23:58:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C080C17B0;
	Tue, 30 Jul 2019 23:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C080C17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564523895;
	bh=dyIkjZ3zUxOdp+/af4h0ZvSOJlZ5bD5d7y8EmQk++Oc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mtg++SyCIjDDA6H7omgglPZWjCuMKh3ogVAfQ/Fml75QpFaes9wGhLcW8o53q9q+F
	 y7pWGcKPkp7m9BzSkD6zfSaikScjuwWAhKGD/FYcDg3RMFTCpk67ZjH/2vqP9PiJwn
	 DbmNdke8BSYkZeqI3PDi1hAJj1j4bMOvXIQ6LWKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A97DF804CC;
	Tue, 30 Jul 2019 23:56:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F3F3F804CA; Tue, 30 Jul 2019 23:56:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75DFF800C0;
 Tue, 30 Jul 2019 23:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75DFF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cyxqDUbB"
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1498F2087F;
 Tue, 30 Jul 2019 21:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564521584;
 bh=y34CFdVMZeUn/jut+Cay2PLxOMKpOFlQC2g7bm8UAQg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cyxqDUbBHmrcl7/PIGtwtl0ORUXQwRS1+RzcT/fUHxq/KzUvg4jfVEYpDKKzzeUeg
 H0sum6ekVJPbJ/wYgWrM4BRgzTh9+8JqNmElAYRFSU21LK2dLjxh8fvIb/rSeS1EMw
 QtKnRfl1rQfuvNtX3aYIRFYE4+huCM+qvkqll264=
Received: by mail-qk1-f176.google.com with SMTP id s145so47638773qke.7;
 Tue, 30 Jul 2019 14:19:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXoWFr3H+1cdtJeRPJ5btaAAIROsD5TAZxQq+DBpbYEsMBght8/
 0et9NqtWmS8VuX4w76cdHOBZqfNND5RgnhaT2b8=
X-Google-Smtp-Source: APXvYqxhuSqxbJP7E4Ukl821y6kcVEUdKMeF67fkFRquhA+NFbr4Ob/M2Mq0aeq408/ydtVoUBxGurP5rUwmYRNqfk4=
X-Received: by 2002:a05:620a:4d4:: with SMTP id
 20mr43816504qks.95.1564521583242; 
 Tue, 30 Jul 2019 14:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <af2d45578f7cdf908eb83cad3371b41315b7b5c4.camel@linux.intel.com>
 <69af4cd7-f9c2-3b2b-2774-4da1063395b2@linux.intel.com>
 <82019862aec57d5d8803fdd4270f88da409fe924.camel@linux.intel.com>
 <2f700356-1b5e-94cf-4586-f8f473dc5a85@linux.intel.com>
In-Reply-To: <2f700356-1b5e-94cf-4586-f8f473dc5a85@linux.intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 30 Jul 2019 17:19:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6L=tcRthh+5n7PBhnqGsztaRhOujSvegykOu4vCWtfAQ@mail.gmail.com>
Message-ID: <CA+5PVA6L=tcRthh+5n7PBhnqGsztaRhOujSvegykOu4vCWtfAQ@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Linux Firmware <linux-firmware@kernel.org>,
 SOF <sound-open-firmware@alsa-project.org>
Subject: Re: [alsa-devel] [Sound-open-firmware] [GIT PULL] SOF v1.3 firmware
	binaries
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

On Tue, Jul 30, 2019 at 5:09 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> >>> ----------------------------------------------------------------
> >>> Liam Girdwood (1):
> >>>         sof: Add Intel SOF V1.3 release firmware binaries.
> >>>
> >>>    LICENCE.sof                                  | 1090
> >>> ++++++++++++++++++++++++++
> >>
> >> Humm, that LICENSE file needs to be double-checked. Is there any
> >> reason
> >> why the text of this LICENSE.sof is different the usual text, e.g.
> >> from
> >> the LICENSE.adsp_sst?
> >
> > LICENCE.adsp_sst is for the closed source firmware and LICENCE.sof is
> > for SOF. The key difference is the removal of Intel binary FW licence
> > and addition of BSD 3c, MIT, ISC and BSD 2c from SOF LICENCE file. Both
> > files are the same wrt newlib.
>
> I would kindly ask that you run this by legal.
>
> The BSD license is provided for the source files, it's a stretch to say
> that the license extends to binaries without a statement that says that
> the binary firmware is only made of those source files, unmodified and
> without proprietary extensions. And to the best of my knowledge the
> newlib dependencies do not apply when compiling with XCC.
>
> >> *    No reverse engineering, decompilation, or disassembly of this
> >> software is
> >>        permitted.
> >
> > I'm not following why we need the reverse engineering conditions for
> > opensource binaries.
>
> me neither, that's why I stated that the model has to be different from SST.
>
>
> >> and the DISCLAIMER part, both of which seem pretty important to me.
> >
> > Disclaimer is in BSD 3 clause and MIT licence - exact same as the
> > sources.
>
> Maybe I am splitting hair, but I'd like a professional opinion on that
> license file. Better safe than sorry. I had GKH tell me on Friday to fix
> a (c) 2017-19 and use (c) 2017-2019...
>
> >>
> >> IANAL, but seeing only a patent clause looks odd. There should be a
> >> mention of redistribution and a clear disclaimer (not sure about the
> >> reverse engineering parts since the code is available it makes no
> >> sense).
> >
> > Patent clause is exactly the same as SST FW.
> >
> >>
> >>>    WHENCE                                       |   33 +
> >>>    intel/sof/apl/intel/sof-apl-v1.3.ri          |  Bin 0 -> 270336
> >>> bytes
> >>>    intel/sof/bdw/sof-bdw-v1.3.ri                |  Bin 0 -> 100144
> >>> bytes
> >>>    intel/sof/byt/sof-byt-v1.3.ri                |  Bin 0 -> 89668
> >>> bytes
> >>>    intel/sof/cht/sof-cht-v1.3.ri                |  Bin 0 -> 90484
> >>> bytes
> >>>    intel/sof/cnl/intel/sof-cnl-v1.3-6cc8da10.ri |  Bin 0 -> 274432
> >>> bytes
> >>>    intel/sof/icl/intel/sof-icl-v1.3.ri          |  Bin 0 -> 278528
> >>> bytes
> >>
> >> There are two types of platforms, the ones which require the Intel
> >> firmware to be signed with a private production key and the ones
> >> that
> >> are signed with the SOF community key.
> >>
> >> if we have a single directory, then how do we deal with the two
> >> cases?
> >
> > I've not yet upstreamed the community signed versions yet so everything
> > is in the intel/sof/platform/key/ directory structure.
> >
> >> It's not even clear to me which of the two cases are handled here.
> >>
> >
> > Intel signed binaries, since they are in intel/sof/platform/intel
> > directory. Community signed will go in intel/sof/platform/community/
> > dir.
>
> I don't understand what you're suggesting nor how it would work with the
> way the kernel deals with directories. I tried to explain that we need
> an intel/sof-production and intel/sof directories, each with generic
> names that are symlinked to another location. This helps if you want to
> build quirks that select one or the other capabilities by just changing
> the firmware directory prefix. Pointers below.
>
> https://github.com/thesofproject/linux/blob/9d7da69a1e85db2cdbbaae78dd7eda4eeaa1eb1c/sound/soc/sof/sof-pci-dev.c#L24
>
> https://github.com/thesofproject/linux/blob/9d7da69a1e85db2cdbbaae78dd7eda4eeaa1eb1c/sound/soc/sof/loader.c#L269
>
> https://github.com/thesofproject/linux/blob/9d7da69a1e85db2cdbbaae78dd7eda4eeaa1eb1c/sound/soc/sof/sof-pci-dev.c#L149
>
> I guess we need to talk off-line since we are evidently not on the same
> page or something is missing for people to use this pull request.

I suggest you guys do that.  At the moment, I'm not pulling anything
related to this until it has a signoff from both you and Liam in the
commit logs at a minimum.

josh

> >>>    intel/sof/sof-apl.ri                         |    1 +
> >>>    intel/sof/sof-bdw.ri                         |    1 +
> >>>    intel/sof/sof-byt.ri                         |    1 +
> >>>    intel/sof/sof-cht.ri                         |    1 +
> >>>    intel/sof/sof-cml.ri                         |    1 +
> >>>    intel/sof/sof-cnl.ri                         |    1 +
> >>>    intel/sof/sof-glk.ri                         |    1 +
> >>>    intel/sof/sof-icl.ri                         |    1 +
> >>>    intel/sof/sof-whl.ri                         |    1 +
> >>
> >> unless I am missing something, we don't have any tables in the Linux
> >> kernel for the WHL and CML configurations, and IIRC we only generate
> >> sof-cnl.ri. Is there actually a user for sof-whl.ri and sof-cml.ri?
> >>
> >
> > There are glk users hence the addition of whl and cml.
>
> glk has nothing to do with whl and cml. Not sure if there is a typo or
> something I missed in your reply?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
