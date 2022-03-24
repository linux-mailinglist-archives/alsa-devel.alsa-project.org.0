Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4C4E603D
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 09:20:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8DBC17BF;
	Thu, 24 Mar 2022 09:19:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8DBC17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648110004;
	bh=bR5Et1UCoK6XQGshnW1K3UVXobUDHPnxS5FZXBoScgU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ru44y9ZlEGWI7KGlTX/BifhDHuWgdJCANNqcQkbYMffNb9HvMszhFEvGip/onND1B
	 cOJNJ+qLz9PFDdeyrT5YQgBRo8IsbISS1JpTkxUzM/Jtefi+qaT1q9YEMFpkXAuOBP
	 K5+2kudK98jmKVpumJd6c87JyhLCpBmqzcPMAFm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45822F800AA;
	Thu, 24 Mar 2022 09:18:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C792CF801EC; Thu, 24 Mar 2022 09:18:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A95B3F800AA
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 09:18:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A95B3F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="YSrUzCP3"
Received: from localhost.localdomain (unknown [10.101.195.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A4CB63F61C; 
 Thu, 24 Mar 2022 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1648109928;
 bh=uR8Y6Vv3BDpXBjZE/HOWoWRGrzuJ5FIMsaRgymTkKmY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=YSrUzCP3rC3EjPcwaSPPvpW5lBS5PNNP0TATBu6aTueSTCf+m52DxDQ1q9TnGbD9Z
 uA7tS+XFz6j9DzO0aTM7J5CzV0Ttpvufy5FjSFztCyQngDJI7y2mdNhG6Fo+HYUbZS
 fuvYn4S5lkyJZnIlA7pbdbP8QbVS4qxGNo545T7mMDpV8MQtbmDbeokxjd7UYT1XFX
 xbNb9GY5iMesnmOim9sxCPghjrbUP0oy1eZMPcnzUlAckq0nJlCcry9SmdtVhak3d8
 w5VtAuT2bbd9ozq10cokR1btM7nGnjIeaooPbSIfYfqsUiaqc3hCXU1W8GE2O/qgUn
 OEc5d9YA0PKaQ==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 patches@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l41: Add one more variable in the debug log
Date: Thu, 24 Mar 2022 16:18:38 +0800
Message-Id: <20220324081839.62009-1-hui.wang@canonical.com>
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

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/codecs/cs35l41-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index e5a56bcbb223..d0a480c40231 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -822,8 +822,8 @@ int cs35l41_otp_unpack(struct device *dev, struct regmap *regmap)
 	word_offset = otp_map_match->word_offset;
 
 	for (i = 0; i < otp_map_match->num_elements; i++) {
-		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d\n",
-			bit_offset, word_offset, bit_sum % 32);
+		dev_dbg(dev, "bitoffset= %d, word_offset=%d, bit_sum mod 32=%d otp_map[i].size = %d\n",
+			bit_offset, word_offset, bit_sum % 32, otp_map[i].size);
 		if (bit_offset + otp_map[i].size - 1 >= 32) {
 			otp_val = (otp_mem[word_offset] &
 					GENMASK(31, bit_offset)) >> bit_offset;
-- 
2.25.1

