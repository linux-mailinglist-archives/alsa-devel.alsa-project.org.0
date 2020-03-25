Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15443193271
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:17:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4EA1699;
	Wed, 25 Mar 2020 22:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4EA1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585171024;
	bh=LUK6yEdu+bnshbvrQgKImJFIfdLDTeJOm87x1k/v/oM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZA+ZSI/Q9YkFuqX9QZt7G/Jh/IRhR8hjsxzA0CJRSqOGodDtdwTuYl9Ls3RlnSnH
	 QYjODkpYUnPDTVYKda8C5J0XBTcTRazXhOQeoPipxELroKa5XsjOUDTYpcObpqjvD3
	 2YmMlpbqAEDv4vb16n8EZM2Pzh4mcHtLOKl3I6vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDB97F802A8;
	Wed, 25 Mar 2020 22:13:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 566EFF8028B; Wed, 25 Mar 2020 22:12:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F192F80095
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F192F80095
IronPort-SDR: wbbpvJGx/hNBiV7AEU98act5uBhn57vlgJZom7Poj8ECAz/SUnY0qQ5JLYujKTv4+gE/Knh8kY
 8AIMPJ4QLrtw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:12:47 -0700
IronPort-SDR: 89E+kqSGutSY2VO/1af5+GEz8yAVMQPs7dCnJ5hatrVapMfro88L3Qwa1Diw0QKKb/WvDAuWgj
 cZNXug9y8yWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="357935846"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2020 14:12:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: SOF: Intel: hda: do not leave clock gating off upon
 error
Date: Wed, 25 Mar 2020 16:12:32 -0500
Message-Id: <20200325211233.27394-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325211233.27394-1-pierre-louis.bossart@linux.intel.com>
References: <20200325211233.27394-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

The misc clock gating (MISCBDCGE) is disabled for controller reset and
reenabled once reset is complete.

Fix the case when error happens during reset, and clock gating is
left disabled. The clock gating should be reenabled also in this case.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 871b71a15a63..93be6fc51ccd 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -183,7 +183,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 		ret = hda_dsp_ctrl_link_reset(sdev, true);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to reset HDA controller\n");
-			return ret;
+			goto err;
 		}
 
 		usleep_range(500, 1000);
@@ -192,7 +192,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 		ret = hda_dsp_ctrl_link_reset(sdev, false);
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
-			return ret;
+			goto err;
 		}
 
 		usleep_range(1000, 1200);
@@ -202,7 +202,8 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 	/* check to see if controller is ready */
 	if (!snd_hdac_chip_readb(bus, GCTL)) {
 		dev_dbg(bus->dev, "controller not ready!\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto err;
 	}
 
 	/* Accept unsolicited responses */
@@ -268,6 +269,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool full_reset)
 
 	bus->chip_init = true;
 
+err:
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
 
 	return ret;
-- 
2.20.1

