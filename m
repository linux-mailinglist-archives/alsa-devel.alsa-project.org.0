Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC06C37EF
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 18:13:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43701F9;
	Tue, 21 Mar 2023 18:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43701F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679418794;
	bh=GZ2jUeTUCoLsgOPhL0fTGLaijRLvdapi4CTxCCln2DY=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gk4MwUaZJbAkDm1d2tURF5QBCteOMg683EIuV6vezy0yv4G3fEt7202R0f0MYo8NP
	 j/w/0w8MZqf65ZGgVPss12gh2d13QO0YGbJf6p7m0mKSpFMaUdDmXSmmKBrzF3Yz+M
	 8LuswJZRlgvcjHoRV2C63LmLIhmIEzlhmoDYgEZw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ACA1F80254;
	Tue, 21 Mar 2023 18:12:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB18BF8027B; Tue, 21 Mar 2023 18:12:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.mutex.one (mail.mutex.one [62.77.152.124])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CD73F8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 18:12:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CD73F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mutex.one header.i=@mutex.one header.a=rsa-sha256
 header.s=default header.b=lDwXhBhf
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.mutex.one (Postfix) with ESMTP id C75EA16C0007;
	Tue, 21 Mar 2023 19:12:13 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
	by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQI5JdkOs9dG; Tue, 21 Mar 2023 19:12:12 +0200 (EET)
From: Marian Postevca <posteuca@mutex.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
	t=1679418732; bh=GZ2jUeTUCoLsgOPhL0fTGLaijRLvdapi4CTxCCln2DY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lDwXhBhf0yBAEAq5F0/8uf8/P1ckYfa0vxFaifa6SoqP0X3uYbZ5Kn35wla/k42xJ
	 ktVwSR/gmIMjs01JlZTGbFvD1y/ChlEBI9jkbgCp09aaeCbBAlhQMHVAWrtbYN0O7m
	 jm9BAmHK5ddJpUc+qqyL28kET69Vwki2hWUddWc8=
To: Mark Brown <broonie@kernel.org>, zhuning@everest-semi.com,
 yangxiaohua@everest-semi.com
Subject: Re: [PATCH 1/4] ASoC: es8316: Enable support for S32 LE format and
 MCLK div by 2
In-Reply-To: <6825a54e-f2c0-41c4-981c-fafcd10454fd@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-2-posteuca@mutex.one>
 <6825a54e-f2c0-41c4-981c-fafcd10454fd@sirena.org.uk>
Date: Tue, 21 Mar 2023 19:09:43 +0200
Message-ID: <87o7omvxns.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 2H6RCHCIIVS6CAJCD22XMFHET6KEHFHZ
X-Message-ID-Hash: 2H6RCHCIIVS6CAJCD22XMFHET6KEHFHZ
X-MailFrom: posteuca@mutex.one
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2H6RCHCIIVS6CAJCD22XMFHET6KEHFHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Thanks for taking the time to review this series of patches.

Mark Brown <broonie@kernel.org> writes:

> On Mon, Mar 20, 2023 at 10:35:16PM +0200, Marian Postevca wrote:
>
>> To properly support a line of Huawei laptops with AMD CPU and a
>> ES8336 codec connected to the ACP3X module we need to enable
>> the S32 LE format and the codec option to divide the MCLK by 2.
>
> The 32 bit support and MCLK division are two separate changes so should
> be two separate patches.
>

Ok, no problem, I just thought that a separate commit for one line was overkill.

>> -	lrck_divider = es8316->sysclk / params_rate(params);
>> +
>> +	mclk_div_option = device_property_read_bool(component->dev,
>> +						    "everest,mclk-div-by-2");
>> +	if (mclk_div_option) {
>
> This introduces a DT property but there's no documentation for it, but I
> don't see why we'd want this in the bindings - the driver should be able
> to tell from the input clock rate and required output/internal clocks if
> it needs to divide MCLK.

The problem here is that I have no knowledge what is the maximum MCLK
that the codec accepts. According to the datasheet the maximum supported
frequency of MCLK is 51.2 Mhz. But this doesn't seem to be the case in
practice since a MCLK of 48Mhz causes noises in the sound output.
The idea to divide the MCLK by 2 was proposed by a Everest Semiconductor
engineer.
So I don't know how to make this generic enough to be activated from the
codec driver.

I cced the Everest Semiconductor engineers, maybe they have a proposal
on how to activate this.


