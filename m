Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B22451926E9
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 12:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326061674;
	Wed, 25 Mar 2020 12:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326061674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585134771;
	bh=ay82w8KBlOHrCBBXfr8FQZ7eSqXCNBcEDHXlQNC2sMQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YVq8HAzn64ZPXy+uUm+F1cfT/P84w13MU40+FhLPfwZ63Ul4qMEKA/vuAoItRQIX2
	 IO8pCCObC/5R0Prj0vsKhuJILFSNKm2z9rRSGYz5b12ekDpmZCX48P8IDUysrf+OaH
	 ZSGBllGJQ6Jz7diCeMOSvxkq9gzovNMnDoGtMc2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 127D2F80095;
	Wed, 25 Mar 2020 12:10:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A7FCF80273; Wed, 25 Mar 2020 12:10:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67AADF80095;
 Wed, 25 Mar 2020 12:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67AADF80095
IronPort-SDR: MCSfiQSye/083k6eMXIL0Jz6oUdfAOXIy7t9oDenXZgQWfynMtC8Jtv6qvCtfIOJdwFtxqcuxo
 7/RhDfEkbAdw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 04:10:48 -0700
IronPort-SDR: zaX59GWTKfqaaUMSE1NpZx/ASCV4qnSpkGCSeWYRZMFyezhcvzwHSh532lsqUzkehe/aNJHku4
 JIKp6istHr7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="293312753"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.55.115])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2020 04:10:46 -0700
Date: Wed, 25 Mar 2020 12:10:45 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: SOF: initialise work immediately
Message-ID: <20200325111044.GB7131@ubuntu>
References: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
 <20200324133042.GB7039@sirena.org.uk>
 <20200324135856.GA29623@ubuntu>
 <20200324144822.GG7039@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324144822.GG7039@sirena.org.uk>
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

On Tue, Mar 24, 2020 at 02:48:22PM +0000, Mark Brown wrote:
> On Tue, Mar 24, 2020 at 02:58:56PM +0100, Guennadi Liakhovetski wrote:
> > On Tue, Mar 24, 2020 at 01:30:42PM +0000, Mark Brown wrote:
> 
> > > As documented in submitting-patches.rst please send patches to the 
> > > maintainers for the code you would like to change.  The normal kernel
> > > workflow is that people apply patches from their inboxes, if they aren't
> > > copied they are likely to not see the patch at all and it is much more
> > > difficult to apply patches.
> 
> > I know that different maintainers have different preferences. For example 
> > in the subsysteem, where I'd worked for about 10 years the maintainer 
> > preferred not to be CCed on patches, he preferred to pick up patches from 
> > his mailing list folders, or whatever arrangement his mail filters 
> > provided for. I learned already that in ALSA / ASoC it's usual to CC 
> > maintainers. But I wasn't sure whether that also holds for larger patch 
> > series. E.g. my main patch series now consists of 14 patches, so, I 
> > thought, that maybe you would rather not receive multiple copies of the 
> > entire seriees for each new version both directly in your inbox and in 
> > the mailing list folder. Or is it indeed your preference to always be 
> > CCed on all patches? I apologise for re-iterating a question, that 
> > probably had been addressed multiple times before, maybe it's worth 
> > documenting this somewhere on ALSA web?
> 
> Yes, copy me on patches.  This is, as covered in what I wrote above, the
> standard and documented approach for the kernel - unless you explicitly
> know that there is some unusual approach for a specific subsystem you
> should assume that if you want people to see your patches you need to
> send the patches to them.

Got it, thanks!
