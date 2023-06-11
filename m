Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70372B253
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 16:46:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29BF3E8;
	Sun, 11 Jun 2023 16:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29BF3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686494767;
	bh=0vk0trypvKvR6MOoTBsccB3ygG1e4pb47o3rVIf/1FE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Mz9Bk8arOKDnp/mVdinlQjQfFcB6C9vBApZIO6u8XU8CS2DaMNDothXi2d8XEpN9d
	 6HF2S/c2FZPsj+CWJjdhNxF9GT3Wka08KH60saOAaY1hAWlU0wDsbee3z3Y9OdqY24
	 JKx3eITQdYHe2iLNnbAVMhL1kGSYVQLHHwQBQWcI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03C30F8025E; Sun, 11 Jun 2023 16:45:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A2F3F80132;
	Sun, 11 Jun 2023 16:45:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B59DF80246; Sun, 11 Jun 2023 16:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC245F80130
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 16:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC245F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=gZeeMua5;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=MIbx27sN
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B74515C0102;
	Sun, 11 Jun 2023 10:44:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 11 Jun 2023 10:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686494690; x=1686581090; bh=zh
	7pnK48QZWxs1JYWxUmK+S2XcdW2Mv/egaGGlTZ6to=; b=gZeeMua5mr/ZMuoDVK
	uUtueDhVLPL1dNcjpIAS2yCRUbjC1oCIlC8xbroSoFWolhl84LaoLTw3qZvduKb2
	FrECRsU4GHQTSZz0OYEShHeKuNyx4fxtxUpUljalRneRkQXWpvK33Fzym1FmZAmD
	gMowUgcL/8xKSnDD17gcGwPcGzfYEHvRhNMzUggVshGXYqm23mAe+ylDJx7Uktsk
	JG/B1VyXOTtTVbm4685qlt+5eMnrfWDDOKaU2mpkozJwjfRMZAMQmc/f+A/lit/S
	PGEKCFcDKmacH+WDoNE6yPzeczhJCwUYKoM0OU0iPr88MXPt8AF6CrcziSs+Hsfp
	r4mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686494690; x=1686581090; bh=zh7pnK48QZWxs
	1JYWxUmK+S2XcdW2Mv/egaGGlTZ6to=; b=MIbx27sNXVtAJF/tySfJWN9Q4lZ16
	KbcVFC8j923dE68lSVUfmBOmagT2kSjgRZNTvx52z/lt07SF7c8NAFJv55oraHL7
	+qIJ3Fo4+1ScIqCfxgZqUaeMFmM9pemu1uxYB2rFkyj6yF2DxlC52+71TOzQZ15p
	aDd9Tl0cqLrnNPS42oNxtBOoBpNIm5wHOyZ6uFA3Z56kDeXpYNdAlwjQbToSelHE
	jsDW0ssg75oIQIxxenF2pxix4dxTD9YxTqTuvSNRJh4/7KuKlWnlOD6rD2ENaDMV
	P9Yuk0Uu38LgpFjQZj5ZLIb/1Ri1gmQ2HoNB8W0Pg0CavDxC8DdrI1AqA==
X-ME-Sender: <xms:4d2FZNOofmZNa6UgMrTwDAzml5xWQJpdHICp9dkljc9sFz2nZ_SYkQ>
    <xme:4d2FZP-PFVQ2nOvJJPHJuThLa2jgIRNuLRc1Vu2oo2vV_VxwUQMfV62ARTtyvWkub
    6Zgi_6jfkeJ1ySgb_U>
X-ME-Received: 
 <xmr:4d2FZMTBAQUu4Al14Kw-nBbgFaPakMyYjl565_mduSkfbs-fQzTLwk41V-nNDi3OoZs_6DQWlkdo25tPpzAcJjdTQOyGuQxiNxzfgC4jucwATg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrgeduvddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
    ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:4d2FZJsEaZOOP9-jV-oDhK0-8w37ci3pi-Mnocd4wJXczGHchbOTOg>
    <xmx:4d2FZFf8AQPxr0ZMFEF-G9SSpCZ5ot_vSx163rxkMp7ypO1FjY2cqg>
    <xmx:4d2FZF03qaPCwii2V0p0cqgs7ztpC7y9dQWt6_QklFMfZscsFPAZwg>
    <xmx:4t2FZFHoI0WtJteMBdYlF7a0RKQcTaN5VWHthIbt0vwx58o0BBAivA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jun 2023 10:44:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: firewire: use 'GPL' string for module license
Date: Sun, 11 Jun 2023 23:44:43 +0900
Message-Id: <20230611144445.221529-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NCYKQLKAGZUA5TTRIVPYPFMZS5FSKVUR
X-Message-ID-Hash: NCYKQLKAGZUA5TTRIVPYPFMZS5FSKVUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCYKQLKAGZUA5TTRIVPYPFMZS5FSKVUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Nowadays, the use of "GPL" string in MODULE_LICENSE macro seems to
obsolete "GPL v2" string. This series includes two patches to use it for
modules in ALSA firewire stack contributed by two developers.

This change does not pose any issue for modules contributed by Takashi
Sakamoto, the author of this series, while it is advisable to have careful
consideration for modules contributed by Clemens Ladisch, since the code
related to license will be modified by a developer who is not the
copyright holder.

A commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
"GPL v2" bogosity") adds detail documentation about the macro itself and
clarifies the difference between "GPL" and "GPL v2". The macro is designed
to provide sufficient information to kernel module loader and user space
tools. Both strings have the same meanings, but the latter is legacy.

In conclusion, any change made to the usage of the macro neither result in
significant alterations to license nor copyright.

Takashi Sakamoto (2):
  ALSA: firewire: use 'GPL' string for module license contributed by
    Takashi Sakamoto
  ALSA: firewire: use 'GPL' string for module license contributed by
    Clemens Ladisch

 sound/firewire/bebob/bebob.c         | 2 +-
 sound/firewire/dice/dice.c           | 2 +-
 sound/firewire/digi00x/digi00x.c     | 2 +-
 sound/firewire/fireface/ff.c         | 2 +-
 sound/firewire/fireworks/fireworks.c | 2 +-
 sound/firewire/isight.c              | 2 +-
 sound/firewire/lib.c                 | 2 +-
 sound/firewire/motu/motu.c           | 2 +-
 sound/firewire/oxfw/oxfw.c           | 2 +-
 sound/firewire/tascam/tascam.c       | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.39.2

