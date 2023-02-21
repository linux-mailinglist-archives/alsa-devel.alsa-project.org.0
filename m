Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5969E0A4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 13:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403D9E8D;
	Tue, 21 Feb 2023 13:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403D9E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676983536;
	bh=Zttj73qKS3RaIpADnGulh1TpAt9nfak0tsstSjH8q/Q=;
	h=Date:From:To:Subject:CC:Reply-To:List-Id:List-Archive:List-Help:
	 List-Owner:List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kYCfHxtgfkjJqDkzAp7WbtJmUwfeGX5BVB3UkFCj9ez4b/PbCHoG0InPogp0qmKNq
	 B4HmcEOkBOV+HkJXI8Ph+ENC08zGz5jkfDma6YkxbpQeZE8PwuS1Dhdxh4q4VVdZ4y
	 tl9MRbrRB14aViYG2sIfG20xqcEknkgBNgTjBvV8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 723B3F8025A;
	Tue, 21 Feb 2023 13:44:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B7E7F80266; Tue, 21 Feb 2023 13:44:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 451F3F800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 13:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 451F3F800BA
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pUS0T-0002pQ-0B; Tue, 21 Feb 2023 13:44:29 +0100
Message-ID: <698e7bfa-09dc-ad74-3eba-ceacd7a29f18@leemhuis.info>
Date: Tue, 21 Feb 2023 13:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: [regression] Bug 217063 - Commit 2232b2d breaks microphone on Lenovo
 "82SJ" Ideapad 14ARH7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1676983473;c24a0bf8;
X-HE-SMSGID: 1pUS0T-0002pQ-0B
Message-ID-Hash: GQL3FNAWBWQZ6F2I62W5AATOTEQ67SEZ
X-Message-ID-Hash: GQL3FNAWBWQZ6F2I62W5AATOTEQ67SEZ
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Joseph R <prosenfeld@Yuhsbstudents.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQL3FNAWBWQZ6F2I62W5AATOTEQ67SEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217063 :

> [reply] [−] Description Joseph R 2023-02-21 00:35:34 UTC
> 
> Created attachment 303765 [details] lspci -vv
> 
> Commit 2232b2dd8cd4f1e6d554b2c3f6899ce36f791b67, intended to fix
> sound on Lenovo Yoga Slim 7 Pro X, makes the microphone on Lenovo
> Ideapad 14 14ARH7 with product code Lenovo "82SJ" unusable.
> 
> Simply removing the lines added by the commit make the microphone
> work again without issues.
> 
> Attached is lspci on a kernel with the lines removed.
> 
> First kernel bug report, so please let me know how I can help get
> this fixed!


See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: 2232b2dd8cd4f1e6d5
https://bugzilla.kernel.org/show_bug.cgi?id=217063
#regzbot title: alsa/asoc: microphone on Lenovo "82SJ" Ideapad 14ARH7 broken
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
