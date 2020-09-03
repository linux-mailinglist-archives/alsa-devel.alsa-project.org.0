Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FB25BD57
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 10:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7918A18D8;
	Thu,  3 Sep 2020 10:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7918A18D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599122011;
	bh=dFaiGRz8BxlI8ZNWDMFJ1w9nLxXXQe3KqARSm6P1AKg=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d77FM75ts+zlxOx4pmhz16ahrDwLiBD/AuPHNyZ06GTIznoucalY5+nHOJYX1Rb27
	 P8Bv76XRkIKsca+Wa4ceq3qXUHChY8CpaRGZatFVIB+/zDEPMElw7ZaWzoO/Ld3ZlL
	 SnLUqiAR2sLddPRH0v1fq0WRPK2MNenVAe16vdzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C31F8021D;
	Thu,  3 Sep 2020 10:31:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0166AF80217; Thu,  3 Sep 2020 10:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1548F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 10:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1548F801DA
IronPort-SDR: 8T6xbcwHetI3H4MfEwvBU75swd5xSoEIqk5FaXNLo1I79Fq+0nYDUDo4UUhSYu24aQ5RVeRy9o
 V4wPnipYWkVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="155044547"
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="155044547"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 01:31:38 -0700
IronPort-SDR: 9Mo/rSbYL2wz5vbp3DJKtyjGFUcsE8xtmgAsg9BRNfojeh2o/Rx8ZIRBDS0RYDXGyjk0nkp6nX
 bOkziLLDsIAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; d="scan'208";a="302128886"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.10.75])
 ([10.213.10.75])
 by orsmga006.jf.intel.com with ESMTP; 03 Sep 2020 01:31:36 -0700
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC] soc_pcm_open: error path behavior change since v5.6
Message-ID: <48810933-41cf-265c-1784-2e2acf979720@intel.com>
Date: Thu, 3 Sep 2020 10:31:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>
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

Hello,

Some time ago negative-tests found out that behavior of soc_pcm_open has 
changed, quite sure this might be a regression hence my email. Till v5.6 
soc_pcm_open was invoking ::shutdown() for cpu_dai in error path only if 
::startup() succeeded first (label: 'out'). After addition of commit:

	5d9fa03e6c3514266fa94851ab1b6dd6e0595a13
	ASoC: soc-pcm: tidyup soc_pcm_open() order

this is no longer true. ::shutdown() can and will be invoked for given 
cpu_dai despite ::startup()'s failure. This complicated further since 
the merging of cpu & codec dais.

The same applies to codec_dais: notice the usage of 
for_each_rtd_codec_dai_rollback macro instead of for_each_rtd_dais in 
error path in v5.6.

Should dai's ::shutdown() be introducing some kind of state-check from 
now on? - similarly to how developers deal with some of the core pcm 
operations e.g.: ::prepare() (as it may get invoked multiple times in a 
row so check is there to prevent redundancy).
Or, perhaps behavior change should be reverted with ::shutdown() routine 
again being called only after successful ::startup()?

Czarek
