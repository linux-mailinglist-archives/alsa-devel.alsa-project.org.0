Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC0F9B7E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 22:10:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E6A81669;
	Tue, 12 Nov 2019 22:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E6A81669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573593040;
	bh=tYHVqqQXu5dQ/vVsua1skNcAlMYlAO+YORhg6EMtPi0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4JNwUOnLUd+syQlpNYKNhRree/5ICnuO/56fPG4kZ8ZjBMY3ooqr7Vja5ERnxE/Z
	 nwPUsfnIQJZxhAmlrHDDuM3IkjEepEIXzOnhkD+Yz8zDLn2pnjP+CK2UYrPjBFKzvj
	 9GIdEv3zLFYV4onl5eonubHYMmGOvdncNJX8qhsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 150E6F80507;
	Tue, 12 Nov 2019 22:08:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ABFFF804CF; Tue, 12 Nov 2019 22:08:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4FAF80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 22:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4FAF80275
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 13:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; d="scan'208";a="235016902"
Received: from ticela-or-053.amr.corp.intel.com (HELO [10.254.108.180])
 ([10.254.108.180])
 by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2019 13:08:46 -0800
To: Mark Brown <broonie@kernel.org>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
 <8ed58ca1-0f9d-63e8-ba5d-28ee5209aee5@linux.intel.com>
 <87pnhx8xjl.wl-kuninori.morimoto.gx@renesas.com>
 <87o8xh8wyz.wl-kuninori.morimoto.gx@renesas.com>
 <87mud18ukk.wl-kuninori.morimoto.gx@renesas.com>
 <73feb970-bca5-b736-ce44-d44dacab02d1@linux.intel.com>
 <20191112190326.GJ5195@sirena.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ce011d55-b1b2-7bd9-9de3-48fb616703f0@linux.intel.com>
Date: Tue, 12 Nov 2019 15:08:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191112190326.GJ5195@sirena.co.uk>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v3 06/19] ASoC: soc-core: add
 soc_unbind_dai_link()
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


>> +       for_each_rtd_components(rtd, rtdcom, component) {
>> +               pr_err("plb: %s processing component\n", __func__);
>> +               if (!component)
>> +                       pr_err("plb: %s component is NULL\n", __func__);
> 
> Could you perhaps add traces of which components are being accessed at
> each stage?  We might want to go through and just add something like
> that in the code anyway to help figure things out.

I tried to add more traces but couldn't triangulate on a clear issue, 
and the traces have an Heisenbug effect.

So I switched to higher-level code analysis: it turns out that 
soc_dai_link_remove() routine is called from both topology and on card 
cleanup.

The patch 06/19 in this series essentially forces the pcm_runtimes to be 
freed in both cases, so possibly twice for topology-managed dailinks - 
or using information that's been freed already.

I 'fixed' this by adding an additional parameter to avoid doing the pcm 
runtime free from the topology (as was done before), and the kernel oops 
goes away. My tests have been running for 45mn now, when without change 
I get a kernel oops in less than 10-20 cycles (but still more than 
apparently our CI tracks, something to improve).

I pushed the code on GitHub to check if there are any negative points 
reported by the Intel CI, should be complete shortly:
https://github.com/thesofproject/linux/pull/1469

I am not sure the suggested fix is correct, I don't fully get what the 
topology and card cleanups should do and how the work is split, if at all.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
