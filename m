Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD631854B32
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 15:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C8AB65;
	Wed, 14 Feb 2024 15:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C8AB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707920132;
	bh=WU5ye4sqffY/jrxVREVpJxv9BvbepfNs+ZpzUGDfugI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PknYf65vlgOD90vH+sjIh3k8gs97/7OvktU0axQ1bk3uytGNAhrkocq+hUJLZbCjD
	 U1O7H6vjH+KhcRlqQs+CnEVxBli1U4NEHT9r/lyT24qclZ4l2tiYPqg8N4qEQFQ0AQ
	 k25XZlWUNQcMthWKzHzmtV4TEnQ5eXoAg/vnww6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3C6DF8059F; Wed, 14 Feb 2024 15:14:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27354F805A1;
	Wed, 14 Feb 2024 15:14:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A770F80238; Wed, 14 Feb 2024 15:14:54 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CD549F8015B
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 15:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD549F8015B
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1raG2D-0003d5-0J; Wed, 14 Feb 2024 15:14:49 +0100
Message-ID: <1c36c706-a2ae-4b9a-979d-2b75e8bb0440@leemhuis.info>
Date: Wed, 14 Feb 2024 15:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Acp5x probing regression introduced between kernel
 6.7.2 -> 6.7.4
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
Cc: stable@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
References: 
 <CAD_nV8BG0t7US=+C28kQOR==712MPfZ9m-fuKksgoZCgrEByCw@mail.gmail.com>
 <CAD_nV8B=KSyOrASsbth=RmDV9ZUCipxhdJY3jY02C2jQ6Y34iA@mail.gmail.com>
 <87bk8kkcbg.wl-tiwai@suse.de> <2024021342-overshoot-percent-a329@gregkh>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <2024021342-overshoot-percent-a329@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1707920090;da87f1e1;
X-HE-SMSGID: 1raG2D-0003d5-0J
Message-ID-Hash: 7FIWJ37ZDD5G52I3OZ56OX3APEOIYPHN
X-Message-ID-Hash: 7FIWJ37ZDD5G52I3OZ56OX3APEOIYPHN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FIWJ37ZDD5G52I3OZ56OX3APEOIYPHN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13.02.24 15:46, Greg Kroah-Hartman wrote:
> On Tue, Feb 13, 2024 at 09:17:39AM +0100, Takashi Iwai wrote:
>> On Mon, 12 Feb 2024 15:32:45 +0100,
>> Ted Chang wrote:

>>> So the culprit was the stable commit 4b6986b170f2f23e390bbd2d50784caa9cb67093, which is the upstream commit c3ab23a10771bbe06300e5374efa809789c65455
>>>     ASoC: amd: Add new dmi entries for acp5x platform
>>
>> Greg, could you revert the commit
>> 4b6986b170f2f23e390bbd2d50784caa9cb67093 on 6.7.y?
>>
>> Apparently it caused the regression on Steam Deck, the driver probe
>> failed with that backport alone.
> 
> Now reverted, as well as on 6.6.y and 6.1.y.

#regzbot introduced: 4b6986b170f2f23e390bbd2d50784caa9cb67093
#regzbot fix: Revert "ASoC: amd: Add new dmi entries for acp5x platform"
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
