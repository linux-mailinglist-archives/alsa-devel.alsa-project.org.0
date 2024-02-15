Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E140D8562BE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 13:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F2B5A4A;
	Thu, 15 Feb 2024 13:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F2B5A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707999098;
	bh=PzcRSIvxshet0sR/WiCdGicxwvY2iOqR5sJU7w49vCY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Goe0dNuMPoVk+giL6RPON4RSH9uPgruoHek5Rltw7yuv/ECyqYif7Yk0VrG1Ll4Ia
	 Gg5kanrmdeEIAStKBQOus+gWFLRrmK9pKXNer+LeaI3sDs/RsM88hOf9lB8iZBibTP
	 c3F9K36JNqhBLNIdNafkmgMkGBT1w4qLa2HeSrTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04ECFF80580; Thu, 15 Feb 2024 13:11:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECBAF8058C;
	Thu, 15 Feb 2024 13:11:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF272F80238; Thu, 15 Feb 2024 13:07:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B68F0F800EE
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 13:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B68F0F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=kYq2L6gM;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G2QEFx8z
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CA00D5C00D2;
	Thu, 15 Feb 2024 07:04:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 15 Feb 2024 07:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1707998683; x=1708085083; bh=V8OUeGK23z
	b3znkZNFvhTlAuws53ZWMqfLzCwf3xo7Y=; b=kYq2L6gMy8/LGR2sSozm5dAnAY
	7a+2K3Y4Bkx6x/ZM+sKXyuIvFUI2hzhPawE2nrBBLGTlrqQnxgKvVENZPks61DLv
	fW8zosFUI6kzRJagUU+rerGGlisaMtmye3xerbCoCb1qZnNYMIpGj9RPf6TA1BL4
	/fetBsdrDpmIoqULgf8Jbk2YrA9HQcYbNzOLuQLH2O+jvPN6JKea6ZCdW7IHxGiy
	1bf7xaju22slCB9MN9eyj29WDJyW9u9Aapm4BLympOSyGLrxeVIa48u8bUenD5EA
	x3usKNLP84AGoJdNTOWkDBc+YBc71ouI3zNIjbB8jHu3ggtthS1XcQDL25vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1707998683; x=1708085083; bh=V8OUeGK23zb3znkZNFvhTlAuws53
	ZWMqfLzCwf3xo7Y=; b=G2QEFx8zZc0uwNY4luZJDqixvJvtusVHK3GicRhAmYcd
	IMgPVQ7HghU9XJksiQwStQuZadvT6fdaQ39RJrUL1XDgswMLuSlThCThTgP1woij
	FXulCL34YdnI6SU/27qvcjC3GusmPtv2L0UH12mb/KqkQ+t2bXYcFLyw1Fi/4TKs
	L/TVpDk4YRCcLQemQUcrkjYNetoOkG7DdN63Q8phNcqfMLtetKbbhVYRfl52zXIE
	aUcr6192HtcYwN0Vby5EkQN5VNRYq1XRvH7i2gxX06O3SqO2l+T3m5CCL/hDArDE
	LAWcFHiI4jn+osHxnF80qXD/5FenrsByRziXslFL9g==
X-ME-Sender: <xms:2_3NZZWiH67Hhrm4l493iY2s_C1DOcQxp4ORUEvlq0Q0o2K9fA7Pow>
    <xme:2_3NZZkz3O4-B8mo86G5c3mggnxKp-P9bZOe2JNzOiFWYnuR3OwtlgNK-m5GN1jnZ
    ve-cUFwC8rPKgh2bLg>
X-ME-Received: 
 <xmr:2_3NZVbGicDiLSZvUZAKSuvE589Yb2H2KOh1evFHDtwLnU7wfYbU9CNGhKreADPTbtEADBooA-G1YM0zt11TX3AeW1f__s7Lkg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrvddtgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
    ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
    eqnecuggftrfgrthhtvghrnhepfeevjeefffelfeduuddutddvleffgfffleevudeghfeu
    heffhfehlefftdejkefhnecuffhomhgrihhnpehgihhthhhusgdrtghomhdprghvtgdrrh
    hsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdq
    thgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:2_3NZcUiBnOUVsARsNwd584SOSgonDHGVzESb3HdQ2g-rAkdEVhfnQ>
    <xmx:2_3NZTmQuZw6Ut3B0ZN3uGtyUtJ-jZ84uwWZMtiTUax6KfSFMmIhLQ>
    <xmx:2_3NZZc6CFarhYVvxft80qacZYtRbVbEq6OAi9hGFvQ3F166muP-WA>
    <xmx:2_3NZbvhMiB5EiubWYHRAVFHXjafdPjkPxGhI-nf99Q6LNzw2l5dig>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Feb 2024 07:04:41 -0500 (EST)
Date: Thu, 15 Feb 2024 21:04:38 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
Subject: Re: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
Message-ID: <20240215120438.GA103911@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20240121140748.GA189921@workstation.local>
 <20240121143048.GA191130@workstation.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240121143048.GA191130@workstation.local>
Message-ID-Hash: MFM2SQENCOVBYDF7NZBPBF7AQ4NQSB6K
X-Message-ID-Hash: MFM2SQENCOVBYDF7NZBPBF7AQ4NQSB6K
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFM2SQENCOVBYDF7NZBPBF7AQ4NQSB6K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Ping?

On Sun, Jan 21, 2024 at 11:30:48PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> On Sun, Jan 21, 2024 at 11:07:48PM +0900, Takashi Sakamoto wrote:
> > Then I have some questions.
> > 
> > 1. The signal source designated for stream-output-1/2
> > I think it is any type of digital input designated by control element
> > "Digital Input Capture Route", or source ID block which generates
> > silence.
> > 
> > 2. The signal sources designated for the outputs
> > According to the manual of MAN301, the sources are selectable somehow.
> > There are two ways at least for pre-amp and player modes. I guess that
> > any interface is defined to configure internal router for the purpose.
> > 
> > [1] https://github.com/alsa-project/snd-firewire-ctl-services/tree/topic/weiss-support
> > [2] https://github.com/alsa-project/snd-firewire-ctl-services/blob/topic/weiss-support/protocols/dice/src/weiss/avc.rs#L12
> 
> I have an extra question.
> 
> 3. store/load router configuration
> 
> In my understanding, TCAT DICE firmware stores configurations per three
> rate modes. When switching between the rate modes, corresponding
> configuration is loaded automatically. In the case of MAN301, the
> configurations done via AV/C command is loaded in the way?
> 
> 
> Regards
> 
> Takashi Sakamoto
