Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F161FF7E1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 17:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F342017A4;
	Thu, 18 Jun 2020 17:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F342017A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592495260;
	bh=OyR+aA+hYwdsP71S5fvodUrv61xpJxy20WB7uVWhr+k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZQFXlgQxC5JMnkXhbFM0KtTgjzmJTXxqHB44T37b2ejcc5Z52UZql8/5z9IWISaBZ
	 xzmBA0WvNlaZVMA9tSmwv1uBF3mTfyUyI+v4rVgIOHMg1IhtiV6PorVe8ASayqdWFr
	 cLdqC/v+pP34aIbhHMcD0iqIGsMq4BPNL8ebBdig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F9EF800D1;
	Thu, 18 Jun 2020 17:45:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF54F80116; Thu, 18 Jun 2020 17:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3F4EF80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 17:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F4EF80101
IronPort-SDR: VYnVQnaZZ35A4KTI3W/MmOBvkNHMsbvCwXrSqSoEtQOjwismRb/I6Re8j8OxQUEFRSUwLN5lB1
 p0DQhXgOValw==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="227327136"
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="227327136"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 08:45:48 -0700
IronPort-SDR: /jZyZ7aeQqspV9Di6+SVGSWa4SIPcybabyMPleC3cJhNjSFkRO8LqE/ZKGNpSd4RvXcRQEO4zp
 EI2h6Nj4kV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="317859568"
Received: from vktejasw-mobl2.amr.corp.intel.com (HELO [10.254.73.19])
 ([10.254.73.19])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Jun 2020 08:45:47 -0700
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
To: Mark Brown <broonie@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
References: <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616155544.GA8891@gerhold.net>
 <7cbc9233-e5f2-03e0-5659-cf22dea75e53@linux.intel.com>
 <45d43cc9-be22-a7d2-1628-3fb30232bd7c@linux.intel.com>
 <20200617090112.GA38317@gerhold.net>
 <62ccb59f-9d08-c241-952b-bb7af8311618@linux.intel.com>
 <20200617174635.GA40060@gerhold.net> <20200618150143.GJ5789@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <145da893-5cb4-63fc-b988-c048ee839785@linux.intel.com>
Date: Thu, 18 Jun 2020 10:45:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618150143.GJ5789@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 6/18/20 10:01 AM, Mark Brown wrote:
> On Wed, Jun 17, 2020 at 07:46:35PM +0200, Stephan Gerhold wrote:
> 
>> At the end the question is if those machine drivers that have
>> dpcm_playback/capture hardcoded just set it because it was required to
>> make DPCM work, or if they actually use it to restrict the direction of
>> a DAI link.

I think those flags are absolutely not DPCM specific, the only use I see 
for the flags is to set:

	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
		if (playback)
			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
		if (capture)
			pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
		goto out;
	}

and that's why I highlighted some time back that they are probably 
redundant with capture_only and playback_only. We don't need 4 flags to 
specify 2 directions.

In all cases the use for those flags seems to be to restrict the 
direction of a DAI link.

Note that people can screw-up the configurations without DPCM, e.g. by 
not setting capture_only for a microphone, I found last week a WoV DAI 
link on Broadwell where the capture_only flag was not set... DPCM does 
not have a monopoly on brokenness...

> The other question would be if they are restricting it to limit the
> direction of a DAI link beyond the limits that the hardware has why are
> they doing that?  I'm not sure that'd be a sensible thing to do.

I don't see any such case. When both directions are not set, it's only 
because the hardware is only capable of one, e.g. dmic, HDMI or SoundWire.

There's one set of cases where we have amplifiers on an SSP link (which 
is bidirectional), but the amplifier itself does not provide any 
capture/feedback. That part is probably borderline incorrect, but 
harmless since the topology does not try to use those links for capture.

