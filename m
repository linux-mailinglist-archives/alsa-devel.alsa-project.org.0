Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EA231D4F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 13:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1C5916FB;
	Wed, 29 Jul 2020 13:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1C5916FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596021736;
	bh=ulf/SGdA7uRFd0ys1fGy2FliAVSkgvh+oBrbnB65aVc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gaLKn8IuGJDY95eZDfqV/28tqQkvVbH4k7tyQGshEQ5waFCkJ2vHC4Ptuuz/OcVU0
	 79K8gxvnJ2d8cJZYI4FvMWH8knhRA46X9EC0BhKwI4+24dAivGdawyUbjHn/SwjrE4
	 0f11fAkpC/T9REcTrGyiKBCUOIKczc5qLsqcAV10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEDF6F801ED;
	Wed, 29 Jul 2020 13:21:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E9A8F801EB; Wed, 29 Jul 2020 13:21:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06EA9F80125
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 13:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06EA9F80125
IronPort-SDR: C9AdlZOoYp/Xp0fm3s0+9dbqy1MRBXZAohKbXvv0LU3kUdDi96BDb16Gd7GFCg7U5ALODwZwvp
 DfMWmM1hfTTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="130953801"
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="130953801"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 04:21:01 -0700
IronPort-SDR: uqPcMaoUSfpo404KJkP5rqAgdej4Bq4CoZPFgIA0ojK34SC5ckBeziVeNCr3s0uvbDpJskNQdK
 aZiFwh7DhfeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; d="scan'208";a="364818643"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001.jf.intel.com with ESMTP; 29 Jul 2020 04:20:57 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k0k8f-004gBc-KZ; Wed, 29 Jul 2020 14:20:49 +0300
Date: Wed, 29 Jul 2020 14:20:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH 0/2] Add period size constraint for Atom Chromebook
Message-ID: <20200729112049.GW3703480@smile.fi.intel.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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

On Wed, Jul 29, 2020 at 07:03:03PM +0800, Brent Lu wrote:
> Two different constraints are implemented: one is in platform's CPU
> DAI to enforce period sizes which are already used in Android BSP. The
> other is in Atom Chromebook's machine driver to use 240 as period size.

One nit to one patch.
Overall, LGTM and thus FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Brent Lu (1):
>   ASoC: intel: atom: Add period size constraint
> 
> Yu-Hsuan Hsu (1):
>   ASoC: Intel: Add period size constraint on strago board
> 
>  sound/soc/intel/atom/sst-mfld-platform-pcm.c | 15 +++++++++++++++
>  sound/soc/intel/boards/cht_bsw_max98090_ti.c | 14 +++++++++++++-
>  sound/soc/intel/boards/cht_bsw_rt5645.c      | 14 +++++++++++++-
>  3 files changed, 41 insertions(+), 2 deletions(-)
> 
> -- 
> 2.7.4
> 

-- 
With Best Regards,
Andy Shevchenko


