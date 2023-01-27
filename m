Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13667E5D1
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:53:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317C81E0;
	Fri, 27 Jan 2023 13:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317C81E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674824037;
	bh=WjBNTbECB5X8evuSEOlFptG7BsXcUtDEbU+gpSuzYs0=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=ADG5/cw6Mq+e5mtE1DS+Q2q9eeRYDPMO5PLpkYtyjKGhyCLTvzcE7sNMSwtvb8zZA
	 6a2dJnyYbxZ7QfZ4/sBim/RU4sFnFYnGRgKbrvCU3DIU7V0epl74zQpcQFMNmsRvde
	 gv+N52keF1ABL7YfeH4s2WvUhkEVQmvFm45ki95M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6BB1F804A9;
	Fri, 27 Jan 2023 13:52:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BE03F80424; Fri, 27 Jan 2023 13:52:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB0F2F80238
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:52:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB0F2F80238
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pLODp-0001vu-Om; Fri, 27 Jan 2023 13:52:49 +0100
Message-ID: <cea5051b-1a13-45a9-6cbe-a664a9cd1d88@leemhuis.info>
Date: Fri, 27 Jan 2023 13:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: hda/hdmi: Use only dynamic PCM device allocation
 #forregzbot
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: ALSA development <alsa-devel@alsa-project.org>
References: <20220922084017.25925-1-perex@perex.cz>
 <1c9c00dec72c241a399b3b7c0a305382a5712529.camel@bi-co.net>
 <163d5366-35d9-f7db-cf50-796d6b011c0a@leemhuis.info>
In-Reply-To: <163d5366-35d9-f7db-cf50-796d6b011c0a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1674823971;
 dfef2cc9; 
X-HE-SMSGID: 1pLODp-0001vu-Om
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 26.12.22 14:26, Thorsten Leemhuis wrote:
> On 25.12.22 13:14, Michael Laß wrote:
>> CC'ing amd-gfx as this might be an issue in the amd driver.
>>
>> This change causes a regression in Linux 6.1 at least on some AMD APUs.
>> There are reports from users with Ryzen 4750U, 5800U and 5850U chips
>> where the HDMI sound devices don't show up anymore. I'm affected by
>> this as well.
>>
>> Reverting this commit (ef6f5494) makes the HDMI audio devices show up
>> again. I verified that this is still an issue in current Linux git
>> (72a85e2b).
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced ef6f5494faf6a37c74990689a
> #regzbot title alsa: hda/hdmi: HDMI sound devices don't show up anymore
> with some AMD APUs
> #regzbot ignore-activity

#regzbot fix: 090ddad4c7a9
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

