Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B465A3E4
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 13:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08093485;
	Sat, 31 Dec 2022 13:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08093485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672488687;
	bh=WRtknkWf5ojrcBaCrtv2ivgV+vSxsRewxhB7GDfIOCU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kdv/4gKw/VlhVL4c2mu2igC1Eq394B0dULVMvZJuHoYv/NdpEwIgE/0BCY/A7pZiA
	 voZTeB6rrQrK3HaMWg9UYu81UdjxirNgQwxXj3SKzz7bcB9A4jEwBdQ18W6vLxBYfN
	 absnIPwHM94oTCltI1mIpJnyHo5LlgZhArtkHztw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96736F80144;
	Sat, 31 Dec 2022 13:10:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C42A9F804D0; Sat, 31 Dec 2022 13:10:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44A47F80144
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 13:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44A47F80144
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=z8wDss50
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 334A5A0040;
 Sat, 31 Dec 2022 13:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 334A5A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1672488624; bh=PhHFiV1Wk6XmHf2NsQx2UZVcgIWvHHXw1zl70Uh/xZ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=z8wDss50kaqDS0kXoHois29XiO8kdl3wrezVaL/nNlrlk0qrL+72FlxNIhKBWWN+V
 vY319FvBJa8qABpCgVYQUEx/43wmSn/HpwXjC5eCne6pVt0u8nsl5Ub+hyjIy/fpRT
 QWdYY5stDo8lBTZT6/qWcC9k4qLknRRsAnVo/cZw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 31 Dec 2022 13:10:19 +0100 (CET)
Message-ID: <47ec3cbb-19d1-ead1-46e8-3558ee7a8bcb@perex.cz>
Date: Sat, 31 Dec 2022 13:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
Content-Language: en-US
To: Ruud van Asseldonk <ruud@veniogames.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Takashi Iwai <tiwai@suse.com>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
 <Y5ZGw/3GHXSUduEc@geday> <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
 <9d663e28-88fb-aa96-574b-e92d6214aefe@veniogames.com>
 <5ba7868c-5ffd-81fc-778c-a7b5f8db50f7@veniogames.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <5ba7868c-5ffd-81fc-778c-a7b5f8db50f7@veniogames.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Geraldo Nascimento <geraldogabriel@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31. 12. 22 12:38, Ruud van Asseldonk wrote:
> Hi all,
> 
> I bisected this and identified e4ea77f8e53f9accb9371fba34c189d0447ecce0
> (ALSA: usb-audio: Always apply the hw constraints for implicit fb sync)
> as the first commit where it is no longer possible to change the sample
> rate. On the parent commit, my sample program successfully changes the
> sample rate from 44100 Hz to 96000 Hz, but on e4ea77f8e53f9, the second
> call to snd_pcm_hw_params fails.

There is an easy workaround - call snd_pcm_hw_free() between the params setup. 
This call ensure that the sync ep is freed. I can just confirm that this
problem is only for USB hw with the implicit feedback (tested with 6.0.11 kernel).

I will try to debug this when I find a little free time. Perhaps, Takashi may 
have a straight idea, what's wrong. When only one stream is used, this 
hw_params call should succeed, too.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
