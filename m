Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA15EC2BE
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 14:31:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2336827;
	Tue, 27 Sep 2022 14:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2336827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664281913;
	bh=YIK1M82N7qhRycvZx3jJtPNEEvpqbJTEiKpr77SzcCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1xPBo2bMyi2SAHy9rM5XoOX49VLr0orE5L15iFqnvpUbhxm4PxglS9+gX7iBYSKB
	 dd8EuHlLroF2SoRnG5UG9vcP0noew2XphBk7m+quMUxcM5FQjYvFy0G4rozcEdaSPh
	 si6VpD0N/2KSFR9d9kzHP1M5fJNitmO3xgcx+vng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26FFCF80496;
	Tue, 27 Sep 2022 14:30:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FC8BF8025E; Tue, 27 Sep 2022 14:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19516F800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 14:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19516F800AA
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id 17EAA520214;
 Tue, 27 Sep 2022 14:30:44 +0200 (CEST)
Received: from lxhi-065 (10.72.94.21) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.12; Tue, 27 Sep
 2022 14:30:43 +0200
Date: Tue, 27 Sep 2022 14:30:43 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix fe and be race when accessing
 substream->runtime
Message-ID: <20220927123043.GB4547@lxhi-065>
References: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
 <bdf56f23-1019-b4c8-a11a-3934db432cf1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bdf56f23-1019-b4c8-a11a-3934db432cf1@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.21]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
Cc: Yanmin Zhang <yanmin_zhang@linux.intel.com>, alsa-devel@alsa-project.org,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 linux-kernel@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Zhang Yanmin <yanmin.zhang@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ramesh Babu <ramesh.babu@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Dean Jenkins <Dean_Jenkins@mentor.com>, Mark Brown <broonie@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 xiao jin <jin.xiao@intel.com>
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

Hi Pierre,

On Di, Sep 27, 2022 at 09:51:46 +0200, Pierre-Louis Bossart wrote:
> On 9/26/22 18:35, Eugeniu Rosca wrote:
> > From: xiao jin <jin.xiao@intel.com>
> > 
> > After start of fe and be, fe might go to close without triggering
> > STOP, and substream->runtime is freed. However, be is still at
> > START state and its substream->runtime still points to the
> > freed runtime.
> > 
> > Later on, FE is opened/started again, and triggers STOP.
> > snd_pcm_do_stop => dpcm_fe_dai_trigger
> >                 => dpcm_fe_dai_do_trigger
> >                 => dpcm_be_dai_trigger
> >                 => dpcm_do_trigger
> >                 => soc_pcm_trigger
> >                 => skl_platform_pcm_trigger
> > skl_platform_pcm_trigger accesses the freed old runtime data and
> > kernel panic.
> > 
> > The patch fixes it by assigning be_substream->runtime in
> > dpcm_be_dai_startup when be's state is START.
> 
> Can I ask on which kernel this patch was validated and on what platform?

As shared with Czarek in https://lore.kernel.org/alsa-devel/20220927110022.GA3802@lxhi-065/ ,
this patch was originally extracted from the out-of-tree Intel Apollo
Lake v4.1 KNL releases, hence it was validated on Intel ref.boards.

No re-testing/re-validation has been performed on the latest vanilla.

One of the goals behind submitting the patch is getting in touch
with the original authors, as well as the members of alsa-devel,
to assess if the patch is still relevant.

> 
> We've done a lot of work since last year on DPCM states, 

Could you please feedback if the work on the DPCM states is
pre- or post-v5.10?


> and I wonder
> the problem mentioned above actually exists on recent kernels.
> 
> Specifically, if the FE is closed, I don't get how the BE is not closed
> as well. And if this problem is found on a recent kernel, then it should
> be seen in the AVS driver as well, no?

It is totally conceivable (if not very likely) that the mainline
advancements in the sound subsystem make this patch obsolete.

I would be happy if that's the final outcome of our discussion
(since this will allow dropping the patch in our downstream kernel).

Best Regards,
Eugeniu
