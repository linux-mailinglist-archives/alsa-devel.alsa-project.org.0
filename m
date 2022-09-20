Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B75BE6DC
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 15:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421CB3E;
	Tue, 20 Sep 2022 15:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421CB3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663679947;
	bh=M/JYckOd6bglLcWNB62iObyokY38Tx5QX8XbnmfCLCY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m2olFJzszE3d2/BQbQ+jUcCuOuT2d3+f2LNO8ZhUhJCoidUH2ob28ei4OWnlmkWf0
	 BkRtrxd9CMMkDlz2tz7skzy51AXVseRHdWSEH1dz8vd59b6u26qlGOvkNXCZGE2l04
	 pPK2bgzG8DpPhgi32mS4WTGsok9E9Nghm39RKaNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 652EFF8012B;
	Tue, 20 Sep 2022 15:17:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6529AF8053D; Tue, 20 Sep 2022 15:17:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CF5EF80155
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 15:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CF5EF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PmfDLwyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663679858; x=1695215858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/JYckOd6bglLcWNB62iObyokY38Tx5QX8XbnmfCLCY=;
 b=PmfDLwyKDsi3/KvQzrfQtrpfi26CTHQq0Vo1uNFJDwiUN7KPq6QyEbnW
 pbIy0e/OTkiAJ197yVvbRGfR+9HXqoQwfwGU0PPVjNNsWZNg33y2lAb4X
 C2Hh8CACwnzHAG/RB8HAPlBDtTVwUC8oNvGvt2+f+Xvw6xRCstFOdKSR4
 bj01LKMHlHjKL/JDatdtp5LPGGIWtshLqozXDH48p/SXgeBtckKBBw5EN
 dODw6JJ4Y9NREwPqp1+F459PRPCdKM5nWUzAJ+K0JBiVyBSkUUxpRqLlq
 XKPbNAAzL9sFSG4+ihrXy9+Sld+BWRrgBfjp2TZtDQKKoAc4hRhq2umEU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="282719130"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="282719130"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="652089673"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 06:17:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ASoC: SOF: Intel: hda-dsp: expose functions for SKL
 support
Date: Tue, 20 Sep 2022 15:16:57 +0200
Message-Id: <20220920131700.133103-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
References: <20220920131700.133103-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

In preparation of the IPCv4 IPC support, this patch adds exposes
two functions required by the SKL/KBL boot and code loader.

Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 4 ++--
 sound/soc/sof/intel/hda.h     | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 1319c8e34021b..f85ac55536fad 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -114,7 +114,7 @@ static int hda_dsp_core_reset_leave(struct snd_sof_dev *sdev, unsigned int core_
 	return ret;
 }
 
-static int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
+int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	/* stall core */
 	snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
@@ -126,7 +126,7 @@ static int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_
 	return hda_dsp_core_reset_enter(sdev, core_mask);
 }
 
-static bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask)
+bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
 	int val;
 	bool is_enable;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index bb9d2af06530e..04b730f754d7b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -565,6 +565,7 @@ int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 int hda_dsp_core_get(struct snd_sof_dev *sdev, int core);
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev);
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev);
+bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask);
 
 int hda_dsp_set_power_state(struct snd_sof_dev *sdev,
 			    const struct sof_dsp_power_state *target_state);
@@ -833,6 +834,8 @@ extern int sof_hda_position_quirk;
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops);
 void hda_ops_free(struct snd_sof_dev *sdev);
 
+int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask);
+
 /* IPC4 */
 irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
-- 
2.34.1

