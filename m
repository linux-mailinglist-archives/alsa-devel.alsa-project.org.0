Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAADF7221AB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 11:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD39B820;
	Mon,  5 Jun 2023 10:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD39B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685955639;
	bh=dU63hkjCVYCsn3cyx2hzqr6dRhy3r70LS3vntVDHq9I=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ns16BR/JoKLsB95v1p/VVAAXcb/s0tizmcJSr3NZ3T9VzseRpsNqX5gUQmqLqR2R6
	 2GbhjwdhftwbuwWvTkrlqfBZJ9nCH+EHX6rMRuTjXRg9/yFd5MMMWhjzaBFUZFVCv8
	 JdTdyC/zPaxULn+N5/wddbXhhTCMDVQpuDVZV12o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F5ACF80549; Mon,  5 Jun 2023 10:59:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D691F80520;
	Mon,  5 Jun 2023 10:59:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53D06F80549; Mon,  5 Jun 2023 10:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE887F80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 10:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE887F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256
 header.s=fm1 header.b=I1upo1i6;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=i2je8BCg
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 99527320091B;
	Mon,  5 Jun 2023 04:58:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 05 Jun 2023 04:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1685955526; x=1686041926; bh=hU
	qz0oSYym1Zk2R50bvVZ+tdv4ZMPRJujK1PFvUebcY=; b=I1upo1i65dPzrlV8cL
	k99gS4i+O+Mu0hn3k2FIELLvItfJIxDDX2io6Py8e7l4RRJReaF+cITZq02xv5nV
	RFcE0Uhj2OqsCPtWgkEpARV1F/prxLCU3AIfkPyUl0GHoDLN6K/Bz7Oz3+kT/yKh
	2Ss2OrmpNlPMhxNzzZ6ZtRY4dPhs5+tCVkPqoR2BtsN8UcvkjU62dr99LtT/3uB5
	0PDGKxYc3jJmFNAg7/VTiCgbvsaanPLzHy3jtZ3Bt8MvJNM3tYY4OImZ4jF9Jlri
	shGoXRkwq3clNnreSYeYRv42vMxs3JZaONg5svdEi6SeqUaL2AC0qLg4357Rm4dT
	1DFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685955526; x=1686041926; bh=hUqz0oSYym1Zk
	2R50bvVZ+tdv4ZMPRJujK1PFvUebcY=; b=i2je8BCgr9i55TWp8LsTy7R9NLcAd
	UYW6Cpi4WYtjrHIw8jSrwlgF/JvA09FLBAwbNZl9TLiY0m61+V4fu4lD5YFlFOCu
	Gs0b8/M2HEQtHkQRxSavBZn1pw+Kgy50dNG94pdrjQE02vr5p6vCX3oBom3jaSiQ
	6dQ4gO28VU1LIVn4932Na/A06i0abz/EhxW5b0+mPMVdtGmn5Lgo1/IpsoJ9W5pj
	RgwHrry6YQ2Uq+VuRpqJ2Ls8XmHpVBIJNCVzU/XCMTvzkaI8+bTBHy/MocMvXnsB
	e9Aqsi6A+kfEvM1GetLvQ9+PWiVlnxz23AstYkPW5ExGOnDxUI4unaSDA==
X-ME-Sender: <xms:xaN9ZBvq5ZaWv7MVRAAEGs9BN3F2YhcV7F6SgV9bT1H1PmPYknZAqQ>
    <xme:xaN9ZKcLE1P-wGXdjQZjhFtPIQlr_CE5mwUqiw3EJpuezkxpJLGfx1JMpsGnwNtMo
    ZZi2GQhosAraVYr_Bo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeelledguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:xaN9ZExY6ALCIu6yuFvPJerTImw7rz-xI_-fWVnSS9_oF345oc-4YA>
    <xmx:xaN9ZINMNY8kJuY1uCtoz_2AGJlGivX3paVbx9n88MyO-9vJHfIyJg>
    <xmx:xaN9ZB8KdzsKYgjzC9-YpirU19bdxALTrR5p1_0girsej3AUrcpumg>
    <xmx:xqN9ZNTrzUdo9ANhA1SqTk1OFnDBBxPGu7HWnCe3kiR2LMqqeIaGSQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 66D24B60086; Mon,  5 Jun 2023 04:58:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <1108b836-38bf-4284-b3b9-82cb33509092@app.fastmail.com>
In-Reply-To: <20230602124447.863476-1-arnd@kernel.org>
References: <20230602124447.863476-1-arnd@kernel.org>
Date: Mon, 05 Jun 2023 10:58:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>,
 "Venkata Prasad Potturu" <venkataprasad.potturu@amd.com>
Cc: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>,
 "Syed Saba Kareem" <Syed.SabaKareem@amd.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
Content-Type: text/plain
Message-ID-Hash: BMNGNIJNEWEUNSWYWFOMHTSI7ZIIWATJ
X-Message-ID-Hash: BMNGNIJNEWEUNSWYWFOMHTSI7ZIIWATJ
X-MailFrom: arnd@arndb.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMNGNIJNEWEUNSWYWFOMHTSI7ZIIWATJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 2, 2023, at 14:44, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The vangogh driver just gained a link time dependency that now causes
> randconfig builds to fail:
>
> x86_64-linux-ld: sound/soc/amd/vangogh/pci-acp5x.o: in function 
> `snd_acp5x_probe':
> pci-acp5x.c:(.text+0xbb): undefined reference to 
> `snd_amd_acp_find_config'
>
> Fixes: e89f45edb747e ("ASoC: amd: vangogh: Add check for acp config 
> flags in vangogh platform")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Please disregard, this version was incomplete, and I ran into the
same issue again in another randconfig build.

v2 coming up, please use that instead.
