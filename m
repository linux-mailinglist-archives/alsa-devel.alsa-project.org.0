Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1160DDEA7A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 13:11:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DAFD1614;
	Mon, 21 Oct 2019 13:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DAFD1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571656287;
	bh=cMMz/nZbMjOZmNVU/dbsmaEJAe13C+XmrSFXgzjE8rU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NiCdrZVx3NA1rB1HVE0suz5Ha6zWWMSRTeRRGh5RxVuwvCEV09ktZFJISqraa1x2O
	 yZXqvSBynwUODpq1S5dIgkiA0oc+AdGMVWTGao6t5J+iM78sVtrWL+QQqZH8WK1CpX
	 Qwevt1gEnPFfU2obPze2K/6APn9uhlF9CIjVL2Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86683F80112;
	Mon, 21 Oct 2019 13:08:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B41BF8060F; Mon, 21 Oct 2019 13:08:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D23F80112
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 13:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D23F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 04:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; d="scan'208";a="187507860"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 21 Oct 2019 04:08:02 -0700
Received: from atirumal-mobl1.amr.corp.intel.com (unknown [10.251.26.228])
 by linux.intel.com (Postfix) with ESMTP id 5A59058029D;
 Mon, 21 Oct 2019 04:08:01 -0700 (PDT)
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1570007072-23049-1-git-send-email-brent.lu@intel.com>
 <CF33C36214C39B4496568E5578BE70C74031B9FD@PGSMSX108.gar.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <63da3995-b807-f9e6-6f09-a90e6b8e8e53@linux.intel.com>
Date: Mon, 21 Oct 2019 05:41:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CF33C36214C39B4496568E5578BE70C74031B9FD@PGSMSX108.gar.corp.intel.com>
Content-Language: en-US
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Zavras,
 Alexios" <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: enable runtime channel
 merge
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


>> In the DAI link "Capture PCM", the FE DAI "Capture Pin" supports 4-channel
>> capture but the BE DAI supports only 2-channel capture. To fix the channel
>> mismatch, we need to enable the runtime channel merge for this DAI link.
>>
> 
> Hi Pierre,
> 
> This patch is for the same issue discussed in the following thread:
> https://patchwork.kernel.org/patch/11134167/
> 
> We enable the runtime channel merge for the DMIC DAI instead of adding a
> machine driver constraint. It's working good on chrome's 3.14 branch (which
> requires some backport for the runtime channel merge feature). Please let
> me know if this implementation is correct for the FE/BE mismatch problem.

Sorry, I don't fully understand your points, and it's the first time I 
see anyone use this .dpcm_merged_chan field for an Intel platform.

If I look at the code I see that the core would limit the number of 
channels to two. But that code needs the CPU_DAI to use 2 channels, 
which I don't see. So is this patch self-contained or do we need an 
additional constraint on the FE?

Thanks
-Pierre

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
