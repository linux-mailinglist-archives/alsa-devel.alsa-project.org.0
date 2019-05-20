Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 709B2241C1
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 22:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA60A42;
	Mon, 20 May 2019 22:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA60A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558382888;
	bh=Po60rmMMjiqg8wDfdiBYPjfxFI8hBM/Ry2stN4WMKdg=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oNscZT3VuZw7DJhB+nuUmyOwIUMliGQ88QCES+PWJ3okpCdwWgMGpFIduha6qMtbz
	 FiSgrx/xKO17pl5nomBi6T5n7gVYmamCMDXEWTDnFc2eM50wZAz2jQtb4QvRXxx+xA
	 6NSXHeqjhUkJUFDDa3A7RvqopNrVZmD4MxW1Bozk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A423CF8962F;
	Mon, 20 May 2019 22:06:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7F11F8961D; Mon, 20 May 2019 22:06:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86954F8065E
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 22:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86954F8065E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 13:06:16 -0700
X-ExtLoop1: 1
Received: from iabraham-mobl1.amr.corp.intel.com (HELO [10.252.193.181])
 ([10.252.193.181])
 by fmsmga006.fm.intel.com with ESMTP; 20 May 2019 13:06:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87imu939x3.wl-kuninori.morimoto.gx@renesas.com>
 <0ba565ea-2f61-015d-f6e3-63124f94e78a@linux.intel.com>
 <87pnoeyo9f.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <513fa7aa-60ca-dea2-1888-1d9df531f478@linux.intel.com>
Date: Mon, 20 May 2019 15:06:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87pnoeyo9f.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-core: WARN() is not related
 to component->driver->probe
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

Hi Morimoto-san,

>>> 	if (component->driver->probe) {
>>> 		ret = component->driver->probe(component);
>>> 		...
>>> (A)		WARN(...)
>>> 	}
>>> (B)	WARN(...)
> (snip)
>> This WARN() was added in 2012 by ff541f4b2a75 ('ASoC: core: giving
>> WARN when device starting from non-off bias with idle_bias_off')
>>
>> The commit message hints at an intentional check
>>
>> "
>> Just found some cases that some codec drivers set the bias to _STANDBY
>> and set idle_bias_off to 1 during probing.
>> It will cause unpaired runtime_get_sync/put() issue. Also as Mark
>> suggested, there is no reason to start from _STANDBY bias with
>> idle_bias_off == 1.
>>
>> So here giving one warning when detected (dapm.idle_bias_off == 1) and
>>      (dapm.bias_level != SND_SOC_BIAS_OFF) just after driver->probe().
>> "
>>
>> My take is that unless we can prove this is incorrect we leave it as is.
> 
> I think this commit is correct, thanks.
> But, then, it sounds we need to check it even though without .prove ?

Sorry, I am not getting your question.
I don't have a trace of which codecs need this check, and I don't know 
either if this check needs to be done in other cases than the .probe(). 
Given all this, why would we try to move this WARN statement outside of 
the .probe case? It seems like asking for trouble.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
