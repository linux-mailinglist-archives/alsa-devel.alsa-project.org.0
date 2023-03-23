Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A29356C689A
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 13:40:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89234EC4;
	Thu, 23 Mar 2023 13:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89234EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679575245;
	bh=UHioeRbqsRW1aI2gh/OPoblCdXKPVzZ8xrK9N619VW4=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C8j0YU/ZnEopGOXqNYFknWogASu+WJnY1mUqCy3laClVIlFGHMhzuj4HK/4hYrhV1
	 Q9NqrKUa7OMQFkIEm6T29jAGZBXd1wQ/E9FmTD13Yh4xClhA8Vd3Bks70EMqlI3Wnd
	 sXnEe10Dvqh43J0vtQSsQBzyFdKu+DE6yiMssbfk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D94ADF8027B;
	Thu, 23 Mar 2023 13:39:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50E67F802E8; Thu, 23 Mar 2023 13:39:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48269F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 13:39:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48269F800C9
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pfKEB-0007XV-1v; Thu, 23 Mar 2023 13:39:35 +0100
Message-ID: <61065a7f-19ce-0308-57ed-4cd4c4d681a0@leemhuis.info>
Date: Thu, 23 Mar 2023 13:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [REGRESSION] kbl-r5514-5663-max hdmi no longer working
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: 
 <CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com>
 <f96431ee-abc0-ff76-3963-c45d3b092840@leemhuis.info>
In-Reply-To: <f96431ee-abc0-ff76-3963-c45d3b092840@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1679575181;0e35de15;
X-HE-SMSGID: 1pfKEB-0007XV-1v
Message-ID-Hash: 4TDA4NGOLH3NHCCBOHHXEZTPLHXJOUUQ
X-Message-ID-Hash: 4TDA4NGOLH3NHCCBOHHXEZTPLHXJOUUQ
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Jason Montleon <jmontleo@redhat.com>, stable@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Alsa-devel <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TDA4NGOLH3NHCCBOHHXEZTPLHXJOUUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13.03.23 18:32, Linux regression tracking (Thorsten Leemhuis) wrote:
> [adding a push of people and lists to the recipients that dealt with the
> culprit; leaving the stable list in CC for now, even if this is a
> mainline issue (apart from the backport of the culprit to 5.10.y Takashi
> asked for a while ago)]
> 
> On 13.03.23 17:34, Jason Montleon wrote:
>> It looks like HDMI audio stopped working in 5.17-rc1. I ran a bisect
>> which points to 636110411ca726f19ef8e87b0be51bb9a4cdef06.
> 
> FWIW, that's "ASoC: Intel/SOF: use set_stream() instead of
> set_tdm_slots() for HDAudio" from Pierre-Louis Bossart.

Pierre-Louis Bossart, did you find time to look into this?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

>> I built
>> 5.17.14 with it reverted and it restored HDMI output, but it doesn't
>> revert cleanly from 5.18 onward.
>>
>> >From what I can tell it looks like -ENOTSUPP is returned from
>> snd_soc_dai_set_stream for hdmi1 and hdmi2 now. I'm not sure if that's
>> expected, but I made the following change and I have working HDMI
>> audio now. https://gist.github.com/jmontleon/4780154c309f956d97ca9a304a00da3f
> 
> Thanks for the report and the patch. I CCed the relevant people for this.
> 
> [TLDR For the rest of the mail: : I'm adding this report to the list of
> tracked Linux kernel regressions; the text you find below is based on a
> few templates paragraphs you might have encountered already in similar
> form. See link in footer if these mails annoy you.]
> 
> To be sure the issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, the Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 636110411ca726f19ef8e87b0be51bb9a4cdef06
> #regzbot title alsa/asoc: kbl-r5514-5663-max hdmi stopped working
> #regzbot ignore-activity
> 
> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply and tell me -- ideally
> while also telling regzbot about it, as explained by the page listed in
> the footer of this mail.
> 
> Developers: When fixing the issue, remember to add 'Link:' tags pointing
> to the report (the parent of this mail). See page linked in footer for
> details.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
