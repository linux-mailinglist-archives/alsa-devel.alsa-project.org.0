Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7474BE97A9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:11:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB7562307;
	Wed, 30 Oct 2019 09:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB7562307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572423077;
	bh=KGmTLURGE9niQXFJDtMjQPpXav5i7BHkYWevglc4PUk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ege91qi8N0KEYID4RIJD28sstQAHISu5BMMjrcbNB0QUVh/iWmRh9cYAosidntNCy
	 JzeGv+Fr/OFYwTtd12KBBcSJzAtwxY/lwx2wWeNnDGLqratdgK6HZvqPkr/hqaoiMA
	 g5+EH1YpanZSlCiz/3K5aq/K8bBHEsn++ExRnn6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A65F8063B;
	Wed, 30 Oct 2019 09:07:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B30CF805AE; Wed, 30 Oct 2019 09:06:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74D5BF802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D5BF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PUVXPPkz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ufAGlv+v"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A156021E29;
 Wed, 30 Oct 2019 04:06:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 30 Oct 2019 04:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lPnFwmOzoAxfO
 Ck9z0gCam72sWGmuDMjE9qlknBPeF4=; b=PUVXPPkz7lbwgSIZobDB3hFbcOEST
 DzIVug2Xa5M3KweeauTwTbMABTkcZpvLxyiJJs71ENFgl3vq12E9bLIwDxX7hB/4
 qb3cwrsW7Xzj70yla1MCTkMe9He5WNUlUq2UWYyrGeuwL/RTYyxwKdREMSyF0O6U
 9MgnctQ394Ew4GUNEhwGWZG/yVhVyN4Nbk+4LoQYajaGrMA5rPJIz75qwVQLr6BM
 K8HBN1fSHbKZEu3LEmYB8Mh6RZHrp0+oxvFkeVpSK6zXYb2QVEaTTtbfCBDxY7Np
 fRYRiqwVM6zf0zuO5sy0Zmo9FJiEBGDz0XfbGvgEW2aqQe8nUmpUATzbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=lPnFwmOzoAxfOCk9z0gCam72sWGmuDMjE9qlknBPeF4=; b=ufAGlv+v
 0M29eukKqWEsce0+6NGcb0ioWnXFWPP+kgEum2ZlPtq8UbXvWunPpCot0KSmrrTl
 V0R9d8fUzTTpyy8MapeuozhxRhwAxh5HEW30h/k1ZjcnPpWLNZeYpVSUUURy0/SA
 Kq0MxOaIbtaI9l7T3vSLqC1sptRFtaad3ZIcLsyCPpwyLSm9xPlCGoHAfekE+Tt2
 fHVqDIzClUfxtKKEmfj1E4sPtA/B5+fnf7NKHtkW6cTZlrueGKPWfWjnOGqTqVhn
 HZQKmHP1XJFsyA9SmmCQsBlwJG5BC1QENueye5zPL7bVD050TA5GzRGUJ9k+sxss
 fbbjqVupcbzs2A==
X-ME-Sender: <xms:nkS5XdGumpPBRO4yRTXfQHzUIpRQdmvpRhMHN3zwHsCCXzWnHufhTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtvddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:nkS5XWDvNs_uw7qoO2uLnRp_oRp6jqsmbNDJd2wYopqjh9ZxGJJTyw>
 <xmx:nkS5XaM5RnhLPVBhKMmrvu2mOgkz1t-DqN6CVucsDqdS363MZbh5ug>
 <xmx:nkS5XQjca4XDbTV35jk48qtrgR2H8itZNb8m9MKGakFZM4768ELJ2g>
 <xmx:nkS5XfrCDKD0MnuNmlCgJMdmzIe4p0qbzrVxhblioFUBVBq5VDkchw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 53CD2306005C;
 Wed, 30 Oct 2019 04:06:53 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 30 Oct 2019 17:06:42 +0900
Message-Id: <20191030080644.1704-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030080644.1704-1-o-takashi@sakamocchi.jp>
References: <20191030080644.1704-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/6] ALSA: firewire-motu: minor code
	refactoring for protocol version 2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This commit adds some helper functions to parse register value for
source of sampling clock and nominal sampling transmission frequency.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 65 +++++++++++++++-----------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 2757e5b42b9b..cb0e58a9f33d 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -26,10 +26,20 @@
 #define  V2_OPT_IFACE_MODE_ADAT			1
 #define  V2_OPT_IFACE_MODE_SPDIF		2
 
+static int get_clock_rate(u32 data, unsigned int *rate)
+{
+	unsigned int index = (data & V2_CLOCK_RATE_MASK) >> V2_CLOCK_RATE_SHIFT;
+	if (index >= ARRAY_SIZE(snd_motu_clock_rates))
+		return -EIO;
+
+	*rate = snd_motu_clock_rates[index];
+
+	return 0;
+}
+
 static int v2_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
 {
 	__be32 reg;
-	unsigned int index;
 	int err;
 
 	err = snd_motu_transaction_read(motu, V2_CLOCK_STATUS_OFFSET, &reg,
@@ -37,13 +47,7 @@ static int v2_get_clock_rate(struct snd_motu *motu, unsigned int *rate)
 	if (err < 0)
 		return err;
 
-	index = (be32_to_cpu(reg) & V2_CLOCK_RATE_MASK) >> V2_CLOCK_RATE_SHIFT;
-	if (index >= ARRAY_SIZE(snd_motu_clock_rates))
-		return -EIO;
-
-	*rate = snd_motu_clock_rates[index];
-
-	return 0;
+	return get_clock_rate(be32_to_cpu(reg), rate);
 }
 
 static int v2_set_clock_rate(struct snd_motu *motu, unsigned int rate)
@@ -79,38 +83,33 @@ static int v2_set_clock_rate(struct snd_motu *motu, unsigned int rate)
 					  sizeof(reg));
 }
 
-static int v2_get_clock_source(struct snd_motu *motu,
-			       enum snd_motu_clock_source *src)
+static int get_clock_source(struct snd_motu *motu, u32 data,
+			    enum snd_motu_clock_source *src)
 {
-	__be32 reg;
-	unsigned int index;
-	int err;
-
-	err = snd_motu_transaction_read(motu, V2_CLOCK_STATUS_OFFSET, &reg,
-					sizeof(reg));
-	if (err < 0)
-		return err;
-
-	index = be32_to_cpu(reg) & V2_CLOCK_SRC_MASK;
+	unsigned int index = data & V2_CLOCK_SRC_MASK;
 	if (index > 5)
 		return -EIO;
 
-	/* To check the configuration of optical interface. */
-	err = snd_motu_transaction_read(motu, V2_IN_OUT_CONF_OFFSET, &reg,
-					sizeof(reg));
-	if (err < 0)
-		return err;
-
 	switch (index) {
 	case 0:
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
 		break;
 	case 1:
+	{
+		__be32 reg;
+
+		// To check the configuration of optical interface.
+		int err = snd_motu_transaction_read(motu, V2_IN_OUT_CONF_OFFSET,
+						    &reg, sizeof(reg));
+		if (err < 0)
+			return err;
+
 		if (be32_to_cpu(reg) & 0x00000200)
 			*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT;
 		else
 			*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_OPT;
 		break;
+	}
 	case 2:
 		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
 		break;
@@ -130,6 +129,20 @@ static int v2_get_clock_source(struct snd_motu *motu,
 	return 0;
 }
 
+static int v2_get_clock_source(struct snd_motu *motu,
+			       enum snd_motu_clock_source *src)
+{
+	__be32 reg;
+	int err;
+
+	err = snd_motu_transaction_read(motu, V2_CLOCK_STATUS_OFFSET, &reg,
+					sizeof(reg));
+	if (err < 0)
+		return err;
+
+	return get_clock_source(motu, be32_to_cpu(reg), src);
+}
+
 static int v2_switch_fetching_mode(struct snd_motu *motu, bool enable)
 {
 	__be32 reg;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
