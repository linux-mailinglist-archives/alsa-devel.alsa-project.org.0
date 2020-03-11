Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09FA181835
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 13:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6027E1662;
	Wed, 11 Mar 2020 13:37:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6027E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583930294;
	bh=9qbFris02EO6y6gzN/rmPfNWU7F7Nen/GmOY3ia3I1w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTfUSyxMN+FVHn4eFPkgNaDzrKyFEUMq9/dTEu9WUSk8ig3cLBCtStiSPF3R5a+01
	 WMY0YnSSgy4vkOOU3UYC851XKrL2kft8XgwtNIto9q6DV62+dZkCzU56GPBHB+EfUc
	 yMnHZC6gV4Bvoyu1/hvoCOUJu0nKXF+iCBH3bfKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E4DF80141;
	Wed, 11 Mar 2020 13:36:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9F3BF801EB; Wed, 11 Mar 2020 13:36:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD8B3F800BE;
 Wed, 11 Mar 2020 13:36:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD8B3F800BE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 05:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; d="scan'208";a="289370390"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.40.3])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2020 05:36:19 -0700
Date: Wed, 11 Mar 2020 13:36:17 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] ASoC: add function parameters to enable forced path
 pruning
Message-ID: <20200311123617.GA5347@ubuntu>
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
 <20200309170749.32313-3-guennadi.liakhovetski@linux.intel.com>
 <20200310124544.GE4106@sirena.org.uk>
 <20200311074126.GA4149@ubuntu>
 <20200311122531.GD5411@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311122531.GD5411@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
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

Hi Mark,

On Wed, Mar 11, 2020 at 12:25:31PM +0000, Mark Brown wrote:
> On Wed, Mar 11, 2020 at 08:41:27AM +0100, Guennadi Liakhovetski wrote:
> > On Tue, Mar 10, 2020 at 12:45:44PM +0000, Mark Brown wrote:
> 
> > > So why doesn't DPCM recognize that the path is inactive and why is it
> > > better to do this than fix whatever the issue is there?
> 
> > Of course that would be better abd I'd much prefer that. Unfortunately I 
> > haven't been able to find a single scenario in which those paths would be 
> > exercised. As far as I understand path pruning should take place e.g. 
> > when a mixer modifies audio routing and as a result disables a certain 
> > pipeline, which is then pruned. If I could reproduce such a scenario I 
> > would be able to first check whether it's working, then see exactly how 
> > it is working and then see how best to add my use case to it. Since I 
> > wasn't able to find such a scenario, my only option was to preserve 
> > the current state and add my own path "on top." I'd be happy to try the 
> > other path too, I just need a use case, that I can reproduce.
> 
> It's still not clear to me what the issue is here.  If something is
> making a modification to the graph which needs a recheck or update I'd
> expect that these things happen along with that modification.  I don't
> understand what you're saying about not being able to reproduce
> scenarios or adding things "on top".

I mean, that I don't have a test-case to test dpcm_prune_paths() without my 
VirtIO support. That function currently exists in the kernel, but I don't 
have a test-case to verify its work, to see it called and actually perform 
the pruning. So I don't know how it is supposed to work. And because of 
that I cannot fix my VirtIO use case to use that function properly, without 
forcing it with an additional parameter.

Thanks
Guennadi
