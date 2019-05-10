Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F919691
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 04:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ACA6192C;
	Fri, 10 May 2019 04:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ACA6192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557453873;
	bh=aEPkbD2/La7Gx7HWwc1LbZGQryto1IaJxN2Ix93yS50=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJavSJQ7DMKuYRSMOrmxuZGsXACHCTlTEaLcbg4L7/ReA3etTnqq4TvkyjktnNUl6
	 xAJouFKyFuQoYUjI0cgesXTjb89oA4cn94LKiJ3ThYwaoItI2O+AOZMHiCOafszd95
	 x245ygAK/gXkPYakOJFUM9918GsvybMflrEgVq/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF88F896F0;
	Fri, 10 May 2019 04:02:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FBC3F896F0; Fri, 10 May 2019 04:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE18F89673
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 04:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE18F89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 19:02:40 -0700
X-ExtLoop1: 1
Received: from ahsanmuh-mobl1.amr.corp.intel.com ([10.255.229.68])
 by fmsmga007.fm.intel.com with ESMTP; 09 May 2019 19:02:39 -0700
Message-ID: <9a392d4db4e6e700cf473f6ddaab532fcf3876f2.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: "Yang, Libin" <libin.yang@intel.com>, Takashi Iwai <tiwai@suse.de>
Date: Thu, 09 May 2019 19:02:38 -0700
In-Reply-To: <96A12704CE18D347B625EE2D4A099D19528396E1@SHSMSX103.ccr.corp.intel.com>
References: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
 <aa0c6eea81a721f340dd1362801e49049a6620dd.camel@linux.intel.com>
 <s5htve4mymn.wl-tiwai@suse.de>
 <ac99b2fefe05833787e473cbd2327a35c02de68b.camel@linux.intel.com>
 <s5hd0krmsyy.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528396E1@SHSMSX103.ccr.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "Wang, Rander" <rander.wang@intel.com>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
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

> > > 
> > > So in the current scenario what we see is that after resuming
> > > from S3,
> > > a pause-release action from the user results in a FE prepare()
> > > followed by the START trigger (and not a PAUSE-RELEASE trigger).
> > > 
> > > Libin's patch proposes to do a prepare() for the BE even in the
> > > case
> > > of a regular pause-release. But this might not be ideal since
> > > other
> > > drivers might have logic in the prepare() ioctl that might end up
> > > with
> > > errors.
> > 
> > Right.
> > 
> > > So I am thinking maybe we can have some internal logic in the SOF
> > > prepare() callback that will also call the BE prepare() when the
> > > be->dpcm[stream].state is SND_SOC_DPCM_STATE_PAUSED? Would that
> > 
> > make
> > > sense?
> > 
> > Yes, that would work, I guess.  Eventually this might be needed to
> > be
> > addressed in ALSA core side, too, but it's good to have some fix
> > beforehand in
> > DPCM.
> 
> Ranjani, with "regular pause-release", do you mean pause-release
> without S3? The prepare() is called from alsa core (pcm_native.c) in
> S3 case.
> Prepare() being called in pause-release after S3 is because of S3,
> not because
> of pause-release. Actually, if you pause-release without S3 (not sure
> in
> pm-runtime case), ASoC's prepare() will not be called. So 
> dpcm_be_dai_prepare() will not be called. So you assumption of
> "regular pause-release" calling prepare() is wrong.
Oh yes. That's right. Thanks for pointing it out.
In this case, the patch sounds like a good fix. Basically, you're
saying that if the FE prepare() gets called (which happens in the case
of pause-release without INFO_RESUME) it should also call the BE
prepare(), right?

Takashi, what do you think? 

> 
> Please let me describe the flow below:
> 1. Pause-release after S3 without RESUME_INFO
> Prepare() -> trigger start
> 2. pause-release without S3 without/with RESUME_INFO
> Trigger pause-release

> 3. Pause-release after S3 with RESUME_INFO
> Trigger resume
Are you sure about this? A paused stream will not be suspended. So it
would still be trigger PAUSE-RELEASE in this case?

Thanks,
Ranjani


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
