Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B038E1030B7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 01:26:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D1C1690;
	Wed, 20 Nov 2019 01:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D1C1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574209606;
	bh=vQlnl1pulZTv0J8sAkcPY9tMQ4pr8x7iw3ANhr9HlBQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMToY7kbvlG3AxzDYdZiWAZ4XbxOgTBwCEzFvDHYE86U73tQkhEzcKSThzLP1Q6L6
	 GoTcVDBDtc2N4wvVg2P/eM9uQeSgvV8wAFQNDhXKtW48mzYNGZGfVNGP8kWs+yYlRQ
	 kHiWsehabCOAgbOB9IOMj5fV+6Jft2/RF5RJzeFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 995C3F80139;
	Wed, 20 Nov 2019 01:25:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AFEFF80138; Wed, 20 Nov 2019 01:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B968F800F4
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 01:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B968F800F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 16:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,219,1571727600"; d="scan'208";a="258885125"
Received: from ecrawfox-mobl2.amr.corp.intel.com (HELO [10.255.230.177])
 ([10.255.230.177])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2019 16:24:51 -0800
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191119174933.25526-1-perex@perex.cz>
 <20191119174933.25526-2-perex@perex.cz>
 <72dfc285-70e8-706d-3018-535bda1e8630@linux.intel.com>
 <f2de9597-c9c2-7696-622b-a2bbc2c32bb7@perex.cz>
 <fb07b326-4c5d-43a7-4525-9d5fa71db95d@linux.intel.com>
 <afd834ff-cfb8-404c-2246-1b11b28d142b@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <11d04fcd-6c5c-ad36-1309-2b9bdf368110@linux.intel.com>
Date: Tue, 19 Nov 2019 18:24:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <afd834ff-cfb8-404c-2246-1b11b28d142b@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: Intel - use control components
 to describe card config
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


> Thinking more, we can create an ucm2 configuration which will handle 
> both cases (independent on CONFIG_SND_SOC_INTEL_USE_CTL_COMPONENTS). I 
> prepared an example:
> 
> https://github.com/alsa-project/alsa-ucm-conf/commit/f1c0083483e184eb7a5eee1f7d8cb4df66cac085 

That'd be fine with me. There's a bit of duplication but it's manageable.

Rather than keep this forever, may we force the use of these components 
for HDaudio+DMIC devices that are only handled by SOF, starting with 5.5 
w/ ucm2, and for older devices BYT/CHT devices ucm2 files are backwards 
compatible on two levels (SOF or legacy, and longnames or components)?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
