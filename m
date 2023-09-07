Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C50797961
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977A1BC0;
	Thu,  7 Sep 2023 19:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977A1BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106730;
	bh=LTYQlpYjRWHhuzVTDClSJzTinidzBZZBJA3f8dy37pI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=icefcCBQ+IIpL24flnNYhIfgpNyVjyKUikJ8A383r5nC5FH8SpwE6VSaX4Df1dbOb
	 6OygC4KvzJqYi5PtTmd2z9PdvDGQwMSCq4/FO148U+VFtKW8N8zc40gg6RJcmAI7id
	 64YQOJekMzta/n9Tjm2+D9dVOJtFP6LJVJnHGJhE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 761BEF8057A; Thu,  7 Sep 2023 19:10:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA39F80578;
	Thu,  7 Sep 2023 19:10:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E95ECF804F3; Thu,  7 Sep 2023 19:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAE29F800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE29F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=E3FAUF13
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CFC7466072E5;
	Thu,  7 Sep 2023 18:10:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106621;
	bh=LTYQlpYjRWHhuzVTDClSJzTinidzBZZBJA3f8dy37pI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E3FAUF13OSTk1RLs/CeCermnjqevCEIh9qWcOU6CTBhA2Diwt80nW3OLY+wcNeta/
	 KXRJhZDKaAA/mkDgz3zFMYDXVVys8b/wAAG3PvsJEiyrQ60082aW4vnKySPNU1Hqg8
	 DWAwMs4kHlVs4t7gxXkxnBIpBRfMwefUPm/ML9LeWpwxY/oIKreIm3e/VWXXEm65Bx
	 mvOasm+2UYtDIToSSL0Gq0oYcSDApcrYuOlCHGf0vk3HLhNmRryd3I0V+qLKANisOn
	 lYlnliflUAhmuZW1TnkmC3g7ecPpQywNDfgqMMd5Zl4akcc3NW2ca526MaJeq4ejTV
	 90tdf9cBV66cg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 02/11] ASoC: cs35l41: Handle mdsync_up reg write errors
Date: Thu,  7 Sep 2023 20:10:01 +0300
Message-ID: <20230907171010.1447274-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 76R5JLMTSXUDM45HG6GXUNSDNQ2MI5CP
X-Message-ID-Hash: 76R5JLMTSXUDM45HG6GXUNSDNQ2MI5CP
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76R5JLMTSXUDM45HG6GXUNSDNQ2MI5CP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The return code of regmap_multi_reg_write() call related to "MDSYNC up"
sequence is shadowed by the subsequent regmap_read_poll_timeout()
invocation, which will hit a timeout in case the write operation above
fails.

Make sure cs35l41_global_enable() returns the correct error code instead
of -ETIMEDOUT.

Additionally, to be able to distinguish between the timeouts of
wait_for_completion_timeout() and regmap_read_poll_timeout(), print an
error message for the former and return immediately.  This also avoids
having to wait unnecessarily for the second time.

Fixes: f8264c759208 ("ALSA: cs35l41: Poll for Power Up/Down rather than waiting a fixed delay")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index a018f1d98428..a6c6bb23b957 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -1251,15 +1251,18 @@ int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l4
 
 		ret = wait_for_completion_timeout(pll_lock, msecs_to_jiffies(1000));
 		if (ret == 0) {
-			ret = -ETIMEDOUT;
-		} else {
-			regmap_read(regmap, CS35L41_PWR_CTRL3, &pwr_ctrl3);
-			pwr_ctrl3 |= CS35L41_SYNC_EN_MASK;
-			cs35l41_mdsync_up_seq[0].def = pwr_ctrl3;
-			ret = regmap_multi_reg_write(regmap, cs35l41_mdsync_up_seq,
-						     ARRAY_SIZE(cs35l41_mdsync_up_seq));
+			dev_err(dev, "Timed out waiting for pll_lock\n");
+			return -ETIMEDOUT;
 		}
 
+		regmap_read(regmap, CS35L41_PWR_CTRL3, &pwr_ctrl3);
+		pwr_ctrl3 |= CS35L41_SYNC_EN_MASK;
+		cs35l41_mdsync_up_seq[0].def = pwr_ctrl3;
+		ret = regmap_multi_reg_write(regmap, cs35l41_mdsync_up_seq,
+					     ARRAY_SIZE(cs35l41_mdsync_up_seq));
+		if (ret)
+			return ret;
+
 		ret = regmap_read_poll_timeout(regmap, CS35L41_IRQ1_STATUS1,
 					int_status, int_status & pup_pdn_mask,
 					1000, 100000);
-- 
2.41.0

