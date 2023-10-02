Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B227B54C6
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 16:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A641FDEC;
	Mon,  2 Oct 2023 16:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A641FDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696256097;
	bh=vtsFilx2VTNxt77peLshnVCZwlt0hO5/O5caTMysMts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cPevJwavooDI4Hk7URpfJ5bKW6U7rfKnowwCiqJryGLGW3bm+3dDh6nvKqatD8xcC
	 3oVOLtWtP/GbcTu5ZxsbqD3dQ3La984EePM50mKnKnMVGyAjdl5jH8asFgm46goL+e
	 AkU17fI7ZEvkDElTm3vekJk1C0bLZ+W8LekaOqtA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11721F80553; Mon,  2 Oct 2023 16:14:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF829F802E8;
	Mon,  2 Oct 2023 16:14:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 893CDF80310; Mon,  2 Oct 2023 16:14:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8617EF801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 16:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8617EF801EB
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qnJgH-0003Y1-AM; Mon, 02 Oct 2023 16:13:53 +0200
Message-ID: <048d9715-9cb2-4bc0-b8b0-5e30a0db54c7@leemhuis.info>
Date: Mon, 2 Oct 2023 16:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Content-Language: en-US, de-DE
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
 <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
 <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
 <0a3feafc-b843-420a-9b04-c835f8210c1a@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <0a3feafc-b843-420a-9b04-c835f8210c1a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1696256037;2750f13f;
X-HE-SMSGID: 1qnJgH-0003Y1-AM
Message-ID-Hash: FXKKZ2H2IMAR5PBCZ7CKXZSY2QBPJHMX
X-Message-ID-Hash: FXKKZ2H2IMAR5PBCZ7CKXZSY2QBPJHMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXKKZ2H2IMAR5PBCZ7CKXZSY2QBPJHMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02.10.23 15:47, Mario Limonciello wrote:
> On 10/2/2023 06:52, Mark Brown wrote:
>> On Mon, Oct 02, 2023 at 11:32:48AM +0200, Linux regression tracking
>> (Thorsten Leemhuis) wrote:
>>
>>> Makes me wonder: How many more such quirk entries will be needed? Will
>>> we have all machines listed soon, or do we expect that future Lenovo
>>> hardware will need entries as well? If it's the latter: are quirks
>>> really the right solution here, or do they just hide some bug or then
>>> need for code that automatically handles things?
>>
>> x86 firmware descriptions are terrible, it's just an endless procession
>> of quirks.  The model for ACPI is not to describe key information in the
>> kernel and instead on Windows load device specific information from
>> separately supplied tables.  On Linux that translates into these endless
>> quirks, on Windows it's platform specific drivers for otherwise generic
>> audio hardware.
> 
> I knew there was a TON of "82" prefix systems from Lenovo so it was an
> educated guess that all of them needed DMIC support.  This was incorrect
> because one of them didn't have DMIC and that caused a no mic support
> problem on that system.
> 
> So in the case of this seemingly endless list of systems being added to
> enable DMIC support Mark is right, Windows does it differently.

Now I understand things better, many thx. But please allow me one more
question from the cheap seats:

Seems before c008323fe361 things worked for a lot of systems for about
one year thx to 2232b2dd8cd4 (which added the wide "82" prefix quirk).
We then made that one machine work with c008323fe361, but broke a lot of
others with it that now need to be fixed with additional quirks; that
"TON of 82 prefix systems" sounds like we might not be close to the end
of that journey.

So can't we just do it the other way around and assume DMIC support on
Lenovo 82* machines, except on those where we know it to cause trouble?

Again: you are the experts here. If you are positive that we soon got
all machines covered where c008323fe361 causes a regression, then I
guess it's best to continue the patch we're on.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
