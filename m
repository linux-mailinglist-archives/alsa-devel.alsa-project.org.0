Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2EB2321EE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:49:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3BD16F3;
	Wed, 29 Jul 2020 17:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3BD16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596037772;
	bh=M/qJDKJMH7wrXeAbY+b8rOaxBgA1V/IqlSNrEl0RwNE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKbE3voLa85YLMTdtsrNPD9lMYmA7t7NaPNWzVKKuG8araGIVpTPA2Tqa6MdG0+3p
	 8ReY5n7ihDBHpc+fw142GQY5Fj7biv54B8mcXO3bXWhWBSzDNJZiN1iYWU6U6y9JPo
	 EN3BOC2Dm/MhskZWrq1ShCBEGOPhH1SR9VBqXJig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE0BEF802E3;
	Wed, 29 Jul 2020 17:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B10F802DB; Wed, 29 Jul 2020 17:45:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD9EF8012F
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD9EF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="WWZhs4ML"
Received: by mail-wm1-x342.google.com with SMTP id g8so3152501wmk.3
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4N4tDfzOiQqATdi2Zol4rwsnSDbJ8cgT+uEdMs1E22o=;
 b=WWZhs4MLKcUYxBMvUVTtWl0OAPx5neW6I3yi2mxSSN5FUCj+m2aiudakBjm5Zyn49G
 qNoZzgivw+l/W6yq8djsxGTazCCcggn8Pdw1nVPO/SxKY53BIYC8rJ37jQ6oVHIFn9bj
 TDE/IMadGdIEd6FW0+Uwn11oO/Wt7jiYKgY1uaAnpifIqkVnE+paKfydATCD8pnB1t8H
 RMPrl8/PzhHRDQVdgqTHRLIwQ0auujdmd+dX2focKFZz9yigqXmKMHqD8pW9euBmr4h9
 l2TOcSdKUsvE2xOj9nfWpk0IyMTwrJVcgBAyrVcS3yeK80UKf8oHd2oQg9BgVPf5Gep3
 qT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4N4tDfzOiQqATdi2Zol4rwsnSDbJ8cgT+uEdMs1E22o=;
 b=c7tTwsUqpI3vrv0fUovzGGc1qgF5zO5m/qVT/6LW/a7HgQFqi0wYL1aHteFEYQB62J
 TdbksT4WDj14lllF86gl4P/GI/hAEjxdR0BvwuSAxQ3LoZeHAjipld5uG30RD8W/8Qfe
 o4BF1P9LEoklemS3el9fqYyUXygpy6SFcDj6LwOnVau7l6XYLk6/+zMvbHSsYcVNIPc9
 Td6hIWyTY5stDQP84bAKmAggr9Id/DWDZGdh4XzzuDAb2iY9mZBTAmusWMkIBn6VEXnC
 hTqoQZ2//9Po5kkFk+5rYY6J9WxBGV+3p3G1Mx+kfCeRtq8ahhpDjf07UfaeXJpGSQpK
 yPZA==
X-Gm-Message-State: AOAM531fWAY1TyylesBJkRUIOspNznC7WvlHu7JXybZ5/GsWoVVbOfoa
 cnJcq+x46gVYMR0L7IzyO/Is9w==
X-Google-Smtp-Source: ABdhPJxDdW0mOc4UD1kq9GZvvkv4pRetXTg0qhqbn32pV9vNmdYnY++BBuAjJwZ83bppWNUoVHSA5g==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr6152075wmj.92.1596037516141; 
 Wed, 29 Jul 2020 08:45:16 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/4] ASoC: meson: axg-tdm-formatters: fix sclk inversion
Date: Wed, 29 Jul 2020 17:44:55 +0200
Message-Id: <20200729154456.1983396-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

After carefully checking, it appears that both tdmout and tdmin require the
rising edge of the sclk they get to be synchronized with the frame sync
event (which should be a rising edge of lrclk).

TDMIN was improperly set before this patch. Remove the sclk_invert quirk
which is no longer needed and fix the sclk phase.

Fixes: 1a11d88f499c ("ASoC: meson: add tdm formatter base driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 11 ++++++-----
 sound/soc/meson/axg-tdm-formatter.h |  1 -
 sound/soc/meson/axg-tdmin.c         |  2 --
 sound/soc/meson/axg-tdmout.c        |  3 ---
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 358c8c0d861c..f7e8e9da68a0 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -70,7 +70,7 @@ EXPORT_SYMBOL_GPL(axg_tdm_formatter_set_channel_masks);
 static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 {
 	struct axg_tdm_stream *ts = formatter->stream;
-	bool invert = formatter->drv->quirks->invert_sclk;
+	bool invert;
 	int ret;
 
 	/* Do nothing if the formatter is already enabled */
@@ -96,11 +96,12 @@ static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 		return ret;
 
 	/*
-	 * If sclk is inverted, invert it back and provide the inversion
-	 * required by the formatter
+	 * If sclk is inverted, it means the bit should latched on the
+	 * rising edge which is what our HW expects. If not, we need to
+	 * invert it before the formatter.
 	 */
-	invert ^= axg_tdm_sclk_invert(ts->iface->fmt);
-	ret = clk_set_phase(formatter->sclk, invert ? 180 : 0);
+	invert = axg_tdm_sclk_invert(ts->iface->fmt);
+	ret = clk_set_phase(formatter->sclk, invert ? 0 : 180);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-tdm-formatter.h b/sound/soc/meson/axg-tdm-formatter.h
index 9ef98e955cb2..a1f0dcc0ff13 100644
--- a/sound/soc/meson/axg-tdm-formatter.h
+++ b/sound/soc/meson/axg-tdm-formatter.h
@@ -16,7 +16,6 @@ struct snd_kcontrol;
 
 struct axg_tdm_formatter_hw {
 	unsigned int skew_offset;
-	bool invert_sclk;
 };
 
 struct axg_tdm_formatter_ops {
diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 3d002b4eb939..88ed95ae886b 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -228,7 +228,6 @@ static const struct axg_tdm_formatter_driver axg_tdmin_drv = {
 	.regmap_cfg	= &axg_tdmin_regmap_cfg,
 	.ops		= &axg_tdmin_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk	= false,
 		.skew_offset	= 2,
 	},
 };
@@ -238,7 +237,6 @@ static const struct axg_tdm_formatter_driver g12a_tdmin_drv = {
 	.regmap_cfg	= &axg_tdmin_regmap_cfg,
 	.ops		= &axg_tdmin_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk	= false,
 		.skew_offset	= 3,
 	},
 };
diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 418ec314b37d..3ceabddae629 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -238,7 +238,6 @@ static const struct axg_tdm_formatter_driver axg_tdmout_drv = {
 	.regmap_cfg	= &axg_tdmout_regmap_cfg,
 	.ops		= &axg_tdmout_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk = true,
 		.skew_offset = 1,
 	},
 };
@@ -248,7 +247,6 @@ static const struct axg_tdm_formatter_driver g12a_tdmout_drv = {
 	.regmap_cfg	= &axg_tdmout_regmap_cfg,
 	.ops		= &axg_tdmout_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk = true,
 		.skew_offset = 2,
 	},
 };
@@ -309,7 +307,6 @@ static const struct axg_tdm_formatter_driver sm1_tdmout_drv = {
 	.regmap_cfg	= &axg_tdmout_regmap_cfg,
 	.ops		= &axg_tdmout_ops,
 	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.invert_sclk = true,
 		.skew_offset = 2,
 	},
 };
-- 
2.25.4

