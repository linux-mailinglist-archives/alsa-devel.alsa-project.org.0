Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B05340C055
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 09:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2D217F7;
	Wed, 15 Sep 2021 09:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2D217F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631690401;
	bh=AOwDkyr0b6jUoBrma1fO02csWfCDiKJ9GzlVEiWUk+E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWSYrRvw0jU6C3EUfd6keRvTS/0UQpkpAgAZHB8PG6KIeYWfixOPtsh2ZjTdnZSV5
	 74ZwJ2RBb1TRT1ZuoxIaZaNtvqzc9yBcwqmjIAg1hk96nRWSgwgiCaf5zgaHDRkXbj
	 90aKFW2Zo1sReUnYLKabU1zay1b3e/QN5qq6PlEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FF2F80227;
	Wed, 15 Sep 2021 09:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B267F804BD; Wed, 15 Sep 2021 09:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B2FCF80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 09:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B2FCF80227
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="285934966"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="285934966"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 00:18:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="544655153"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 00:18:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: Intel: hda-dsp: Declare locally used functions
 as static
Date: Wed, 15 Sep 2021 10:18:03 +0300
Message-Id: <20210915071805.5704-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915071805.5704-1-peter.ujfalusi@linux.intel.com>
References: <20210915071805.5704-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

The following functions can be made static as they are only used locally:
hda_dsp_core_reset_enter
hda_dsp_core_reset_leave
hda_dsp_core_stall_reset
hda_dsp_core_power_up
hda_dsp_core_power_down
hda_dsp_core_is_enabled

The hda_dsp_ipc_int_disable is also only used within hda-dsp.c, but for
symmetry for hda_dsp_ipc_int_enable (used by hda-loader.c) leave it as it
is.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 61 +++++++++++++++++------------------
 sound/soc/sof/intel/hda.h     |  9 ------
 2 files changed, 30 insertions(+), 40 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 623cf291e207..058baca2cd0e 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -34,7 +34,7 @@ MODULE_PARM_DESC(enable_trace_D0I3_S0,
  * DSP Core control.
  */
 
-int hda_dsp_core_reset_enter(struct snd_sof_dev *sdev, unsigned int core_mask)
+static int hda_dsp_core_reset_enter(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	u32 adspcs;
 	u32 reset;
@@ -73,7 +73,7 @@ int hda_dsp_core_reset_enter(struct snd_sof_dev *sdev, unsigned int core_mask)
 	return ret;
 }
 
-int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev, unsigned int core_mask)
+static int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	unsigned int crst;
 	u32 adspcs;
@@ -113,7 +113,7 @@ int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev, unsigned int core_mask)
 	return ret;
 }
 
-int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
+static int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	/* stall core */
 	snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
@@ -125,6 +125,31 @@ int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
 	return hda_dsp_core_reset_enter(sdev, core_mask);
 }
 
+static bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask)
+{
+	int val;
+	bool is_enable;
+
+	val = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPCS);
+
+#define MASK_IS_EQUAL(v, m, field) ({	\
+	u32 _m = field(m);		\
+	((v) & _m) == _m;		\
+})
+
+	is_enable = MASK_IS_EQUAL(val, core_mask, HDA_DSP_ADSPCS_CPA_MASK) &&
+		MASK_IS_EQUAL(val, core_mask, HDA_DSP_ADSPCS_SPA_MASK) &&
+		!(val & HDA_DSP_ADSPCS_CRST_MASK(core_mask)) &&
+		!(val & HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
+
+#undef MASK_IS_EQUAL
+
+	dev_dbg(sdev->dev, "DSP core(s) enabled? %d : core_mask %x\n",
+		is_enable, core_mask);
+
+	return is_enable;
+}
+
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	int ret;
@@ -156,7 +181,7 @@ int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask)
  * Power Management.
  */
 
-int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
+static int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	unsigned int cpa;
 	u32 adspcs;
@@ -195,7 +220,7 @@ int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
 	return ret;
 }
 
-int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask)
+static int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	u32 adspcs;
 	int ret;
@@ -218,32 +243,6 @@ int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask)
 	return ret;
 }
 
-bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev,
-			     unsigned int core_mask)
-{
-	int val;
-	bool is_enable;
-
-	val = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPCS);
-
-#define MASK_IS_EQUAL(v, m, field) ({	\
-	u32 _m = field(m);		\
-	((v) & _m) == _m;		\
-})
-
-	is_enable = MASK_IS_EQUAL(val, core_mask, HDA_DSP_ADSPCS_CPA_MASK) &&
-		MASK_IS_EQUAL(val, core_mask, HDA_DSP_ADSPCS_SPA_MASK) &&
-		!(val & HDA_DSP_ADSPCS_CRST_MASK(core_mask)) &&
-		!(val & HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
-
-#undef MASK_IS_EQUAL
-
-	dev_dbg(sdev->dev, "DSP core(s) enabled? %d : core_mask %x\n",
-		is_enable, core_mask);
-
-	return is_enable;
-}
-
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 4fdfb108645c..519547e65e93 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -492,17 +492,8 @@ struct sof_intel_hda_stream {
  */
 int hda_dsp_probe(struct snd_sof_dev *sdev);
 int hda_dsp_remove(struct snd_sof_dev *sdev);
-int hda_dsp_core_reset_enter(struct snd_sof_dev *sdev,
-			     unsigned int core_mask);
-int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev,
-			     unsigned int core_mask);
-int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask);
-int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask);
 int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask);
-int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask);
-bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev,
-			     unsigned int core_mask);
 int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 				  unsigned int core_mask);
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
-- 
2.33.0

