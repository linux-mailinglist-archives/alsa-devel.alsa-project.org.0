Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582AFB4A4
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 17:07:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2B11660;
	Wed, 13 Nov 2019 17:06:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2B11660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573661224;
	bh=P1k4wv4il3OsonT2u1kajKl+abtThmemHq7D8DemDcg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfCy8yb4TR43GaoRe/Psd++O1vrb73M41bJwkfjZaxVs92UiXMHQnPI7kNjv4Fu+n
	 WuDmK8tzKuU6stegvcyI/N987gwqo3t5kUJowv2jdDuVsSro6Olm5IAgnENHiUdsEP
	 ubQmEOjyTohGsq+voGYXIjYJznv2jgNtURD4YMnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3CCF80086;
	Wed, 13 Nov 2019 17:05:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E71C5F80086; Wed, 13 Nov 2019 17:05:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68BF9F80084
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 17:05:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68BF9F80084
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 08:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; d="scan'208";a="229789958"
Received: from dmsnyder-mobl1.amr.corp.intel.com (HELO [10.252.193.15])
 ([10.252.193.15])
 by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2019 08:05:06 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
 <8ed58ca1-0f9d-63e8-ba5d-28ee5209aee5@linux.intel.com>
 <87pnhx8xjl.wl-kuninori.morimoto.gx@renesas.com>
 <87o8xh8wyz.wl-kuninori.morimoto.gx@renesas.com>
 <87mud18ukk.wl-kuninori.morimoto.gx@renesas.com>
 <73feb970-bca5-b736-ce44-d44dacab02d1@linux.intel.com>
 <20191112190326.GJ5195@sirena.co.uk>
 <ce011d55-b1b2-7bd9-9de3-48fb616703f0@linux.intel.com>
 <87lfsk4cit.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3e4b8289-8e59-d8fe-635b-d55d2b20de5d@linux.intel.com>
Date: Wed, 13 Nov 2019 10:05:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <87lfsk4cit.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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



On 11/12/19 10:37 PM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your report
> 
>>>> +       for_each_rtd_components(rtd, rtdcom, component) {
>>>> +               pr_err("plb: %s processing component\n", __func__);
>>>> +               if (!component)
>>>> +                       pr_err("plb: %s component is NULL\n", __func__);
>>>
>>> Could you perhaps add traces of which components are being accessed at
>>> each stage?  We might want to go through and just add something like
>>> that in the code anyway to help figure things out.
>>
>> I tried to add more traces but couldn't triangulate on a clear issue,
>> and the traces have an Heisenbug effect.
>>
>> So I switched to higher-level code analysis: it turns out that
>> soc_dai_link_remove() routine is called from both topology and on card
>> cleanup.
>>
>> The patch 06/19 in this series essentially forces the pcm_runtimes to
>> be freed in both cases, so possibly twice for topology-managed
>> dailinks - or using information that's been freed already.
>>
>> I 'fixed' this by adding an additional parameter to avoid doing the
>> pcm runtime free from the topology (as was done before), and the
>> kernel oops goes away. My tests have been running for 45mn now, when
>> without change I get a kernel oops in less than 10-20 cycles (but
>> still more than apparently our CI tracks, something to improve).
>>
>> I pushed the code on GitHub to check if there are any negative points
>> reported by the Intel CI, should be complete shortly:
>> https://github.com/thesofproject/linux/pull/1469
>>
>> I am not sure the suggested fix is correct, I don't fully get what the
>> topology and card cleanups should do and how the work is split, if at
>> all.
> 
> BTW, I guess your kernel is appling this patch,
> but, is it correct ?
> 
> 	df95a16d2a9626dcfc3f2b3671c9b91fa076c997
> 	("ASoC: soc-core: fix RIP warning on card removal")

Sorry morimoto-san, I am not getting the question.

Are you asking if the patch is correct?

Or are you asking if the kernel used for this test include this patch? 
The answer is yes, this patch ("ASoC: soc-core: fix RIP warning on card 
removal") was merged by Mark and the SOF tree does use it, since we 
follow Mark's tree.

> If so, I think I could understand the issue.
> But, before explaining detail,
> I want to confirm that my solution is correct or not first.
> 
> Can you please check attached patch ?

Takashi's feedback seems to hint at problems with this patch, so will 
wait for further instructions here if you want me to test.
Thanks!

> Then, please remove above RIP warning patch.
> It is not clean patch, but OK to confirming, so far.
> I think
> 	- no kernel Oops
> 	- no RIP warning
> 
> Thank you for your help !!
> Best regards
> ---
> Kuninori Morimoto
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
