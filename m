Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0853369C047
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Feb 2023 14:02:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0B7EDA;
	Sun, 19 Feb 2023 14:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0B7EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676811776;
	bh=RSdmdqsqWKCz79IeZjXYGqlGJDh7kL39Nv5LT3+SVbI=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vEbKcdyRI4Z/FJn1VU0efjMhdKq/bTlfSfG5G4QgfGo/HVVJgtLcJ6LXxxTkQ2kOh
	 pWytqciDYf/ZdZG1mek32sE1OTOB5WrhXQcwywGBlimY2u5fTfKywtVZ+DSton/Xbx
	 d08oNBdT2w+r90XwCY1+91N+NnaH2jrTpOTc5wq8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C00F8025A;
	Sun, 19 Feb 2023 14:02:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 132C5F80266; Sun, 19 Feb 2023 14:01:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.3 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BA59F80083
	for <alsa-devel@alsa-project.org>; Sun, 19 Feb 2023 14:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA59F80083
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pTjJS-0000j4-Ss; Sun, 19 Feb 2023 14:01:06 +0100
Message-ID: <2dbfaaa8-fc2f-7eb6-6e66-452b54186290@leemhuis.info>
Date: Sun, 19 Feb 2023 14:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216909_-_Avantree_Leaf_US?=
 =?UTF-8?Q?B_audio_device_does_not_play_sound_in_applications_run_via_wine?=
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Takashi Iwai <tiwai@suse.de>
References: <f5beb73a-4306-fc04-8ab1-e5fc06c9f40f@leemhuis.info>
In-Reply-To: <f5beb73a-4306-fc04-8ab1-e5fc06c9f40f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1676811674;b57412e4;
X-HE-SMSGID: 1pTjJS-0000j4-Ss
Message-ID-Hash: 3FHRMQ2ZYHXCVXF7HXYWRRAV53HBXENZ
X-Message-ID-Hash: 3FHRMQ2ZYHXCVXF7HXYWRRAV53HBXENZ
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Bernd Steinhauser <linux@bernd-steinhauser.de>,
 Alsa-devel <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FHRMQ2ZYHXCVXF7HXYWRRAV53HBXENZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 11.01.23 11:52, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216909 :

Per https://bugzilla.kernel.org/show_bug.cgi?id=216909#c11

#regzbot inconclusive: likely more of an application bug that surfaced
by improvements in the kernel side; workaround is available
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
