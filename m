Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604D336B64
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 06:23:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 814921709;
	Thu, 11 Mar 2021 06:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 814921709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615440233;
	bh=nKJpAWbmNGAWS0PnclTCWRar0su+QPYXRETlnt3lbx8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WePhzJqSSlg/gwHPx7V2j4U63NwGKvxyRxHXQs0GnXYafnJxlKLduMMY2LIhDd7mQ
	 p9GqUnqK6BSk0xGhw2ovDdt64/uUvLq4/DSQsTwJ67ncPEEcm5m0jUTnxrzNSENHCa
	 k/AOwYqZ5jw02TtJgEQNDQXMLdAOvvWGNicFjYjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76297F80482;
	Thu, 11 Mar 2021 06:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB76F802E7; Thu, 11 Mar 2021 06:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6E9EF80227
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E9EF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="2dG7dRSE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vCQ7AmUJ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 671412F9D;
 Thu, 11 Mar 2021 00:21:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 00:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=r9NmmVXj2X/lM
 wdRk/iv7M6mcJV1mKAwq4IuCDRDv5U=; b=2dG7dRSEnQrZ4IbLKfW+xogCGNc9L
 ZEc3zC4pEbXbSt+H0rwd/7hh2S6jOO3u56NTpE1nrM239eIRa9u/KesG5oSkXK9D
 Je2mAqrLBOHsIos9IQ0cZs45eAaPerEQcV4igseFS/msKS0sjXDfR9ssjFS6v82P
 urg/f37CdoiLNjOzLZDS6R0wAcUpR7xqq0tG4+2s/++xeSjDWppCzqwHnYA9h0HD
 C38dBnxqRWOpZzr/nY0sF1yJEcYePYCMdH1t/Q9bgbl1b2H0r8sTd9xZkw4/qSnE
 LJpN9cbjZamOmBWBCDEp+qhMnA5yKD5w4yuURFzgRT/1ncOGpOiYTsSJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=r9NmmVXj2X/lMwdRk/iv7M6mcJV1mKAwq4IuCDRDv5U=; b=vCQ7AmUJ
 cD076+gCySBw09M34TLx08ZghUXba4xQBir1YK+1vpJ0/2++uEJFcGpkTD3moh+J
 Uhe5X5R3BFZ9v9eI0+t/RM2+yP3rOM/TJPzmkKrNloRbOjEcs91DkgjGcepKOckI
 1vsis7uUlV2YcycadPXeNtvwyb26n0pKk8BRb4CzfZLMRYm/yZYuHcuDY33HQ+AQ
 j3J5FdWPAu08JZ+2yLxYmpwfSVnm5clRgykhbVi6kPMJus5R9aoNkkm5hM1js0xH
 wN9Ww6gE0jtm//lk8Lm+qOXVTVPXqBlfo5fxSy8X5jZs1K/023TRHaHGHut1T9YE
 g3HPJNE2rMEcDw==
X-ME-Sender: <xms:8ahJYNihyPbA2hirBMRjIjL6UMjgIV_SjNIagcA4Y9_3VYIMhtx59A>
 <xme:8ahJYCAV6x9G3WiEWlqzfGM7U1y44bMUdC4Wn3HsKiOlZ6EeA3jMLx4Jp9NFj2Z9s
 z6R-lw0bNA-jsx_jHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduledgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:8ahJYNEW8_zu6quXcIXY-kuhrWX3wm8z9ECGErTlIRLlb8jVL86STQ>
 <xmx:8ahJYCTpj6X3kOCGDBK_IqPVJ_fP-p-BHVeNIOHv2rOkq407RWCfXg>
 <xmx:8ahJYKxgMCuy7fdG7KerDPYUuDGlvcgJgf2SrNf9tEXOeLgkpwTRuw>
 <xmx:8qhJYAbdA9pFFGuAmHpjNoMikmb7fxsFoMelBSMWtljK0hUsvTNrYA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 00C8B240054;
 Thu, 11 Mar 2021 00:21:52 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-utils][PATCH 02/14] axfer: minor code arrangement in a point of
 stdio detection
Date: Thu, 11 Mar 2021 14:21:33 +0900
Message-Id: <20210311052146.404003-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
References: <20210311052146.404003-1-o-takashi@sakamocchi.jp>
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

Current implementation sets stdio member in a condition branch, however
it's convenient to set it always regardless of any condition.

This commit arranges assignment to the member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 axfer/container.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/axfer/container.c b/axfer/container.c
index 8733ff7..fb35eba 100644
--- a/axfer/container.c
+++ b/axfer/container.c
@@ -169,6 +169,14 @@ int container_parser_init(struct container_context *cntr,
 	// Open a target descriptor.
 	if (!strcmp(path, "-")) {
 		cntr->fd = fileno(stdin);
+	} else {
+		cntr->fd = open(path, O_RDONLY);
+		if (cntr->fd < 0)
+			return -errno;
+	}
+
+	cntr->stdio = (cntr->fd == fileno(stdin));
+	if (cntr->stdio) {
 		if (isatty(cntr->fd)) {
 			fprintf(stderr,
 				"A terminal is referred for standard input. "
@@ -176,11 +184,6 @@ int container_parser_init(struct container_context *cntr,
 				"should be referred instead.\n");
 			return -EIO;
 		}
-		cntr->stdio = true;
-	} else {
-		cntr->fd = open(path, O_RDONLY);
-		if (cntr->fd < 0)
-			return -errno;
 	}
 
 	err = set_nonblock_flag(cntr->fd);
@@ -254,6 +257,14 @@ int container_builder_init(struct container_context *cntr,
 		return -EINVAL;
 	if (!strcmp(path, "-")) {
 		cntr->fd = fileno(stdout);
+	} else {
+		cntr->fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
+		if (cntr->fd < 0)
+			return -errno;
+	}
+
+	cntr->stdio = (cntr->fd == fileno(stdout));
+	if (cntr->stdio) {
 		if (isatty(cntr->fd)) {
 			fprintf(stderr,
 				"A terminal is referred for standard output. "
@@ -261,11 +272,6 @@ int container_builder_init(struct container_context *cntr,
 				"should be referred instead.\n");
 			return -EIO;
 		}
-		cntr->stdio = true;
-	} else {
-		cntr->fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0644);
-		if (cntr->fd < 0)
-			return -errno;
 	}
 
 	err = set_nonblock_flag(cntr->fd);
-- 
2.27.0

