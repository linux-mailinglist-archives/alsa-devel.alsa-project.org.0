Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF1224194
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 19:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0FFD165E;
	Fri, 17 Jul 2020 19:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0FFD165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595006114;
	bh=SqYmNwC6ZSrl6wHC8kHcBV4fhxx2WSURotEFJtCDR3U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vk8rX+JE1oM/lPDGBfSV1LlJTzKMoOe30sDZ3kjVvk62RaYTqFmTNUQBisNLnsHrZ
	 n1fCIECvoi9Jh+ls7RteCkkqJd+V5XL6yGP2fWIqQFwVXl0fLfK+B0hkHUg3XMJSfE
	 6O58jBpnuthfGTGS7x7OI2KOyn2aRhx28LznUBFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 189A7F8014E;
	Fri, 17 Jul 2020 19:13:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A687AF80217; Fri, 17 Jul 2020 19:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CFFEF80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 19:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CFFEF80110
IronPort-SDR: +Q/NUJJ741SlKuBjQf4N5a8bZcPyCuFpK39T2/kutAYsiSMEleuOdLldM7Et9GXLPjgX66wWhP
 KJLM3FIOJ7EQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="129209826"
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="129209826"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 10:13:16 -0700
IronPort-SDR: EaN2GhY6u+2P7yGhSgA+vtRIemJ/p+/VQYCdWZicF3mlqYjjT2iwlOf8S80uPgk6bbwvnSyeGs
 grWABHYHl5tA==
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="460911188"
Received: from krkamatg-mobl.amr.corp.intel.com (HELO [10.254.77.31])
 ([10.254.77.31])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 10:13:15 -0700
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
 <20200616085409.GA110999@gerhold.net> <20200616090210.GA111206@gerhold.net>
 <254a667e-fa49-240a-6386-7e82df8e5c35@linux.intel.com>
 <20200616145251.GO4447@sirena.org.uk>
 <af973f45-59b9-ecff-7d78-97d8352ed072@linux.intel.com>
 <20200616164255.GR4447@sirena.org.uk>
 <1j1rla9s22.fsf@starbuckisacylon.baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8693bcb6-4c90-036d-79f0-87516e47f41b@linux.intel.com>
Date: Fri, 17 Jul 2020 12:13:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1j1rla9s22.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 tiwai@suse.de, Daniel Baluta <daniel.baluta@gmail.com>,
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


> Commit 25612477d20b ("ASoC: soc-dai: set dai_link dpcm_ flags with a
> helper") makes things worse (for me) by requiring all the elements on
> the link to support the stream direction for the direction to be enabled.
> 
> This breaks platforms where there is multiple codecs with different
> capabilities on a link. For example, we may have 2 codecs on a link, one
> doing playback, the other capture. This is the case on several Amlogic
> platforms.
> 
> With the new meaning of those flag, the card driver has to set something
> that ASoC core will also compute on its own, and verify it agrees with
> the card. This is redundant.
> What is the point of this ? Can't we just cut the middle man then ?
> 
> The old meaning at least allowed to pass the additional information that
> a direction was to be forcefully disabled. This is also redundant with
> capture_only/playback_only though ...

My plan was to remove two of the 4 flags after all configurations were 
checked.

> Can we revert this change until we figure out to do with those flags ?
> 
> I could propose a patch to move on but I'm not entirely clear what it kind
> of restriction we were trying to put on Multi-CPU links
> 
> IMO, on a Multi-CPU/Multi-Codec link, we should allow the direction as
> long as at least one CPU and one Codec on the link are capable of
> handling the direction (not all of them, as it seems to be set now)

You have a valid point Jerome. I must admit I was looking at TDM 
configurations, where we do want all DAIs in the same dailink to be 
consistent.

But when I checked older code there is indeed a precedent for some 
KabyLake platforms with an amplifier on playback and a microphone codec 
on capture for the same dailink.

I think your proposal of checking that at least one DAI matches the 
dailink capabilities, and conversely changing the helper to set the 
properties if one or more dais support a direction smay indeed be required.

If this was a feature and not a bug to have different capabilities on 
the same link so be it. Mark, do you concur?



