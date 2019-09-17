Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E393B5741
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 22:58:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 945801612;
	Tue, 17 Sep 2019 22:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 945801612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568753917;
	bh=cmVxGY9CNgG5851XFLgua1HZwWFnbmCoE1DTd99IdaI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDmugmQAaaoPO4iDtWRn0e3lJkBqJGxU1cfUFrgAfXNEbbOO1sO+bdbz/u9p4CWu/
	 ar73Hj/kytl7yVUkT2fnOwAwp9xaOtGMlgjpjEKYcfgtDNpiDcJ85wBGpkvXcbs2n6
	 S/nt+/bJa+eoXeBjBOlhRM900SIe7GWc2Y63jBmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38D24F8048E;
	Tue, 17 Sep 2019 22:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC6E1F8048E; Tue, 17 Sep 2019 22:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E02F801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 22:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E02F801DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 13:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; d="scan'208";a="387693269"
Received: from dlinn-mobl.amr.corp.intel.com (HELO [10.251.154.92])
 ([10.251.154.92])
 by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2019 13:56:55 -0700
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>, Mac Chiang <mac.chiang@intel.com>
References: <20190917103858.GA3524@sirena.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a71b94b7-7692-2f12-8568-488bf845742c@linux.intel.com>
Date: Tue, 17 Sep 2019 15:56:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917103858.GA3524@sirena.co.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] Build failure after merge of the sound-current
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 9/17/19 5:38 AM, Mark Brown wrote:
> After merging the sound-current tree, today's linux-next build for x86
> allmodconfig failed like this:
> 
> In file included from /home/broonie/next/next/sound/soc/intel/boards/sof_rt5682.c:23:
> /home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h: In function 'soc_intel_is_cml':
> /home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: error: 'INTEL_FAM6_KABYLAKE_MOBILE' undeclared (first use in this function); did you mean 'INTEL_FAM6_KABYLAKE_L'?
>   SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);

> caused by commit
> 
> 	c643c189f0fec116 (ASoC: Intel: boards: Add Cometlake machine driver support)
> 
> IIRC there was some previous discussion of a dependency on other changes
> here but I thought that was resolved?  I've reverted that commit for
> today.

Seems like a conflict with

af239c44e3f97 ('x86/intel: Aggregate big core mobile naming')

maybe we can have a temporary fix in the ASoC tree along the lines of

#ifdef INTEL_FAM6_KABYLAKE_L
#define INTEL_FAM6_KABYLAKE_MOBILE	INTEL_FAM6_KABYLAKE_L
#endif

and remove it when the initial patch is in an rc1?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
