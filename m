Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE077F40A8
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 09:56:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33CDDAE9;
	Wed, 22 Nov 2023 09:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33CDDAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700643373;
	bh=nwUB83CrsxigqP5Gos3cK28m6iTkvKx+fHD6ziocKoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s854UUxqLLGYKcW2opRJ/ykJfBbQSnO8l69t2cGWtbLXdbuNgBnoAdsEEy/VwmASW
	 hylvmo2bvEQiiUIBwslE0N7qT+HhApUFT4zLbno+sXqIJ9sCLAgVrPQ2X3jbrEqZo7
	 BPsd0FbueI4vpckbCLUTUXzOWZq9kzGUuW7eQ2Oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E14F80568; Wed, 22 Nov 2023 09:55:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4F68F80310;
	Wed, 22 Nov 2023 09:55:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97B7EF802E8; Wed, 22 Nov 2023 09:55:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93EAAF80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 09:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93EAAF80093
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5j1E-0004hl-4x; Wed, 22 Nov 2023 09:55:36 +0100
Message-ID: <d002ad6f-d908-4cf6-afcf-bf0989418e72@leemhuis.info>
Date: Wed, 22 Nov 2023 09:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
Content-Language: en-US, de-DE
To: syed saba kareem <ssabakar@amd.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Marian Postevca <posteuca@mutex.one>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <87a5v8szhc.fsf@mutex.one> <ZUQssoD2rUHSYQ2v@debian.me>
 <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1700643341;9dc2e5b9;
X-HE-SMSGID: 1r5j1E-0004hl-4x
Message-ID-Hash: RTRPYUQOQATBJQVRKI5DSG4DYKMK5UDT
X-Message-ID-Hash: RTRPYUQOQATBJQVRKI5DSG4DYKMK5UDT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTRPYUQOQATBJQVRKI5DSG4DYKMK5UDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03.11.23 14:30, syed saba kareem wrote:
> On 11/3/23 04:41, Bagas Sanjaya wrote:
>> On Thu, Aug 03, 2023 at 10:22:07PM +0300, Marian Postevca wrote:
> [...]
>>> Some help here would be welcome. Is there something missing in my
>>> machine driver code, or
>>> is the runtime pm handling in acp pci driver wrong?
>>
> We were working on some other priority tasks, will upstream the changes
> 
> by next week.

Hi syed saba kareem! Did that happen? From here it looks like it did
not, so I assume the regression was not yet addressed. But it's easy to
miss something, hence this mail.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
