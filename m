Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B739E99F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5A5216AC;
	Tue,  8 Jun 2021 00:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5A5216AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104992;
	bh=DfijiQ+CSkdyTLYBCOX8TYldCSo1qQhFMuH1U1Ifnpc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvzJfU2uZmxRs4JDYLk9MkHHpFpUfUMa5kYWvf/Tg/q8yzbNUUy4ptXMn6fsqvfxf
	 kGUEjHFIuUzjNozUIYHK84VLFyugit9+tvO1/fVgsofdhZr5ZypOkTlTHGLhCwRz8c
	 PfFWVDvQSv0u554ZYIRfF87bejdUO3VNFjIy3iz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B998AF8052E;
	Tue,  8 Jun 2021 00:23:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E214DF80510; Tue,  8 Jun 2021 00:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BCF7F804C3
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BCF7F804C3
IronPort-SDR: xlcQso/QvWU56kXYyCp2KXRtaMTQHfIQc578aokuwg25Q7zyuM3VYEypSKxVBH7e2p6aDXWomJ
 3iUn2GOppgrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268581950"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="268581950"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:12 -0700
IronPort-SDR: tWFOJVNA9vl2O4tSzI7BmKqB1/Ye5QnnvfrlEwayHE1jA+//jSFVROQ17t3VsKkt73Kwa0/8gn
 wDJtXpYm6PGw==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449271010"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/15] ASoC: rt715-sdca: fix clock stop prepare timeout issue
Date: Mon,  7 Jun 2021 17:22:35 -0500
Message-Id: <20210607222239.582139-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

From: Jack Yu <jack.yu@realtek.com>

Fix clock stop prepare timeout issue (#2853).
The trigger of internal circuit which belong to
“SDCA preset stuffs” was not set correctly in previous driver,
which could block clock_stop_preparation state.
Add the correct register setting to fix it.

Fixes: 20d17057f0a8c ('ASoC: rt715-sdca: Add RT715 sdca vendor-specific driver')
Signed-off-by: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 1 +
 sound/soc/codecs/rt715-sdca-sdw.h | 1 +
 sound/soc/codecs/rt715-sdca.c     | 3 +++
 sound/soc/codecs/rt715-sdca.h     | 1 +
 4 files changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 7646bbe739f1..a5c673f43d82 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -70,6 +70,7 @@ static bool rt715_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x2000036:
 	case 0x2000037:
 	case 0x2000039:
+	case 0x2000044:
 	case 0x6100000:
 		return true;
 	default:
diff --git a/sound/soc/codecs/rt715-sdca-sdw.h b/sound/soc/codecs/rt715-sdca-sdw.h
index cd365bb60747..0cbc14844f8c 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.h
+++ b/sound/soc/codecs/rt715-sdca-sdw.h
@@ -113,6 +113,7 @@ static const struct reg_default rt715_mbq_reg_defaults_sdca[] = {
 	{ 0x2000036, 0x0000 },
 	{ 0x2000037, 0x0000 },
 	{ 0x2000039, 0xaa81 },
+	{ 0x2000044, 0x0202 },
 	{ 0x6100000, 0x0100 },
 	{ SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_FU_ADC8_9_VOL,
 		RT715_SDCA_FU_VOL_CTRL, CH_01), 0x00 },
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index d82166f1a378..66e166568c50 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -1054,6 +1054,9 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 		rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
 			RT715_REV_1, 0x40, 0x40);
 	}
+	/* DFLL Calibration trigger */
+	rt715_sdca_index_update_bits(rt715, RT715_VENDOR_REG,
+			RT715_DFLL_VAD, 0x1, 0x1);
 	/* trigger mode = VAD enable */
 	regmap_write(rt715->regmap,
 		SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
index 0c1fdd5bc7ca..90881b455ece 100644
--- a/sound/soc/codecs/rt715-sdca.h
+++ b/sound/soc/codecs/rt715-sdca.h
@@ -81,6 +81,7 @@ struct rt715_sdca_kcontrol_private {
 #define RT715_AD_FUNC_EN				0x36
 #define RT715_REV_1					0x37
 #define RT715_SDW_INPUT_SEL				0x39
+#define RT715_DFLL_VAD					0x44
 #define RT715_EXT_DMIC_CLK_CTRL2			0x54
 
 /* Index (NID:61h) */
-- 
2.25.1

