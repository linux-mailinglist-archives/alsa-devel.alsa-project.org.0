Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A24261D954
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 11:14:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB68163C;
	Sat,  5 Nov 2022 11:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB68163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667643269;
	bh=YzNR5cUV+A/MssPqqMYJxIyLO2gHuY5YePaEbKBZYUY=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZemQ5qQIPg8w1wMG2aDrdQP9mxBQmV3Z4/6FEStAaclhtXmSg7EcYWQTQC4X2ME7
	 gKOsPVZCXhaGh1zvjMoekCSj29n8Z3zVFNcaGFxu9aa/G20AudwznF3xPivmTKU6A+
	 qw2gcIj/hwj7y0rgdqVb/bZfFMfMT08if+8Vy9No=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8FF1F8012F;
	Sat,  5 Nov 2022 11:13:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E4ECF803DC; Sat,  5 Nov 2022 11:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED6ACF801D5
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 11:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED6ACF801D5
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1orGB2-0007lr-7a; Sat, 05 Nov 2022 11:13:24 +0100
Message-ID: <d4662501-c93e-bc17-e4f0-7bce6110d76f@leemhuis.info>
Date: Sat, 5 Nov 2022 11:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev, alsa-devel@alsa-project.org
References: <20221102200527.4174076-1-jmontleo@redhat.com>
 <302e95d4-2a0d-7d2a-177c-82923c14c654@leemhuis.info>
In-Reply-To: <302e95d4-2a0d-7d2a-177c-82923c14c654@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1667643205;
 ca81cfd9; 
X-HE-SMSGID: 1orGB2-0007lr-7a
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

On 03.11.22 12:57, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> On 02.11.22 21:05, Jason Montleon wrote:
>> Starting with 6.0-rc1 these messages are logged and the sound card
>> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
>> it to function properly again.
>>
>> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
>> spi-PRP0001:00 not registered
>> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot introduced v5.19..v6.0 ^
> https://bugzilla.kernel.org/show_bug.cgi?id=216641
> #regzbot title sound: asoc: kbl_r5514_5663_max: sound broken
> #regzbot ignore-activity

#regzbot fixed-by: a1dca8774faf3f77eb34fa0ac6f3e2b82
