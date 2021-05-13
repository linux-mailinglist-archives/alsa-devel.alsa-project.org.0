Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B813F37F84C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 14:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4244C17E9;
	Thu, 13 May 2021 14:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4244C17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620910766;
	bh=Jmbsqs6uT3k5n2AcU9RI75bcmhrq93/FVqpyo7sBTP4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lFC8qMVTW5TazvQazSefTjb2AzWQNfkwMo1O+AfoyuYNzPZQPA76BgegZF4yV6K8S
	 ptwWKZtXkiiXlv9ItDIZeDBmdWqF/HGleC9QKbomJAjOEONjbaiTN8zUFJqGx1P/XZ
	 roP6jzOTlZIN5hH469WSN85QENGIHOUuZv62ru6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC941F80425;
	Thu, 13 May 2021 14:57:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8B10F802C4; Thu, 13 May 2021 14:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09A5EF80163
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 14:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09A5EF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="VATk/n/F"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VRnmhL+U"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2FA655C018D;
 Thu, 13 May 2021 08:57:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 13 May 2021 08:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=yl6WsJ+8WiVfG
 i4QQz4Tx8e0Pc0dhvQ1v4iJrm4iw9w=; b=VATk/n/FpUTHcvSNGrmZemRetz4pz
 RV20l6xwI7Wb+pbe13gqo+uDCxULRhMb067OuZ5jSB/usRK6JFq+HFO8CDpToN3b
 1EX3+eVW7G1W8rd7Zv6ox9pFr5MoCrNUCJ8Ec4UmqlAzXQBCWHquFjP6eyVbM71o
 fYm3QYdiyFVSxme1+aRNGraJtufchAmXthSWfDaYyPZTzsYFdGanMPVUy5WpWBsk
 mUpw5O+y+UatcvyF6sH71TTu0ocAjWGei3xFJfF+N+3pH73ZUlx/p8r1YEgUR8Em
 +LlZNsDs4N80lWpJUojX9mJLAY7JNkJklCcfkYCIk86n1c4F0BGDbxeeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=yl6WsJ+8WiVfGi4QQz4Tx8e0Pc0dhvQ1v4iJrm4iw9w=; b=VRnmhL+U
 15bFtlTIeyW8RjHUEacDKKoJrAGu5DrKzXNNUEUpPIN2vJ+/uXhQscB/lXQ0c2Gf
 YdcaQli5TeNa0a2cOkxohGVYIMN/qRnVYBvhh4YylW9mwiY54sqXIWi2HgnjFRpN
 cVXb5fKD7Y9l+lMvIIDJE+1FpttekFArJaOFzAWOo/XCQRtpE/YTIaxVaQg/dP6r
 zWAIomWU8ZDUmhjZpOnZ5/AW9GULpHLx9FVnOMFyKOh0DW3O/x3STXHC38XbCoon
 05HGIxUv59VkM2CGNHNyi4nr6bSYypSfB+VN7LuSq3/JK5VzUk5vP80nxSHIGVsa
 RozP3kFwJ76Ncw==
X-ME-Sender: <xms:HSKdYGUOH2x2cncqheDNBojegJ6fAuhVxKOC7xBLMPRx1HuFH-f3_g>
 <xme:HSKdYCn7OROubDTtM-JIxp4wyBgU1C_EdZY_2WyqsRBNeDHgbEy4qEJddvmZdsk-9
 24OLIsh3rGzBOT-L7M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:HSKdYKYeg1bGSmZA4gABT-Xn6--j1p6TW7nzgYQEhy8jjaN52xHVkw>
 <xmx:HSKdYNWcSB3gX410GgI48-_6H_Wb62nqKyR5VXIQSy6KFnb2IgOTnQ>
 <xmx:HSKdYAnpcTt57rUDHIgkOkSuuqzUwu8BiD8JGczKMdBL7ZWmLehGyA>
 <xmx:HSKdYMuN5PDCfypUI96hi-irwDgQoAY95QeAafvc6VTPLMPevdiykQ>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 13 May 2021 08:56:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/5] ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro
Date: Thu, 13 May 2021 21:56:49 +0900
Message-Id: <20210513125652.110249-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210513125652.110249-1-o-takashi@sakamocchi.jp>
References: <20210513125652.110249-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de, stable@vger.kernel.org
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

Mackie d.2 has an extension card for IEEE 1394 communication, which uses
BridgeCo DM1000 ASIC. On the other hand, Mackie d.4 Pro has built-in
function for IEEE 1394 communication by Oxford Semiconductor OXFW971,
according to schematic diagram available in Mackie website. Although I
misunderstood that Mackie d.2 Pro would be also a model with OXFW971,
it's wrong. Mackie d.2 Pro is a model which includes the extension card
as factory settings.

This commit fixes entries in Kconfig and comment in ALSA OXFW driver.

Cc: <stable@vger.kernel.org>
Fixes: fd6f4b0dc167 ("ALSA: bebob: Add skelton for BeBoB based devices")
Fixes: ec4dba5053e1 ("ALSA: oxfw: Add support for Behringer/Mackie devices")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/Kconfig       | 4 ++--
 sound/firewire/bebob/bebob.c | 2 +-
 sound/firewire/oxfw/oxfw.c   | 1 -
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index 25778765cbfe..9897bd26a438 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -38,7 +38,7 @@ config SND_OXFW
 	   * Mackie(Loud) Onyx 1640i (former model)
 	   * Mackie(Loud) Onyx Satellite
 	   * Mackie(Loud) Tapco Link.Firewire
-	   * Mackie(Loud) d.2 pro/d.4 pro
+	   * Mackie(Loud) d.4 pro
 	   * Mackie(Loud) U.420/U.420d
 	   * TASCAM FireOne
 	   * Stanton Controllers & Systems 1 Deck/Mixer
@@ -84,7 +84,7 @@ config SND_BEBOB
 	  * PreSonus FIREBOX/FIREPOD/FP10/Inspire1394
 	  * BridgeCo RDAudio1/Audio5
 	  * Mackie Onyx 1220/1620/1640 (FireWire I/O Card)
-	  * Mackie d.2 (FireWire Option)
+	  * Mackie d.2 (FireWire Option) and d.2 Pro
 	  * Stanton FinalScratch 2 (ScratchAmp)
 	  * Tascam IF-FW/DM
 	  * Behringer XENIX UFX 1204/1604
diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 2c8e3392a490..daeecfa8b9aa 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -387,7 +387,7 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	SND_BEBOB_DEV_ENTRY(VEN_BRIDGECO, 0x00010049, &spec_normal),
 	/* Mackie, Onyx 1220/1620/1640 (Firewire I/O Card) */
 	SND_BEBOB_DEV_ENTRY(VEN_MACKIE2, 0x00010065, &spec_normal),
-	/* Mackie, d.2 (Firewire Option) */
+	// Mackie, d.2 (Firewire option card) and d.2 Pro (the card is built-in).
 	SND_BEBOB_DEV_ENTRY(VEN_MACKIE1, 0x00010067, &spec_normal),
 	/* Stanton, ScratchAmp */
 	SND_BEBOB_DEV_ENTRY(VEN_STANTON, 0x00000001, &spec_normal),
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 1f1e3236efb8..9eea25c46dc7 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -355,7 +355,6 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	 *  Onyx-i series (former models):	0x081216
 	 *  Mackie Onyx Satellite:		0x00200f
 	 *  Tapco LINK.firewire 4x6:		0x000460
-	 *  d.2 pro:				Unknown
 	 *  d.4 pro:				Unknown
 	 *  U.420:				Unknown
 	 *  U.420d:				Unknown
-- 
2.27.0

