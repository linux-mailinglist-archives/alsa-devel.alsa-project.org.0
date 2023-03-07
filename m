Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A936ADCD8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:09:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39D61420;
	Tue,  7 Mar 2023 12:08:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39D61420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678187349;
	bh=FbvIqx7DhxzBsWt4htRgPpIZgoHUVqJMLKG5CyUaPsM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gUbFvDsL7uWYf6PEU1sze7w7skjkhUwIPdyyhbikOaVMoalFigZ4OJRFBpk+3Ju92
	 x+MEf5U1Xt12koO02q7RToMIDQ5iTC4MnTsxyFcYa/bJoJaPUU2YbsBxvjkbvSlLEZ
	 6PkSAaeH0g1EOR11xLUL+08sFvVZXIZoPRpc7YRk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A95AF8051B;
	Tue,  7 Mar 2023 12:08:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D848F80520; Tue,  7 Mar 2023 12:08:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2146BF800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2146BF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kvsEETd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678187294; x=1709723294;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FbvIqx7DhxzBsWt4htRgPpIZgoHUVqJMLKG5CyUaPsM=;
  b=kvsEETd0a2astcYMgDtobfE+uh6XAUIqSGFGLN//zVah4osf6lg27Ap5
   N9Gh12NMwOL0QSm4MBPZEQ9SYHGylBXLLUnxM89b+d6SbecQ4SKubKJeU
   2oRGkW0Bhyt7uZTHV4MkCaPLTtJZinjSkgHjFQwm/1Mce5zAFeHfwI+o/
   KcNRMNd/y14nNmpWZ15gV83TB4/NRWFYiy55PvrCo14Oqkm3L1C29e5BX
   lFPiYBCLkWs7w4ezAn5yaLdBPqMsgcIW0dgarw7FgrWi+PjlafH2rz64E
   5BNGeJ9Iq9v1rB1Amnr3m+ynnvbbVYnw6AIE8k+kNtvGy7SFAIzczXqX6
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338147860"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338147860"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:08:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740687934"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="740687934"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:08:08 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-topology: don't allocate blob if it will not
 be used
Date: Tue,  7 Mar 2023 13:08:30 +0200
Message-Id: <20230307110830.2178-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QRWN3PSO73KX7H3BVAQZNXVDI4FJVMJH
X-Message-ID-Hash: QRWN3PSO73KX7H3BVAQZNXVDI4FJVMJH
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRWN3PSO73KX7H3BVAQZNXVDI4FJVMJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

A copier blob will be only used when a copier is connected in the
topology. An ALH copier in playback direction that doesn't have any
source means the copier is not connected in the topology. Thus, we
don't need to allocate the blob.
The patch doesn't do the same test before freeing the blob because
the blob is null and it is fine to free null.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index cc641355ba31..1ee046aaf46f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -517,7 +517,23 @@ static int sof_ipc4_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	{
 		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 		struct sof_ipc4_alh_configuration_blob *blob;
+		struct snd_soc_dapm_path *p;
 		struct snd_sof_widget *w;
+		int src_num = 0;
+
+		snd_soc_dapm_widget_for_each_source_path(swidget->widget, p)
+			src_num++;
+
+		if (swidget->id == snd_soc_dapm_dai_in && src_num == 0) {
+			/*
+			 * The blob will not be used if the ALH copier is playback direction
+			 * and doesn't connect to any source.
+			 * It is fine to call kfree(ipc4_copier->copier_config) since
+			 * ipc4_copier->copier_config is null.
+			 */
+			ret = 0;
+			break;
+		}
 
 		blob = kzalloc(sizeof(*blob), GFP_KERNEL);
 		if (!blob) {
-- 
2.39.2

