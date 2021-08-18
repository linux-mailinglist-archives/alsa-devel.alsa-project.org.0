Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 914C13EFE82
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 10:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27DDC1679;
	Wed, 18 Aug 2021 09:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27DDC1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629273609;
	bh=dn29flncw23v5S1lvEnH2rHeW+198k4gg8gos2dwDVE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKpMu+C8I5rfBYnT4i6io51LXX9NHixqplju0FhMuCOKjW9/WMdNa+CpXWhYZ+CZG
	 DfbIQqsUMluecJKbWljc4V3KdexBLKgnxZIewAmsbrJOs2hCSLA31BwM1N0dR5g6Ax
	 O9R5Hn46SyUhB5uaLGSWOCvZRMrCcb9lpSwlFhNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7C74F80425;
	Wed, 18 Aug 2021 09:56:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3431EF8052E; Wed, 18 Aug 2021 09:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33CE0F80425
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33CE0F80425
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="195855514"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="195855514"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="676974798"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 00:55:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/11] ASoC: Intel: Skylake: Fix module resource and format
 selection
Date: Wed, 18 Aug 2021 09:57:35 +0200
Message-Id: <20210818075742.1515155-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818075742.1515155-1-cezary.rojewski@intel.com>
References: <20210818075742.1515155-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, jairaj.arava@intel.com,
 upstream@semihalf.com, harshapriya.n@intel.com, cujomalainey@google.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, jenny.tc@intel.com, lma@semihalf.com,
 vamshi.krishna.gopal@intel.com
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

Module configuration may differ between its instances depending on
resources required and input and output audio format. Available
parameters to select from are stored in module resource and interface
(format) lists. These come from topology, together with description of
each of pipe's modules.

Ignoring index value provided by topology and relying always on 0th
entry leads to unexpected module behavior due to under/overbudged
resources assigned or impropper format selection. Fix by taking entry at
index specified by topology.

Fixes: f6fa56e22559 ("ASoC: Intel: Skylake: Parse and update module config structure")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 054c080b7289..a35ee9d47d6d 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -113,7 +113,7 @@ static int is_skl_dsp_widget_type(struct snd_soc_dapm_widget *w,
 
 static void skl_dump_mconfig(struct skl_dev *skl, struct skl_module_cfg *mcfg)
 {
-	struct skl_module_iface *iface = &mcfg->module->formats[0];
+	struct skl_module_iface *iface = &mcfg->module->formats[mcfg->fmt_idx];
 
 	dev_dbg(skl->dev, "Dumping config\n");
 	dev_dbg(skl->dev, "Input Format:\n");
@@ -195,8 +195,8 @@ static void skl_tplg_update_params_fixup(struct skl_module_cfg *m_cfg,
 	struct skl_module_fmt *in_fmt, *out_fmt;
 
 	/* Fixups will be applied to pin 0 only */
-	in_fmt = &m_cfg->module->formats[0].inputs[0].fmt;
-	out_fmt = &m_cfg->module->formats[0].outputs[0].fmt;
+	in_fmt = &m_cfg->module->formats[m_cfg->fmt_idx].inputs[0].fmt;
+	out_fmt = &m_cfg->module->formats[m_cfg->fmt_idx].outputs[0].fmt;
 
 	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		if (is_fe) {
@@ -239,9 +239,9 @@ static void skl_tplg_update_buffer_size(struct skl_dev *skl,
 	/* Since fixups is applied to pin 0 only, ibs, obs needs
 	 * change for pin 0 only
 	 */
-	res = &mcfg->module->resources[0];
-	in_fmt = &mcfg->module->formats[0].inputs[0].fmt;
-	out_fmt = &mcfg->module->formats[0].outputs[0].fmt;
+	res = &mcfg->module->resources[mcfg->res_idx];
+	in_fmt = &mcfg->module->formats[mcfg->fmt_idx].inputs[0].fmt;
+	out_fmt = &mcfg->module->formats[mcfg->fmt_idx].outputs[0].fmt;
 
 	if (mcfg->m_type == SKL_MODULE_TYPE_SRCINT)
 		multiplier = 5;
@@ -1631,11 +1631,12 @@ int skl_tplg_update_pipe_params(struct device *dev,
 			struct skl_module_cfg *mconfig,
 			struct skl_pipe_params *params)
 {
-	struct skl_module_res *res = &mconfig->module->resources[0];
+	struct skl_module_res *res;
 	struct skl_dev *skl = get_skl_ctx(dev);
 	struct skl_module_fmt *format = NULL;
 	u8 cfg_idx = mconfig->pipe->cur_config_idx;
 
+	res = &mconfig->module->resources[mconfig->res_idx];
 	skl_tplg_fill_dma_id(mconfig, params);
 	mconfig->fmt_idx = mconfig->mod_cfg[cfg_idx].fmt_idx;
 	mconfig->res_idx = mconfig->mod_cfg[cfg_idx].res_idx;
@@ -1644,9 +1645,9 @@ int skl_tplg_update_pipe_params(struct device *dev,
 		return 0;
 
 	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		format = &mconfig->module->formats[0].inputs[0].fmt;
+		format = &mconfig->module->formats[mconfig->fmt_idx].inputs[0].fmt;
 	else
-		format = &mconfig->module->formats[0].outputs[0].fmt;
+		format = &mconfig->module->formats[mconfig->fmt_idx].outputs[0].fmt;
 
 	/* set the hw_params */
 	format->s_freq = params->s_freq;
-- 
2.25.1

