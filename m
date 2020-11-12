Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C52392B09FD
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 527B21809;
	Thu, 12 Nov 2020 17:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 527B21809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605198708;
	bh=J2RrIBmE/5E40OTST4AzLdvLWGtS+l+TKfqXIf92RE4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JL+83TS3mdPkmLv2o3sNwnqYJNeoClnJ3aHpLnK6iNOQ8D1X/H+aAr2NIRDkuz0eP
	 gKUE+gYX2/RShRlT1WOVHuEnoTt29EjYo10J63oOGt6aJXhmOu5HSfL0ehCuJ5Z3M5
	 vQz/XllNiIRk1s2TcVNcHcUXQlHqgCGXNNv4fALI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD540F8021C;
	Thu, 12 Nov 2020 17:30:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC87F8007E; Thu, 12 Nov 2020 17:30:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF133F8007E
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF133F8007E
IronPort-SDR: /qAr9U4t4cK1VQ3xQznLSdS4wOUEbfFQIT3izSZVuE81pWuQDZ0XTmSB41W3j865Ne4UolHqFO
 swH/jpGfn3Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="157355217"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="157355217"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:30:04 -0800
IronPort-SDR: xzrr0vRg3zU6/W2katBS14BSYuwir42vAVhw+gBpFtb917I/hPRpIoGAIBk2Ee8okMJqEzDoTX
 HUC1L1Z9Dz4Q==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="357147665"
Received: from nsalmulx-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.36.117])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:30:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RESEND 1/3] topology: use inclusive language for bclk
Date: Thu, 12 Nov 2020 10:29:38 -0600
Message-Id: <20201112162940.4970-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112162940.4970-1-pierre-louis.bossart@linux.intel.com>
References: <20201112162940.4970-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
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
'codec_consumer' for options and modify #defines to use CP and CC
suffixes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/uapi/asoc.h | 11 +++++++----
 include/topology.h        |  2 +-
 src/topology/pcm.c        | 36 ++++++++++++++++++++++++++----------
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/include/sound/uapi/asoc.h b/include/sound/uapi/asoc.h
index 4efb4ec4..ceafb1a9 100644
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
+#define SND_SOC_TPLG_BCLK_CC         1 /* codec is bclk consumer */
+/* keep previous definitions for compatibility */
+#define SND_SOC_TPLG_BCLK_CM         SND_SOC_TPLG_BCLK_CP
+#define SND_SOC_TPLG_BCLK_CS         SND_SOC_TPLG_BCLK_CC
 
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
index 191b7a0a..f05df348 100644
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
 
@@ -1462,11 +1470,19 @@ int tplg_parse_hw_config(snd_tplg_t *tplg, snd_config_t *cfg,
 				 */
 				SNDERR("deprecated bclk value '%s'", val);
 
-				hw_cfg->bclk_master = SND_SOC_TPLG_BCLK_CS;
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CC;
 			} else if (!strcmp(val, "codec_slave")) {
-				hw_cfg->bclk_master = SND_SOC_TPLG_BCLK_CS;
+				SNDERR("deprecated bclk value '%s', use 'codec_consumer'", val);
+
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CC;
+			} else if (!strcmp(val, "codec_consumer")) {
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CC;
 			} else if (!strcmp(val, "codec_master")) {
-				hw_cfg->bclk_master = SND_SOC_TPLG_BCLK_CM;
+				SNDERR("deprecated bclk value '%s', use 'codec_provider", val);
+
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CP;
+			} else if (!strcmp(val, "codec_provider")) {
+				hw_cfg->bclk_provider = SND_SOC_TPLG_BCLK_CP;
 			}
 			continue;
 		}
@@ -1623,10 +1639,10 @@ int tplg_save_hw_config(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 	if (err >= 0 && hc->fmt)
 		err = tplg_save_printf(dst, pfx, "\tformat '%s'\n",
 				       get_audio_hw_format_name(hc->fmt));
-	if (err >= 0 && hc->bclk_master)
+	if (err >= 0 && hc->bclk_provider)
 		err = tplg_save_printf(dst, pfx, "\tbclk '%s'\n",
-				       hc->bclk_master == SND_SOC_TPLG_BCLK_CS ?
-						"codec_slave" : "codec_master");
+				       hc->bclk_provider == SND_SOC_TPLG_BCLK_CC ?
+						"codec_consumer" : "codec_provider");
 	if (err >= 0 && hc->bclk_rate)
 		err = tplg_save_printf(dst, pfx, "\tbclk_freq %u\n",
 				       hc->bclk_rate);
@@ -1791,7 +1807,7 @@ static int set_link_hw_config(struct snd_soc_tplg_hw_config *cfg,
 	cfg->clock_gated = tpl->clock_gated;
 	cfg->invert_bclk = tpl->invert_bclk;
 	cfg->invert_fsync = tpl->invert_fsync;
-	cfg->bclk_master = tpl->bclk_master;
+	cfg->bclk_provider = tpl->bclk_provider;
 	cfg->fsync_master = tpl->fsync_master;
 	cfg->mclk_direction = tpl->mclk_direction;
 	cfg->reserved = tpl->reserved;
@@ -2174,7 +2190,7 @@ next:
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

