Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF046BCB0C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 10:37:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C5E111E;
	Thu, 16 Mar 2023 10:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C5E111E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678959475;
	bh=7o7ME2SdLurkkn84msXQnOzCUgGEGsafJ5/VgHcOEkk=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hn+3w6rssUasIk5rof+E5icm8N2J32Kw66/z+Z74fhwzBN+J4ywZ+DADdpkKa6DCd
	 LKorxiTPoGGrqVsMiyQiop4Q8XUQCrETOEHJXYkDuD9LZ7UTHeHj0RXkE0NtypTwMN
	 eES1i+kDgNBT2ndJYqOE50oqKiN7s+mkogZ0hLQo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F4BF8032D;
	Thu, 16 Mar 2023 10:37:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64945F80423; Thu, 16 Mar 2023 10:36:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.0 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36CFBF80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 10:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36CFBF80272
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pck2V-0005ee-ST; Thu, 16 Mar 2023 10:36:51 +0100
Message-ID: <cf688390-8b70-1367-eb8e-48a2fee1a1d5@leemhuis.info>
Date: Thu, 16 Mar 2023 10:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [regression] Bug 217063 - Commit 2232b2d breaks microphone on
 Lenovo "82SJ" Ideapad 14ARH7
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Mario Limonciello <mario.limonciello@amd.com>
References: <698e7bfa-09dc-ad74-3eba-ceacd7a29f18@leemhuis.info>
In-Reply-To: <698e7bfa-09dc-ad74-3eba-ceacd7a29f18@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1678959415;9eced0b2;
X-HE-SMSGID: 1pck2V-0005ee-ST
Message-ID-Hash: 6LDF267KKRPDPHO52RXKGSV6BCFQIZPZ
X-Message-ID-Hash: 6LDF267KKRPDPHO52RXKGSV6BCFQIZPZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LDF267KKRPDPHO52RXKGSV6BCFQIZPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 21.02.23 13:44, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217063 :

#regzbot resolve: no longer happens with the latest kernels
#regzbot ignore-activity

For details see https://bugzilla.kernel.org/show_bug.cgi?id=217063#c4


Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



