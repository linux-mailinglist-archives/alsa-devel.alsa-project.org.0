Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A9327D0
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 06:45:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9DB41665;
	Mon,  3 Jun 2019 06:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9DB41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559537148;
	bh=yh//7ek6XKByfTTu8jysAl79nANpDJzWLAkjP0S6WvQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlacKOgr/wW+MWADioTqfryoQ73sHU4gzVb0bOfIuKnEXptw5YtCyi3f2EtD3qKsx
	 Evo535+D+9oUuFe7xeRKGjlScbpv5rJb3OA3SW+IXYTrxVMs0oqyMoG8GicoG8ny3m
	 z2b1jGBZ52B3Al6trI/I2D50HqizRzj7TLY+qK9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84242F896CE;
	Mon,  3 Jun 2019 06:44:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89C4FF896DD; Mon,  3 Jun 2019 06:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C564F80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 06:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C564F80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="ZSkcTZb6"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="Q9RB65tm"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 01DA4609CD; Mon,  3 Jun 2019 04:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559537036;
 bh=ttpWugHMy8518Beje3tyTXiTDX9IdodmG9+Gvem9yrg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZSkcTZb6U+WDnqHhirCDrCWcow4LIQVKDwnUR2qagdYPfYAVhU/jCfmgXvBdskSxt
 MUBbG644ggb4FaEiDJZkCC/rrWwp5BdAwKcxyKYRgXIoWUaYThYS2XsL44hLmZiMbR
 Mm3+QfOfEy7JD3uTgYeGen2iwZDvMALM7D4rpAGg=
Received: from [10.110.39.2] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A40460237;
 Mon,  3 Jun 2019 04:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559537035;
 bh=ttpWugHMy8518Beje3tyTXiTDX9IdodmG9+Gvem9yrg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q9RB65tm0hDa1g3h7O4c8T0zS4lK2KiIHARvnYsRhhgTP/0KIxKLXuXjC0zJe/IO1
 zNI5tjprlkKHaYk5ll0w4PjAIbxmC1QY9LsfKJD6hByVWC1t2d+s6MgPCCYgz7armJ
 zWjusqj54zYY5u6Sy96apPUd6W+zntXNg+8D/Buk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A40460237
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
To: Takashi Iwai <tiwai@suse.de>
References: <1559021223-28674-1-git-send-email-bgoswami@codeaurora.org>
 <s5hftoz870o.wl-tiwai@suse.de>
From: Banajit Goswami <bgoswami@codeaurora.org>
Message-ID: <ef3f8ccc-8e0e-b8d9-38ca-350621905dea@codeaurora.org>
Date: Sun, 2 Jun 2019 21:43:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hftoz870o.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, Phani Kumar Uppalapati <phaniu@codeaurora.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: Check for integer overflow
 during multiplication
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

Thanks Takashi for the review!

On 5/27/2019 10:47 PM, Takashi Iwai wrote:
> On Tue, 28 May 2019 07:27:03 +0200,
> <bgoswami@codeaurora.org> wrote:
>> From: Phani Kumar Uppalapati <phaniu@codeaurora.org>
>>
>> Channel info data structure is parsed from userspace and if
>> the number of channels is not set correctly, it could lead
>> to integer overflow when the number of channels is multiplied
>> with pcm bit width. Add a condition to check for integer
>> overflow during the multiplication operationi, and return error
>> if overflow detected.
>>
>> Signed-off-by: Phani Kumar Uppalapati <phaniu@codeaurora.org>
>> Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
> Did you really hit this?

This was reported by static analysis tool.

I will take your feedback, and re-look at the issue, to see if this 
issue can happen.

> The info->channel value is already checked in snd_pcm_channel_info()
> before calling the ioctl ops, to the upper bound runtime->channels.
> So it shouldn't overflow at the point you suggested.
>
>
> thanks,
>
> Takashi

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
