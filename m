Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 633078BF0D7
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 01:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94442843;
	Wed,  8 May 2024 01:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94442843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715123519;
	bh=sAAr9VYn+hvAOzBBZthjzXP3fDcDZfnu5BuEBB9blKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BzkQL0GIQl85NDFkpEOFtpNFlZfHZmUijX4mFBDQY3coreO4QfZ6OLf+TcBOeDgvQ
	 zg3hWeIBgbLbNAzaqHnohD2jIWj9iT2A4Zfv9DZHeixzCIQL3zg8eQhRACyFhOOpau
	 IFhSLKTVAcflzCAkctw0Ezq0cY4HLQsTYXPtDSWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF55CF805FF; Wed,  8 May 2024 01:11:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 664C2F805FC;
	Wed,  8 May 2024 01:11:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30999F8057B; Wed,  8 May 2024 01:11:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51F11F80563
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 01:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51F11F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hPxhBsxF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84D3ACE174D;
	Tue,  7 May 2024 23:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACD9C4AF17;
	Tue,  7 May 2024 23:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715123455;
	bh=sAAr9VYn+hvAOzBBZthjzXP3fDcDZfnu5BuEBB9blKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hPxhBsxFUAjNyDVILyASJ2Zh7QUDm9FKMj2Y8lFQCawg+ZqF2B7uIQqTPgjRm7YBt
	 WmGlJaKPuwXXnN9rdXBTelxvj4vGpd6P3mZkIYpBa4G8Wkwmbjhqo8FdyYvWpISpaS
	 nM+J/qFm+OrR+mRnkS9+7/6uMbZOms4fmJHf9IcYnkzBWYTjIZW9OBY37uBMqc1NDy
	 aBRxXJ14HcPYwFSV61vxqX/UTP6v4NFJ9sSp/cALtZlk3LSp81K77vBx4dApUaaQaG
	 63GtYANT/6Sj2daBgHCS7Riv+vc1czFplXov8JRUihbWo0JpiIggvkPsg9fiCmgWKx
	 pqWPYqPscE6bA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 12/43] ASoC: cs35l41: Update DSP1RX5/6 Sources for
 DSP config
Date: Tue,  7 May 2024 19:09:33 -0400
Message-ID: <20240507231033.393285-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231033.393285-1-sashal@kernel.org>
References: <20240507231033.393285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6NWDO6OE6YKRI4FMLXUJK4LN53GJ5WLL
X-Message-ID-Hash: 6NWDO6OE6YKRI4FMLXUJK4LN53GJ5WLL
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NWDO6OE6YKRI4FMLXUJK4LN53GJ5WLL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Stefan Binding <sbinding@opensource.cirrus.com>

[ Upstream commit eefb831d2e4dd58d58002a2ef75ff989e073230d ]

Currently, all ASoC systems are set to use VPMON for DSP1RX5_SRC,
however, this is required only for internal boost systems.
External boost systems require VBSTMON instead of VPMON to be the
input to DSP1RX5_SRC.
Shared Boost Active acts like Internal boost (requires VPMON).
Shared Boost Passive acts like External boost (requires VBSTMON)
All systems require DSP1RX6_SRC to be set to VBSTMON.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://msgid.link/r/20240411142648.650921-1-sbinding@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs35l41.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 5456e6bfa242f..bc541293089f0 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1095,6 +1095,7 @@ static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cf
 static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 {
 	struct wm_adsp *dsp;
+	uint32_t dsp1rx5_src;
 	int ret;
 
 	dsp = &cs35l41->dsp;
@@ -1114,16 +1115,29 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 		return ret;
 	}
 
-	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX5_SRC,
-			   CS35L41_INPUT_SRC_VPMON);
+	switch (cs35l41->hw_cfg.bst_type) {
+	case CS35L41_INT_BOOST:
+	case CS35L41_SHD_BOOST_ACTV:
+		dsp1rx5_src = CS35L41_INPUT_SRC_VPMON;
+		break;
+	case CS35L41_EXT_BOOST:
+	case CS35L41_SHD_BOOST_PASS:
+		dsp1rx5_src = CS35L41_INPUT_SRC_VBSTMON;
+		break;
+	default:
+		dev_err(cs35l41->dev, "wm_halo_init failed - Invalid Boost Type: %d\n",
+			cs35l41->hw_cfg.bst_type);
+		goto err_dsp;
+	}
+
+	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX5_SRC, dsp1rx5_src);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write INPUT_SRC_VPMON failed: %d\n", ret);
+		dev_err(cs35l41->dev, "Write DSP1RX5_SRC: %d failed: %d\n", dsp1rx5_src, ret);
 		goto err_dsp;
 	}
-	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX6_SRC,
-			   CS35L41_INPUT_SRC_CLASSH);
+	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX6_SRC, CS35L41_INPUT_SRC_VBSTMON);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Write INPUT_SRC_CLASSH failed: %d\n", ret);
+		dev_err(cs35l41->dev, "Write CS35L41_INPUT_SRC_VBSTMON failed: %d\n", ret);
 		goto err_dsp;
 	}
 	ret = regmap_write(cs35l41->regmap, CS35L41_DSP1_RX7_SRC,
-- 
2.43.0

