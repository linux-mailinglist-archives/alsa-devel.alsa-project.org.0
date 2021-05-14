Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DB93805B2
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 10:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959ED1795;
	Fri, 14 May 2021 10:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959ED1795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620982735;
	bh=FH3fKSLjoSNRWJdpMLaR2n5I4RdQDT8u4WOGidERsIw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HciZLLywKq20AG9QZjh0mKrVuhiZIrR1TwTeS6TmCZnuT2F6bv5iJshmLT6yxRSYS
	 anPoDu4p+G3GvtZl1b9ekEAb5Pe0aBxalvwBRE+722CATY/9I6IEPpEmBYPjZsjaZY
	 GthWRZBhvchD/ekPtJvsYO0o5y7sGAAgueSQeq28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB204F804E0;
	Fri, 14 May 2021 10:55:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2B1F80424; Fri, 14 May 2021 10:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43348F802CA
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43348F802CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rtAqLCC3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VQekJLbT"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 769D75C0068;
 Fri, 14 May 2021 04:54:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 14 May 2021 04:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=04B8WSGwX5etz
 joVcth0fUo+6aT5eIGOIh6BYnsQgE4=; b=rtAqLCC3qDNx9x6mLnYnjGncmyHxe
 dI2BwKiXUHXKnA+axWMB0y79xozVcDGDz5hWfB8lv1QHqmOTMQCCSD/8M6o12Pn8
 dC9e6hH1/uLO52xS2CH5v1XydVbiv9aSbELUXu02E1+KPJ/NjkoWdBBnZ+jlgDRS
 RBcUIgaWCupPi2vwvA7GHgg3fnrrSw4F7/IAvVXK2oRtYm1IjFQGrGc2McJ0+ZjU
 rdc973jv7VNIXxWYWcIwqCRZGhoqGKsRcsdCPmKw3PJQBWvWJUcZYRyRNY9+8+Qg
 qz0oixkoVRoU7zrSc9jjcQ07/tvLbfs1CjVQlNYVQbUaCMx28X1dwfDCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=04B8WSGwX5etzjoVcth0fUo+6aT5eIGOIh6BYnsQgE4=; b=VQekJLbT
 TxlfvH6m8tqcdcG3YtFfezTvu3HFmWJYhaf14UwLxxLbTgX+i4V3pBaWh+5UAiU9
 lHdv+W9yli1lk6VPRqUFxVivsqPH2qt9c6mvRpLXFhXzGx5Atef1KPRMPYAE4qOE
 /p/hN7TCa5Qh3eehsV+qtTTp1rNdaJ1/Q4w8iZ0XZiD2FIm0oAFC+4nxt/OWmD3H
 AWbG7puAM/mvsgW8hmHV2vrx6q0hhXioAcU1ni2JwA8BJv+f+pPFIJlRyZPi/GLE
 7bRjE40MVZR9AijJIKGmtc/AgOjORzhK5vMckp9WBzy2A6e0gppeaaHzVV8ZBvKQ
 MsiatGoJR1BSXg==
X-ME-Sender: <xms:2jqeYHNKp-drDZgAUYh58zUpGuFsCHWCjVNRh04mG4TAKvAtnhmlng>
 <xme:2jqeYB8hGJPTrmUG1yHgjSbq_Iu_E0wb-SEbxWPzPImLTJLXMy8Wv0VIRl3VNHy_E
 qk9TZ79UUOm5pY_nso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudeg
 rdefrdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:2jqeYGRM_LCEJzdjvzo1B2zPF6iCna-e3u0sJ3ybSddU0G0Kpxyveg>
 <xmx:2jqeYLvKIXEhfnyJ2ODGlw4YKXLAPBvWduJbOC2mNAMOqeg4sgteEA>
 <xmx:2jqeYPcXL9I3Z21nNq8lAFVmaH_f2QgkLFT9IJ3bWZm_YNOClsIZbw>
 <xmx:2jqeYPkRudLMozb76iZ5QrxCjnzKR9kj4NzLInh6E6rmfvHsAAT23g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 14 May 2021 04:54:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 7/7] ALSA: oxfw; code refactoring for wrong_dbs quirk
Date: Fri, 14 May 2021 17:54:35 +0900
Message-Id: <20210514085435.92807-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
References: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A new entry is added to the quirk enumeration for wrong_dbs quirk to
obsolete structure member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 2 +-
 sound/firewire/oxfw/oxfw.c        | 2 +-
 sound/firewire/oxfw/oxfw.h        | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 33a7d0f308f1..9edd8515f586 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -163,7 +163,7 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 
 		if (oxfw->quirks & SND_OXFW_QUIRK_JUMBO_PAYLOAD)
 			flags |= CIP_JUMBO_PAYLOAD;
-		if (oxfw->wrong_dbs)
+		if (oxfw->quirks & SND_OXFW_QUIRK_WRONG_DBS)
 			flags |= CIP_WRONG_DBS;
 	} else {
 		conn = &oxfw->in_conn;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 8a0bb8229c66..0dcd9eda4d40 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -176,7 +176,7 @@ static int detect_quirks(struct snd_oxfw *oxfw)
 	 * value in 'dbs' field of CIP header against its format information.
 	 */
 	if (vendor == VENDOR_LOUD && model == MODEL_SATELLITE)
-		oxfw->wrong_dbs = true;
+		oxfw->quirks |= SND_OXFW_QUIRK_WRONG_DBS;
 
 	return 0;
 }
diff --git a/sound/firewire/oxfw/oxfw.h b/sound/firewire/oxfw/oxfw.h
index 9e1c12546ab5..1b0c53802569 100644
--- a/sound/firewire/oxfw/oxfw.h
+++ b/sound/firewire/oxfw/oxfw.h
@@ -36,6 +36,8 @@ enum snd_oxfw_quirk {
 	// Postpone transferring packets during handling asynchronous transaction. As a result,
 	// next isochronous packet includes more events than one packet can include.
 	SND_OXFW_QUIRK_JUMBO_PAYLOAD = 0x01,
+	// The dbs field of CIP header in tx packet is wrong.
+	SND_OXFW_QUIRK_WRONG_DBS = 0x02,
 };
 
 /* This is an arbitrary number for convinience. */
@@ -50,7 +52,6 @@ struct snd_oxfw {
 	struct delayed_work dwork;
 
 	enum snd_oxfw_quirk quirks;
-	bool wrong_dbs;
 	bool has_output;
 	bool has_input;
 	u8 *tx_stream_formats[SND_OXFW_STREAM_FORMAT_ENTRIES];
-- 
2.27.0

