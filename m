Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27283805603
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 14:33:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865E0208;
	Tue,  5 Dec 2023 14:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865E0208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701783205;
	bh=6+WBrSgT42RrM7DT7u63I6cXjt19hweBF2PFFZTCcNU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpzOBAW13j8ehtbfyPZoCbsqPHKVAPN5hfZYt3+eBjCC1fFhFbUTDspFpFgIsUFv7
	 jlkDosWXwVbTLvnjA7FtxkLca2IqZPicZ5HEbSMQHX/iWwRq2xjJHYpGhuLYnJjFQG
	 67lWpFxug/daZ3NoCKgS0YvBf6JbEmOhoSOMnLOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 802CDF8056F; Tue,  5 Dec 2023 14:32:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A49D6F80571;
	Tue,  5 Dec 2023 14:32:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C078BF8024E; Tue,  5 Dec 2023 14:32:46 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DC35F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 14:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DC35F800AC
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rAVXK-0005dK-0Y; Tue, 05 Dec 2023 14:32:30 +0100
Message-ID: <670a7310-8098-4083-9f30-96987cc5d0aa@leemhuis.info>
Date: Tue, 5 Dec 2023 14:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
Content-Language: en-US, de-DE
To: syed saba kareem <ssabakar@amd.com>, Marian Postevca
 <posteuca@mutex.one>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
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
 <6085d2e3-f28e-4d1d-9863-8275931430e6@amd.com> <87fs0x4fn7.fsf@mutex.one>
 <ac9d4f7b-c7af-4d21-b0b8-d0f188b94b0f@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ac9d4f7b-c7af-4d21-b0b8-d0f188b94b0f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1701783156;c56de6c9;
X-HE-SMSGID: 1rAVXK-0005dK-0Y
Message-ID-Hash: L7ZFJDFX3EOAAL3BRVLF5X64LSSNRAIZ
X-Message-ID-Hash: L7ZFJDFX3EOAAL3BRVLF5X64LSSNRAIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7ZFJDFX3EOAAL3BRVLF5X64LSSNRAIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23.11.23 14:58, syed saba kareem wrote:
> 
> On 11/23/23 03:25, Marian Postevca wrote:
>> syed saba kareem <ssabakar@amd.com> writes:
>>
>>> Hi , We have up streamed the patch it is in review.
>>>
>>> Please find the below link for the patch details.
>>>
>>> https://patchwork.kernel.org/project/alsa-devel/patch/20231113123345.2196504-2-Syed.SabaKareem@amd.com/
>>>
>> Sorry maybe I'm not understanding here something, when you are saying
>> that the patch is in review, where is this review being done?
>>
>> As far as I can tell Mark Brown only pulled the first patch from your
>> series:
> 
> We got comments for the second patch and we addressed them.
> 
> It seems it may be stuck at review stage as one patch got merged.
> 
> Will resend the patch again.
> 
> You can find the received review comments for the patch in the below link.

Any news? From a quick look it seems this didn't make any progress at
all, but I might be missing something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

>>> Applied to
>>>
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>>> for-next
>>>
>>> Thanks!
>>>
>>> [1/2] ASoC: amd: acp: add Kconfig options for acp7.0 based platform
>>> driver
>>>        commit: d3534684ada99ef8c0899eb28c62b4462483ee19
>>> [2/2] ASoC: amd: acp: add pm ops support for renoir platform
>>>        (no commit info)
>>>
>> I don't see the second patch in for-next.
> 
> 
