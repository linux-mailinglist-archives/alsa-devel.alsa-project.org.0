Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A710276CB46
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 12:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9444E7F8;
	Wed,  2 Aug 2023 12:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9444E7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690973443;
	bh=m7zyEewoEOcawjU5qLcDKu8hf0HKqwxRK6fxN9AuRUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nABktSJ0+oWdbYgEvdK4mPbwFJ8rQbONtEb0umj05w/+t/KzcVf3LQf+b8WysL22t
	 YIuBs7cb6/ZxDZzq2qL8sIb1N23alGt8uUa32gUfmRvEinSluy0za+jIPv723BIJcX
	 yRA1lL4SqinK5zjujUm6KOw3smf7MxmdNSyqmwbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E246F80544; Wed,  2 Aug 2023 12:49:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27222F801D5;
	Wed,  2 Aug 2023 12:49:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D223F8025A; Wed,  2 Aug 2023 12:49:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 732B4F80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 12:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 732B4F80087
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qR9Pz-0007If-TK; Wed, 02 Aug 2023 12:49:27 +0200
Message-ID: <a84a17e8-6a00-f451-6cfe-bb4ff87d51f7@leemhuis.info>
Date: Wed, 2 Aug 2023 12:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: regressions@lists.linux.dev
Cc: alsa-devel@alsa-project.org
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: 
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1690973369;822261d2;
X-HE-SMSGID: 1qR9Pz-0007If-TK
Message-ID-Hash: FO2MRTQWB5Z3DRE3YRJCENDOEEOTLAZY
X-Message-ID-Hash: FO2MRTQWB5Z3DRE3YRJCENDOEEOTLAZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO2MRTQWB5Z3DRE3YRJCENDOEEOTLAZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 13.05.23 21:52, Joseph C. Sible wrote:
> 
> Forwarding my regression bug report submission per the instructions in
> "Reporting regressions".
> 
> #regzbot introduced: 5aec989130
> https://bugzilla.kernel.org/show_bug.cgi?id=217440

#regzbot fix: 69ea4c9d02b7947cdd6123
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
