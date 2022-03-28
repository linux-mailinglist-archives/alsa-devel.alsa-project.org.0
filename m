Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3164E96CF
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 14:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9051117C6;
	Mon, 28 Mar 2022 14:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9051117C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648471028;
	bh=/Mcf3Xtc05RicaaDfP1rO1SMDmgoPSAQ2kNbmGOJ0oY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nuYPer8jIMNA4roZdwEjY1drsxMC9zFweKGcwRavXLRMAiac0pyJx0RKo+Ofpst9q
	 KPn3po11bLzhWJgxfOpkdajWk6GJB5fyUmL/AehRtFHXRC94XepW1iPtzhfOFhtFGl
	 5bSVRnWYbN03X2EaeV+149BDZU6KMc0EwTX9o9j4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F67EF8026D;
	Mon, 28 Mar 2022 14:36:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E994F8024C; Mon, 28 Mar 2022 14:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4172F80121
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 14:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4172F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="GpT37Lq+"
Received: from localhost.localdomain (unknown [123.112.67.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id D4B933F622; 
 Mon, 28 Mar 2022 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648470952;
 bh=wswi+jnFbxPy9HMqDyETigFc3JyKkrEaBCs6wU1CA2c=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=GpT37Lq+Yx8REI1O7ySXkJ8PYTOVXFx7hgWL7h9pxMekxwuYr9hzcbed3n6VmQTsK
 i/2f6Z+QiE8LhmJ7zR7c5zKy4FTQCrg32rq3BdXkOaGjuNKMLZP8WvvEqLxuGsysmv
 gaBHZKKdU0GM1uyf1fIlSs83rRUgFnYTk4EIYWg4826Ok1QI+qsLASl4qCHDiSC4gp
 rzX4/KbrtqlWwVF/daaaiCoNbAqsY3Ru9LsBMAkR7fd074G/0JBI2/ARCOQqLHHQ6I
 PTVQXrDmrCpLoCrRt2NMdVs7Pb/3HrlZvngD5O7tUCRSCYkCbt9DOBDD61vq2mXQER
 2/CL49UuOSB1Q==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com
Subject: [PATCH v3 1/2] ASoC: cs35l41: Add one more variable in the debug log
Date: Mon, 28 Mar 2022 20:35:34 +0800
Message-Id: <20220328123535.50000-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

otp_map[].size is a key variable to compute the value of otp_val and
to update the bit_offset, it is helpful to debug if could put it in
the debug log.

Reviewed-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/codecs/cs35l41-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index e5a56bcbb223..810643be13a4 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -822,8 +822,8 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 	word_offset = otp_map_match->word_offset;
 
 	for (i = 0; i < otp_map_match->num_elements; i++) {
-		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
-			bit_offset, word_offset, bit_sum % 32);
+		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d, otp_map[i].size = %u\n",
+			bit_offset, word_offset, bit_sum % 32, otp_map[i].size);
 		if (bit_offset + otp_map[i].size - 1 >= 32) {
 			otp_val = (otp_mem[word_offset] &
 					GENMASK(31, bit_offset)) >> bit_offset;
-- 
2.25.1

