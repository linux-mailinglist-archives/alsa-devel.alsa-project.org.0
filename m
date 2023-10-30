Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54D7DBDA4
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 17:20:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847A1950;
	Mon, 30 Oct 2023 17:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847A1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698682856;
	bh=eELh1gf0uX18QjXDoqpNKshIwQV70OdpxFn1NIRGxcw=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RWcY2Prc3kmZuxas0uyeZ2zLpZUsNzn2hlap1Z8995VdOqT0khWCgRYTJgyQmjFSq
	 MwhgnTCKSe0Qz4jtUblfDdrKusCsDdS1vVv3Sl2SjoAsdMeL6KpSfz6gIlbFxrNBPR
	 aDNkpIa69fsvuuJeNAW8c/hOv+Gt9nbp/47rF9hY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A831BF80558; Mon, 30 Oct 2023 17:20:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D0CF80166;
	Mon, 30 Oct 2023 17:20:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3B7DF8016D; Mon, 30 Oct 2023 17:20:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E24EBF80152
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 17:19:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E24EBF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=arunraghavan.net header.i=@arunraghavan.net
 header.a=rsa-sha256 header.s=fm2 header.b=WwpVt4uQ;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=OWRRnq8T
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 476305C0256;
	Mon, 30 Oct 2023 12:19:52 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute5.internal (MEProxy); Mon, 30 Oct 2023 12:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:content-type:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1698682792; x=
	1698769192; bh=+8GY1RVOlNrKfpbllCQ52Ox/8ppvwVZ5pTINdnbQAa4=; b=W
	wpVt4uQuGAQgCdDlcJ6aeZ58G2Ye0fFcH1cxXVR4AKZn6709CA+G4/EtdSB9LBum
	B63olU1coYB7XzAi7XHsaGl44miUqACRsGrrw7nEkyyvk8BbxRYHFIVUYgcGw70C
	10I/Q34NWTVqyAHmKt5BqX1ZHBXz0g3l73y0LIGBVSBOaaI9l/h6WEMSI6X0mefL
	y2CVZVjQNtTOkaojBg/x8pSs/8XHRIlZsjfsfevnNabs8HMLhAo46SnNjS9ZDGhA
	My+95C1n+nB+qADNw1mc6ARfgxdjGb8GZGccJ8rXM+IXqA1an8MkD+oypwtQL1dM
	Ax5ri1Gv+DO3gjjW2KGAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698682792; x=1698769192; bh=+8GY1RVOlNrKf
	pbllCQ52Ox/8ppvwVZ5pTINdnbQAa4=; b=OWRRnq8TZsOOktGiSIkYQXSR5Ufm0
	0e1E44G8cFVt3x7yMuahfWyKNCyUeHboQUb/Cz6b2I2B06yJyk5hmmQvbmO8N1DT
	h+1V0wx4NZmgafPOqni1dqLGgjI4C4AgnSVWTXJRVsWGmnu+5dysOQLU1RrqArWx
	TcI+fMPtLgmhjexwsAnPlQXJIyLKHXprF05GRUdZgc48pgUQnMKHAOzgvZcNanMm
	acrqV4W6kMJIRMYGy4tb7wpVdmnxUzb1YAWymjwMkGX0S+Aa3rD37zTIAKa6AKgR
	F7PoPjJtqKIzGvGRNUzoOvdnow//5gjFNf1iEV4UE2tCXU76e8x7SJz1g==
X-ME-Sender: <xms:p9c_ZQ0VPDsjouGohYxFfB9b5vmIH7_Gvp1S0QkXAvG-6dcwMTRScA>
    <xme:p9c_ZbHAcCkGH5W8Ya5WDuRXq4lVmbvhthBWDaolzTMpHVurvwr2nYm6iKRf3A5Lt
    HMrAxsQmcDVuuCASQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetrhhu
    nhcutfgrghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqe
    enucggtffrrghtthgvrhhnpeeitedtheehvdetieeuudetkedthefggfetjeegjeduveef
    veeuhfelvdejveekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvght
X-ME-Proxy: <xmx:p9c_ZY5prQqsrVL_wGPs6totnyoUVst4Q3mW1w4SBglP8HCMieeFbA>
    <xmx:p9c_ZZ3xdhCqkuGFub90g8JlMalC0SfQUfxzv6rccLa0r7B3toUWTA>
    <xmx:p9c_ZTGyt_6LOqIvrBDJBDZzyMWxV4Z5xiyawtqJhdqVyH7_34wz7w>
    <xmx:qNc_ZZOzbYnRbrOF-cVMs9da4ajRI7uoW-rMsik5R3M96ThgQpVwMw>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 85FA5234007E; Mon, 30 Oct 2023 12:19:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <e0e21050-fc8d-4964-aad9-6d0e5e84aaf1@app.fastmail.com>
In-Reply-To: <056916f6-43e9-41f2-a8f9-93845405c0e3@app.fastmail.com>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
 <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
 <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
 <4154b125-35c8-b15a-8706-54b9eb3cb5e0@ivitera.com>
 <2504b014-08b2-4f39-83f6-5072b5ec4ea8@app.fastmail.com>
 <004494f2-bd2b-9bdb-8f45-61b6aed6432b@ivitera.com>
 <056916f6-43e9-41f2-a8f9-93845405c0e3@app.fastmail.com>
Date: Mon, 30 Oct 2023 12:19:31 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Pavel Hofman" <pavel.hofman@ivitera.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
Content-Type: text/plain
Message-ID-Hash: LS5FMEEYW7OYGT4RBPT36GJSOQDJ6XU3
X-Message-ID-Hash: LS5FMEEYW7OYGT4RBPT36GJSOQDJ6XU3
X-MailFrom: arun@arunraghavan.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LS5FMEEYW7OYGT4RBPT36GJSOQDJ6XU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Oct 2023, at 12:33 PM, Arun Raghavan wrote:
[...]
> Maybe a silly question, but what is the status of these patches -- I 
> see them as "Accepted" on patchwork but they've not actually landed 
> upstream yet?

Definitely a silly question, this has been upstream since 5.17, just missed that somehow. Sorry about the noise, all.

Thanks!
Arun
