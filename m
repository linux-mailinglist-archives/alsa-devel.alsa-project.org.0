Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C676A60B325
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67AF66F48;
	Mon, 24 Oct 2022 18:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67AF66F48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630637;
	bh=dlZlIGSlCoUGXrbXP2irFKEUlQlv/4Gvwh9efHK8Cz4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUKt7I7ooQEp6TgeO8Tu0soq68LX+cbszFjChaZeDE2KX4lITP+K1jSbHobL4BA37
	 vSqCjq1iyAOL0/tMP/q5GmJE9UkCBne/ICcp/Xbo36U/LcZnb6jk9c4OayJl78RGpF
	 HG0mPfSk9cgW750RoNXh1KTyOU5Wsd5VSMxu6hAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 610ACF805B4;
	Mon, 24 Oct 2022 18:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D34FF8057C; Mon, 24 Oct 2022 18:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2DD2F8053D
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2DD2F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fnlPcv7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630414; x=1698166414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlZlIGSlCoUGXrbXP2irFKEUlQlv/4Gvwh9efHK8Cz4=;
 b=fnlPcv7MKECJo+hY5B6hP71+MqhgL7MOYxGGinem6U4fPVWfwwr1ne61
 /DatqTvKseYgUBpx/b7nP8O2f9eCu6HoSZG8X47GStZ8zqerhq4+7zu62
 t/7P4774Cd9z4+S5PIudUMt+Cy7zDitA68vysR09Qo4EW06hwlUBBoMRs
 +dFCuqVCGuVbkHXp3Y+ERC0VjF15PkW/NFMPymnxMQxJtfILTZlZVcrvN
 IqNgjFE3fidp4V+ix1KfVSIN6XpBzP+zCeSp9K5eF/fnGcB9TIEXQCOcI
 wePdSSiX7WLB2YOcHMv1+8RbHs/ExFsPzrGumZgid95Xa4/SE/sG8B/a3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868652"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868652"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263069"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263069"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/16] ASoC: SOF: Intel: hda: always do a full reset
Date: Mon, 24 Oct 2022 11:53:04 -0500
Message-Id: <20221024165310.246183-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

There's no point in checking for a full-reset condition that is
always-true in the callers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 26 ++++++++++++--------------
 sound/soc/sof/intel/hda-dsp.c  |  2 +-
 sound/soc/sof/intel/hda.c      |  2 +-
 sound/soc/sof/intel/hda.h      |  2 +-
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 7f387ad5ef6f4..e3334693c2926 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -182,7 +182,7 @@ int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 	return 0;
 }
 
-int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
+int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
@@ -199,20 +199,18 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 #endif
 	hda_dsp_ctrl_misc_clock_gating(sdev, false);
 
-	if (full_reset) {
-		/* reset HDA controller */
-		ret = hda_dsp_ctrl_link_reset(sdev, true);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to reset HDA controller\n");
-			goto err;
-		}
+	/* reset HDA controller */
+	ret = hda_dsp_ctrl_link_reset(sdev, true);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to reset HDA controller\n");
+		goto err;
+	}
 
-		/* exit HDA controller reset */
-		ret = hda_dsp_ctrl_link_reset(sdev, false);
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
-			goto err;
-		}
+	/* exit HDA controller reset */
+	ret = hda_dsp_ctrl_link_reset(sdev, false);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
+		goto err;
 	}
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 74067df96fdc4..6d896ea316806 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -691,7 +691,7 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
 
 	/* reset and start hda controller */
-	ret = hda_dsp_ctrl_init_chip(sdev, true);
+	ret = hda_dsp_ctrl_init_chip(sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to start controller after resume\n");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index d63f843dc7aab..2ee414600f779 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -890,7 +890,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
 
 	/* Init HDA controller after i915 init */
-	ret = hda_dsp_ctrl_init_chip(sdev, true);
+	ret = hda_dsp_ctrl_init_chip(sdev);
 	if (ret < 0) {
 		dev_err(bus->dev, "error: init chip failed with ret: %d\n",
 			ret);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index c91fc36378235..6b1474d78ebb3 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -702,7 +702,7 @@ void hda_dsp_ctrl_ppcap_int_enable(struct snd_sof_dev *sdev, bool enable);
 int hda_dsp_ctrl_link_reset(struct snd_sof_dev *sdev, bool reset);
 void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable);
 int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable);
-int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset);
+int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev);
 void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev);
 /*
  * HDA bus operations.
-- 
2.34.1

