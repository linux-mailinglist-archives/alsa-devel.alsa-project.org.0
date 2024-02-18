Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6441859551
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 08:51:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C814DB60;
	Sun, 18 Feb 2024 08:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C814DB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708242685;
	bh=/AMkZzvC7J19Nj7TGLqr4LewSEDj+S09p/X7TVcWDx8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SKHBr31+GzLgKaRB53PyaUTsu5qGTU67/HCO7SGuDZ6KhUihtqvz2sdVncMA4GXdW
	 Cz458xWjqmeN0M64xVte5hgzYgx1IYm9Mx/eA4XWhtICBNrkP26y5vjUl8pPOx94/f
	 0gZB3cHoid2Sdr07msJ0HMesLr3V4FzqgCHeCzfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA5C0F805C5; Sun, 18 Feb 2024 08:50:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 061F7F805E6;
	Sun, 18 Feb 2024 08:50:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5B37F80567; Sun, 18 Feb 2024 08:44:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60F28F80104
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 08:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F28F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=Z+Twek47;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=g4djpoYC
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id DECB45C0058;
	Sun, 18 Feb 2024 02:41:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 18 Feb 2024 02:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1708242094; x=1708328494; bh=u+ASbW1uZk
	V2QQrzxNATrz8sNjKu4XywG6tInW4goYk=; b=Z+Twek47hRiMFnOcDmF+TYoiOE
	l5932wVTT5MkyLrs7p+IYYEishlyoyRjPDdmnlnPjDGKZfHKNVTmEcuCUx/lMTNF
	a093cU9gmO4EkXtWr0znhJAfgWfJjGG9KBZKf4D/ELRH24qxlgdbdjrDhzTNgKgz
	+wrqdUL+U5m8eo62dF7JsxArT6a6EfSZv4muAzw6M8hY3OS6xAO8+MoFuxVuVHEL
	ZirUplfhMneMj4GiuE5lciuR2qeKzkrRL9+MTcw+O/8y1qWb50lTVvAaUCWrt4II
	Ns10IAm5xB+4OLIVdE4gTvEVOM5hCnHBuWjIh45sJnsFnrEUfUW5r/PjS8wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1708242094; x=1708328494; bh=u+ASbW1uZkV2QQrzxNATrz8sNjKu
	4XywG6tInW4goYk=; b=g4djpoYC2KZSyQsItrhRyzWofF+OOpHDsoYnqh2KPJnO
	C+mKag9xm5l/1xUSzNOsjVnjZXlkW/bmUlm7ue8qe58bXaB2OCC3H9VSSy/lECrn
	xNQZLAZ34krC3gM155N5Q5FETZTgymWLbD4yAJKuE6CNesqF++vyiNHWLtIpQJnn
	F6o1IJXwOwbygdJR/qTHRJJZJV7tJRsc2nootjnrrTLH1wvIkkVv/Ud0rKtqfoLR
	Ooxja8OQVNfT8k8M/P8yhit7whPHG7Zgwa2Uiq6AVL/QxJVqeyp9p8DLMXkpUfCc
	09ZxlEt1iszBYrwYqkPpc3Xz92wYbdI+Q/+2JCzsfg==
X-ME-Sender: <xms:rrTRZff0DqqALKLUUvmT1I-gD18_-Lq-eG8nvDWmTR-YzE8OVHIn6g>
    <xme:rrTRZVNTHiZK_zQmmshJwh6ew1WR1Ae4SFQ9f6vgdZfrvhMY0TjXq4EGccn3oQRKt
    N1DPEtmt2jWd-18Ll8>
X-ME-Received: 
 <xmr:rrTRZYhkqjuYkRAv95cgiT-d5yygBDZPH8HcN1QYr_d_GSwam-KudfVIdDjqaYv_qxks-PRra0Gi1aJoGonGkDDwuoS9V-38Mb78Yf2MMFB7>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrvdehgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
    hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeffvdeuleffve
    ekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveekkeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:rrTRZQ9qImAkzBMkRsxQ82ilJxXF-3XBwitAD7wQSreFmowc3GGU2g>
    <xmx:rrTRZbtmCN7JvaKBHuMUzuywRBKd7lPCHEMMaL25GReYaXdbnAFisA>
    <xmx:rrTRZfFbKnUtyM3rK5752oHB4dkvNbtlz2RT-I6j_4X6SvkrDzepgQ>
    <xmx:rrTRZZ2KXK11vAOhBydZZY2MnwA9zZ1N8ElCHsbYc-dIj2FVqiWGNQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Feb 2024 02:41:33 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ALSA: oxfw: add support for Miglia Harmony Audio
Date: Sun, 18 Feb 2024 16:41:24 +0900
Message-Id: <20240218074128.95210-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BZD7WAJAPF3MJJVQT7MIG2TZWGRYBHMU
X-Message-ID-Hash: BZD7WAJAPF3MJJVQT7MIG2TZWGRYBHMU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZD7WAJAPF3MJJVQT7MIG2TZWGRYBHMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

There used to be a company called Miglia Technologies Ltd. in the UK,
and the company was selling a product called Harmony Audio in 2004. Upon
obtaining the product by chance recently and examining its internals, it
was revealed that it utilizes Oxford Semiconductor OXFW970 for its
communication function in IEEE 1394 bus.

This patchset adds support for the model.

Takashi Sakamoto (4):
  ALSA: oxfw: use const qualifier for immutable argument
  ALSA: oxfw: support the case that AV/C Stream Format Information
    command is not available
  ALSA: firewire-lib: handle quirk to calculate payload quadlets as data
    block counter
  ALSA: oxfw: add support for Miglia Harmony Audio

 sound/firewire/amdtp-stream.c     |  12 ++--
 sound/firewire/amdtp-stream.h     |   4 ++
 sound/firewire/oxfw/oxfw-stream.c | 100 +++++++++++++++++++++++-------
 sound/firewire/oxfw/oxfw.c        |  10 ++-
 sound/firewire/oxfw/oxfw.h        |   7 ++-
 5 files changed, 103 insertions(+), 30 deletions(-)

-- 
2.40.1

