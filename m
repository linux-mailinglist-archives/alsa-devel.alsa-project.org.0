Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A1B193330
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 23:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 799801682;
	Wed, 25 Mar 2020 22:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 799801682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173614;
	bh=spHUXvHjx8eBc9PKiPOcEtZELzy9Uf2RGtTyoSCjkmw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZW8gXnzPQYMTsi0XX2CFjE4WQ1hb+iZGtczqOfKu2uJb28JocPmaU2VRpcgzwGrvH
	 FpVtSFqZtEZxhy2VXLynrxpcors4iU8Xjtxz3Z8v3uWOLYTFu+j4RAzCdOmGmx5qyF
	 5c2+28CfCBb1pe0cjcjMVzN+T8whQEEE8EQqlg6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22615F80333;
	Wed, 25 Mar 2020 22:51:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7649EF802E8; Wed, 25 Mar 2020 22:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82659F802A0
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82659F802A0
IronPort-SDR: pU/1i2eDXf4IAVckKK1uCK7O70k4AxPPTEZEe8zr72dNF78xe9JwUVf94pHqybAD9zWa6XxdRo
 u+7fwiHSAbHg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:50:46 -0700
IronPort-SDR: KgkJ+XAREfh7bwAx8DxA/n9TBbXzrXfJzz1qzEdLQqgx/6lTkDT+fJ+ML9v04YtP+ymFphaWe/
 1vC2sNUevKIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="265666220"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2020 14:50:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 11/11] ASoC: SOF: Intel: hda-ctrl: add reset cycle before
 parsing capabilities
Date: Wed, 25 Mar 2020 16:50:27 -0500
Message-Id: <20200325215027.28716-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
References: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
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

Without this cycle, HDaudio capability parsing fails on some devices.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index f88dbcc4ba66..6288b2f99540 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -65,15 +65,32 @@ int hda_dsp_ctrl_get_caps(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	u32 cap, offset, feature;
 	int count = 0;
+	int ret;
+
+	/*
+	 * On some devices, one reset cycle is necessary before reading
+	 * capabilities
+	 */
+	ret = hda_dsp_ctrl_link_reset(sdev, true);
+	if (ret < 0)
+		return ret;
+	ret = hda_dsp_ctrl_link_reset(sdev, false);
+	if (ret < 0)
+		return ret;
 
 	offset = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, SOF_HDA_LLCH);
 
 	do {
-		cap = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, offset);
-
 		dev_dbg(sdev->dev, "checking for capabilities at offset 0x%x\n",
 			offset & SOF_HDA_CAP_NEXT_MASK);
 
+		cap = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR, offset);
+
+		if (cap == -1) {
+			dev_dbg(bus->dev, "Invalid capability reg read\n");
+			break;
+		}
+
 		feature = (cap & SOF_HDA_CAP_ID_MASK) >> SOF_HDA_CAP_ID_OFF;
 
 		switch (feature) {
@@ -106,8 +123,8 @@ int hda_dsp_ctrl_get_caps(struct snd_sof_dev *sdev)
 			bus->mlcap = bus->remap_addr + offset;
 			break;
 		default:
-			dev_vdbg(sdev->dev, "found capability %d at 0x%x\n",
-				 feature, offset);
+			dev_dbg(sdev->dev, "found capability %d at 0x%x\n",
+				feature, offset);
 			break;
 		}
 
-- 
2.20.1

