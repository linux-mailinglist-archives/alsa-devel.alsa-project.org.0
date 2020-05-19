Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F01D9541
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:27:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7888315E4;
	Tue, 19 May 2020 13:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7888315E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887624;
	bh=Neb5fIhh4WmPEwl3S5PcdnaO4eXzatvOkFGZL5RFG9E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HqmE8gtDCHQ5szqSG+3EjQsXlAt/x+Fjvl6HcCPHxJLPH9Rehyxd/R+Yd8W8Hirl1
	 +Z0238+9s/muBlHzfISlYFlkGZYRIjzN7eVt980FA+f6E3Jy7kjwQad40JeEFBJ3Sq
	 8iqKWfJRlyNurE0pY+6opXi72IYvJ9IXEF6otZEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B2AAF80344;
	Tue, 19 May 2020 13:17:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4A50F802A9; Tue, 19 May 2020 13:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32DDAF80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32DDAF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Kv3qJ6Zb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="poltk4bF"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A0C55C0103;
 Tue, 19 May 2020 07:17:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=YNv877ecgxPco
 6dSRW+VlGXk88SPO4989DnMJ2IaVhw=; b=Kv3qJ6Zb+Lk/C4fxaT6m6QZ76B/BM
 138zPDPmFVh2TdpNEoFd+9t6G6eGRaKNkKgvZeZPyEsbpnbL/Mw+TdhM/x1S/ibq
 rDVtlnuWgmuyIWZkPJaK4VlV6B6MiTlcN9brO2M/+VF3+2aN5f/KemxE4D5qrjuh
 +M9vL51kJmFobaRYVeDoyz6Y31YafxiyWDTqTTJLvDJ/dXkA/IDaVBK1GzuXWUly
 MbDvxdjir3B1zBIKjm1xhR8f1znbc1wTRsYmuWckibLkpzCksJa3N88ueAofZvRD
 dsUofGKlmMRU+RKbBKB5zBQf3TcAqkSFsWR6b/uNUIoG084A0YewLbEKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=YNv877ecgxPco6dSRW+VlGXk88SPO4989DnMJ2IaVhw=; b=poltk4bF
 bSIeDF2nPi4sz3lwVG3QiF0Ftcm4uZBBf5y8aAfZA+o8dsxLIH2DKZFa3yPZbb2W
 UTNSLCtqmedNbXUFVF45kMF4shMFFPcFHIBmetC5X72C+9ScTuJERqkNn5w1dfrT
 8fCRL0xny6pV0BHFn2VmuLJrYp5Vs8XLL28PSXvrstyzhDOEEP2Qdf/YFFtpkabM
 DIvyJbuwmPyGfpHb3EVwYD7bx97AdtZuFp5jLgaYV4thtkMl3u2tlWpWDqzV7KDV
 GSy4WEGPeuFR+tKJCuJxKjCQbCJHT1oUMKnsYAMzB5gP5Ou5AwbZlyUKA9t28+dw
 BUrdsbzlUMRfag==
X-ME-Sender: <xms:McDDXhmbcFcpEoEzDQ7WhcSfemzxD7g01XLCP2kESSwtlzNbA-X9kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:McDDXs2bTFcOwRACQvplCFUbIqr65Gywv66Doh4_LpPqrzjvYjTvKg>
 <xmx:McDDXnrc9F2NlFURGJY6l9jepFEY_XEefsR3jUlksmX5F0uvULYWZg>
 <xmx:McDDXhnoslB-CL6I5k5LHIqUnp13rrZmOl3zFiPhOj89VxDKmSAMTw>
 <xmx:McDDXkibCR1Tt-eNvqpnHfsaPyVR0wBX2rBHcCN1Tywar_nXtOK7uQ>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 47348328005E;
 Tue, 19 May 2020 07:17:04 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 13/14] ALSA: firewire-motu: refactoring protocol v3 for clock
 source getter
Date: Tue, 19 May 2020 20:16:40 +0900
Message-Id: <20200519111641.123211-14-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
References: <20200519111641.123211-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

This commit splits the method to get clock source for protocol
version 3 so that model-dependent operations are explicitly defined.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v3.c | 98 +++++++++++++++++++-------
 1 file changed, 72 insertions(+), 26 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v3.c b/sound/firewire/motu/motu-protocol-v3.c
index cc100d7be0bf..fd49d1fcf473 100644
--- a/sound/firewire/motu/motu-protocol-v3.c
+++ b/sound/firewire/motu/motu-protocol-v3.c
@@ -87,54 +87,100 @@ int snd_motu_protocol_v3_set_clock_rate(struct snd_motu *motu,
 	return 0;
 }
 
-int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
-					  enum snd_motu_clock_source *src)
+static int detect_clock_source_828mk3(struct snd_motu *motu, u32 data,
+				      enum snd_motu_clock_source *src)
 {
-	__be32 reg;
-	u32 data;
-	unsigned int val;
-	int err;
-
-	err = snd_motu_transaction_read(motu, V3_CLOCK_STATUS_OFFSET, &reg,
-					sizeof(reg));
-	if (err < 0)
-		return err;
-	data = be32_to_cpu(reg);
-
-	val = data & V3_CLOCK_SOURCE_MASK;
-	if (val == 0x00) {
+	switch (data) {
+	case 0x00:
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
-	} else if (val == 0x01) {
+		break;
+	case 0x01:
 		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
-	} else if (val == 0x02) {
+		break;
+	case 0x02:
 		*src = SND_MOTU_CLOCK_SOURCE_SPH;
-	} else if (val == 0x10) {
+		break;
+	case 0x10:
 		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
-	} else if (val == 0x18 || val == 0x19) {
-		err = snd_motu_transaction_read(motu, V3_OPT_IFACE_MODE_OFFSET,
-						&reg, sizeof(reg));
+		break;
+	case 0x18:
+	case 0x19:
+	{
+		__be32 reg;
+		u32 options;
+		int err;
+
+		err = snd_motu_transaction_read(motu,
+				V3_OPT_IFACE_MODE_OFFSET, &reg, sizeof(reg));
 		if (err < 0)
 			return err;
-		data = be32_to_cpu(reg);
+		options = be32_to_cpu(reg);
 
-		if (val == 0x18) {
-			if (data & V3_NO_ADAT_OPT_IN_IFACE_A)
+		if (data == 0x18) {
+			if (options & V3_NO_ADAT_OPT_IN_IFACE_A)
 				*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT_A;
 			else
 				*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT_A;
 		} else {
-			if (data & V3_NO_ADAT_OPT_IN_IFACE_B)
+			if (options & V3_NO_ADAT_OPT_IN_IFACE_B)
 				*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT_B;
 			else
 				*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT_B;
 		}
-	} else {
+
+		break;
+	}
+	default:
 		*src = SND_MOTU_CLOCK_SOURCE_UNKNOWN;
+		break;
 	}
 
 	return 0;
 }
 
+static int v3_detect_clock_source(struct snd_motu *motu, u32 data,
+				  enum snd_motu_clock_source *src)
+{
+	switch (data) {
+	case 0x00:
+		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
+		break;
+	case 0x01:
+		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
+		break;
+	case 0x02:
+		*src = SND_MOTU_CLOCK_SOURCE_SPH;
+		break;
+	case 0x10:
+		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
+		break;
+	default:
+		*src = SND_MOTU_CLOCK_SOURCE_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
+int snd_motu_protocol_v3_get_clock_source(struct snd_motu *motu,
+					  enum snd_motu_clock_source *src)
+{
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
+	if (motu->spec == &snd_motu_spec_828mk3)
+		return detect_clock_source_828mk3(motu, data, src);
+	else
+		return v3_detect_clock_source(motu, data, src);
+}
+
 int snd_motu_protocol_v3_switch_fetching_mode(struct snd_motu *motu,
 					      bool enable)
 {
-- 
2.25.1

