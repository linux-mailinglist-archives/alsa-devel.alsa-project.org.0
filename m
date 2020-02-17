Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2D160F1B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:47:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B6221676;
	Mon, 17 Feb 2020 10:46:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B6221676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581932839;
	bh=UegL4qwYO2r1ZO81+6UUahogQUO8p8aylkVc9cALTqM=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9xI/XmcnG0grliA59sw+yTCxCNR2l95GjX1DjnzMtslFS/Y1FH6HMFAVyI/m9aP/
	 hXAqm30dDDrCbZuoQWCvsfSpOcpF0PQ1ZjhalsXmKJ/jdG5d0LywYL0XUP7HvqihL2
	 9us+Udec72yitFKcDwxk1gfoCo27vBDuU+b1/gs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B08F80096;
	Mon, 17 Feb 2020 10:46:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D2ACF801F5; Mon, 17 Feb 2020 10:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49BA3F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49BA3F80096
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 01:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,452,1574150400"; d="scan'208";a="314731888"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 17 Feb 2020 01:45:50 -0800
Date: Mon, 17 Feb 2020 11:45:49 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5ha75hbmjb.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.2002171138320.2957@eliteleevi.tm.intel.com>
References: <20200216203516.10869-1-tiwai@suse.de>
 <alpine.DEB.2.21.2002171058360.2957@eliteleevi.tm.intel.com>
 <s5ha75hbmjb.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: intel: Fix probe error without
 i915 graphics
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

Hey,

On Mon, 17 Feb 2020, Takashi Iwai wrote:

> On Mon, 17 Feb 2020 10:11:59 +0100, Kai Vehmanen wrote:
> > With my patchset, if i915 is not present or the init fails, only the idisp 
> > codec is dropped and the probe continues for other codecs.
> > 
> > Your patch will partly conflict with mine as I rely on i915_init to 
> > report failure in this case. Ok if we wait until my patch gets in? 
> 
> Sure, mine is just a quick fix.  If there is already a work on it,
> let's take it instead.

ok, I'll try to fix the remaining issue with module reload today.

> But, this HP machine still seems broken even after ignoring i915, so
> we'd need more work in anyway?

I needed to do some changes in the machine driver as well, but it should 
work on devices like this HP now. SOF will create PCM nodes for HDMI/DP, 
but they will never be connected -- these ports will be handled by the DGPU 
driver.

The one thing I haven't checked is how UCM behaves when the "Jack" nodes 
for HDMI/DP are not created. That may require some further changes to UCM 
(fortunately with UCMv2 we can now additionl conditional statements to 
cover this case as well). Another option is to create dummy mixer nodes, 
but that's not yet in my patch series.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
