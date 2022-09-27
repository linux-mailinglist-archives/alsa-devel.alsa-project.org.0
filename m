Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F395EC04A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1327784C;
	Tue, 27 Sep 2022 13:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1327784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664276495;
	bh=qWzViMw8PBL2YeYwWe9QfjDE51OuzNkqPLoy6kQBFlU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAEBT7uktMEYr/GzLkxFQDlp69PtHFF5CEg4RJ677gdgNxjbq3bPp6p4PH7Kfqyut
	 /CI5V39+tN0llikANS60/ctVfAe7KSRvll/WineieQ2hVzZfPYhx2fxuiXKi6xnOdg
	 3HTubqA/LlzwsMMi3etfu2CZl49LKsBa9rcNmSgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6097DF80496;
	Tue, 27 Sep 2022 13:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68469F80166; Tue, 27 Sep 2022 13:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F565F80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F565F80166
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id C361E520359;
 Tue, 27 Sep 2022 13:00:27 +0200 (CEST)
Received: from lxhi-065 (10.72.94.21) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.12; Tue, 27 Sep
 2022 13:00:27 +0200
Date: Tue, 27 Sep 2022 13:00:22 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix fe and be race when accessing
 substream->runtime
Message-ID: <20220927110022.GA3802@lxhi-065>
References: <1664210154-11552-1-git-send-email-erosca@de.adit-jv.com>
 <2f5a510b-082a-60e2-5770-58be086b5fc8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2f5a510b-082a-60e2-5770-58be086b5fc8@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.21]
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

On Di, Sep 27, 2022 at 09:50:05 +0200, Cezary Rojewski wrote:
> On 2022-09-26 6:35 PM, Eugeniu Rosca wrote:
> >From: xiao jin <jin.xiao@intel.com>
> >
> >After start of fe and be, fe might go to close without triggering
> >STOP, and substream->runtime is freed. However, be is still at
> >START state and its substream->runtime still points to the
> >freed runtime.
> >
> >Later on, FE is opened/started again, and triggers STOP.
> >snd_pcm_do_stop => dpcm_fe_dai_trigger
> >                 => dpcm_fe_dai_do_trigger
> >                 => dpcm_be_dai_trigger
> >                 => dpcm_do_trigger
> >                 => soc_pcm_trigger
> >                 => skl_platform_pcm_trigger
> >skl_platform_pcm_trigger accesses the freed old runtime data and
> >kernel panic.
> >
> >The patch fixes it by assigning be_substream->runtime in
> >dpcm_be_dai_startup when be's state is START.
> >
> >Signed-off-by: xiao jin <jin.xiao@intel.com>
> >Signed-off-by: Zhang Yanmin <yanmin.zhang@intel.com>
> >Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Hello,
> 
> The change seems to be driven by the skylake-driver problem. 

Agreed, based on the author/co-signer's e-mail and the call stack.

> With all due
> respect, why not ping owners of the driver first? There are some crucial CCs
> missing.

Some feedback already provided by Pierre-Louis Bossart (many thanks).
Cc-ing more Intel contributors in the sound subsystem.

> 
> I'd like to know more about the scenario you guys reproduced the problem in.

This patch was originally identified in the Intel Apollo Lake v4.1 KNLs.
Given that the change itself is in the core sound subsystem, our internal
assessment was that the patch might potentially be relevant/helpful
on other HW platforms.

Our intention is to confirm or invalidate this assumption with the
original developers of the patch, as well as with the audio maintainers
and the members of the alsa-devel ML.

> Configuration details and kernel base would be good to know too. Since our
> CI did not detect problem of such sort, if the problem actually exists, we
> would like to append a test or two to cover it later on.

If there is no evidence that the patch is fixing a real-life issue
occurring in the latest vanilla, I agree to drop the patch.

So far, I do not possess this evidence myself.

> Regards,
> Czarek

Best regards,
Eugeniu
