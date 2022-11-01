Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1C06149D7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 12:50:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35C7A1693;
	Tue,  1 Nov 2022 12:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35C7A1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667303411;
	bh=wGDHfZN1yDS7e81Ax2a2N1nh/pZrYDz0sItxuEj/SB0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3IYsTl/UYH5jVog67ho5VUTgh0XPFGCvmlAo1Cts2Y0kv7U7grbvpt6P5V8u8eik
	 kmEga942GrRaxF1opxbytFjVAar1l8htRVJRbFrMu5BlIKIvL1NvwCxVa3IKXV6SOH
	 r8Av0fsGVtoAplQdbe3meKH1MoLDr2tuYiBFMSlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 906B9F80423;
	Tue,  1 Nov 2022 12:49:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84963F80423; Tue,  1 Nov 2022 12:49:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80759F80155
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 12:49:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80759F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ltJxDAIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667303348; x=1698839348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wGDHfZN1yDS7e81Ax2a2N1nh/pZrYDz0sItxuEj/SB0=;
 b=ltJxDAItb3F/DAYB5QmW+++qh2mN8W18NW5GrdOYltdeLLKcF0SFB58E
 dFFbbIIPt+U/rUBq/ZIfTxv4F8EFpYVrC9cGxDE1X0HGWlvqpi92i0SIx
 O93PREaqf29McVDsWw4H3PON90LRb2VtnS0CrH6PRi08Ez0BSLk2PMtB4
 Xi25vNWunWnKHd1OepjZKCpgAO56MA+VeOodcZMM3Ryqm+9BMFuTvLyAB
 SCo8/pmRGTSWGIg5tC7fhewHRQDc40n8x49rNyZHKjBWU618SOmuS6oef
 HZaadCYM7kKFN0B4J10JYymDkqNutoyX0OUeQIB5qzOyaL7pRoDALzdK+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="289507961"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="289507961"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 04:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="879065032"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="879065032"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 01 Nov 2022 04:49:00 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc3-topology: use old pipeline teardown flow with
 SOF2.1 and older
Date: Tue,  1 Nov 2022 13:49:13 +0200
Message-Id: <20221101114913.1292671-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

Originally in commit b2ebcf42a48f ("ASoC: SOF: free widgets in
sof_tear_down_pipelines() for static pipelines"), freeing of pipeline
components at suspend was only done with recent FW as there were known
limitations in older firmware versions.

Tests show that if static pipelines are used, i.e. all pipelines are
setup whenever firmware is powered up, the reverse action of freeing all
components at power down, leads to firmware failures with also SOF2.0
and SOF2.1 based firmware.

The problems can be specific to certain topologies with e.g. components
not prepared to be freed at suspend (as this did not happen with older
SOF kernels).

To avoid hitting these problems when kernel is upgraded and used with an
older firmware, bump the firmware requirement to SOF2.2 or newer. If an
older firmware is used, and pipeline is a static one, do not free the
components at suspend. This ensures the suspend flow remains backwards
compatible with older firmware versions. This limitation does not apply
if the product configuration is updated to dynamic pipelines.

The limitation is not linked to firmware ABI, as the interface to free
pipeline components has been available already before ABI3.19. The
problem is in the implementation, so firmware version should be used to
decide whether it is safe to use the newer flow or not. This patch adds
a new SOF_FW_VER() macro to compare SOF firmware release versions.

Link: https://github.com/thesofproject/sof/issues/6475
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/info.h      |  4 ++++
 sound/soc/sof/ipc3-topology.c | 15 ++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 65e86e4e9fd8..75193850ead0 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -36,6 +36,10 @@ enum sof_ipc_ext_data {
 	SOF_IPC_EXT_USER_ABI_INFO	= 4,
 };
 
+/* Build u32 number in format MMmmmppp */
+#define SOF_FW_VER(MAJOR, MINOR, PATCH) ((uint32_t)( \
+	((MAJOR) << 24) | ((MINOR) << 12) | (PATCH)))
+
 /* FW version - SOF_IPC_GLB_VERSION */
 struct sof_ipc_fw_version {
 	struct sof_ipc_hdr hdr;
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index c148715aa0f9..0720e1eae084 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2275,6 +2275,7 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
+	bool dyn_widgets = false;
 	int ret;
 
 	/*
@@ -2284,12 +2285,14 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	 * topology loading the sound card unavailable to open PCMs.
 	 */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (swidget->dynamic_pipeline_widget)
+		if (swidget->dynamic_pipeline_widget) {
+			dyn_widgets = true;
 			continue;
+		}
 
-		/* Do not free widgets for static pipelines with FW ABI older than 3.19 */
+		/* Do not free widgets for static pipelines with FW older than SOF2.2 */
 		if (!verify && !swidget->dynamic_pipeline_widget &&
-		    v->abi_version < SOF_ABI_VER(3, 19, 0)) {
+		    SOF_FW_VER(v->major, v->minor, v->micro) < SOF_FW_VER(2, 2, 0)) {
 			swidget->use_count = 0;
 			swidget->complete = 0;
 			continue;
@@ -2303,9 +2306,11 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 	/*
 	 * Tear down all pipelines associated with PCMs that did not get suspended
 	 * and unset the prepare flag so that they can be set up again during resume.
-	 * Skip this step for older firmware.
+	 * Skip this step for older firmware unless topology has any
+	 * dynamic pipeline (in which case the step is mandatory).
 	 */
-	if (!verify && v->abi_version >= SOF_ABI_VER(3, 19, 0)) {
+	if (!verify && (dyn_widgets || SOF_FW_VER(v->major, v->minor, v->micro) >=
+	    SOF_FW_VER(2, 2, 0))) {
 		ret = sof_tear_down_left_over_pipelines(sdev);
 		if (ret < 0) {
 			dev_err(sdev->dev, "failed to tear down paused pipelines\n");

base-commit: b3d2170916491cbb849d08e5e816ec161947657d
-- 
2.38.1

