Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DD1D953E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6F261761;
	Tue, 19 May 2020 13:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6F261761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887544;
	bh=K1VPGpNvVFsNcIzkxIcrl+hz1MPDPDsk+TMtMw82/4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Om7i8FvbI8Nu1lTQwMtBINZLJLwIpQYh+ppm9xyv7dM7ipuGhvZdeKJErHGIDhccY
	 iDv7G0x5sN2JkjYTSlSMczIs2FSx/NRqZmuTAu02q8oSA9pH6fOupEO1LA3bnCUSoE
	 UThiEbtcfX05x73YHr48kX29jUeJzZOb3flsLfuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DF8EF80333;
	Tue, 19 May 2020 13:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14CB4F802A9; Tue, 19 May 2020 13:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25F0DF8025E
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F0DF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="x8f3/72+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dA/2mYlY"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E6B45C00FC;
 Tue, 19 May 2020 07:17:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 19 May 2020 07:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=nlcOHwjmQzo9t
 erwl+BHtdrwPd4jxMe/9BOXUe8GfEY=; b=x8f3/72+hlbOtdbJnTquX5cViS9eJ
 cciOLKVMaMuX+ddZpHTUfPbLEVrUGuz197xyo/4LaFsfHoN4CvB1g9gKe6DDgDlP
 kjgK0579lCeWgBD7415tNBr+HUwsTTBwmzn4iZEHlblcvuHvh2oHYDdncdj7qCek
 pD+bk0Z/cbUXlzswhHKdWoDnDFHO2N/+eKktFrq/jpVT/P73K8pEprnGRq1nU72K
 erqWwcyogvxwg+TC8O/nUWpKmhmXmabcQ1UUhdUGBMSH87oBRNuq8ctrmHysqVKI
 N++nsPWlyPsCWFjIUogfhmQxtB0oz1+orriPAMmscPmMrCxHtEq0x+Pqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nlcOHwjmQzo9terwl+BHtdrwPd4jxMe/9BOXUe8GfEY=; b=dA/2mYlY
 /5AxQVXnPnV0K/hgaVyzvFy+WMtGmb5VsP/HZA3UqK3xIwKwVXIgvDovTTy3j3/7
 BCOzLZ/zmFGtHyFRnEipCvU/YsNhKrUMdOh1NNmyXTo0Il8aTaDeErTtac1RrZ1q
 ctDumMTIKMx4SOas1gi98JlVyU2TNlVyLMwp7QA90fvazh89GHU+eOHwusF8bx6e
 rLMSU1VN0MsiB602qCQQKFvLggth9mjIjmWMVwH9qB1+FhCi2HgyC7Ogi3Z3huDv
 /lLc/hHmtYhoeJ66IKvWnFkyS09WiW1SIMFIPg44SfyQRWuXXTmL1Z0kNfloHVRd
 clBoKrYyWZGJDQ==
X-ME-Sender: <xms:MMDDXgQEBzld__xY3qs5l7jFDMC6obUV96EfHjgjWU_CnBWgNG9auQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpeeknecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:MMDDXtxpPgmjuiRTCbiruz6_0SRXEv3dDG7uEQLrZnkgv06570x08g>
 <xmx:MMDDXt0S31jTXkgfIF6_KcYrDsXFjtFz_zv0DRAI8oOTLYOqsyhJAA>
 <xmx:MMDDXkACjZAesVQEd90wM-qN6uiGxUVpxD_QVBCrU-H609Fvuv3KVA>
 <xmx:MMDDXjd8W1XDCAkCgYMMPunryY5uUuDOjXyB_PFOR7vl63hQsRPt8Q>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 196E33280068;
 Tue, 19 May 2020 07:17:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Subject: [PATCH 12/14] ALSA: firewire-motu: refactoring protocol v2 for clock
 source getter
Date: Tue, 19 May 2020 20:16:39 +0900
Message-Id: <20200519111641.123211-13-o-takashi@sakamocchi.jp>
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
version 2 so that model-dependent operations are explicitly defined.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-protocol-v2.c | 48 +++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/motu/motu-protocol-v2.c b/sound/firewire/motu/motu-protocol-v2.c
index 1bdc905e8e22..2e6c3cc8a9e1 100644
--- a/sound/firewire/motu/motu-protocol-v2.c
+++ b/sound/firewire/motu/motu-protocol-v2.c
@@ -78,14 +78,10 @@ int snd_motu_protocol_v2_set_clock_rate(struct snd_motu *motu,
 					  sizeof(reg));
 }
 
-static int get_clock_source(struct snd_motu *motu, u32 data,
-			    enum snd_motu_clock_source *src)
+static int detect_clock_source_optical_model(struct snd_motu *motu, u32 data,
+					     enum snd_motu_clock_source *src)
 {
-	unsigned int index = data & V2_CLOCK_SRC_MASK;
-	if (index > 5)
-		return -EIO;
-
-	switch (index) {
+	switch (data) {
 	case 0:
 		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
 		break;
@@ -118,12 +114,48 @@ static int get_clock_source(struct snd_motu *motu, u32 data,
 		*src = SND_MOTU_CLOCK_SOURCE_ADAT_ON_DSUB;
 		break;
 	default:
-		return -EIO;
+		*src = SND_MOTU_CLOCK_SOURCE_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
+static int v2_detect_clock_source(struct snd_motu *motu, u32 data,
+				  enum snd_motu_clock_source *src)
+{
+	switch (data) {
+	case 0:
+		*src = SND_MOTU_CLOCK_SOURCE_INTERNAL;
+		break;
+	case 2:
+		*src = SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX;
+		break;
+	case 3:
+		*src = SND_MOTU_CLOCK_SOURCE_SPH;
+		break;
+	case 4:
+		*src = SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC;
+		break;
+	default:
+		*src = SND_MOTU_CLOCK_SOURCE_UNKNOWN;
+		break;
 	}
 
 	return 0;
 }
 
+static int get_clock_source(struct snd_motu *motu, u32 data,
+			    enum snd_motu_clock_source *src)
+{
+	data &= V2_CLOCK_SRC_MASK;
+	if (motu->spec == &snd_motu_spec_828mk2 ||
+	    motu->spec == &snd_motu_spec_traveler)
+		return detect_clock_source_optical_model(motu, data, src);
+	else
+		return v2_detect_clock_source(motu, data, src);
+}
+
 int snd_motu_protocol_v2_get_clock_source(struct snd_motu *motu,
 					  enum snd_motu_clock_source *src)
 {
-- 
2.25.1

