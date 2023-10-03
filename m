Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DE17B6659
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 12:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353E6844;
	Tue,  3 Oct 2023 12:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353E6844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696328773;
	bh=2F8+9AFi92S4BBwNQp6sXHuqNBtfALWTMhiW0ztqhAI=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G9qISOFoGJ4tmw5CTx3GaUH8R067PBqYaua1VTyiAV/1U2CeH2tJYuYry4Ic4amZK
	 zV00J6KrWQwGIixaLPNW+RuqMOtsVyL12b9yEJbRC1uC1gf8TTZYB2T3he8HKRFZuu
	 NDxXfjriXfyCxKWgX9ERzaRtTSyng4qZ3zKOO+Mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76784F80549; Tue,  3 Oct 2023 12:25:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2276FF80310;
	Tue,  3 Oct 2023 12:25:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9726AF8047D; Tue,  3 Oct 2023 12:25:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6131AF80166
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 12:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6131AF80166
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qncaH-0002AJ-7T; Tue, 03 Oct 2023 12:24:57 +0200
Message-ID: <aa54a70c-e7fc-4ca2-9a4d-425675ed0be3@leemhuis.info>
Date: Tue, 3 Oct 2023 12:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo Yoga Slim
 7 Pro 14ARH7 82UU
Content-Language: en-US, de-DE
To: Markus Meier <kerneldev@epic-bytes.net>, alsa-devel@alsa-project.org
References: <10347605.nUPlyArG6x@kali>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>, Sven Frotscher <sven.frotscher@gmail.com>,
 August Wikerfors <git@augustwikerfors.se>
In-Reply-To: <10347605.nUPlyArG6x@kali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: 
 webpack.hosteurope.de;regressions@leemhuis.info;1696328711;1d0bd62f;
X-HE-SMSGID: 1qncaH-0002AJ-7T
Message-ID-Hash: 4CN7MBCQPJOFZT7NJLRU647CZFT6LTZY
X-Message-ID-Hash: 4CN7MBCQPJOFZT7NJLRU647CZFT6LTZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CN7MBCQPJOFZT7NJLRU647CZFT6LTZY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02.10.23 23:04, Markus Meier wrote:
> 
> I own a  Lenovo Yoga Slim 7 Pro 14ARH7 where the microphone is not showing up.
> I added the system to the quirk table and the mic is working correctly (but 
> with very low volume) now.
> 
> Here's an except from dmidecode:
> System Information
>         Manufacturer: LENOVO
>         Product Name: 82UU
>         Version: Yoga Slim 7 Pro 14ARH7
>         SKU Number: LENOVO_MT_82UU_BU_idea_FM_Yoga Slim 7 Pro 14ARH7
>         Family: Yoga Slim 7 Pro 14ARH7
>
> Please add this patch to the kernel and add it to the stable kernels too. I 
> guess the microphone should have worked before. Seems to be a regression 
> introduced by c008323fe361bd62a43d9fb29737dacd5c067fb7
>
> [-- Attachment #2: yoga-slim-7-pro-82UU-microphone.patch --]
> [-- Type: text/x-patch, Size: 451 bytes --]
> 
> --- a/sound/soc/amd/yc/acp6x-mach.c	2023-09-29 19:31:03.753786095 +0200
> +++ b/sound/soc/amd/yc/acp6x-mach.c	2023-09-29 19:32:06.414276453 +0200
> @@ -217,6 +217,13 @@
>  		.driver_data = &acp6x_card,
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82UU"),
> +		}
> +	},
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
>  		}
>  	},

I CCed a bunch of lists and people to make sure everyone is aware of
that patch, as it otherwise might fall through the cracks.

Markus, quick question: do you have (a) an interest in contributing a
change to Linux or (b) did you just post this because Mario asked you to
do so in https://bugzilla.kernel.org/show_bug.cgi?id=217063#c25 ?

If it's (a) then you might want to take a closer look at
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
, as your patch lacks a few important things before it can be applied
(most notably a Signed-off-by tag)

If it's (b) I wonder if it would be easier for everyone involved if some
kernel developer could create a patch own their own, as that likely is
way easier to review and thus likely gets the problem resolved a lot faster.

Ciao, Thorsten
