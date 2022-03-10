Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B06414D4050
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:31:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43386174D;
	Thu, 10 Mar 2022 05:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43386174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886663;
	bh=iNiQtCd/oPSic95w5KV0EuTTGxoqCn/PuC44oqX0LJk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NE9j6ldijpH4hIGVHEtTmihc5zdUe1Ps7hifxy6AZPLAqIxESr/BPygTdwcLkAXxc
	 t84vIjMenzmzRUJ6cc05FYmZAHLIvqKKDqYz4Zee3GGe/pfvUAqrzaKsSeoMtFobA/
	 RjLQhkbSAIXw1RLEzF4deZIIsnxQtbUSBipSfnBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11979F80538;
	Thu, 10 Mar 2022 05:28:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74C9EF80520; Thu, 10 Mar 2022 05:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7100FF80518
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7100FF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PDRY3xe8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886470; x=1678422470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iNiQtCd/oPSic95w5KV0EuTTGxoqCn/PuC44oqX0LJk=;
 b=PDRY3xe8XiLebOyo9FT9EWGB3zSi9oDyeTBiewKkpnJ8LPTNAxaIq3LA
 ss8uw4gvJM/AMqs+ewiIP8Uhd6IqYJaNz7uqR7eI8JcWoOi8fwYaoKQDT
 paajjH5yu1MvIlRxfXYfbYVSZs0b7wpNVOXxlOiaV3U9Z7oWSG2Hj/v6S
 vOrj71oXYyDheSakdQYPQPQ9MB5EO2aQhn7jFr+qF/9bO2eNpknmcGxBp
 Y+Y2Pp49vhO67eKjxOmLNnoXQZoup9p5mVAWc/jsIc1cD/trBoCMtY0ZN
 8YSZu8ygjclFZbyFKTuYixnp+K8s9J4LaaQYtNaJ9G5aXRMCHQoS8nvUj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380898"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380898"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884692"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ASoC: SOF: Intel: Convert to use the generic
 set_stream_data_offset ops
Date: Wed,  9 Mar 2022 20:27:18 -0800
Message-Id: <20220310042720.976809-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Switch from the IPC dependent ipc_pcm_params() ops to the IPC neutral
set_stream_data_offset().

Remove the no longer used hda_ipc_pcm_params() function as well.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     | 2 +-
 sound/soc/sof/intel/bdw.c     | 2 +-
 sound/soc/sof/intel/byt.c     | 4 ++--
 sound/soc/sof/intel/cnl.c     | 2 +-
 sound/soc/sof/intel/hda-ipc.c | 7 -------
 sound/soc/sof/intel/hda.h     | 3 ---
 sound/soc/sof/intel/icl.c     | 2 +-
 sound/soc/sof/intel/pci-tng.c | 2 +-
 sound/soc/sof/intel/tgl.c     | 2 +-
 9 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index cd8d08c17561..6721c8f95161 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -56,7 +56,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
-	.ipc_pcm_params	= hda_ipc_pcm_params,
+	.set_stream_data_offset = hda_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = hda_machine_select,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index d627b7498d5e..fb9682b2fe32 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -596,7 +596,7 @@ static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	.get_window_offset = bdw_get_window_offset,
 
 	.ipc_msg_data	= sof_ipc_msg_data,
-	.ipc_pcm_params	= sof_ipc_pcm_params,
+	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = bdw_machine_select,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index dcfeaedb8fd5..bb84a4aa587a 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -250,7 +250,7 @@ static const struct snd_sof_dsp_ops sof_byt_ops = {
 	.get_window_offset = atom_get_window_offset,
 
 	.ipc_msg_data	= sof_ipc_msg_data,
-	.ipc_pcm_params	= sof_ipc_pcm_params,
+	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = atom_machine_select,
@@ -332,7 +332,7 @@ static const struct snd_sof_dsp_ops sof_cht_ops = {
 	.get_window_offset = atom_get_window_offset,
 
 	.ipc_msg_data	= sof_ipc_msg_data,
-	.ipc_pcm_params	= sof_ipc_pcm_params,
+	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = atom_machine_select,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index bef27e8751f2..6a96470b967f 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -274,7 +274,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
-	.ipc_pcm_params	= hda_ipc_pcm_params,
+	.set_stream_data_offset = hda_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = hda_machine_select,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 317c3ab7e768..0395638c43ae 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -289,10 +289,3 @@ int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-
-int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       const struct sof_ipc_pcm_params_reply *reply)
-{
-	return hda_set_stream_data_offset(sdev, substream, reply->posn_offset);
-}
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 1e0a6d7bde17..13b509c9f481 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -566,9 +566,6 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream,
 		     void *p, size_t sz);
-int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       const struct sof_ipc_pcm_params_reply *reply);
 int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
 			       size_t posn_offset);
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index f20ab60e8a52..b44a649bfc0b 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -118,7 +118,7 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
-	.ipc_pcm_params	= hda_ipc_pcm_params,
+	.set_stream_data_offset = hda_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = hda_machine_select,
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 7d5062f8076e..6efef225973f 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -165,7 +165,7 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 	.get_window_offset = atom_get_window_offset,
 
 	.ipc_msg_data	= sof_ipc_msg_data,
-	.ipc_pcm_params	= sof_ipc_pcm_params,
+	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = atom_machine_select,
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index c7d1c244bc48..cb1c319d5bee 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -91,7 +91,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
-	.ipc_pcm_params	= hda_ipc_pcm_params,
+	.set_stream_data_offset = hda_set_stream_data_offset,
 
 	/* machine driver */
 	.machine_select = hda_machine_select,
-- 
2.25.1

