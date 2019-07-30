Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D157B155
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 20:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 173911797;
	Tue, 30 Jul 2019 20:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 173911797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564510404;
	bh=4Mg12I54k254baq3jEXzU5p4O/B2mqLoe3bRfMSIDIc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=np5/MbB4Cz5GVlGkwYU64Dc+c9KOVCJpdei1Ypm5EckDWVPwhzV3RGDg+GSZEmU5D
	 oQDZU13ZV8e0GQbr9z7U3MBR2QOMmIHukMoFw336J7pj0DDBI6Jslr1nziEtDLxEdy
	 JXVankynyK4XioDjOIwEqjRKpldrpzcD6fsRVEM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7499DF80482;
	Tue, 30 Jul 2019 20:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF9F3F804CA; Tue, 30 Jul 2019 20:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E49F80214;
 Tue, 30 Jul 2019 20:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E49F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 11:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="190941449"
Received: from rmdeggen-mobl.amr.corp.intel.com ([10.251.80.230])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2019 11:11:30 -0700
Message-ID: <82019862aec57d5d8803fdd4270f88da409fe924.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 linux-firmware@kernel.org
Date: Tue, 30 Jul 2019 19:11:32 +0100
In-Reply-To: <69af4cd7-f9c2-3b2b-2774-4da1063395b2@linux.intel.com>
References: <af2d45578f7cdf908eb83cad3371b41315b7b5c4.camel@linux.intel.com>
 <69af4cd7-f9c2-3b2b-2774-4da1063395b2@linux.intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
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

On Tue, 2019-07-30 at 11:16 -0500, Pierre-Louis Bossart wrote:
> [fixed alsa-devel email]

Thanks, auto-complete with my butter fingers....
> 
> On 7/30/19 10:33 AM, Liam Girdwood wrote:
> > The following changes since commit
> > dff98c6c57383fe343407bcb7b6e775e0b87274f:
> > 
> >    Merge branch 'master' of git://github.com/skeggsb/linux-firmware 
> > (2019-07-26 07:32:37 -0400)
> > 
> > are available in the Git repository at:
> > 
> >    https://github.com/thesofproject/linux-firmware.git sof-v1.3
> > 
> > for you to fetch changes up to
> > cde3a116cea96976125b9215b303edfda85c9b54:
> > 
> >    sof: Add Intel SOF V1.3 release firmware binaries. (2019-07-30
> > 16:06:41 +0100)
> > 
> > ----------------------------------------------------------------
> > Liam Girdwood (1):
> >        sof: Add Intel SOF V1.3 release firmware binaries.
> > 
> >   LICENCE.sof                                  | 1090
> > ++++++++++++++++++++++++++
> 
> Humm, that LICENSE file needs to be double-checked. Is there any
> reason 
> why the text of this LICENSE.sof is different the usual text, e.g.
> from 
> the LICENSE.adsp_sst?

LICENCE.adsp_sst is for the closed source firmware and LICENCE.sof is
for SOF. The key difference is the removal of Intel binary FW licence
and addition of BSD 3c, MIT, ISC and BSD 2c from SOF LICENCE file. Both
files are the same wrt newlib.

> 
> You are missing both the first part:
> 
> ***** INTEL BINARY FIRMWARE RELEASE LICENCE
> ********************************
> 
> Copyright (c) 2014-15 Intel Corporation.
> All rights reserved.
> 
> Redistribution.
> 
> Redistribution and use in binary form, without modification, are
> permitted
> provided that the following conditions are met:
> *    Redistributions must reproduce the above copyright notice and
> the
>       following disclaimer in the documentation and/or other
> materials 
> provided
>       with the distribution.
> *    Neither the name of Intel Corporation nor the names of its 
> suppliers may
>       be used to endorse or promote products derived from this
> software 
> without
>       specific prior written permission.

These two are in the BSD 3 clause licence (which is included).

> *    No reverse engineering, decompilation, or disassembly of this 
> software is
>       permitted.

I'm not following why we need the reverse engineering conditions for
opensource binaries.

> 
> and the DISCLAIMER part, both of which seem pretty important to me.

Disclaimer is in BSD 3 clause and MIT licence - exact same as the
sources.

>  
> IANAL, but seeing only a patent clause looks odd. There should be a 
> mention of redistribution and a clear disclaimer (not sure about the 
> reverse engineering parts since the code is available it makes no
> sense).

Patent clause is exactly the same as SST FW.

> 
> >   WHENCE                                       |   33 +
> >   intel/sof/apl/intel/sof-apl-v1.3.ri          |  Bin 0 -> 270336
> > bytes
> >   intel/sof/bdw/sof-bdw-v1.3.ri                |  Bin 0 -> 100144
> > bytes
> >   intel/sof/byt/sof-byt-v1.3.ri                |  Bin 0 -> 89668
> > bytes
> >   intel/sof/cht/sof-cht-v1.3.ri                |  Bin 0 -> 90484
> > bytes
> >   intel/sof/cnl/intel/sof-cnl-v1.3-6cc8da10.ri |  Bin 0 -> 274432
> > bytes
> >   intel/sof/icl/intel/sof-icl-v1.3.ri          |  Bin 0 -> 278528
> > bytes
> 
> There are two types of platforms, the ones which require the Intel 
> firmware to be signed with a private production key and the ones
> that 
> are signed with the SOF community key.
> 
> if we have a single directory, then how do we deal with the two
> cases? 

I've not yet upstreamed the community signed versions yet so everything
is in the intel/sof/platform/key/ directory structure.

> It's not even clear to me which of the two cases are handled here.
> 

Intel signed binaries, since they are in intel/sof/platform/intel
directory. Community signed will go in intel/sof/platform/community/
dir.

> >   intel/sof/sof-apl.ri                         |    1 +
> >   intel/sof/sof-bdw.ri                         |    1 +
> >   intel/sof/sof-byt.ri                         |    1 +
> >   intel/sof/sof-cht.ri                         |    1 +
> >   intel/sof/sof-cml.ri                         |    1 +
> >   intel/sof/sof-cnl.ri                         |    1 +
> >   intel/sof/sof-glk.ri                         |    1 +
> >   intel/sof/sof-icl.ri                         |    1 +
> >   intel/sof/sof-whl.ri                         |    1 +
> 
> unless I am missing something, we don't have any tables in the Linux 
> kernel for the WHL and CML configurations, and IIRC we only generate 
> sof-cnl.ri. Is there actually a user for sof-whl.ri and sof-cml.ri?
> 

There are glk users hence the addition of whl and cml.

Liam

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
