Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74113D161
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 02:06:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33FA817B0;
	Thu, 16 Jan 2020 02:05:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33FA817B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579136803;
	bh=8EnAE2D72Lkyfs53lBGSC4MJ4pWdBJkkND7Zk/mziEs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NN0tfYWlCquXEoPHkv+Hs5zsuSqapZRLeJv4m3lbXGHaWVImpl0VuH6sknDoyZWKx
	 KzVIcxniKmtm56kOsHQBwhYI8u5P/fDqk8BOlKGJ7lc6xpDjkdB/ZzkDSn6XzzjLq0
	 tGoehWqncdMVp5UHrje5UvJDgbIBrPTHxZQ0VwCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B64D9F800CC;
	Thu, 16 Jan 2020 02:04:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D127F801EB; Thu, 16 Jan 2020 02:04:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A14EDF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 02:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A14EDF800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 17:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="243098841"
Received: from cecox1-mobl.amr.corp.intel.com (HELO [10.251.131.55])
 ([10.251.131.55])
 by orsmga002.jf.intel.com with ESMTP; 15 Jan 2020 17:04:49 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
 <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
 <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
 <7de214eb-d6a0-3f86-9eb3-76488f0ec99f@linux.intel.com>
 <87r2001bsi.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6d0f1830-a2f0-997a-99cc-05c268acefc6@linux.intel.com>
Date: Wed, 15 Jan 2020 19:04:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87r2001bsi.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 ojab // <ojab@ojab.ru>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
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



>> a) remove the error handling after soc_dapm_add_routes() to be
>> backwards compatible with Intel problematic machine drivers. Not
>> really nice for everyone else.
>>
>> b) remove this error conditionally so that legacy Intel solutions
>> still work but new ones deal with errors upfront.
>>
>> I am not sure if there's a 'clean' way to implement b), maybe with a
>> Kconfig selected by some machine drivers? Morimito-san, any
>> suggestions now that we've root caused the problem (copied again below
>> for reference)?
> 
> Is it possible to *real* fixup in the future, some day ?

Quite unlikely I am afraid. This is a mismatch between topology and 
machine driver, and there are no planned updates of those topologies 
(which were never released for upstream use).

In this case I guess the topology file was taken from a ChromeOS 
distribution (based on v4.4 IIRC), so there's really no guarantee that a 
fix would ever reach the user without a convoluted set of manual updates.

> We need correct code, but backward compatibility is also needed.
> Not only Intel but some machine might have similar issue,
> so, how about to indicate WARNING, and comment ?
> 
> Like this
> 
>           ret = snd_soc_dapm_add_routes(dapm,
>                                         component->driver->dapm_routes,
>                                         component->driver->num_dapm_routes);
>          if (ret < 0)
>   -               goto err_probe;
>   +               /*
>   +                * This is error, but legacy Intel want
>   +                * compatibility until xxxx.
>   +                * call "goto err_probe" after that
>   +                */
>   +               dev_warn(dev, "DAPM route add failed.")

we already had a warning before:

[   22.364318] skl_n88l25_s4567 skl_n88l25_s4567: ASoC: Failed to add 
route iDisp3_out -> direct -> iDisp3 Tx

and it was ignored since there was no functional impact....

Maybe we could have some sort of boolean flag in the component->driver 
definition and explicitly request a backwards-compatible behavior (e.g. 
for all SKL/KBL machine drivers) when that driver is known to be flaky. 
There's already things like 'fully_routed', maybe we can add something 
such as 'disable_route_check'?
		
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
