Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8A85EFA62
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 18:26:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EBB415F9;
	Thu, 29 Sep 2022 18:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EBB415F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664468806;
	bh=j0bHoW1dMhRlkR/2o8psYMdotkFnTuf3l5zsd3QVxi4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dnheChZd2jMXK/IuXtDsCQGY/+nvYBYqPWODIQCT0c5hWGrJFlxL024X6VmlYpNCe
	 yGieJe7q0dEschIA1SWoOcxaZKNqFpQDloIrb+Z/Wp2VQCB/Ue3NfJHOPYU0R9FDl8
	 c36NbsqGVyXCGveYLjH4WXnrnTctrmHTuX0dfwI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA15F803DD;
	Thu, 29 Sep 2022 18:25:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DD1AF8023A; Thu, 29 Sep 2022 18:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODY_30, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96460F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 18:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96460F80109
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id 72D6F5201DA;
 Thu, 29 Sep 2022 18:25:34 +0200 (CEST)
Received: from lxhi-065 (10.72.94.4) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.12; Thu, 29 Sep
 2022 18:25:33 +0200
Date: Thu, 29 Sep 2022 18:25:29 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix fe and be race when accessing
 substream->runtime
Message-ID: <20220929162529.GA7982@lxhi-065>
References: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
 <2f5a510b-082a-60e2-5770-58be086b5fc8@intel.com>
 <20220927110022.GA3802@lxhi-065>
 <21ffd91e-8089-0a57-bdb6-d73246079398@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <21ffd91e-8089-0a57-bdb6-d73246079398@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.4]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiada Wang <jiada_wang@mentor.com>, Zhang Yanmin <yanmin.zhang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ramesh Babu <ramesh.babu@intel.com>, Ramesh Babu B <ramesh.babu.b@intel.com>,
 xiao jin <jin.xiao@intel.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Dean Jenkins <Dean_Jenkins@mentor.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Yanmin Zhang <yanmin_zhang@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Rander Wang <rander.wang@linux.intel.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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

Hello Czarek,

Thank you for your friendly feedback.

On Mi, Sep 28, 2022 at 04:24:43 +0200, Cezary Rojewski wrote:
> On 2022-09-27 1:00 PM, Eugeniu Rosca wrote:
> >Hello Czarek,
> 
> ...
> 
> >>I'd like to know more about the scenario you guys reproduced the problem in.
> >
> >This patch was originally identified in the Intel Apollo Lake v4.1 KNLs.
> >Given that the change itself is in the core sound subsystem, our internal
> >assessment was that the patch might potentially be relevant/helpful
> >on other HW platforms.
> >
> >Our intention is to confirm or invalidate this assumption with the
> >original developers of the patch, as well as with the audio maintainers
> >and the members of the alsa-devel ML.
> >
> >>Configuration details and kernel base would be good to know too. Since our
> >>CI did not detect problem of such sort, if the problem actually exists, we
> >>would like to append a test or two to cover it later on.
> >
> >If there is no evidence that the patch is fixing a real-life issue
> >occurring in the latest vanilla, I agree to drop the patch.
> >
> >So far, I do not possess this evidence myself.
> 
> 
> I've spent some time to locate the change. Found it and it seems obsolete.
> Some tags are missing in the revision of yours and the original date does
> not match either - it's Apr 2018 for the original. Won't be mentioning the
> tags as some engineers no longer bear @intel.com.
> 
> soc-pcm and skylake-driver valuable bits from those trees are already part
> of the upstream. Most of what is left was later proven obsolete or redundant
> by my or Pierre's engineers. There seems to be no patch missing except for
> few fixes from the recent SKL/KBL up-revs for our clients. Nothing APL
> specific.

Thanks for this thorough check. That also gives us enough confidence
to drop the patch in some of our downstream kernels.

> 
> Following kernels related to APL are maintained by the IPG team from
> software perspective:
> 	4.1.42, 4.1.49, 4.4, 4.9, 4.14, 4.19
> 
> Multiple OSes. And then there are flavors for kernels/OS both. It's quite
> likely kernel base of yours fits into one of these buckets or at least have
> had changes ported from one of them.

Good to know and yes, you are right w.r.t. the origin of the patch.

> 
> TLDR: I agree here with my colleagues - if you believe the change is
> necessary, a proof e.g.: in form of reproduction steps, is needed. Otherwise
> it's no-go. Happy to hop on a call should you need any additional
> information.

That's a very kind attitude and we will definitely share any empirical
evidence if it turns out the patch is really contributing with healing
of any future runtime issues.

> 
> Regards,
> Czarek

Best Regards
Eugeniu
