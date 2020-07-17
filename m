Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1775122433B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 20:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE68515F2;
	Fri, 17 Jul 2020 20:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE68515F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595011018;
	bh=kqEmt+/VE9QLwRbyz3Ft6d4VRzQ2YHwL5knr7wxlukA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nD73kOG5yb0e2GXkvYoZwq385zSzUdAdnlCwOCuF4SJXQdwHUxXXibXISGuPGhfoL
	 OnkuR3crl2z1HnMMsYqtoacp1oUjq8KfI8x2K2kxK2yy1R+7UYpqyN1rjvb62aCXT9
	 IWoFNOlaYfT2ohpZXr4WAzdMvbgsB0Ff2Bm8ZCg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F23F8021D;
	Fri, 17 Jul 2020 20:35:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39D8CF80217; Fri, 17 Jul 2020 20:35:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCE89F8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 20:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE89F8014E
IronPort-SDR: yR73a3ZJQ6BVjxbUIhFBv18kOzB1WkSfcdSKp3UUGbq6TwwB6WByl/TvSBRlLWmTxIC/5ieb/b
 VkPh0kff7VcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="148820607"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="148820607"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 11:34:53 -0700
IronPort-SDR: gc7zJEwf5NvQw+AuJr3F0M3SalGbVD44pW9D9fqo5aJBvn99xR63VFLx2fkpRsu9DOYK+dMzDD
 s56nczF9j7AA==
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="460934442"
Received: from bnforneh-mobl.amr.corp.intel.com (HELO [10.255.230.26])
 ([10.255.230.26])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 11:34:52 -0700
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
To: Mark Brown <broonie@kernel.org>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net> <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616164255.GR4447@sirena.org.uk>
 <1j1rla9s22.fsf@starbuckisacylon.baylibre.com>
 <8693bcb6-4c90-036d-79f0-87516e47f41b@linux.intel.com>
 <20200717181833.GC905@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <581603a5-7d5c-65d9-602d-dbe925430464@linux.intel.com>
Date: Fri, 17 Jul 2020 13:34:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717181833.GC905@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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



On 7/17/20 1:18 PM, Mark Brown wrote:
> On Fri, Jul 17, 2020 at 12:13:14PM -0500, Pierre-Louis Bossart wrote:
> 
>>> IMO, on a Multi-CPU/Multi-Codec link, we should allow the direction as
>>> long as at least one CPU and one Codec on the link are capable of
>>> handling the direction (not all of them, as it seems to be set now)
> 
> ...
> 
>> If this was a feature and not a bug to have different capabilities on the
>> same link so be it. Mark, do you concur?
> 
> Yes.

ok, I cooked a quick patch to do this, testing on-going:
https://github.com/thesofproject/linux/pull/2293

