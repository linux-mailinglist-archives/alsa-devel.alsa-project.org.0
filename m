Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C023B1562
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 10:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91DD166B;
	Wed, 23 Jun 2021 10:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91DD166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624435475;
	bh=JdM9pavdIbCq5Z39552H8Ecu1LfiXc6Hj841GcFTGlE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgApTm2sUXgDd2v7b1KeByCbzGg6I2mVIbE8Wg/fafr+bXHMy6UrQ9Q1oEuqlmbh9
	 PTvY5RXNbWYcKCYOGSN+B/VrcMyn7VCHTK2PBal05X2Ytwf7NFHbgQ/DJq+4MOd2w9
	 IYGjgR+5lO0XSgM5JyDuym78G1OkHcd5WYcT7tSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E55F804DF;
	Wed, 23 Jun 2021 10:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C483CF804DF; Wed, 23 Jun 2021 10:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E55B8F804B0
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 10:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E55B8F804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dbmeKqvQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XmC2yl2S"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4A50010B6;
 Wed, 23 Jun 2021 04:00:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Jun 2021 04:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=cZvbA7HJg/yrZ
 QKqzAoWYW3siIam0Njwr9/Wp1izCzU=; b=dbmeKqvQOOIifMOdv1qs/sIZtUczk
 VXeQntRVnfw8hjVM8+1glChOuuheuY8DAp+1sddPYC5UHUqxSLAEdDu9tNpFb4Ox
 DEdMsSFCzl9rpyKNdPizzF9RPJRMiYyYtTV0XijeayUVIaZMRET9XUTUY2PT08kz
 gNBZWIJftDj30qXcco0Zb9OwTMzfrFq2kNRwlyjVjpJnBQ1HKqj56heX4Kzrwc8l
 QsN1Xgf+0JqmRx4qPwWU8ibgKc2HDjw5dEl7JsypFEeR1XW+DS89vWU7ZdZ+jNk6
 KEmztIjD6m0eD8v9gN6SfVJi0yQnKxD43on7K9swcq0zhet/Dmb6z3OJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=cZvbA7HJg/yrZQKqzAoWYW3siIam0Njwr9/Wp1izCzU=; b=XmC2yl2S
 xSbmVJuJB4HpVWIT/THX0hOGiK7Bzi5qIFcCsI/TFqNHQm03s5YDAXFmkdew0uZY
 U2l6n6jzRk/G626j7CjQBlKD4ly5ObqRa73ma3G1VDge1oloPMXB3S7TK6oTSO4H
 IKMKQVBjcJPQPNKdoEy4MWCq4mQBE/EqhqPbRdtNgKZtaZMdwGVfrSUwCr7KZVEW
 CGiS54xPEUD2ZHNBr7eNn2oqvrU0kad61eU0Do8LGE0VgpWugLDJKL/+VUYFWDFZ
 a8RRe4gmSjxymOJqL7mF4sn79Aret7NIAqMnkRxtBRY94meWzwthUz1ZcxJ1c9n2
 umbg1tzCn00V5A==
X-ME-Sender: <xms:_-nSYPbEuvdv2aMZ-NdxqXunVtgrpaxaYFBr0eKw-exjCfnyro3JhA>
 <xme:_-nSYOb8OHbPgcHC5PbsQWewvRHtzS8eG_hgjfFJAU9Mulq90Nhz5i1Aq1huuFiPR
 k3V6tDFoYNCfksjHoc>
X-ME-Received: <xmr:_-nSYB-q4hi_9Z0kWPxsjIKNBm0Vp-reA_dYvx8A_dfaeCvq-L45czZjRuybiaqn8l6EAffwXBvbueYxWmIUa9_OiiejXxw513I6tAEn_OF73FlcybHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucevlhhushht
 vghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
 hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:_-nSYFq10Tj5bjVHUvdd_d2SVx8gl8yrhZ15_TYpXAMOr2X5xvUD-g>
 <xmx:_-nSYKrXdBFvIVHpmLFKzVYXO1iGJKBGiQ41nsFFNEf7T4eI6U27Kg>
 <xmx:_-nSYLQrISbtI9AJtMN___eMaIfsH1FkUmz3oqGupk24oTmjRz0ZiA>
 <xmx:_-nSYPBRBMpGbi1MAZMWluAVYkHPNo-Qxb-emfesX_tlzbCKYVb5ig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 03:59:58 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 6/9] ALSA: firewire-motu: code refactoring for source
 detection of sampling clock in v3 protocol
Date: Wed, 23 Jun 2021 16:59:38 +0900
Message-Id: <20210623075941.72562-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
References: <20210623075941.72562-1-o-takashi@sakamocchi.jp>
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

Current implementation of driver has two similar helper functions for
source detection of sampling clock. This commit merges them as a code
refactoring.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 59 ++++++--------------------
 1 file changed, 12 insertions(+), 47 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index 77e61e89770b..ab113651107b 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -97,9 +97,19 @@ int snd_motu_protocol_v3_set_clock_rate(struct snd_motu *motu,
 	return 0;
 }
 
-static int detect_clock_source_828mk3(struct snd_motu *motu, u32 data,
-				      enum snd_motu_clock_source *src)
+int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
+					  enum snd_motu_clock_source *src)
 {
+	__be32 reg;
+	u32 data;
+	int err;
+
+	err = snd_motu_transaction_read(motu, V3_CLOCK_STATUS_OFFSET, &reg,
+					sizeof(reg));
+	if (err < 0)
+		return err;
+	data = be32_to_cpu(reg) & V3_CLOCK_SOURCE_MASK;
+
 	switch (data) {
 	case 0x00:
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
@@ -118,7 +128,6 @@ static int detect_clock_source_828mk3(struct snd_motu *motu, u32 data,
 	{
 		__be32 reg;
 		u32 options;
-		int err;
 
 		err = snd_motu_transaction_read(motu,
 				V3_OPT_IFACE_MODE_OFFSET, &reg, sizeof(reg));
@@ -137,7 +146,6 @@ static int detect_clock_source_828mk3(struct snd_motu *motu, u32 data,
 			else
 				*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT_B;
 		}
-
 		break;
 	}
 	default:
@@ -148,49 +156,6 @@ static int detect_clock_source_828mk3(struct snd_motu *motu, u32 data,
 	return 0;
 }
 
-static int v3_detect_clock_source(struct snd_motu *motu, u32 data,
-				  enum snd_motu_clock_source *src)
-{
-	switch (data) {
-	case 0x00:
-		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
-		break;
-	case 0x01:
-		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
-		break;
-	case 0x02:
-		*src = SND_MOTU_CLOCK_SOURCE_SPH;
-		break;
-	case 0x10:
-		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
-		break;
-	default:
-		*src = SND_MOTU_CLOCK_SOURCE_UNKNOWN;
-		break;
-	}
-
-	return 0;
-}
-
-int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
-					  enum snd_motu_clock_source *src)
-{
-	__be32 reg;
-	u32 data;
-	int err;
-
-	err = snd_motu_transaction_read(motu, V3_CLOCK_STATUS_OFFSET, &reg,
-					sizeof(reg));
-	if (err < 0)
-		return err;
-	data = be32_to_cpu(reg) & V3_CLOCK_SOURCE_MASK;
-
-	if (motu->spec == &snd_motu_spec_828mk3_fw || motu->spec == &snd_motu_spec_828mk3_hybrid)
-		return detect_clock_source_828mk3(motu, data, src);
-	else
-		return v3_detect_clock_source(motu, data, src);
-}
-
 int snd_motu_protocol_v3_switch_fetching_mode(struct snd_motu *motu,
 					      bool enable)
 {
-- 
2.30.2

