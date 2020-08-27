Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76C253ECE
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 09:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB2017D9;
	Thu, 27 Aug 2020 09:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB2017D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598512639;
	bh=1VdRf5CtWIyPIdXvS2wAEaKh5zW4UzsiNlRDUA6XX6U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/o/oA4nXNEqmqzGOW/FyzY+c/YimymRVvy7cs7Mz2UKLlQWheysv1dMoL3Ef58kO
	 RLRJy3QM1/Yt7AOVrFyQkWBGrmpsKKIICzV1B11mORa2PUqzo82cFJ37ZQOFMWI7gM
	 p8ItyeC/8MS0REdftQzuAAuIJgkFTze/urho0SFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 794A3F80105;
	Thu, 27 Aug 2020 09:15:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21A30F8016F; Thu, 27 Aug 2020 09:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7B9FF80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 09:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7B9FF80105
IronPort-SDR: l5oGs1gxbuBs65DbtHlQA90rhC5kara4TAaIjpmgcczCbdSoBFHqwSARoh8PhmfsrNlNV7VNRa
 tfAhzMIKlPgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="144193281"
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; d="scan'208";a="144193281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 00:15:30 -0700
IronPort-SDR: Zpm+ya4u91Zk+HFTnzEsfMZuveriW7ix0fFcTT2Hv0fvJEotLVmqf+NbcQu3eYwsPY142coxyd
 IiJ2JnYxKqDQ==
X-IronPort-AV: E=Sophos;i="5.76,358,1592895600"; d="scan'208";a="475094944"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 00:15:28 -0700
Date: Thu, 27 Aug 2020 10:14:18 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: intel/skl/hda - fix probe regression on systems
 without i915
In-Reply-To: <159542547442.19620.11983281044239009101.b4-ty@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2008271002260.3186@eliteleevi.tm.intel.com>
References: <20200714132804.3638221-1-kai.vehmanen@linux.intel.com>
 <159542547442.19620.11983281044239009101.b4-ty@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 kuninori.morimoto.gx@renesas.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com,
 Rander Wang <rander.wang@linux.intel.com>
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

+stable

On Wed, 22 Jul 2020, Mark Brown wrote:
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
[...]
> 
> [1/1] ASoC: intel/skl/hda - fix probe regression on systems without i915
>       commit: ffc6d45d96f07a32700cb6b7be2d3459e63c255a

please apply this to stable kernels as well. Without the patch, audio is 
broken with 5.8.x on many laptops (with Intel audio and non-Intel 
graphics). One more recent bug filed:
https://github.com/thesofproject/sof/issues/3345

This does _not_ affect 5.7.x and older, plus already fixed in 5.9-rc.

Br, Kai

