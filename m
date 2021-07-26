Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4183D6862
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 23:03:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C98D1B0A;
	Mon, 26 Jul 2021 23:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C98D1B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627333390;
	bh=FWmCm3XBbToS9cEkqweOQlixriiLx8fEMqPxg2TW898=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0hNDVjyrBOouUTJ1JJ9xeQ9qhnmNsDhfYBjKFX10GDiTNnr2bAc0nVU5Kw3S43Wu
	 +q9dFilC9SpC1PGIum+0Aa7fKOHPKVmhbBLPLTecH0egsQsktg5UG/ECLqbLeTlEGQ
	 ae5IxRHA4hT//YXRDvUaw4AKoR95qdgIx6rMAcLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7FCDF8025E;
	Mon, 26 Jul 2021 23:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17F5F8025A; Mon, 26 Jul 2021 23:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 723B1F80130
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 23:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 723B1F80130
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="273398800"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="273398800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 14:01:22 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="464057612"
Received: from tskelley-mobl.amr.corp.intel.com (HELO [10.212.14.236])
 ([10.212.14.236])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 14:01:21 -0700
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
To: Arnd Bergmann <arnd@arndb.de>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
 <CAK8P3a38tizZh1z=iJQotL3Tv3z8iK0qq2WCSy853M-nfwt4mQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9cbc71be-17b0-4a88-c8a1-a1e800894a56@linux.intel.com>
Date: Mon, 26 Jul 2021 16:01:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a38tizZh1z=iJQotL3Tv3z8iK0qq2WCSy853M-nfwt4mQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
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



> I have not done as much randconfig tested recently as I used to, but
> since I ramped up the rate again after the merge window, I have unfortunately
> once more run into a variation of this problem, with
> CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE=m and
> CONFIG_SND_SOC_SOF_HDA_COMMON=y:
> 
> x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function
> `hda_dsp_interrupt_thread':
> hda.c:(.text+0x739): undefined reference to `sdw_intel_thread'
> x86_64-linux-ld: hda.c:(.text+0x764): undefined reference to
> `sdw_intel_process_wakeen_event'
> x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_sdw_int_enable':
> hda.c:(.text+0x782): undefined reference to `sdw_intel_enable_irq'
> x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_sdw_startup':
> hda.c:(.text+0x7ac): undefined reference to `sdw_intel_startup'
> x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function
> `hda_sdw_process_wakeen':
> hda.c:(.text+0x7dc): undefined reference to `sdw_intel_process_wakeen_event'
> x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_dsp_probe':
> hda.c:(.text+0xee1): undefined reference to `sdw_intel_probe'
> x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_dsp_remove':
> hda.c:(.text+0xf7f): undefined reference to `sdw_intel_enable_irq'
> x86_64-linux-ld: hda.c:(.text+0xf8e): undefined reference to `sdw_intel_exit'
> 
> This only seems to appear very rarely, as I still did around 25000 randconfig
> builds since you merged the series, but this config does show the problem
> for any kernel version between the fix and the latest linux-next:
> 
> https://pastebin.com/raw/VCjcB3EU
> 
> I have only done the quick bisection but no analysis regarding what
> we may have missed back in March. I hope you can figure this out.

Thanks for this report Arnd.

I can reproduce the problem, the changes made 6 months back don't make
too much sense to me any longer. I have really no idea why I moved the
INTEL_SOUNDWIRE config to a boolean, that was asking for trouble.

I have a tentative fix being tested at
https://github.com/thesofproject/linux/pull/3066. I just moved the
select operations to a different option and reverted the INTEL_SOUNDWIRE
config to be an on/off switch from the user perspective, with
dependencies on built-in v. module checked inside.

