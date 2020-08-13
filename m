Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDF243FBC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85DEB16A5;
	Thu, 13 Aug 2020 22:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85DEB16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349753;
	bh=HUbYotcZsaI80lr0RyUlHnJM8uZtacGxpdtgWGdm5Rg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J4tPC6m04Ei2ylWyZwLaNUEoauXsGAX4HDhNK1ZgNvauPA8XPSxqYPKUTJd5nxc0t
	 x2LyW7mlB73aJFP5gXqbjPf7UoOXkciNu9hcr3ykzvlAhRMlLAEUfvqKFLUMqnLSZ9
	 aRWhqJ4ZS7P01Wq6ljWHqrWiYMH7ybghWv+87yGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5105BF80383;
	Thu, 13 Aug 2020 22:02:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DAC5F80342; Thu, 13 Aug 2020 22:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B655CF802F9
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B655CF802F9
IronPort-SDR: Jp7Ay7Le7eR3Fo0pwcReMgiFxm+Q6oJZWRU8Bp+dlhDkqxriKJSqeA+FOowC5VVw7QD9tC1Ee2
 fI57AexsslXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="134374684"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="134374684"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:12 -0700
IronPort-SDR: rTNEol2S1rvY39dKvJQxTFj5dWx4PJ2fOzsxzRPysbwRvE+wV756Np+Hyvyg6LFhEHOytxfV9q
 E+4yM8AK+7Wg==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506332"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 21/21] ASoC: Intel: Skylake: (cosmetic) align function
 parameters
Date: Thu, 13 Aug 2020 15:01:47 -0500
Message-Id: <20200813200147.61990-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warnings and align headers with code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/skylake/cnl-sst-dsp.h  |  4 ++--
 sound/soc/intel/skylake/skl-sst-ipc.h  | 16 ++++++++--------
 sound/soc/intel/skylake/skl-topology.h |  8 ++++----
 sound/soc/intel/skylake/skl.h          |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index 7bd4d2a8fdfa..d3cf4bd1a070 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -82,8 +82,8 @@ struct sst_generic_ipc;
 #define CNL_ADSPCS_CPA_SHIFT	24
 #define CNL_ADSPCS_CPA(x)	(x << CNL_ADSPCS_CPA_SHIFT)
 
-int cnl_dsp_enable_core(struct sst_dsp *ctx, unsigned int core);
-int cnl_dsp_disable_core(struct sst_dsp *ctx, unsigned int core);
+int cnl_dsp_enable_core(struct sst_dsp *ctx, unsigned int core_mask);
+int cnl_dsp_disable_core(struct sst_dsp *ctx, unsigned int core_mask);
 irqreturn_t cnl_dsp_sst_interrupt(int irq, void *dev_id);
 void cnl_dsp_free(struct sst_dsp *dsp);
 
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
index 08ac31778325..aaaab3b3ec42 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.h
+++ b/sound/soc/intel/skylake/skl-sst-ipc.h
@@ -107,12 +107,12 @@ struct skl_ipc_d0ix_msg {
 
 irqreturn_t skl_dsp_irq_thread_handler(int irq, void *context);
 
-int skl_ipc_create_pipeline(struct sst_generic_ipc *sst_ipc,
+int skl_ipc_create_pipeline(struct sst_generic_ipc *ipc,
 		u16 ppl_mem_size, u8 ppl_type, u8 instance_id, u8 lp_mode);
 
-int skl_ipc_delete_pipeline(struct sst_generic_ipc *sst_ipc, u8 instance_id);
+int skl_ipc_delete_pipeline(struct sst_generic_ipc *ipc, u8 instance_id);
 
-int skl_ipc_set_pipeline_state(struct sst_generic_ipc *sst_ipc,
+int skl_ipc_set_pipeline_state(struct sst_generic_ipc *ipc,
 		u8 instance_id,	enum skl_ipc_pipeline_state state);
 
 int skl_ipc_save_pipeline(struct sst_generic_ipc *ipc,
@@ -120,10 +120,10 @@ int skl_ipc_save_pipeline(struct sst_generic_ipc *ipc,
 
 int skl_ipc_restore_pipeline(struct sst_generic_ipc *ipc, u8 instance_id);
 
-int skl_ipc_init_instance(struct sst_generic_ipc *sst_ipc,
+int skl_ipc_init_instance(struct sst_generic_ipc *ipc,
 		struct skl_ipc_init_instance_msg *msg, void *param_data);
 
-int skl_ipc_bind_unbind(struct sst_generic_ipc *sst_ipc,
+int skl_ipc_bind_unbind(struct sst_generic_ipc *ipc,
 		struct skl_ipc_bind_unbind_msg *msg);
 
 int skl_ipc_load_modules(struct sst_generic_ipc *ipc,
@@ -150,12 +150,12 @@ int skl_ipc_set_d0ix(struct sst_generic_ipc *ipc,
 
 int skl_ipc_check_D0i0(struct sst_dsp *dsp, bool state);
 
-void skl_ipc_int_enable(struct sst_dsp *dsp);
+void skl_ipc_int_enable(struct sst_dsp *ctx);
 void skl_ipc_op_int_enable(struct sst_dsp *ctx);
 void skl_ipc_op_int_disable(struct sst_dsp *ctx);
-void skl_ipc_int_disable(struct sst_dsp *dsp);
+void skl_ipc_int_disable(struct sst_dsp *ctx);
 
-bool skl_ipc_int_status(struct sst_dsp *dsp);
+bool skl_ipc_int_status(struct sst_dsp *ctx);
 void skl_ipc_free(struct sst_generic_ipc *ipc);
 int skl_ipc_init(struct device *dev, struct skl_dev *skl);
 void skl_clear_module_cnt(struct sst_dsp *ctx);
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index 5e93ad85e06d..fb011862fb24 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -453,7 +453,7 @@ int skl_dsp_set_dma_control(struct skl_dev *skl, u32 *caps,
 void skl_tplg_set_be_dmic_config(struct snd_soc_dai *dai,
 	struct skl_pipe_params *params, int stream);
 int skl_tplg_init(struct snd_soc_component *component,
-				struct hdac_bus *ebus);
+				struct hdac_bus *bus);
 void skl_tplg_exit(struct snd_soc_component *component,
 				struct hdac_bus *bus);
 struct skl_module_cfg *skl_tplg_fe_get_cpr_module(
@@ -476,13 +476,13 @@ int skl_stop_pipe(struct skl_dev *skl, struct skl_pipe *pipe);
 
 int skl_reset_pipe(struct skl_dev *skl, struct skl_pipe *pipe);
 
-int skl_init_module(struct skl_dev *skl, struct skl_module_cfg *module_config);
+int skl_init_module(struct skl_dev *skl, struct skl_module_cfg *mconfig);
 
 int skl_bind_modules(struct skl_dev *skl, struct skl_module_cfg
-	*src_module, struct skl_module_cfg *dst_module);
+	*src_mcfg, struct skl_module_cfg *dst_mcfg);
 
 int skl_unbind_modules(struct skl_dev *skl, struct skl_module_cfg
-	*src_module, struct skl_module_cfg *dst_module);
+	*src_mcfg, struct skl_module_cfg *dst_mcfg);
 
 int skl_set_module_params(struct skl_dev *skl, u32 *params, int size,
 			u32 param_id, struct skl_module_cfg *mcfg);
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 26057f38a014..857ea17e3c9f 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -166,7 +166,7 @@ int skl_platform_unregister(struct device *dev);
 int skl_platform_register(struct device *dev);
 
 struct nhlt_specific_cfg *skl_get_ep_blob(struct skl_dev *skl, u32 instance,
-					u8 link_type, u8 s_fmt, u8 no_ch,
+					u8 link_type, u8 s_fmt, u8 num_ch,
 					u32 s_rate, u8 dirn, u8 dev_type);
 
 int skl_nhlt_update_topology_bin(struct skl_dev *skl);
-- 
2.25.1

