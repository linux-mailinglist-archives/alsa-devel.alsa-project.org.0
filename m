Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C989F86446
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 16:25:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD0915E0;
	Thu,  8 Aug 2019 16:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD0915E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565274333;
	bh=zisAmisbNkgLMZ63k97Q2PPHsuuj5tK84pDsVg7owV4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E68B8weVbb1mMJeD3XkPFWIwI83X4f3ZnVK2sQpq0GbUJ7TQLshfzzBV/UCllzloz
	 2gwU+i8xHd1UK6s2rD5UGFEO9O9WRgmCAqDO3g8FEEmXc/7cpr2bSKK5HCf7z/+vJN
	 th4+suFsqvy5yTTi9Fd22BDp+EmOt+dL6E1zoTgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E540F8053A;
	Thu,  8 Aug 2019 16:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55FF2F80534; Thu,  8 Aug 2019 16:23:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EB7EF800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 16:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EB7EF800E3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 07:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; d="scan'208";a="182608201"
Received: from spenceke-mobl1.amr.corp.intel.com (HELO [10.251.157.200])
 ([10.251.157.200])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2019 07:23:40 -0700
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20190808095715.29713-1-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ae7d32fe-a279-8309-2370-1832edcce413@linux.intel.com>
Date: Thu, 8 Aug 2019 09:23:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808095715.29713-1-tiwai@suse.de>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 0/3] ALSA: hda: bus cleanup
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



On 8/8/19 4:57 AM, Takashi Iwai wrote:
> Hi,
> 
> this is a few patches to simplify and cleanup the HD-audio bus ops.
> 
> The first two patches translate the indirect calls of DMA page
> allocation and MMIO accesses with the direct ones, as well as
> eliminating the whole bus->io_ops.
> 
> The last one is SOF-specific, and fixes/cleans up by calling the
> proper hdaudio bus init function, as formerly discussed.

This is a good cleanup, thanks Takashi.

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

One request from me since I am lazy: could we somehow merge branches 
between you / Mark since at the moment we have two sets of conflicts 
(NHLT and this one). We test all the upstream changes on hardware as 
soon as we can, and manual conflict resolution makes it slower/more 
error prone.

> 
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (3):
>    ALSA: hda: Remove page allocation redirection
>    ALSA: hda: Direct MMIO accesses
>    ASoC: SOF: Intel: Initialize hdaudio bus properly
> 
>   include/sound/hdaudio.h                | 69 +++++++++++++--------------
>   include/sound/hdaudio_ext.h            |  1 -
>   sound/hda/Kconfig                      |  3 ++
>   sound/hda/ext/hdac_ext_bus.c           | 60 +-----------------------
>   sound/hda/hdac_bus.c                   | 36 ++++++++++++--
>   sound/hda/hdac_controller.c            | 18 +++----
>   sound/hda/hdac_stream.c                |  8 ++--
>   sound/pci/hda/Kconfig                  |  1 +
>   sound/pci/hda/hda_controller.c         |  6 +--
>   sound/pci/hda/hda_controller.h         |  3 +-
>   sound/pci/hda/hda_intel.c              | 71 ++--------------------------
>   sound/pci/hda/hda_tegra.c              | 84 +--------------------------------
>   sound/soc/intel/skylake/skl-messages.c | 15 +-----
>   sound/soc/intel/skylake/skl.c          |  7 ++-
>   sound/soc/sof/intel/hda-bus.c          | 85 ++++------------------------------
>   sound/soc/sof/intel/hda-dsp.c          |  2 +-
>   sound/soc/sof/intel/hda.c              |  6 +--
>   sound/soc/sof/intel/hda.h              |  3 +-
>   18 files changed, 107 insertions(+), 371 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
