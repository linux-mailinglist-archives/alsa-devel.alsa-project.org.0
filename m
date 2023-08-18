Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E80780C58
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 15:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703A6E12;
	Fri, 18 Aug 2023 15:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703A6E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692364488;
	bh=wcb4/8vJ5Gg60qX9W1hU4I8MZlbtEa1ucO4W6YLBZLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SCZ5zqTY4Tdy2ngAekvZnjn5qdYHAEyy695eEXyi3SyFBqR2gBHUXmzR2UbI5tnl2
	 0ufxIR/xKdZkJKk+a4soPPqXwDfrnGnWhK7PUiGLbRRrz6WLnT5Fu6vZRiLvBlNh4J
	 HHpdKyenS1+OC2hs5AJzRs9B4lk/mMZFZS+gjyu8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB018F80254; Fri, 18 Aug 2023 15:13:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75AA4F8016D;
	Fri, 18 Aug 2023 15:13:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 483ACF801EB; Fri, 18 Aug 2023 15:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA9C3F800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 15:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA9C3F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=QeIGU9Ll;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=MByipL/e
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B39D5C00DB;
	Fri, 18 Aug 2023 09:13:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 18 Aug 2023 09:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1692364423; x=1692450823; bh=7E7Osd9oulitwMJgNzfM8GmUr
	DDoaqf4zMYvUbvX400=; b=QeIGU9LlbPKp7XkpN9XiEKHKIYD1mOU2XlA0ZBaQw
	Nbn0BRBBICW0SimpSErFd75CUKdicXbCDVCSPkwIkoIreQtcerL57PX/FFOXE5Wk
	sS2sdA4PsrVCG9/ntQyTCRIijXkBK3Orko/33ONVhVGkYc6JRm0fKAJfpkZ2cGMa
	rNDdKrgY1ZyW6TyEokSYdwgRthPAPQPYcUYg9Zc0jcFdWVVbx/AOms1+FncxxPUM
	JewLQK+VfDm2PGtGrSsu/rL3L8UxvmzHGmwYYl5yX4FKkbdvImJGozS9O88k8TvK
	cD0NCLnmrqNmRX7vRTvgnC8mLozDoxn4b/iIwR/L9t71A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1692364423; x=1692450823; bh=7E7Osd9oulitwMJgNzfM8GmUrDDoaqf4zMY
	vUbvX400=; b=MByipL/e1ZwkNZ8AqyVCAaLiPCv3uhAVyIOX1otbsU4JWm2qllN
	Ji3YpBvAKEIw5sg9OHbt2r7SiL2FS+QFmXySjIHvn+PS6qistf79vNMt8tFwg2m5
	cUYD0BQXjdSaUWNHL9VVpA5E3zFVi18+5q/Q7Aa0nrIo13DRDWnwDAMiSdJumI2k
	FS2xTsiEXt2xTk7kAwMyhL/oOn5MDep7yf8IGP+3Jaa3ld/JmCJEFH7pCj6Udy2l
	IQDwpLwXN+DQiDLFJmbrR6XaIGxUeFGp4lYjgeJRSkh0JNddV+TPDyCyEI4xpv1/
	sBuZdILNRv04/aGfKd+Kaz7pe2aqvXJ7wtA==
X-ME-Sender: <xms:hm7fZO0x9l15unXK8QFiuqJjcmj6cTWPKIOouLa4BdAXvqhwZ90B8w>
    <xme:hm7fZBFMIAenTgyqapLTOjhu2G4i1G62WYFfXPWx5DMTNC1nEgEIb3yRPVrfZB1V7
    kJtwY6G8qimLqWWw3k>
X-ME-Received: 
 <xmr:hm7fZG4BJOIExKpvBe2rTivutMvPc_6nRQ3lrCbe1M8FTaT_ch6b2y9ceVJEpCiE5cORKcC6baVF6kHzFaaDJmFVq-XL-qY9i44>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedruddufedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefvrghk
    rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
    drjhhpqeenucggtffrrghtthgvrhhnpeegleekueehvdejuddvieegudduffehgeefkeeg
    geelvdeilefhlefhteffleehheenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgr
    shhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:hm7fZP3b6JztT7wnBss11V0Fcwmtw690i3EE9_t0384SQlNfFZnphw>
    <xmx:hm7fZBG9SnSVMFJ3iF7c_xoNLxMlXYw_wz6ugNWHVv6KuBm-ABAOjw>
    <xmx:hm7fZI9iQjRNudTWgqJ_KQD2wEmnUbAsJmRCzowfyI27rT0cFN09cw>
    <xmx:h27fZPOJjuTYiMjY6LpnJU9KiEinrjmQo_3G4B8c9OWTU0VL8koYkg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Aug 2023 09:13:41 -0400 (EDT)
Date: Fri, 18 Aug 2023 22:13:38 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
Subject: Re: ALSA: dice: improve support for Weiss devices
Message-ID: <20230818131338.GA397874@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
 <20230808152511.GA729027@workstation.local>
 <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
Message-ID-Hash: KLUUIXAC57NUY5KWDAJA7ZAHKNCHMVTV
X-Message-ID-Hash: KLUUIXAC57NUY5KWDAJA7ZAHKNCHMVTV
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLUUIXAC57NUY5KWDAJA7ZAHKNCHMVTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Sorry for my late reply, but I'm in short summer vacation in my country
side (less connections to internet). Would you please wait for any
reaction within a few days.


Regards

Takashi Sakamoto

On Wed, Aug 16, 2023 at 03:05:36PM +0200, Michele Perrone wrote:
>    Dear Mr. Sakamoto,
> 
>    since we are not discussing about the patch anymore, let me reply to
>    our
>    open threads in a separate message.
> 
>    On 08/08/23 17:25, Takashi Sakamoto wrote:
> 
> As a policy to maintain current ALSA firewire stack, any code for control
> function is out of kernel land, thus your AVC function can not to be
> merged to Linux upstream as is.
> 
> I think the most convenient way is to provide source code for the
> AVC function to me. Then I re-implement it by Rust language for
> snd-dice-ctl-service program. As long as interpreting original code, we
> have no license issue for the new code.
> 
>    That is very kind of you. You can now find our current AVC code in the
>    following public repository (branch 'avc'):
>    [1]https://github.com/weiss-engineering/snd-dice/tree/avc
>    If you have questions about the code, also on the firmware side of
>    things,
>    feel free to ask.
> 
> But As a first step, I would like you to assist my support for DICE common
> controls in your models.
> I need the `clock caps` and `clock source names` fields to implement the
> common controls for your device in snd-firewire-ctl-services.
> 
>    You can find the `clock caps` and `clock source names` fields for all
>    our Firewire devices below. As I currently do not have access to our
>    Firewire hardware except for MAN301, DAC202, and INT202, for the
>    remaining devices I copied the fields from their latest firmware source
>    code. -- MAN301 -- clock caps: 44100 48000 88200 96000 176400 192000
>    aes1 aes2 aes3 wc internal clock source names: AES/EBU (XLR)\S/PDIF
>    (RCA)\S/PDIF (TOS)\Unused\Unused\Unused\Unused\Word Clock
>    (BNC)\Unused\Unused\Unused\Unused\Internal\\ -- DAC202 -- clock caps:
>    44100 48000 88200 96000 176400 192000 aes1 aes2 aes3 wc arx1 internal
>    clock source names: AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF
>    (TOSLINK)\Unused\Unused\Unused\Unused\Word
>    Clock\Unused\Unused\Unused\Unused\Internal\\ -- INT202 -- clock caps:
>    44100 48000 88200 96000 176400 192000 arx1 internal clock source names:
>    Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\U
>    nused\Unused\Internal\\ -- INT203 -- clock caps: 44100 48000 88200
>    96000 176400 192000 aes1 aes2 arx1 internal clock source names: AES/EBU
>    (XLR)\S/PDIF
>    (RCA)\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Un
>    used\Internal\\ -- ADC2 -- clock caps: 44100 48000 88200 96000 176400
>    192000 aes1 clock source names:
>    AES12\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Un
>    used\Unused\Unused\\ -- DAC2/Minerva -- clock caps: 44100 48000 88200
>    96000 176400 192000 aes1 aes2 aes3 arx1 internal clock source names:
>    AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF
>    (TOSLINK)\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unuse
>    d\Internal\\ -- Vesta -- clock caps: 44100 48000 88200 96000 176400
>    192000 aes1 aes2 aes3 arx1 internal clock source names: AES/EBU
>    (XLR)\S/PDIF (RCA)\S/PDIF
>    (TOSLINK)\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unused\Unuse
>    d\Internal\\ -- AFI1 -- clock caps: 44100 48000 88200 96000 176400
>    192000 aes1 aes2 aes3 aes4 adat wc internal clock source names:
>    AES12\AES34\AES56\AES78\Unused\ADAT\Unused\Word
>    Clock\Unused\Unused\Unused\Unused\Internal\\
> 
> In my point of view, we need to decide license under which the file of
> configuration ROM image is public. I think CC0[0] is bette for our case.
> 
>    I have created a pull request in takaswie/am-config-roms with three ROM
>    images: MAN301, DAC202, INT202. I cannot extract the remaining images
>    at
>    the moment, because I do not have all Firewire devices available. I
>    will
>    add the remaining images as soon as I can get my hands on them.
> 
>    Kind regards,
>    Michele Perrone
> 
> 参照
> 
>    1. https://github.com/weiss-engineering/snd-dice/tree/avc
