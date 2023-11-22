Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6BD7F43D2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 11:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F37DEE;
	Wed, 22 Nov 2023 11:27:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F37DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700648877;
	bh=1pMzQkC7rrtq0Ux1Kqz9BzU+OZ+fwJV8EN0R2MkHqWM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cMPUFQCA77jO4NLZA+BedDSA0QLP5p4Bg4OHHFeEDAAkdNTY3JywUYQF+t9PPRtyo
	 r/FsW1PkAcqI1YgkERA9YXUn+cXYdIDbz32jBoWQ8OJcaRtpSUzeyHlk7RFhzpDpOL
	 EMr5Ejxf4y7v9urrxgYWsnONUSKeqdBtJpNXcT3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1029F8057E; Wed, 22 Nov 2023 11:27:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9FBF80579;
	Wed, 22 Nov 2023 11:27:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2E62F802E8; Wed, 22 Nov 2023 11:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3894F80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 11:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3894F80246
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5kRm-0005zh-7d; Wed, 22 Nov 2023 11:27:06 +0100
Message-ID: <5124589d-81b9-42ae-a4af-d16590477b66@leemhuis.info>
Date: Wed, 22 Nov 2023 11:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
To: syed saba kareem <ssabakar@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Marian Postevca <posteuca@mutex.one>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <87a5v8szhc.fsf@mutex.one> <ZUQssoD2rUHSYQ2v@debian.me>
 <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
 <d002ad6f-d908-4cf6-afcf-bf0989418e72@leemhuis.info>
 <6085d2e3-f28e-4d1d-9863-8275931430e6@amd.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <6085d2e3-f28e-4d1d-9863-8275931430e6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1700648835;08987be2;
X-HE-SMSGID: 1r5kRm-0005zh-7d
Message-ID-Hash: 4CCG6JP7X36D4SHKHJREUHK7ZWJVDNA6
X-Message-ID-Hash: 4CCG6JP7X36D4SHKHJREUHK7ZWJVDNA6
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CCG6JP7X36D4SHKHJREUHK7ZWJVDNA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22.11.23 10:32, syed saba kareem wrote:
> On 11/22/23 14:25, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 03.11.23 14:30, syed saba kareem wrote:
>>> On 11/3/23 04:41, Bagas Sanjaya wrote:
>>>> On Thu, Aug 03, 2023 at 10:22:07PM +0300, Marian Postevca wrote:
>>> [...]
>>>>> Some help here would be welcome. Is there something missing in my
>>>>> machine driver code, or
>>>>> is the runtime pm handling in acp pci driver wrong?
>>> We were working on some other priority tasks, will upstream the changes
>>>
>>> by next week.
>> Hi syed saba kareem! Did that happen? From here it looks like it did
>> not, so I assume the regression was not yet addressed. But it's easy to
>> miss something, hence this mail.
> 
> Hi , We have up streamed the patch it is in review.
> Please find the below link for the patch details.
> https://patchwork.kernel.org/project/alsa-devel/patch/20231113123345.2196504-2-Syed.SabaKareem@amd.com/

Ahh, great. Has to Fixes: tag and no Link:/Closes: tag to this thread,
otherwise I would have noticed that change myself, but whatever.

Thx!

#regzbot monitor:
https://lore.kernel.org/all/20231113123345.2196504-2-Syed.SabaKareem@amd.com/
#regzbot fix: ASoC: amd: acp: add pm ops support for renoir platform
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
