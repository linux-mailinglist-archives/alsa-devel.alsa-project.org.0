Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A572B255
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 16:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648AEFA;
	Sun, 11 Jun 2023 16:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648AEFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686494817;
	bh=AXYzxEx+XTsw9Dut+WNQwtQjDYP/iIrP3C1wR3x3+lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OLsiVpr9/NTj5HbgrHlBFb+irdNROUT9Y3X91cIDHliHcS5ipc0Pp9Lk/Bu7QBcoc
	 fYIL83xp/vAVI4IYVZlkIEnrnJn2Jygj9I0EZBHuO8MlpJnGw2hZxULzOV2K5EInk1
	 jXVExYNV8WMFMLnSIgv8HNjIOFscnPhs+S6xpcdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B9BCF80548; Sun, 11 Jun 2023 16:45:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D12EF80533;
	Sun, 11 Jun 2023 16:45:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADD71F80155; Sun, 11 Jun 2023 16:45:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DF43F80132
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 16:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF43F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=Suq8TTRR;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZUN/bCpJ
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id EDE6C5C0107;
	Sun, 11 Jun 2023 10:44:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 11 Jun 2023 10:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1686494693; x=
	1686581093; bh=y8W5XAYxi+i+XBaEeXuvYqE2RJN4a7DM7SirQzqwMTk=; b=S
	uq8TTRR0dfskyPC2zzfUHYw96SuAKPnKhjdLEPGyBeWN+sg7FHE0mdQ3efvUtQgD
	pAFHq6b2PtGpCwgQ8e7J4IQ5BPyQNzuHsDmhuxvZ3ANoM39QnXfxOfHK8KJpKeom
	9FOM+Bs/S/9NfsE7eQUo34BH4dogdHuGEfGXi3C7bg9E0fYE9V+cMmapFTPJZETT
	9KKJ8QDRXXVPCQP502lswoFD7SQnFXN+fzwQyANkeE17ydItCUquODHBcPCH6DR2
	yz/J8k4Cv8ZYIvZxN5EDILqLPY1Eb24j0bZQnWnnQ+c+jz11UZZ7cG5dbkJLKLmX
	aeYmBh+7poXfAEkPLpyiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1686494693; x=
	1686581093; bh=y8W5XAYxi+i+XBaEeXuvYqE2RJN4a7DM7SirQzqwMTk=; b=Z
	UN/bCpJkRbk4Vap6peiuO0ggwPyA8C32hEOB5yfcD9CBhU2QV5AAJL6VEjkdeQ3v
	0jWXJsr8QEtPml/12l71WOFsJrELIEul4HOydM1YLSpomhp8x5/MCIwfH9Xu1mu+
	vus0nUaA7qHCWimMM6aMetFbPiA0oLeNYXcWT432C3p9soHsjDy2JQUiboV5wEBr
	+xFR60f6Ln/XrFS9UiXKR0u7gO6cx2D9HkRaWAMJGLutIcqCxNyYdu3l2g+gpq97
	TgBW/tVWtahmvv3sVopE68RWhZifull+Q9vuY6vswGPUXxu26BR4DVAK1oee2C04
	Xv2BtWrvMGpkDE9s9f7jA==
X-ME-Sender: <xms:5d2FZOl4JxYTvZKi0c-ee47VyVdkrc4aWeKu4VXuu_ugDmVI9KQLsw>
    <xme:5d2FZF3tMbInOw9R3ZAxfP5Vexv_j-liMGpTTddadj3So4FYHmcy2dUrkX59qNge3
    hYNf4QVr--fKYz2eWw>
X-ME-Received: 
 <xmr:5d2FZMr2nynJUtVPPYPM6ETjw3B_7prXQLB8-Ul8_r5tfxJekw8sP6QoM_yV5qi-D6JIjjWnuPrawDV-EY_7MHuPNcCp_peMIK0HidYN_1Qt9Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrgeduvddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedvjefgje
    euvdfguddukeelveetgfdtvefhtdfffeeigfevueetffeivdffkedvtdenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:5d2FZCn88GNadTYjP99EdyLOZGtMv6Rj-CflFV6vEG5XDZ0TcYIzQQ>
    <xmx:5d2FZM33N1A0zzZvcc1SzVynP245vnRY6lHrDhxFuzZ0IBvnAO2NyQ>
    <xmx:5d2FZJtMWShTfUHkfE1ZUaC90Xx-a5G9vcWBIEQkgrf2OJ5OgpGOfA>
    <xmx:5d2FZJ8D8pJgWHTL3HVwT4OGeXF0tsg3CTtpkPQ6IlQ0fsBizJ-R7A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jun 2023 10:44:52 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: firewire: use 'GPL' string for module license
 contributed by Clemens Ladisch
Date: Sun, 11 Jun 2023 23:44:45 +0900
Message-Id: <20230611144445.221529-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611144445.221529-1-o-takashi@sakamocchi.jp>
References: <20230611144445.221529-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SLQQED6ICVR6BUXYB37FESAH2AYDZJZU
X-Message-ID-Hash: SLQQED6ICVR6BUXYB37FESAH2AYDZJZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLQQED6ICVR6BUXYB37FESAH2AYDZJZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 sound/firewire/dice/dice.c | 2 +-
 sound/firewire/isight.c    | 2 +-
 sound/firewire/lib.c       | 2 +-
 sound/firewire/oxfw/oxfw.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 6036a5edbcb8..6c93e6e4982c 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -9,7 +9,7 @@
 
 MODULE_DESCRIPTION("DICE driver");
 MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 #define OUI_WEISS		0x001c6a
 #define OUI_LOUD		0x000ff2
diff --git a/sound/firewire/isight.c b/sound/firewire/isight.c
index 6655af53b367..806f82c9ceee 100644
--- a/sound/firewire/isight.c
+++ b/sound/firewire/isight.c
@@ -77,7 +77,7 @@ struct audio_payload {
 
 MODULE_DESCRIPTION("iSight audio driver");
 MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 
 static struct fw_iso_packet audio_packet = {
 	.payload_length = sizeof(struct audio_payload),
diff --git a/sound/firewire/lib.c b/sound/firewire/lib.c
index e0a2337e8f27..654e1a6050a9 100644
--- a/sound/firewire/lib.c
+++ b/sound/firewire/lib.c
@@ -69,4 +69,4 @@ EXPORT_SYMBOL(snd_fw_transaction);
 
 MODULE_DESCRIPTION("FireWire audio helper functions");
 MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index b496f87841ae..9523479fa94a 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -32,7 +32,7 @@
 
 MODULE_DESCRIPTION("Oxford Semiconductor FW970/971 driver");
 MODULE_AUTHOR("Clemens Ladisch <clemens@ladisch.de>");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("snd-firewire-speakers");
 MODULE_ALIAS("snd-scs1x");
 
-- 
2.39.2

