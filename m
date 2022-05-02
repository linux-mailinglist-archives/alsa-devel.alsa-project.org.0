Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D96C4516F44
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 14:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 353D41ED;
	Mon,  2 May 2022 14:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 353D41ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651493172;
	bh=9ajzmig39sZIW1tda8C5ZrZa0JA+CxOakY6tZ5XPreo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vQvC8IXwG1PwcmlJUplTPXnp8cBO/gicKwpObA+0pvesrixFS0msH1pE0518Gy3bQ
	 PlF5zPWj9AwczOuGJQqEP+DRdi5Eq+5j/NKXCg6Uo0M3pxwMRGaOHIesYiecbNhuWB
	 kRw1vtk4gooWm6kF0uaRc9OE/R+ZJQRzUXsvB12g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A838DF80249;
	Mon,  2 May 2022 14:05:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA85EF80245; Mon,  2 May 2022 14:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB346F80129
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 14:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB346F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Vecqb6cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651493106; x=1683029106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ajzmig39sZIW1tda8C5ZrZa0JA+CxOakY6tZ5XPreo=;
 b=Vecqb6cvWNMyUnmhUCURYwhFc0bol3ghOwcSi8RaXVgjMXT5eLDtPbBc
 0ApMj0oXJFYA/5G6VdVviRcg/Ra6LZhZ6/M1f5LoTjPl6IgF1ZnKn/8ks
 C66s5Vp7Uu9NKiM0mz5HePPiENXcsXNIwaf581n2tLGgr6Q9shJCIgBS/
 M144i7rS1Ql91qyz2Ja0DmtDN/jjnKhdX3LL/t9CnkS8JGN24A0H9WTP8
 g7p3hvlyzOw8PWxG1NrfF/aYVTSpKWOZYiB4TQuJi1a1Kka1vKA/xgp0n
 xSo96QGzHv4QV8KrBfr2YsucfQEyhtd/RoqMsx9SDLy+oJShpGy64wlgf Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="266773185"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="266773185"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 05:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="663493307"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 02 May 2022 05:04:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id F3115179; Mon,  2 May 2022 15:04:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: cs43130: Re-use generic struct u16_fract
Date: Mon,  2 May 2022 15:04:55 +0300
Message-Id: <20220502120455.84386-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lucas Tanure <tanureal@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 James Schulman <james.schulman@cirrus.com>
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

Instead of custom data type re-use generic struct u16_fract.
No changes intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/cs43130.c |  16 ++--
 sound/soc/codecs/cs43130.h | 151 +++++++++++++++++++------------------
 2 files changed, 84 insertions(+), 83 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 04548b577ad5..a2bce0f9f247 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -712,30 +712,30 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 	case CS43130_ASP_PCM_DAI:
 	case CS43130_ASP_DOP_DAI:
 		regmap_write(cs43130->regmap, CS43130_ASP_DEN_1,
-			     (clk_gen->den & CS43130_SP_M_LSB_DATA_MASK) >>
+			     (clk_gen->v.denominator & CS43130_SP_M_LSB_DATA_MASK) >>
 			     CS43130_SP_M_LSB_DATA_SHIFT);
 		regmap_write(cs43130->regmap, CS43130_ASP_DEN_2,
-			     (clk_gen->den & CS43130_SP_M_MSB_DATA_MASK) >>
+			     (clk_gen->v.denominator & CS43130_SP_M_MSB_DATA_MASK) >>
 			     CS43130_SP_M_MSB_DATA_SHIFT);
 		regmap_write(cs43130->regmap, CS43130_ASP_NUM_1,
-			     (clk_gen->num & CS43130_SP_N_LSB_DATA_MASK) >>
+			     (clk_gen->v.numerator & CS43130_SP_N_LSB_DATA_MASK) >>
 			     CS43130_SP_N_LSB_DATA_SHIFT);
 		regmap_write(cs43130->regmap, CS43130_ASP_NUM_2,
-			     (clk_gen->num & CS43130_SP_N_MSB_DATA_MASK) >>
+			     (clk_gen->v.numerator & CS43130_SP_N_MSB_DATA_MASK) >>
 			     CS43130_SP_N_MSB_DATA_SHIFT);
 		break;
 	case CS43130_XSP_DOP_DAI:
 		regmap_write(cs43130->regmap, CS43130_XSP_DEN_1,
-			     (clk_gen->den & CS43130_SP_M_LSB_DATA_MASK) >>
+			     (clk_gen->v.denominator & CS43130_SP_M_LSB_DATA_MASK) >>
 			     CS43130_SP_M_LSB_DATA_SHIFT);
 		regmap_write(cs43130->regmap, CS43130_XSP_DEN_2,
-			     (clk_gen->den & CS43130_SP_M_MSB_DATA_MASK) >>
+			     (clk_gen->v.denominator & CS43130_SP_M_MSB_DATA_MASK) >>
 			     CS43130_SP_M_MSB_DATA_SHIFT);
 		regmap_write(cs43130->regmap, CS43130_XSP_NUM_1,
-			     (clk_gen->num & CS43130_SP_N_LSB_DATA_MASK) >>
+			     (clk_gen->v.numerator & CS43130_SP_N_LSB_DATA_MASK) >>
 			     CS43130_SP_N_LSB_DATA_SHIFT);
 		regmap_write(cs43130->regmap, CS43130_XSP_NUM_2,
-			     (clk_gen->num & CS43130_SP_N_MSB_DATA_MASK) >>
+			     (clk_gen->v.numerator & CS43130_SP_N_MSB_DATA_MASK) >>
 			     CS43130_SP_N_MSB_DATA_SHIFT);
 		break;
 	default:
diff --git a/sound/soc/codecs/cs43130.h b/sound/soc/codecs/cs43130.h
index e62d671e95bb..1dd893674313 100644
--- a/sound/soc/codecs/cs43130.h
+++ b/sound/soc/codecs/cs43130.h
@@ -10,6 +10,8 @@
 #ifndef __CS43130_H__
 #define __CS43130_H__
 
+#include <linux/math.h>
+
 /* CS43130 registers addresses */
 /* all reg address is shifted by a byte for control byte to be LSB */
 #define CS43130_FIRSTREG	0x010000
@@ -372,97 +374,96 @@ enum cs43130_dai_id {
 };
 
 struct cs43130_clk_gen {
-	unsigned int	mclk_int;
-	int		fs;
-	u16		den;
-	u16		num;
+	unsigned int		mclk_int;
+	int			fs;
+	struct u16_fract	v;
 };
 
 /* frm_size = 16 */
 static const struct cs43130_clk_gen cs43130_16_clk_gen[] = {
-	{22579200,	32000,		441,		10,},
-	{22579200,	44100,		32,		1,},
-	{22579200,	48000,		147,		5,},
-	{22579200,	88200,		16,		1,},
-	{22579200,	96000,		147,		10,},
-	{22579200,	176400,		8,		1,},
-	{22579200,	192000,		147,		20,},
-	{22579200,	352800,		4,		1,},
-	{22579200,	384000,		147,		40,},
-	{24576000,	32000,		48,		1,},
-	{24576000,	44100,		5120,		147,},
-	{24576000,	48000,		32,		1,},
-	{24576000,	88200,		2560,		147,},
-	{24576000,	96000,		16,		1,},
-	{24576000,	176400,		1280,		147,},
-	{24576000,	192000,		8,		1,},
-	{24576000,	352800,		640,		147,},
-	{24576000,	384000,		4,		1,},
+	{ 22579200,	32000,		.v = { 441,	10, }, },
+	{ 22579200,	44100,		.v = { 32,	1, }, },
+	{ 22579200,	48000,		.v = { 147,	5, }, },
+	{ 22579200,	88200,		.v = { 16,	1, }, },
+	{ 22579200,	96000,		.v = { 147,	10, }, },
+	{ 22579200,	176400,		.v = { 8,	1, }, },
+	{ 22579200,	192000,		.v = { 147,	20, }, },
+	{ 22579200,	352800,		.v = { 4,	1, }, },
+	{ 22579200,	384000,		.v = { 147,	40, }, },
+	{ 24576000,	32000,		.v = { 48,	1, }, },
+	{ 24576000,	44100,		.v = { 5120,	147, }, },
+	{ 24576000,	48000,		.v = { 32,	1, }, },
+	{ 24576000,	88200,		.v = { 2560,	147, }, },
+	{ 24576000,	96000,		.v = { 16,	1, }, },
+	{ 24576000,	176400,		.v = { 1280,	147, }, },
+	{ 24576000,	192000,		.v = { 8,	1, }, },
+	{ 24576000,	352800,		.v = { 640,	147, }, },
+	{ 24576000,	384000,		.v = { 4,	1, }, },
 };
 
 /* frm_size = 32 */
 static const struct cs43130_clk_gen cs43130_32_clk_gen[] = {
-	{22579200,	32000,		441,		20,},
-	{22579200,	44100,		16,		1,},
-	{22579200,	48000,		147,		10,},
-	{22579200,	88200,		8,		1,},
-	{22579200,	96000,		147,		20,},
-	{22579200,	176400,		4,		1,},
-	{22579200,	192000,		147,		40,},
-	{22579200,	352800,		2,		1,},
-	{22579200,	384000,		147,		80,},
-	{24576000,	32000,		24,		1,},
-	{24576000,	44100,		2560,		147,},
-	{24576000,	48000,		16,		1,},
-	{24576000,	88200,		1280,		147,},
-	{24576000,	96000,		8,		1,},
-	{24576000,	176400,		640,		147,},
-	{24576000,	192000,		4,		1,},
-	{24576000,	352800,		320,		147,},
-	{24576000,	384000,		2,		1,},
+	{ 22579200,	32000,		.v = { 441,	20, }, },
+	{ 22579200,	44100,		.v = { 16,	1, }, },
+	{ 22579200,	48000,		.v = { 147,	10, }, },
+	{ 22579200,	88200,		.v = { 8,	1, }, },
+	{ 22579200,	96000,		.v = { 147,	20, }, },
+	{ 22579200,	176400,		.v = { 4,	1, }, },
+	{ 22579200,	192000,		.v = { 147,	40, }, },
+	{ 22579200,	352800,		.v = { 2,	1, }, },
+	{ 22579200,	384000,		.v = { 147,	80, }, },
+	{ 24576000,	32000,		.v = { 24,	1, }, },
+	{ 24576000,	44100,		.v = { 2560,	147, }, },
+	{ 24576000,	48000,		.v = { 16,	1, }, },
+	{ 24576000,	88200,		.v = { 1280,	147, }, },
+	{ 24576000,	96000,		.v = { 8,	1, }, },
+	{ 24576000,	176400,		.v = { 640,	147, }, },
+	{ 24576000,	192000,		.v = { 4,	1, }, },
+	{ 24576000,	352800,		.v = { 320,	147, }, },
+	{ 24576000,	384000,		.v = { 2,	1, }, },
 };
 
 /* frm_size = 48 */
 static const struct cs43130_clk_gen cs43130_48_clk_gen[] = {
-	{22579200,	32000,		147,		100,},
-	{22579200,	44100,		32,		3,},
-	{22579200,	48000,		49,		5,},
-	{22579200,	88200,		16,		3,},
-	{22579200,	96000,		49,		10,},
-	{22579200,	176400,		8,		3,},
-	{22579200,	192000,		49,		20,},
-	{22579200,	352800,		4,		3,},
-	{22579200,	384000,		49,		40,},
-	{24576000,	32000,		16,		1,},
-	{24576000,	44100,		5120,		441,},
-	{24576000,	48000,		32,		3,},
-	{24576000,	88200,		2560,		441,},
-	{24576000,	96000,		16,		3,},
-	{24576000,	176400,		1280,		441,},
-	{24576000,	192000,		8,		3,},
-	{24576000,	352800,		640,		441,},
-	{24576000,	384000,		4,		3,},
+	{ 22579200,	32000,		.v = { 147,	100, }, },
+	{ 22579200,	44100,		.v = { 32,	3, }, },
+	{ 22579200,	48000,		.v = { 49,	5, }, },
+	{ 22579200,	88200,		.v = { 16,	3, }, },
+	{ 22579200,	96000,		.v = { 49,	10, }, },
+	{ 22579200,	176400,		.v = { 8,	3, }, },
+	{ 22579200,	192000,		.v = { 49,	20, }, },
+	{ 22579200,	352800,		.v = { 4,	3, }, },
+	{ 22579200,	384000,		.v = { 49,	40, }, },
+	{ 24576000,	32000,		.v = { 16,	1, }, },
+	{ 24576000,	44100,		.v = { 5120,	441, }, },
+	{ 24576000,	48000,		.v = { 32,	3, }, },
+	{ 24576000,	88200,		.v = { 2560,	441, }, },
+	{ 24576000,	96000,		.v = { 16,	3, }, },
+	{ 24576000,	176400,		.v = { 1280,	441, }, },
+	{ 24576000,	192000,		.v = { 8,	3, }, },
+	{ 24576000,	352800,		.v = { 640,	441, }, },
+	{ 24576000,	384000,		.v = { 4,	3, }, },
 };
 
 /* frm_size = 64 */
 static const struct cs43130_clk_gen cs43130_64_clk_gen[] = {
-	{22579200,	32000,		441,		40,},
-	{22579200,	44100,		8,		1,},
-	{22579200,	48000,		147,		20,},
-	{22579200,	88200,		4,		1,},
-	{22579200,	96000,		147,		40,},
-	{22579200,	176400,		2,		1,},
-	{22579200,	192000,		147,		80,},
-	{22579200,	352800,		1,		1,},
-	{24576000,	32000,		12,		1,},
-	{24576000,	44100,		1280,		147,},
-	{24576000,	48000,		8,		1,},
-	{24576000,	88200,		640,		147,},
-	{24576000,	96000,		4,		1,},
-	{24576000,	176400,		320,		147,},
-	{24576000,	192000,		2,		1,},
-	{24576000,	352800,		160,		147,},
-	{24576000,	384000,		1,		1,},
+	{ 22579200,	32000,		.v = { 441,	40, }, },
+	{ 22579200,	44100,		.v = { 8,	1, }, },
+	{ 22579200,	48000,		.v = { 147,	20, }, },
+	{ 22579200,	88200,		.v = { 4,	1, }, },
+	{ 22579200,	96000,		.v = { 147,	40, }, },
+	{ 22579200,	176400,		.v = { 2,	1, }, },
+	{ 22579200,	192000,		.v = { 147,	80, }, },
+	{ 22579200,	352800,		.v = { 1,	1, }, },
+	{ 24576000,	32000,		.v = { 12,	1, }, },
+	{ 24576000,	44100,		.v = { 1280,	147, }, },
+	{ 24576000,	48000,		.v = { 8,	1, }, },
+	{ 24576000,	88200,		.v = { 640,	147, }, },
+	{ 24576000,	96000,		.v = { 4,	1, }, },
+	{ 24576000,	176400,		.v = { 320,	147, }, },
+	{ 24576000,	192000,		.v = { 2,	1, }, },
+	{ 24576000,	352800,		.v = { 160,	147, }, },
+	{ 24576000,	384000,		.v = { 1,	1, }, },
 };
 
 struct cs43130_bitwidth_map {
-- 
2.35.1

