Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431AE36252A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B383116A8;
	Fri, 16 Apr 2021 18:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B383116A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618589290;
	bh=pW6+a3VOoMG7YVBCggLKNn1jpcH9k1zdARW9Ho4Pn1M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eg3HJBxfHC8N2iXtDijtk22bM0ffMu1hQ/Yl8D71hfNXGnD1uLR6//qApGUPKvt3I
	 eKTZnCq3TWjO6SDEgVsfOUQiKqDfPf9AL+8jwwA2mv203zvXN/WPH6oaN5wUlr/zsh
	 jS1EsFhPpCo7llISsRcYYvR4XuF20lCvkpfchj7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D942F800FF;
	Fri, 16 Apr 2021 18:06:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B871CF8025B; Fri, 16 Apr 2021 18:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCB09F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCB09F80128
IronPort-SDR: kVp+xgPkrRwT4BHCOV/fj5pLVU0a8xZqeASQ3SG5MYiFK3Dm2oQZ5+o/bC3aDZvvhWnZ7t3pH1
 bYYWRug+9rWA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="280379371"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="280379371"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 09:06:00 -0700
IronPort-SDR: 9gLszkYQcT7NbBxyEBOeH7bbcKzLUDEs34D4ETIswWWRMGwyHsZvL1YxD9DbzgvQ7ukUevs5Ta
 TlqiqUT5gEcg==
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="615993215"
Received: from jaolanlo-mobl.amr.corp.intel.com (HELO [10.212.2.231])
 ([10.212.2.231])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 09:05:59 -0700
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Jack Yu <jack.yu@realtek.com>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
 <20210330170915.GH4976@sirena.org.uk>
 <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
 <3102f11c-d2bc-c53e-ac68-60628b990515@linux.intel.com>
 <5292be30-7e2d-c2f2-85ed-a1a609feb6c6@linux.intel.com>
 <4166fcbe-4e62-74f4-b4cc-241ddd07e9dc@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <09eaea61-d330-4f88-29cc-15d7b70aa0c4@linux.intel.com>
Date: Fri, 16 Apr 2021 10:58:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4166fcbe-4e62-74f4-b4cc-241ddd07e9dc@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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


> The only my concern is that RT715 as an universal codec can handle the
> multiple stereo streams (current controls mapping) or the multichannel stream
> (new proposed controls mapping). The ASoC codec code should be universal, so
> it's a question, how to model the controls and how to detect and set the
> model. I think that we're missing a communication way between the DMA /
> machine driver and the codec driver. Yes, we can add DMI checks to RT715, but
> usually, the specific machines are already detected in the higher layer
> (soundwire bus, pci bus). It would be really nice, if the SOF driver can do a
> query: "If present, I need RT715 codec in the multichannel mode.".

The RT715 was an early SoundWire device, and it'll likely be superseded 
by the newer SDCA version. The direction for SDCA 'SmartMic' devices is 
not to manage independent stereo streams corresponding to different 
pairs of microphones, and it's not a solution we want to promote in the 
rest of the stack.

There will be multiple streams provided by the codec, but each stream 
will be tied to a given functionality (regular capture, buffered capture 
with triggers, voice, etc).

In addition, what can be configured by the user for volume/mute in 
'Feature Units' is after platform-specific channel 
remapping/mixing/processing. It could very well be that there are 4 mics 
in a platform but only 2 channels are provided to the host.

In other words, the streams generated by the codec and transmitted on 
the SoundWire bus will always be exposed with N channels, in a 
multichannel mode. We will need to report this N to UCM, currently 
that's missing, and the SOF topologies also have a limitation to 2ch 
that we will need to remove.

> So my opinion is that both mappings may exist and the correct one should be
> selected at runtime. So I won't delete the old mapping, it may be usable. Mark?

What I was suggesting is not to delete the old controls in UCM but make 
them conditional. If present you use them, otherwise you use the newer 
solution.

> BTW: I already implemented the control remap plugin to alsa-lib, so you can
> split / merge controls with similar parameters as you like now. I need to do
> more test with the UCM integration, but it's here.
> 
> https://github.com/alsa-project/alsa-lib/blob/master/src/control/control_remap.c#L1197

thanks for the pointer, I'll have to look into this.
