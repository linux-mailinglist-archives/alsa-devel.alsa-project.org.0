Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FF3235A7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 03:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA151675;
	Wed, 24 Feb 2021 03:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA151675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614133607;
	bh=XRYKeIcJj2qmmwhkCWEj8Rk+CMl3gHq7JBkvgbN5b34=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCeXvRsSSIlX/QPhgHC4LciXizejpDwR3wGpXBU6TRTYcZnZFfxO7gr5iV83cMZ1R
	 d3/NF0xDIe1p5MvdMK+97pfLDKf2Ep2fkH/DwWegGBua2Yb/rtRGuzkZqs6PLSCo4s
	 M7sT9n8hDtQ0YiYsVknJOt++4jlQDO1nPmLuAGYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C423F8016D;
	Wed, 24 Feb 2021 03:25:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07B9DF8016A; Wed, 24 Feb 2021 03:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=NICE_REPLY_A,PRX_BODY_14,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDBD5F80167
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 03:25:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDBD5F80167
Received: from [123.112.65.229] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>) id 1lEjrK-0002rN-VB
 for alsa-devel@alsa-project.org; Wed, 24 Feb 2021 02:25:03 +0000
Subject: Re: [PATCH] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
To: alsa-devel@alsa-project.org
References: <20210223122205.233701-1-hui.wang@canonical.com>
 <s5hpn0rue0e.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <831dac8a-a36d-8ed7-556a-ff0e848f53be@canonical.com>
Date: Wed, 24 Feb 2021 10:24:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <s5hpn0rue0e.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 2/23/21 9:09 PM, Takashi Iwai wrote:
> On Tue, 23 Feb 2021 13:22:05 +0100,
> Hui Wang wrote:
>> If the platform set the dyn_pcm_assign to true, it will call
>> hdmi_find_pcm_slot() to find a pcm slot when hdmi/dp monitor is
>> connected and need to create a pcm.
>>
>> So far only intel_hsw_common_init() and patch_nvhdmi() set the
>> dyn_pcm_assign to true, here we let tgl platforms assign the pcm slot
>> dynamically first, if the driver runs for a period of time and there
>> is no regression reported, we could set no_fixed_assgin to true in
>> the intel_hsw_common_init(), and then set it to true in the
>> patch_nvhdmi().
>>
>> This change comes from the discussion between Takashi and
>> Kai Vehmanen. Please refer to:
>> https://github.com/alsa-project/alsa-lib/pull/118
>>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> As this would "fix" actual use cases, I'd love to merge this for 5.12,
> but of course it needs to be verified beforehand.
>
> So this was actually tested in your side, right?
>
I tested it on TGL machines with Ubuntu,  both sof and legacy hda, so 
far there is no regression.

Regards,

Hui.

> thanks,
>
> Takashi
>
