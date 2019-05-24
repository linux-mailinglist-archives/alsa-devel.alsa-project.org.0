Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 833E129E32
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 20:39:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0925E1717;
	Fri, 24 May 2019 20:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0925E1717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558723140;
	bh=9lAxoAGH7SB1iuikZxlsMN+/5rYGHRvcXUeQDcg/TH8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fccue/TKpLT0M5KjcJXgmoKEFy/SgAQnUVu5+GGaARzDtAi17UMd4qPLbMa9g1aLM
	 VKu2tB49uktxpz/7sK7S0HD89aivDYAr+Kd04i5RTPruSPkiRmkxcFLmCblz9ikKed
	 tCrN1o8nc8YNySk/1DmKI1b+CkNhLVN+pkyuLaKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95D60F89636;
	Fri, 24 May 2019 20:37:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89761F89633; Fri, 24 May 2019 20:37:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 996D4F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 20:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 996D4F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 11:37:05 -0700
X-ExtLoop1: 1
Received: from dravindr-mobl1.amr.corp.intel.com (HELO [10.254.105.104])
 ([10.254.105.104])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2019 11:37:04 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgt7p3zo.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <03cf0a3b-3464-57fd-c313-cfe8db01d2cd@linux.intel.com>
Date: Fri, 24 May 2019 10:58:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87sgt7p3zo.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 000/145] ASoC: modern dai_link style support
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

Hi Morimoto-san,

> These are for modern dai_link style support patches.
> [001/145] adds missing modern dai_link style for CPU.
> and others are switch to modern style from legacy style.
> Last patch removes legacy style.
> 
> These are based on mark/for-5.3 + v5.2-rc1
> 
> I hope these work well for all sound card, but I can't test for all.
> Please test these at each sound cards.

We're testing for Intel stuff w/ SOF.

One question: I try to enforce the use of checkpatch --strict to avoid 
different styles in the Intel contributions, and your series generates a 
ton of alignment warnings, e.g.

CHECK: Alignment should match open parenthesis
#45: FILE: sound/soc/intel/boards/sof_rt5682.c:373:
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
  							"ssp%d-port",

CHECK: Alignment should match open parenthesis
#81: FILE: sound/soc/intel/boards/glk_rt5682_max98357a.c:378:
+SND_SOC_DAILINK_DEF(idisp3_codec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("ehdaudio0D2", "intel-hdmi-hifi3")));

I am not too religious on style as long as there is a style.
I'd be fine if the expectation is that all the dailink definitions use a 
tab for readability (and it's a one-time change), but would like the 
functional code changes to be aligned to avoid future warnings.
Would that work for you? I can send you the Intel changes if that helps.

Thanks
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
