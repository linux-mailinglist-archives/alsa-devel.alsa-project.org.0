Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9AD45A7A7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 17:26:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECD09167C;
	Tue, 23 Nov 2021 17:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECD09167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637684759;
	bh=NamqoL0ziGoHHfmGaDmjD0O8vP7TIxlTDDVApCA+4Us=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h+0cs+8I2F9DCT4okpSGybF0P8+IwMZ9gdEPKM/T5Xztg2SizEq6dawNFd0UNh/i3
	 GwkJw9tWCQwgaf4qvNaohwdeCfq8akImb8vSBkS1BHGK++WG3+rsnc4OSnuoenhdUK
	 K8pIywwbB7sF2yBlM7MlJnWyxryHMV4V5ok8OR2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA30F80154;
	Tue, 23 Nov 2021 17:25:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DB7F804AB; Tue, 23 Nov 2021 17:25:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511C0F800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511C0F800E7
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="221933221"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="221933221"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 08:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="597131511"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 23 Nov 2021 08:24:46 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: sof-audio: setup sched widgets during pipeline
 complete step
Date: Tue, 23 Nov 2021 18:17:14 +0200
Message-Id: <20211123161715.113131-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Older firmware prior to ABI 3.19 has a dependency where the scheduler
widgets need to be setup last. Moving the call to sof_widget_setup()
before the pipeline_complete() call also helps remove the need for the
'reverse' direction when walking through the widget list - this was
only working because of the topology macros but the topology does not
require any order.

Fixes: 5fcdbb2d45df ("ASoC: SOF: Add support for dynamic pipelines")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 0f2566f7c094..f4e142ec0fbd 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -637,16 +637,25 @@ const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 
 int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 {
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
 	int ret;
 
 	/* restore pipeline components */
-	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		/* only set up the widgets belonging to static pipelines */
 		if (!verify && swidget->dynamic_pipeline_widget)
 			continue;
 
+		/*
+		 * For older firmware, skip scheduler widgets in this loop,
+		 * sof_widget_setup() will be called in the 'complete pipeline' loop
+		 */
+		if (v->abi_version < SOF_ABI_VER(3, 19, 0) &&
+		    swidget->id == snd_soc_dapm_scheduler)
+			continue;
+
 		/* update DAI config. The IPC will be sent in sof_widget_setup() */
 		if (WIDGET_IS_DAI(swidget->id)) {
 			struct snd_sof_dai *dai = swidget->private;
@@ -694,6 +703,12 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 			if (!verify && swidget->dynamic_pipeline_widget)
 				continue;
 
+			if (v->abi_version < SOF_ABI_VER(3, 19, 0)) {
+				ret = sof_widget_setup(sdev, swidget);
+				if (ret < 0)
+					return ret;
+			}
+
 			swidget->complete =
 				snd_sof_complete_pipeline(sdev, swidget);
 			break;
@@ -722,7 +737,7 @@ int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify)
 	 * sroute->setup because during suspend all streams are suspended and during topology
 	 * loading the sound card unavailable to open PCMs.
 	 */
-	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		if (swidget->dynamic_pipeline_widget)
 			continue;
 

base-commit: 65c16dd2942f4476a3f96a2625b1475c6137c09a
-- 
2.33.0

