Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9A7BB71C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 14:00:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDEA91DD;
	Fri,  6 Oct 2023 13:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDEA91DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696593626;
	bh=CmEeg3jHAdohk23mZokIcnJCapY1URD8PLyyV1HLdsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DY+VvQc7ecnXo0+EE0KIL93E5cX3aZbx+VW3QMkqpbTLP9Ilo6wjBwmUnqRCotBGF
	 WfKuYmrDNrMjfx+2QSLbVRgibFAHiUdIUraYzhdoAj8Lh7L5jKrv/Zg/6dTjv8TEsm
	 L8lHlgD6c7qTHVZ68rqfZKe6uAL84ppQNHVzQQpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59A5DF80557; Fri,  6 Oct 2023 13:59:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A0EF80310;
	Fri,  6 Oct 2023 13:59:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FE73F8047D; Fri,  6 Oct 2023 13:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F6D7F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 13:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F6D7F80130
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qojUI-0006Lx-Bk; Fri, 06 Oct 2023 13:59:22 +0200
Message-ID: <62e54bf9-18fe-41cb-86d4-20f24074d267@leemhuis.info>
Date: Fri, 6 Oct 2023 13:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo Yoga Slim
 7 Pro 14ARH7 82UU
Content-Language: en-US, de-DE
To: Markus Meier <kerneldev@epic-bytes.net>, alsa-devel@alsa-project.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>, Sven Frotscher <sven.frotscher@gmail.com>,
 August Wikerfors <git@augustwikerfors.se>
References: <10347605.nUPlyArG6x@kali>
 <aa54a70c-e7fc-4ca2-9a4d-425675ed0be3@leemhuis.info>
 <4836369.GXAFRqVoOG@mobile>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <4836369.GXAFRqVoOG@mobile>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1696593565;5eacbf86;
X-HE-SMSGID: 1qojUI-0006Lx-Bk
Message-ID-Hash: FLL2CF2TFKJPJRV6R7MBJ57UEI7VAMO6
X-Message-ID-Hash: FLL2CF2TFKJPJRV6R7MBJ57UEI7VAMO6
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLL2CF2TFKJPJRV6R7MBJ57UEI7VAMO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03.10.23 17:04, Markus Meier wrote:
> Am Dienstag, 3. Oktober 2023, 12:24:56 CEST schrieben Sie:
>> On 02.10.23 23:04, Markus Meier wrote:
>>> I own a  Lenovo Yoga Slim 7 Pro 14ARH7 where the microphone is not showing
>>> up. I added the system to the quirk table and the mic is working
>>> correctly (but with very low volume) now.
> [...]
>> I CCed a bunch of lists and people to make sure everyone is aware of
>> that patch, as it otherwise might fall through the cracks.
>>
>> Markus, quick question: do you have (a) an interest in contributing a
>> change to Linux or (b) did you just post this because Mario asked you to
>> do so in https://bugzilla.kernel.org/show_bug.cgi?id=217063#c25 ?
> 
> Nope I don't plan to become some kind of kernel developer. I just want to use 
> my notebook without any issues and want to help others who want to use this 
> device with Linux too. I just followed Mario's suggestions. I thought it would 
> be easier for everyone when I create a patch, try if it works and then submit 
> it to a bugtracker to get the bug fixed.

And that's good, as that way we know that the fix works, so many thx for
it. It's just that the patch description needs to be more like the
following.

"""
The 82UU (Lenovo Yoga Slim 7 Pro 14ARH7) requires an entry in the quirk
list to enable the internal microphone, just like many other Lenovo 82*
devices recently added.

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo
82SJ")
Cc: stable@vger.kernel.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217063#c23
"""

Add another line right below with your sign-off, as explained here:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Then send it again. The patch likely must be inline (but maybe Mark
accepts attached patches as well, not sure, some maintainers do).

If you want the easy way out, just reply to your mail that started this
thread (with me in CC) with a signed-off-by tag for the patch, then I'll
handle the rest.

> [...]
> Thanks for your help Thorsten. I really enjoyed your Heise Kernel-Log series 
> and I really miss those series. Was always a pleasure to read that.

Thx, great to hear!

Ciao, Thorsten
