Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B4B0F94
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 15:08:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3C41744;
	Thu, 12 Sep 2019 15:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3C41744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568293729;
	bh=JfYS2/M1QkffhVYnWbxgESBN0WPFHTKDIkSD5vYDTi4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMS8FsACyG7dLBzU6EU7ZKFFiXAwBsSqFIif1CvFVNll5hTdxiAPh/UGwsa/K6q9Z
	 Mdyfy3XkCTjj+UTMfc7pzed0iKnSZYqKgnS8ohrqgh3nK4fromzT8t65mm0/LLNGPs
	 JmbNOY1LZmewstVazW2afKTImAew/DdnFgdM6dSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0794DF80368;
	Thu, 12 Sep 2019 15:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E24EF80368; Thu, 12 Sep 2019 15:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE277F80143
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 15:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE277F80143
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 06:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="189988369"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 06:06:56 -0700
Received: from vjyoung-mobl.amr.corp.intel.com (unknown [10.251.12.73])
 by linux.intel.com (Postfix) with ESMTP id E1E3C580862;
 Thu, 12 Sep 2019 06:06:54 -0700 (PDT)
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1567733058-9561-1-git-send-email-brent.lu@intel.com>
 <391e8f6c-7e35-deb4-4f4d-c39396b778ba@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402C9EA2@PGSMSX108.gar.corp.intel.com>
 <29b9fd4e-3d78-b4a3-e61a-c066bf24995a@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402CB9AC@PGSMSX108.gar.corp.intel.com>
 <99769525-779a-59aa-96da-da96f8f09a8a@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C7402DBB9B@PGSMSX108.gar.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <34604b9a-f479-3f92-7917-84f295a82fd8@linux.intel.com>
Date: Thu, 12 Sep 2019 08:06:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CF33C36214C39B4496568E5578BE70C7402DBB9B@PGSMSX108.gar.corp.intel.com>
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

On 9/12/19 1:00 AM, Lu, Brent wrote:
>>>
>>> The story is Chrome has a tool called alsa_conformance_test which runs
>>> capture or playback against a PCM port with all possible
>>> configurations (channel, format, rate) then measure if the sample rate
>>> is correct. Since the channel max number reported is 4, it tests the
>>> 4-channel 48K capture and reports the actual sample rate is 24000
>>> instead of 48000. That's the reason we want to add a constraint in
>>> machine driver to avoid user space programs trying to do 4 channel
>> recording since this machine does not support it in the beginning.
>>
>> ok, that helps get context, thanks for the details.
>>
>> I would have expected some error to be returned if there's a front-end
>> opened with 4 channels and the back-end only supports two. Adding the
>> constraint seems like a work-around to avoid dealing with the mismatch
>> between FE and BE. I don't understand DPCM enough to suggest an
>> alternative though. Ranjani, can you help on this one?
>>
>> And even if we agree with this solution, it'd be nice to apply it for the
>> Broadwell machine driver for consistency.
> 
> It's not only the mismatch but also the design limitation. According to the
> information from google, the board (samus) only uses two microphone so
> 3 or 4 channel recording are not supported. That's the reason we leverage
> the constraint from other machine driver (like kbl_da7219_max98357a.c)
> to remove the 3 and 4 channel recording option.

The design limitation is already handled by the fact that the SSP 
operates in 2ch mode, so it's a different case from KBL where indeed the 
DMIC-based back-end can support 4 channels.

> 
> The difference after the constraint is implemented is that the
> snd_pcm_hw_params_set_channels() function will return error (Invalid
> argument) when channel number is 3 or 4 so the application knows the
> configuration is not supported.

I get the error, I am just wondering if the fix is at the right 
location. I'll look into it, give me until tomorrow.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
