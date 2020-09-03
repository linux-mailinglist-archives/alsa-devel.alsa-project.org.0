Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB325CA05
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:13:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0396B1936;
	Thu,  3 Sep 2020 22:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0396B1936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599164011;
	bh=m/F4Oo/93kZwY/ksreB+EV/QOkK6Ynn8uTrSoFbusfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rO61cGQwP3ZKeumqv2CO3Au2CjSxbaHKdecDHKbYK+W9EZtN8mcOfzhfs725T/b+B
	 g3g82//yBn0EyFaz5sWORnQZlrH9FydaJ317xx37qQzIj2eeI83l1EzvM5DQKlaBB6
	 /KIm/7C90V+RZQUygVceo2Q0uLXYU0GBjnWp1KKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19CE9F802A9;
	Thu,  3 Sep 2020 22:11:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C8BF8020D; Thu,  3 Sep 2020 22:11:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F710F8020D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F710F8020D
IronPort-SDR: NQxikz+qv3q6mdTF5u2UtQqQgCCjTZ3EnI/J+0lXmp/AMzZi6pN0fBRhUbJx97ykw/yDBcYe4g
 H/fp5tcEhOeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="242471256"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="242471256"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 13:10:47 -0700
IronPort-SDR: hgL/lG4MDSrCr9J1pnfn2gfku1lHOxyyDaATYQqqzk11vp0znQZQ/mj/JDZKHA6P9/trgQxzre
 hf4LD+hUKrQA==
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="447033084"
Received: from mrcordie-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.195.28])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 13:10:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/3] topology: use inclusive language for bclk
Date: Thu,  3 Sep 2020 15:10:22 -0500
Message-Id: <20200903201024.1109914-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

use bclk_provider for structure fields, 'codec_provider' and
'codec_follower' for options and modify #defines to use CP and CF
suffixes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/uapi/asoc.h | 11 +++++++----
 include/topology.h        |  2 +-
 src/topology/pcm.c        | 37 +++++++++++++++++++++++++++----------
 3 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/include/sound/uapi/asoc.h b/include/sound/uapi/asoc.h
index 4efb4ec4..8558992f 100644
--- a/include/sound/uapi/asoc.h
+++ b/include/sound/uapi/asoc.h
@@ -169,10 +169,13 @@
 #define SND_SOC_TPLG_LNK_FLGBIT_VOICE_WAKEUP            (1 << 3)
 
 /* DAI topology BCLK parameter
- * For the backwards capability, by default codec is bclk master
+ * For the backwards capability, by default codec is bclk provider
  */
-#define SND_SOC_TPLG_BCLK_CM         0 /* codec is bclk master */
-#define SND_SOC_TPLG_BCLK_CS         1 /* codec is bclk slave */
+#define SND_SOC_TPLG_BCLK_CP         0 /* codec is bclk provider */
+#define SND_SOC_TPLG_BCLK_CF         1 /* codec is bclk follower */
+/* keep previous definitions for compatibility */
+#define SND_SOC_TPLG_BCLK_CM         SND_SOC_TPLG_BCLK_CP
+#define SND_SOC_TPLG_BCLK_CS         SND_SOC_TPLG_BCLK_CF
 
 /* DAI topology FSYNC parameter
  * For the backwards capability, by default codec is fsync master
@@ -335,7 +338,7 @@ struct snd_soc_tplg_hw_config {
 	__u8 clock_gated;	/* SND_SOC_TPLG_DAI_CLK_GATE_ value */
 	__u8 invert_bclk;	/* 1 for inverted BCLK, 0 for normal */
 	__u8 invert_fsync;	/* 1 for inverted frame clock, 0 for normal */
-	__u8 bclk_master;	/* SND_SOC_TPLG_BCLK_ value */
+	__u8 bclk_provider;	/* SND_SOC_TPLG_BCLK_ value */
 	__u8 fsync_master;	/* SND_SOC_TPLG_FSYNC_ value */
 	__u8 mclk_direction;    /* SND_SOC_TPLG_MCLK_ value */
 	__le16 reserved;	/* for 32bit alignment */
diff --git a/include/topology.h b/include/topology.h
index 1f52e66e..6c970649 100644
--- a/include/topology.h
+++ b/include/topology.h
@@ -1028,7 +1028,7 @@ struct snd_tplg_hw_config_template {
 	unsigned char clock_gated;      /* SND_SOC_TPLG_DAI_CLK_GATE_ value */
 	unsigned char  invert_bclk;     /* 1 for inverted BCLK, 0 for normal */
 	unsigned char  invert_fsync;    /* 1 for inverted frame clock, 0 for normal */
-	unsigned char  bclk_master;     /* SND_SOC_TPLG_BCLK_ value */
+	unsigned char  bclk_provider;   /* SND_SOC_TPLG_BCLK_ value */
 	unsigned char  fsync_master;    /* SND_SOC_TPLG_FSYNC_ value */
 	unsigned char  mclk_direction;  /* SND_SOC_TPLG_MCLK_ value */
 	unsigned short reserved;        /* for 32bit alignment */
diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index a60ba00d..c6fb07e2 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -1411,6 +1411,7 @@ int tplg_parse_hw_config(snd_tplg_t *tplg, snd_config_t *cfg,
 	snd_config_t *n;
 	const char *id, *val = NULL;
 	int ret, ival;
+	bool provider_legacy;
 
 	elem = tplg_elem_new_common(tplg, cfg, NULL, SND_TPLG_TYPE_HW_CONFIG);
 	if (!elem)
@@ -1451,8 +1452,15 @@ int tplg_parse_hw_config(snd_tplg_t *tplg, snd_config_t *cfg,
 			continue;
 		}
 
-		if (strcmp(id, "bclk") == 0 ||
-		    strcmp(id, "bclk_master") == 0) {
+		provider_legacy = false;
+		if (strcmp(id, "bclk_master") == 0) {
+			SNDERR("deprecated option %s, please use 'bclk'\n", id);
+			provider_legacy = true;
+		}
+
+		if (provider_legacy ||
+		    strcmp(id, "bclk") == 0) {
+
 			if (snd_config_get_string(n, &val) < 0)
 				return -EINVAL;
 
@@ -1462,12 +1470,21 @@ int tplg_parse_hw_config(snd_tplg_t *tplg, snd_config_t *cfg,
 				 */
 				SNDERR("deprecated bclk value '%s'", val);
 
-				hw_cfg->bclk_master = SND_SOC_TPLG_BCLK_CS;
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CF;
 			} else if (!strcmp(val, "codec_slave")) {
-				hw_cfg->bclk_master = SND_SOC_TPLG_BCLK_CS;
+				SNDERR("deprecated bclk value '%s', use 'codec_follower'", val);
+
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CF;
+			} else if (!strcmp(val, "codec_follower")) {
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CF;
 			} else if (!strcmp(val, "codec_master")) {
-				hw_cfg->bclk_master = SND_SOC_TPLG_BCLK_CM;
+				SNDERR("deprecated bclk value '%s', use 'codec_provider", val);
+
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CP;
+			} else if (!strcmp(val, "codec_provider")) {
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CP;
 			}
+
 			continue;
 		}
 
@@ -1623,10 +1640,10 @@ int tplg_save_hw_config(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 	if (err >= 0 && hc->fmt)
 		err = tplg_save_printf(dst, pfx, "\tformat '%s'\n",
 				       get_audio_hw_format_name(hc->fmt));
-	if (err >= 0 && hc->bclk_master)
+	if (err >= 0 && hc->bclk_provider)
 		err = tplg_save_printf(dst, pfx, "\tbclk '%s'\n",
-				       hc->bclk_master == SND_SOC_TPLG_BCLK_CS ?
-						"codec_slave" : "codec_master");
+				       hc->bclk_provider == SND_SOC_TPLG_BCLK_CF ?
+						"codec_follower" : "codec_provider");
 	if (err >= 0 && hc->bclk_rate)
 		err = tplg_save_printf(dst, pfx, "\tbclk_freq %u\n",
 				       hc->bclk_rate);
@@ -1791,7 +1808,7 @@ static int set_link_hw_config(struct snd_soc_tplg_hw_config *cfg,
 	cfg->clock_gated = tpl->clock_gated;
 	cfg->invert_bclk = tpl->invert_bclk;
 	cfg->invert_fsync = tpl->invert_fsync;
-	cfg->bclk_master = tpl->bclk_master;
+	cfg->bclk_provider = tpl->bclk_provider;
 	cfg->fsync_master = tpl->fsync_master;
 	cfg->mclk_direction = tpl->mclk_direction;
 	cfg->reserved = tpl->reserved;
@@ -2174,7 +2191,7 @@ next:
 		hw->clock_gated = link->hw_config[i].clock_gated;
 		hw->invert_bclk = link->hw_config[i].invert_bclk;
 		hw->invert_fsync = link->hw_config[i].invert_fsync;
-		hw->bclk_master = link->hw_config[i].bclk_master;
+		hw->bclk_provider = link->hw_config[i].bclk_provider;
 		hw->fsync_master = link->hw_config[i].fsync_master;
 		hw->mclk_direction = link->hw_config[i].mclk_direction;
 		hw->mclk_rate = link->hw_config[i].mclk_rate;
-- 
2.25.1

