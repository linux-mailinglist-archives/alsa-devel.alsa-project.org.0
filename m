Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017E4182F8C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 12:47:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8491216E0;
	Thu, 12 Mar 2020 12:46:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8491216E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584013650;
	bh=aCjkl9gpkU1+eEZ2W0KpBz71vInbaGYi3LZv/ytc4JE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GbhhL8vMBPdzjQnJwUehRhZxJ6FpGJk86kC+KYL+1fSIsgsrPBySJQpYAAfEw33y8
	 Ya94xjE6rgVA+QYVL+z8HcqKP+mtmtA/o8t+CgESkcldivOK+tJcWuL5/PfQCoiPzL
	 0pXIA2xxPUbH4b8AxnizNWpRAEUkgDP1qLkQfsTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC4F5F8020C;
	Thu, 12 Mar 2020 12:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B6FF8020C; Thu, 12 Mar 2020 12:45:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F14EFF800BE;
 Thu, 12 Mar 2020 12:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F14EFF800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 04:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="322447053"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.40.3])
 by orsmga001.jf.intel.com with ESMTP; 12 Mar 2020 04:45:38 -0700
Date: Thu, 12 Mar 2020 12:45:37 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/3] [RESEND] ASoC: SOF: preparatory patches
Message-ID: <20200312114536.GA15167@ubuntu>
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
 <9cfc4182-1f22-9f28-52d8-f8aac1f7bc0b@linux.intel.com>
 <20200310125055.GF4106@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310125055.GF4106@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Hi,

On Tue, Mar 10, 2020 at 12:50:56PM +0000, Mark Brown wrote:
> On Mon, Mar 09, 2020 at 05:05:06PM -0500, Pierre-Louis Bossart wrote:
> 
> > To get a better picture of the directions, reviewers are invited to take a
> > look at the in-depth documentation written by Guennadi since the initial
> > patches were shared. This documentation was reviewed by Liam and me and is
> > really required to understand the concepts:
> 
> > https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html
> 
> How does this relate to the virtio audio spec that's currently under
> review?

The spec under discussion is only for simple audio virtualisation with fixed 
roles and topologies. With our approach guests get access to advanced DSP 
capabilities. The virtualisation approach under discussion can be a fallback 
for cases when no DSP has been detected on the host.

> It looks to be doing something much lower level than that.
> I am concerned that this looks to be exposing DPCM as a virtio ABI,
> we're trying to replace it as an internal API never mind ABI.

You mean that our approach works at the widget level, which is a part of the 
DPCM API? Well there is a translation layer between our ABI and DPCM. And by 
virtue of the same argument don't we already have DPCM as an ABI on the 
opposite side of SOF - in its IPC ABI? Largely this virtualisation approach 
doesn't add new interfaces, it re-uses the SOF IPC ABI, which is also one of 
its advantages.

Thanks
Guennadi
