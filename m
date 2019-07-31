Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C877BE13
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 12:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFEF31715;
	Wed, 31 Jul 2019 12:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFEF31715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564567896;
	bh=bo6pgyicADBdus/n9UAUgdkB4SwSlI5kGkoH3de2tTE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Osv9ToHLlxjjvIlXaLolzpI0eQvUu8J5DmQ4IitvzBf7lVNwdjz4NE8xei3xh8iU7
	 7vjqCE6ZiR+4vjKT6DEQ/RRc1k5ohjPczIDBqlblc1Bdc3lpqjcmkEunzTp4wP1+qV
	 qgwgvGh0rtZhW3jeogHiq06R+sss26vd+ITuv0qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A2DF8048E;
	Wed, 31 Jul 2019 12:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C8FFF80483; Wed, 31 Jul 2019 12:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64BEDF80133;
 Wed, 31 Jul 2019 12:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64BEDF80133
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 03:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,329,1559545200"; d="scan'208";a="347482960"
Received: from wmasilun-mobl.ger.corp.intel.com ([10.251.89.117])
 by orsmga005.jf.intel.com with ESMTP; 31 Jul 2019 03:06:36 -0700
Message-ID: <9dc8192ebb040d30f3da85f44afffaff586e00d6.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Josh Boyer <jwboyer@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Date: Wed, 31 Jul 2019 11:06:36 +0100
In-Reply-To: <CA+5PVA6L=tcRthh+5n7PBhnqGsztaRhOujSvegykOu4vCWtfAQ@mail.gmail.com>
References: <af2d45578f7cdf908eb83cad3371b41315b7b5c4.camel@linux.intel.com>
 <69af4cd7-f9c2-3b2b-2774-4da1063395b2@linux.intel.com>
 <82019862aec57d5d8803fdd4270f88da409fe924.camel@linux.intel.com>
 <2f700356-1b5e-94cf-4586-f8f473dc5a85@linux.intel.com>
 <CA+5PVA6L=tcRthh+5n7PBhnqGsztaRhOujSvegykOu4vCWtfAQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
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

On Tue, 2019-07-30 at 17:19 -0400, Josh Boyer wrote:
> > I don't understand what you're suggesting nor how it would work
> > with the
> > way the kernel deals with directories. I tried to explain that we
> > need
> > an intel/sof-production and intel/sof directories, each with
> > generic
> > names that are symlinked to another location. This helps if you
> > want to
> > build quirks that select one or the other capabilities by just
> > changing
> > the firmware directory prefix. Pointers below.
> > 
> > https://github.com/thesofproject/linux/blob/9d7da69a1e85db2cdbbaae78dd7eda4eeaa1eb1c/sound/soc/sof/sof-pci-dev.c#L24
> > 
> > https://github.com/thesofproject/linux/blob/9d7da69a1e85db2cdbbaae78dd7eda4eeaa1eb1c/sound/soc/sof/loader.c#L269
> > 
> > https://github.com/thesofproject/linux/blob/9d7da69a1e85db2cdbbaae78dd7eda4eeaa1eb1c/sound/soc/sof/sof-pci-dev.c#L149

So the commit did support this, but it would put all "production"
signed binaries at the intel/sof/ level via soft links (to be
automatically loaded by the driver as the default).

A subsequent commit would have added the community signed images. I
planned to link community signed binaries at the intel/sof/community
level since most users would use the production signed images by
default (and would not need to use a module param to select). My
assumption was that machines using community signed by default would
have this in their default_fw_path ?

> > 
> > I guess we need to talk off-line since we are evidently not on the
> > same
> > page or something is missing for people to use this pull request.
> 
> I suggest you guys do that.  At the moment, I'm not pulling anything
> related to this until it has a signoff from both you and Liam in the
> commit logs at a minimum.

Yep, no problem - Pierre and I will refine and resend shortly. I also
need to remove links for aliases.

Thanks

Liam

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
