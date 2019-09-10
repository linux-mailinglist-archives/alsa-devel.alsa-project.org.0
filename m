Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D3AECB3
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 16:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CF6168A;
	Tue, 10 Sep 2019 16:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CF6168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568124857;
	bh=K3vo6WzkXohxYl4+2YXumPFgi4Qj3vO6dsztSqc/xMY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QhO9ulB1Cd9xA4VnCwLri+XQWUd1BJ3kfBvstKZducjERKTjFX5HrAYqjAGyqTchG
	 6YqXPROXro70iqqjqvNKyPF3m+3B/VyZSano29yqSS83U3WsENL9gdEJLT3Um5s7GG
	 4xQG0Y2kyeVobB80JYlTobSGSDLBPRFSCsuv9kcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B74F800E9;
	Tue, 10 Sep 2019 16:12:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54A9EF80368; Tue, 10 Sep 2019 16:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 783A2F800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 16:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 783A2F800C9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 07:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="186862805"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 10 Sep 2019 07:12:25 -0700
Received: from wkhong-mobl2.amr.corp.intel.com (unknown [10.255.34.248])
 by linux.intel.com (Postfix) with ESMTP id EA9DE58044E;
 Tue, 10 Sep 2019 07:12:23 -0700 (PDT)
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1567733058-9561-1-git-send-email-brent.lu@intel.com>
 <391e8f6c-7e35-deb4-4f4d-c39396b778ba@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402C9EA2@PGSMSX108.gar.corp.intel.com>
 <29b9fd4e-3d78-b4a3-e61a-c066bf24995a@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402CB9AC@PGSMSX108.gar.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <99769525-779a-59aa-96da-da96f8f09a8a@linux.intel.com>
Date: Tue, 10 Sep 2019 09:12:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CF33C36214C39B4496568E5578BE70C7402CB9AC@PGSMSX108.gar.corp.intel.com>
Content-Language: en-US
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint
	support
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


>> I also don't see any case where we support 4 channels in any broadwell
>> machine driver?
> It's the bdw-rt5650.c which only exists in chrome's 3.14 branch supporting Buddy
> project. They submitted the machine driver but not yet merged.
> 
> https://patchwork.kernel.org/patch/11050985/
> 
>>
>> So again can you point me to an issue or existing backport that requires the
>> patch below. Not trying to be obtuse but we should only change older
>> platforms when there is evidence that a change is needed.
> The story is Chrome has a tool called alsa_conformance_test which runs capture or
> playback against a PCM port with all possible configurations (channel, format, rate)
> then measure if the sample rate is correct. Since the channel max number reported
> is 4, it tests the 4-channel 48K capture and reports the actual sample rate is 24000
> instead of 48000. That's the reason we want to add a constraint in machine driver to
> avoid user space programs trying to do 4 channel recording since this machine does
> not support it in the beginning.

ok, that helps get context, thanks for the details.

I would have expected some error to be returned if there's a front-end 
opened with 4 channels and the back-end only supports two. Adding the 
constraint seems like a work-around to avoid dealing with the mismatch 
between FE and BE. I don't understand DPCM enough to suggest an 
alternative though. Ranjani, can you help on this one?

And even if we agree with this solution, it'd be nice to apply it for 
the Broadwell machine driver for consistency.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
