Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6362B0A05
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 539BD1823;
	Thu, 12 Nov 2020 17:32:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 539BD1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605198770;
	bh=krDdy9/EKLkT4ugtm1qYksI6SoSpaa9EEuH+3nugvNQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOSF54Uw/eldWwmsf/bU4WqMfkqt+0wBoHLzXa4eS3yfEah3mf7X8J+23VoNMGWra
	 kDk70wN+pj4qLOvSD+McU0GblFGfhkAvv/26IQ3H50cyICHvhk7w2BamFtS9dgnXrI
	 DwmWJgCTspWkmyq0o8I1eYKrcda2K8FqP3jalIYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8772BF804D8;
	Thu, 12 Nov 2020 17:30:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B6EFF804CA; Thu, 12 Nov 2020 17:30:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E35B5F801D5
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E35B5F801D5
IronPort-SDR: vDNG8I/xayAGAMZg3ia8p8+Ktm1HoXrDu+2O15GHKsCFb12uV2yR1wOk591an5ihqOJdTTS3bu
 xk1mPJJG5R6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="157355220"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="157355220"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:30:04 -0800
IronPort-SDR: cS4+f+9qR3gtn7yxueBvwg82ptBaAfGoRi6rsg5cim1qF+IPk/IA/WsP+ylWnds7PtZWLcQfMg
 oijDeawW8G+A==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="357147676"
Received: from nsalmulx-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.36.117])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:30:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RESEND 2/3] topology: use inclusive language for fsync
Date: Thu, 12 Nov 2020 10:29:39 -0600
Message-Id: <20201112162940.4970-3-pierre-louis.bossart@linux.intel.com>
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

use fsync_provider for structure fields, 'codec_provider' and
'codec_consumer' for options and modify #defines to use CP and CC
suffixes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/uapi/asoc.h | 11 +++++++----
 include/topology.h        |  2 +-
 src/topology/pcm.c        | 39 +++++++++++++++++++++++++++------------
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/include/sound/uapi/asoc.h b/include/sound/uapi/asoc.h
index ceafb1a9..f32c5697 100644
--- a/include/sound/uapi/asoc.h
+++ b/include/sound/uapi/asoc.h
@@ -178,10 +178,13 @@
 #define SND_SOC_TPLG_BCLK_CS         SND_SOC_TPLG_BCLK_CC
 
 /* DAI topology FSYNC parameter
- * For the backwards capability, by default codec is fsync master
+ * For the backwards capability, by default codec is fsync provider
  */
-#define SND_SOC_TPLG_FSYNC_CM         0 /* codec is fsync master */
-#define SND_SOC_TPLG_FSYNC_CS         1 /* codec is fsync slave */
+#define SND_SOC_TPLG_FSYNC_CP         0 /* codec is fsync provider */
+#define SND_SOC_TPLG_FSYNC_CC         1 /* codec is fsync consumer */
+/* keep previous definitions for compatibility */
+#define SND_SOC_TPLG_FSYNC_CM         SND_SOC_TPLG_FSYNC_CP
+#define SND_SOC_TPLG_FSYNC_CS         SND_SOC_TPLG_FSYNC_CC
 
 /*
  * Block Header.
@@ -339,7 +342,7 @@ struct snd_soc_tplg_hw_config {
 	__u8 invert_bclk;	/* 1 for inverted BCLK, 0 for normal */
 	__u8 invert_fsync;	/* 1 for inverted frame clock, 0 for normal */
 	__u8 bclk_provider;	/* SND_SOC_TPLG_BCLK_ value */
-	__u8 fsync_master;	/* SND_SOC_TPLG_FSYNC_ value */
+	__u8 fsync_provider;	/* SND_SOC_TPLG_FSYNC_ value */
 	__u8 mclk_direction;    /* SND_SOC_TPLG_MCLK_ value */
 	__le16 reserved;	/* for 32bit alignment */
 	__le32 mclk_rate;	/* MCLK or SYSCLK freqency in Hz */
diff --git a/include/topology.h b/include/topology.h
index 6c970649..4ade20df 100644
--- a/include/topology.h
+++ b/include/topology.h
@@ -1029,7 +1029,7 @@ struct snd_tplg_hw_config_template {
 	unsigned char  invert_bclk;     /* 1 for inverted BCLK, 0 for normal */
 	unsigned char  invert_fsync;    /* 1 for inverted frame clock, 0 for normal */
 	unsigned char  bclk_provider;   /* SND_SOC_TPLG_BCLK_ value */
-	unsigned char  fsync_master;    /* SND_SOC_TPLG_FSYNC_ value */
+	unsigned char  fsync_provider;  /* SND_SOC_TPLG_FSYNC_ value */
 	unsigned char  mclk_direction;  /* SND_SOC_TPLG_MCLK_ value */
 	unsigned short reserved;        /* for 32bit alignment */
 	unsigned int mclk_rate;	        /* MCLK or SYSCLK freqency in Hz */
diff --git a/src/topology/pcm.c b/src/topology/pcm.c
index f05df348..888aa59a 100644
--- a/src/topology/pcm.c
+++ b/src/topology/pcm.c
@@ -1504,8 +1504,15 @@ int tplg_parse_hw_config(snd_tplg_t *tplg, snd_config_t *cfg,
 			continue;
 		}
 
-		if (strcmp(id, "fsync") == 0 ||
-		    strcmp(id, "fsync_master") == 0) {
+		provider_legacy = false;
+		if (strcmp(id, "fsync_master") == 0) {
+			SNDERR("deprecated option %s, please use 'fsync'\n", id);
+			provider_legacy = true;
+		}
+
+		if (provider_legacy ||
+		    strcmp(id, "fsync") == 0) {
+
 			if (snd_config_get_string(n, &val) < 0)
 				return -EINVAL;
 
@@ -1515,11 +1522,19 @@ int tplg_parse_hw_config(snd_tplg_t *tplg, snd_config_t *cfg,
 				 */
 				SNDERR("deprecated fsync value '%s'", val);
 
-				hw_cfg->fsync_master = SND_SOC_TPLG_FSYNC_CS;
+				hw_cfg->fsync_provider = SND_SOC_TPLG_FSYNC_CC;
 			} else if (!strcmp(val, "codec_slave")) {
-				hw_cfg->fsync_master = SND_SOC_TPLG_FSYNC_CS;
-			} else if (!strcmp(val, "codec_master")) {
-				hw_cfg->fsync_master = SND_SOC_TPLG_FSYNC_CM;
+				SNDERR("deprecated fsync value '%s', use 'codec_consumer'", val);
+
+				hw_cfg->fsync_provider = SND_SOC_TPLG_FSYNC_CC;
+			} else if (!strcmp(val, "codec_consumer")) {
+				hw_cfg->fsync_provider = SND_SOC_TPLG_FSYNC_CC;
+ 			} else if (!strcmp(val, "codec_master")) {
+				SNDERR("deprecated fsync value '%s', use 'codec_provider'", val);
+
+				hw_cfg->fsync_provider = SND_SOC_TPLG_FSYNC_CP;
+			} else if (!strcmp(val, "codec_provider")) {
+				hw_cfg->fsync_provider = SND_SOC_TPLG_FSYNC_CP;
 			}
 			continue;
 		}
@@ -1648,10 +1663,10 @@ int tplg_save_hw_config(snd_tplg_t *tplg ATTRIBUTE_UNUSED,
 				       hc->bclk_rate);
 	if (err >= 0 && hc->invert_bclk)
 		err = tplg_save_printf(dst, pfx, "\tbclk_invert 1\n");
-	if (err >= 0 && hc->fsync_master)
-		err = tplg_save_printf(dst, pfx, "\tfsync_master '%s'\n",
-				       hc->fsync_master == SND_SOC_TPLG_FSYNC_CS ?
-						"codec_slave" : "codec_master");
+	if (err >= 0 && hc->fsync_provider)
+		err = tplg_save_printf(dst, pfx, "\tfsync_provider '%s'\n",
+				       hc->fsync_provider == SND_SOC_TPLG_FSYNC_CC ?
+						"codec_consumer" : "codec_provider");
 	if (err >= 0 && hc->fsync_rate)
 		err = tplg_save_printf(dst, pfx, "\tfsync_freq %u\n",
 				       hc->fsync_rate);
@@ -1808,7 +1823,7 @@ static int set_link_hw_config(struct snd_soc_tplg_hw_config *cfg,
 	cfg->invert_bclk = tpl->invert_bclk;
 	cfg->invert_fsync = tpl->invert_fsync;
 	cfg->bclk_provider = tpl->bclk_provider;
-	cfg->fsync_master = tpl->fsync_master;
+	cfg->fsync_provider = tpl->fsync_provider;
 	cfg->mclk_direction = tpl->mclk_direction;
 	cfg->reserved = tpl->reserved;
 	cfg->mclk_rate = tpl->mclk_rate;
@@ -2191,7 +2206,7 @@ next:
 		hw->invert_bclk = link->hw_config[i].invert_bclk;
 		hw->invert_fsync = link->hw_config[i].invert_fsync;
 		hw->bclk_provider = link->hw_config[i].bclk_provider;
-		hw->fsync_master = link->hw_config[i].fsync_master;
+		hw->fsync_provider = link->hw_config[i].fsync_provider;
 		hw->mclk_direction = link->hw_config[i].mclk_direction;
 		hw->mclk_rate = link->hw_config[i].mclk_rate;
 		hw->bclk_rate = link->hw_config[i].bclk_rate;
-- 
2.25.1

