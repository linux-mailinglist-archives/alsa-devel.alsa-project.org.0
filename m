Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D772B256
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 16:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA54683E;
	Sun, 11 Jun 2023 16:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA54683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686494820;
	bh=Lst9QpbkISKmwQOeI650NIuV/KC939TnFMD9b/7LBrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a44N9NaD7o3rU381w+gOrksAQeeyLKj+tSx5NmD1DljQorSO0s9g1exaTn0fygxEQ
	 XhRIoojXZFkQ2eDzikvf6FDz/h/qQ1l5VyqdKJ58TVm33o/8YxFng0gAzBrueUJq9H
	 AvwL7iUOv5cJK6iylheQG8l1HBE9aYtKt//oRK5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80980F80563; Sun, 11 Jun 2023 16:45:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDBDAF80549;
	Sun, 11 Jun 2023 16:45:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92EB3F80149; Sun, 11 Jun 2023 16:45:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45172F800ED
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 16:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45172F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=JbDaFgrn;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=m+2dzbm4
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 4AC455C00CC;
	Sun, 11 Jun 2023 10:44:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 11 Jun 2023 10:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1686494692; x=
	1686581092; bh=Yn0aEu1aeS0zTTNKk9DiktzZz5EnwUeRU6UeCFqUZus=; b=J
	bDaFgrnlFoKVahg3yqWSZb+92SSD6B7ls/SxS2KrwYJdLXBts7dGso6QFf6LidK9
	sy6kyon3TbDqSFPrqBoXDBDGml2J5VrVTrLWkMOSx4vbC+jmOPvjrxNWpJ06dOZN
	pZ/GZec8B6YgUJ0TVpvcqOO949lr/FnnYEinkv0caZHGFusR/wteu4LTCoF3hghs
	no2VbwMd2cB7lXOzZ6V0nrS7/d9FMZuBLjHG/fN4sDXaYJxK+3SvoO4uPG/sQwjT
	ftNR066Czu3rsXJAAPK4yW4SgFye21WOgnQemU8IvnMQvjXJMCpU8cXHI32FinP6
	/N2L7CRs/78H0ZooeiLxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1686494692; x=
	1686581092; bh=Yn0aEu1aeS0zTTNKk9DiktzZz5EnwUeRU6UeCFqUZus=; b=m
	+2dzbm4+mNzAPJUvo8wTz/ryixAVq4oG7rBoklQ55iY+NcPZBBhCpo3pCyq4ogZO
	fil4b8qX1tpRbEKMvUaQwAKfiE1RuTVWx4S2NWhxCby9S7OWAb8aFNutPX7LlLu9
	jPfCKoFNmv7Meg+Wo8xDjNnaJs4GZSmZN5wpU/K3vg8lHJZ6wLPgPgXf7cGWwq6Y
	7GahgV+1jfztGc3gJlnSi7P/hBXPX0xMvHY/7PHZ9RgI9+4r7+4ctanKCocy2uBs
	fzP5oy3lI4aLcRAO8oY9w12cLXZ4EhmFvIpxtvtMe2/b8ieNAXxBANlRoDBc5MrH
	DsWoFekrES8X8o4bmAOWw==
X-ME-Sender: <xms:5N2FZOrNq0O74gd6dHIsm-uzqm0Zgi3uYiJWWbORtUZGj6pd9rcSaQ>
    <xme:5N2FZMoE1TI8nt5IeETdVO_YB1GjRYDvqn5yYgppPt9ofrT3tu0Yzj3e5sSwsah-4
    KUF11h2YvXdvD9Nqgg>
X-ME-Received: 
 <xmr:5N2FZDPemJR57zww-AUSy2h-hgP0FhHAkMa1SWSYSNCpMYdIQxdwRlhb5RMLG9_mg1A9de0wYMLUcMaIsEwhGeW_tWGMpUsim2843IuUySvP6g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrgeduvddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:5N2FZN7Zn_JP_fPNlP3CO7QDbhPh7sAXVWritS8VGwz3zWGLzJHj8A>
    <xmx:5N2FZN77uIQ--gmRP_ICFOFrD64uo_S26T-KbdweAppR5RaEm-u_Jg>
    <xmx:5N2FZNhNm-posye0RRCgpE1aenH5uQl0aYKY13M1VL0uGGyfv9UWiw>
    <xmx:5N2FZPQCWQlukFQ2ArU75oXijC7a1Gm9I9SGPy04ra1fnMAAjKmf4w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jun 2023 10:44:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: firewire: use 'GPL' string for module license
 contributed by Takashi Sakamoto
Date: Sun, 11 Jun 2023 23:44:44 +0900
Message-Id: <20230611144445.221529-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611144445.221529-1-o-takashi@sakamocchi.jp>
References: <20230611144445.221529-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3P4GNZ575NWVLXWMUJTD6P5VCPQRWM7M
X-Message-ID-Hash: 3P4GNZ575NWVLXWMUJTD6P5VCPQRWM7M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3P4GNZ575NWVLXWMUJTD6P5VCPQRWM7M/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In MODULE_LICENSE macro, "GPL" string obsoletes "GPL v2" string by a
commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2"
bogosity").

This commit uses the preferable expression.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob.c         | 2 +-
 sound/firewire/digi00x/digi00x.c     | 2 +-
 sound/firewire/fireface/ff.c         | 2 +-
 sound/firewire/fireworks/fireworks.c | 2 +-
 sound/firewire/motu/motu.c           | 2 +-
 sound/firewire/tascam/tascam.c       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 06a7ced218e2..2ba5962beb30 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -15,7 +15,7 @@
 
 MODULE_DESCRIPTION("BridgeCo BeBoB driver");
 MODULE_AUTHOR("Takashi Sakamoto <o-takashi@sakamocchi.jp>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 static int index[SNDRV_CARDS]	= SNDRV_DEFAULT_IDX;
 static char *id[SNDRV_CARDS]	= SNDRV_DEFAULT_STR;
diff --git a/sound/firewire/digi00x/digi00x.c b/sound/firewire/digi00x/digi00x.c
index 995302808c27..704ae2a5316b 100644
--- a/sound/firewire/digi00x/digi00x.c
+++ b/sound/firewire/digi00x/digi00x.c
@@ -9,7 +9,7 @@
 
 MODULE_DESCRIPTION("Digidesign Digi 002/003 family Driver");
 MODULE_AUTHOR("Takashi Sakamoto <o-takashi@sakamocchi.jp>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 #define VENDOR_DIGIDESIGN	0x00a07e
 #define MODEL_CONSOLE		0x000001
diff --git a/sound/firewire/fireface/ff.c b/sound/firewire/fireface/ff.c
index 448e972028d9..82241058ea14 100644
--- a/sound/firewire/fireface/ff.c
+++ b/sound/firewire/fireface/ff.c
@@ -11,7 +11,7 @@
 
 MODULE_DESCRIPTION("RME Fireface series Driver");
 MODULE_AUTHOR("Takashi Sakamoto <o-takashi@sakamocchi.jp>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 static void name_card(struct snd_ff *ff)
 {
diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
index ffb6dd796243..dd4298876ac0 100644
--- a/sound/firewire/fireworks/fireworks.c
+++ b/sound/firewire/fireworks/fireworks.c
@@ -18,7 +18,7 @@
 
 MODULE_DESCRIPTION("Echo Fireworks driver");
 MODULE_AUTHOR("Takashi Sakamoto <o-takashi@sakamocchi.jp>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 static int index[SNDRV_CARDS]	= SNDRV_DEFAULT_IDX;
 static char *id[SNDRV_CARDS]	= SNDRV_DEFAULT_STR;
diff --git a/sound/firewire/motu/motu.c b/sound/firewire/motu/motu.c
index f8b7fe38751c..d73599eb7d5a 100644
--- a/sound/firewire/motu/motu.c
+++ b/sound/firewire/motu/motu.c
@@ -11,7 +11,7 @@
 
 MODULE_DESCRIPTION("MOTU FireWire driver");
 MODULE_AUTHOR("Takashi Sakamoto <o-takashi@sakamocchi.jp>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 const unsigned int snd_motu_clock_rates[SND_MOTU_CLOCK_RATE_COUNT] = {
 	/* mode 0 */
diff --git a/sound/firewire/tascam/tascam.c b/sound/firewire/tascam/tascam.c
index eb58d3fcf087..86880089de28 100644
--- a/sound/firewire/tascam/tascam.c
+++ b/sound/firewire/tascam/tascam.c
@@ -9,7 +9,7 @@
 
 MODULE_DESCRIPTION("TASCAM FireWire series Driver");
 MODULE_AUTHOR("Takashi Sakamoto <o-takashi@sakamocchi.jp>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 static const struct snd_tscm_spec model_specs[] = {
 	{
-- 
2.39.2

