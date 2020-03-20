Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BCB18C5AF
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 04:23:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B5017C9;
	Fri, 20 Mar 2020 04:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B5017C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584674591;
	bh=P+FjRK2wXx/zGqnWUz4J8BzKVLQR19Evv1TIJT/tL0I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C6DiPE362coFKt+PAnkbDuuKvW/qy39Mu6NQaLLkYjlojOGNSVP2Npy+ddY6YhcHZ
	 59CSFMZ0C1OiaD5bOrRg3rcs05FJsAPpHqkuDQn1RBAHW9WJ5m9AidAN3YnhQTqQJc
	 O0uWbA1ETISCC87qxYjNjMxdhqKX0ActWxnWdllQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DED24F800C0;
	Fri, 20 Mar 2020 04:21:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B169EF8015B; Fri, 20 Mar 2020 04:21:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41914F800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 04:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41914F800C0
IronPort-SDR: 6QRANaKpFGL40cQHjR0lLkNJEnXmNDfMXG/6Bpqqet4VIYynrvn3hg4u79z6wylZAlj632xDGw
 CZ3HDnegSTBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 20:21:19 -0700
IronPort-SDR: mR03DYeqvkIQcgn0WcWd2qJ7otYBW15lrJjlF8zdd6PSU699Wr5FRC2o0WZ3rL9yRLtxxBUDjJ
 ut+0mQv3w5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; d="scan'208";a="324731214"
Received: from jliu231-mobl1.ccr.corp.intel.com (HELO [10.254.208.65])
 ([10.254.208.65])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2020 20:21:16 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <eef45d20-3bce-184a-842c-216c15252014@linux.intel.com>
 <20200319173502.GC3983@sirena.org.uk>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <0d01b2ce-9531-1a08-e632-4608ab894fbe@linux.intel.com>
Date: Fri, 20 Mar 2020 11:21:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319173502.GC3983@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 kuninori.morimoto.gx@renesas.com, curtis@malainey.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com
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



On 3/20/20 1:35 AM, Mark Brown wrote:
> On Thu, Mar 19, 2020 at 12:21:47PM -0500, Pierre-Louis Bossart wrote:
>> On 3/19/20 11:51 AM, Dominik Brodowski wrote:
> 
>>> That patch fixes the issue(s). I didn't even need to revert 64df6afa0dab
>>> ("ASoC: Intel: broadwell: change cpu_dai and platform components for SOF")
>>> on top of that. But you can assess better whether that patch needs care for
>>> other reasons; for me, this one-liner you have suggested is perfect.
> 
> Good news!
> 
>> .ignore_suspend is set for bdw-rt5677.c and bdw-rt5650.c as well. I don't
>> know if that was intentional.
> 
> The intended use case is for applications doing audio during suspend
> like telephony audio between the modem and CODEC on a phone or
> compressed audio playback.  I guess the compressed audio playback case
> could possibly apply with these systems though x86 suspend/resume is
> usually sufficiently heavyweight that it's surprising.

I think that's true, on many of SKL- intel platforms(byt, hsw, bdw), we 
are seeing this .ignore_suspend set with offload or deep buffer FE 
dai_links configured together.

So it looks we can't ignore calling codec's suspend/resume callbacks 
during the power cycle for rt286 codec(on the Dell XPS here), which is 
actually supported on Chromebook SAMUS(rt5677)?

Thanks,
~Keyon

> 
