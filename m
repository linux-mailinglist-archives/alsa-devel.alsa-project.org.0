Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062C191253
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 15:00:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1533165D;
	Tue, 24 Mar 2020 14:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1533165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585058449;
	bh=ZAvLSHBXEV2HBDdeeAnDyiWcapdaJvrFxnl9T3KlXWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQLfWwybsP2WGa+Tw9HKx3FefajpxFskrDoPieN7UxwE5cx8+dl+oopVRTyDzEKMi
	 ij8pO/GgP/5I4FtAGEfcLjH/sppPcUIOXaRcX4lm9rE76TJ0fHCmYKcafaTYq+Ah8u
	 0OD+wfHPd9+g1TKDwH/d7vTMaff5ImwzqLwfwFX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0BD6F80227;
	Tue, 24 Mar 2020 14:59:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B6BBF801F9; Tue, 24 Mar 2020 14:59:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54D5DF800B9;
 Tue, 24 Mar 2020 14:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D5DF800B9
IronPort-SDR: CKEDXakbNeFNlBm71CRyrXw6XtEjp/v6Cgk+cF5AIAQl1kAyw0wb0nyLZSwiEJCQxp2VwOpFup
 RlcPSTLovrjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 06:58:59 -0700
IronPort-SDR: tXU4/sxlWmPcrZrwUSFMmX/J/JydvV7JxB410pVa3riYI3wgfcsE7N10eGoG41KgJWWYUV1+KU
 GLT6vLU1eK+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="446234727"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.249.33.88])
 by fmsmga005.fm.intel.com with ESMTP; 24 Mar 2020 06:58:57 -0700
Date: Tue, 24 Mar 2020 14:58:56 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: SOF: initialise work immediately
Message-ID: <20200324135856.GA29623@ubuntu>
References: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
 <20200324133042.GB7039@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324133042.GB7039@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
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

On Tue, Mar 24, 2020 at 01:30:42PM +0000, Mark Brown wrote:
> On Tue, Mar 24, 2020 at 01:29:19PM +0100, Guennadi Liakhovetski wrote:
> > Fix uninitialised work errors by moving initialisation to directly
> > after allocation.
> > 
> > Guennadi Liakhovetski (2):
> >   ASoC: SOF: (cosmetic) use for_each_pcm_streams() in sof_dai_load()
> >   ASoC: SOF: fix uninitialised "work" with VirtIO
> 
> As documented in submitting-patches.rst please send patches to the 
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.

I know that different maintainers have different preferences. For example 
in the subsysteem, where I'd worked for about 10 years the maintainer 
preferred not to be CCed on patches, he preferred to pick up patches from 
his mailing list folders, or whatever arrangement his mail filters 
provided for. I learned already that in ALSA / ASoC it's usual to CC 
maintainers. But I wasn't sure whether that also holds for larger patch 
series. E.g. my main patch series now consists of 14 patches, so, I 
thought, that maybe you would rather not receive multiple copies of the 
entire seriees for each new version both directly in your inbox and in 
the mailing list folder. Or is it indeed your preference to always be 
CCed on all patches? I apologise for re-iterating a question, that 
probably had been addressed multiple times before, maybe it's worth 
documenting this somewhere on ALSA web?

Thanks
Guennadi
