Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901F852E63
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 11:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB07484C;
	Tue, 13 Feb 2024 11:53:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB07484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707821641;
	bh=+JnBgDGOZAp2YbrH6cwJtYEtXr9eH6MJ20r1BkDzDXE=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Seob4n7Oc/62w6Pe+Mb8NVhiknH91eSvs8ISll93KCd0iGcfOMPCPEmvETzYvOTiQ
	 gYll9h+CaUKKaNj3Xxk74PvsNARwYytEV0mwi4pR5sPhAc25QOkm08mdxUeZbq2f0E
	 9FJgHXSxCd7CZrK346dd4uSY0ZIAqJ22WP1UcUFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA51F80567; Tue, 13 Feb 2024 11:53:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D52F8057D;
	Tue, 13 Feb 2024 11:53:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 470D5F80238; Tue, 13 Feb 2024 11:53:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1E21F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 11:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1E21F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256
 header.s=fm3 header.b=hdWJrUS8;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=G02pROHA
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id DE8C01C00087;
	Tue, 13 Feb 2024 05:53:13 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 13 Feb 2024 05:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707821593; x=1707907993; bh=6dv3XkVpsh
	WAdzS8Nc4Xo0CoQTmrm60p1TUc7YC2Dao=; b=hdWJrUS8Cd51e7g6sHyMhMiCxv
	IDWxmxNLFPEiqY+2GMkGyjR8B8XSgya46SGAtMuyBQ/eW2An26StdfkpA6wC8S6g
	LuJTGDhGXLsntq83AcJAOtuW98rfnCbKxncDN3QVgRbDxMvaPmCq57xQwVgR2I7H
	+UlLZ7ltgGP14MFBIcNnSK/dS7wb4+Fi72zXXwTBbOxaVaot+dbzoa4ScEVZGF3w
	gSxd5R5MMAG38ir1USb5rRVnvmlzFvdPU6idyu6sNe9GkY2HAl2MNhEmDSwnux4Q
	VmGCD7B9Ruxsgy8d4UdVCKlPPG6k0z3ndm78tVLasKcstligOWQlDT3eEbbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707821593; x=1707907993; bh=6dv3XkVpshWAdzS8Nc4Xo0CoQTmr
	m60p1TUc7YC2Dao=; b=G02pROHA+7jjMd7tHb5W9Mk1RHyKHtv+aGTn41ZLW0fH
	TeDGVYBX5dqUePSIxI0FC/zSx8psmAhZsU2w2xqEZpYNMKtCAqUppnDdcxNKd/Gq
	t7v7HDGf+wTfHKW1oIRp6dTsyFDFkIRBYLeHpQbB1dDWdAtwyFaa3Od+5wWJq/y4
	YHhUPnHwW4mbW4LM/+uL4x21bUnKQya075BRbFDcNy3bqfseqZn4J+EZ8HMwvQqe
	PUeKkR8Ve8iedu7wfp4NfaMD9/aiHMqWwUB8UdvLekkwgqMFJbu6IAnZOAIWOjYW
	Vw7e7GDFqI6KFb/+a/V/Ofa27HmNYxUzVwGh1D7xYA==
X-ME-Sender: <xms:F0rLZb_1q4NKRMH-XXweuv45E4i6FkWcds3C1qZ80Ws1TMhlCedt-w>
    <xme:F0rLZXtYCwVkCjihBn9E_icVc9UEUFEBcYTprGOvxx8x770weQ-EuImCYvFjUiE70
    vTv3049MW5pipRXSvQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrudehgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:F0rLZZCGF4p3x0Tli4MvIOHCz3GP44OMlMiAIBqdkgchzB1cmvLNvQ>
    <xmx:F0rLZXcXjSCXz4H84WVOn0iFRqU4fNWpZD2PIwaO0L4RzJF_UJ1o4g>
    <xmx:F0rLZQOsH68J5cLPZ8MzFdW_2JYHAoCTzJJ6bmTQV3gsg88zA7cFDA>
    <xmx:GUrLZRxiq9tjm-VczEMhcII7VaYv9BO8Xu8yf6vQZFSyb0aOzroxWDV57V4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6BDE7B6008D; Tue, 13 Feb 2024 05:53:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <c61d7daf-1b13-4ff8-aeae-7dcd8dd02131@app.fastmail.com>
In-Reply-To: <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
References: <20240213101220.459641-1-arnd@kernel.org>
 <1jbk8kk5pk.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 13 Feb 2024 11:52:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Content-Type: text/plain
Message-ID-Hash: SOMVIG46CMG2NJC52O53AFIKH6L4RX5J
X-Message-ID-Hash: SOMVIG46CMG2NJC52O53AFIKH6L4RX5J
X-MailFrom: arnd@arndb.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOMVIG46CMG2NJC52O53AFIKH6L4RX5J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 13, 2024, at 11:36, Jerome Brunet wrote:
> On Tue 13 Feb 2024 at 11:11, Arnd Bergmann <arnd@kernel.org> wrote:

> This probably pre-dates the introduction of devm_clk_get_enabled()
> It would probably be better to use that instead of duplicating helper
> functions which do the same thing.

Ah, I had not thought of that interface either, so you are probably
right that this is the best way to do it.
Can you send a replacement patch then and add my Reported-by?

I also sent the same patch for drivers/nvmem/meson-efuse.c, which
I guess will also need the same treatment. I also checked and saw
that all three files already had this code in linux-6.0 when
devm_clk_get_enabled() got added.

> If for any reason it is not possible, a common helper in clk.h would
> preferable I think.

I can't think of anything that prevents us from using
devm_clk_get_enabled() here.

    Arnd
