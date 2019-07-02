Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE185D17D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 16:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE6F16A0;
	Tue,  2 Jul 2019 16:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE6F16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562077187;
	bh=ImcjcgftCJeJetg37BQYRkUgnv0PPmrZtmBcwuA4Cgw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaw/ENOTkXEALvdoUVd+5V0BtrsgZEhCQLuE7rz4xqkll5cv8EhYpwfJxOnJt3VHI
	 t4P+ymTHBzgnsX28FEjPiTCt8xLClZGzaqCEqEdoQIhPT2RH57L9Yym0IUDViQ9NcC
	 gGZPwbnECv3vy6kVPJ9/bT/fEG6u+nVhaRyJw7JI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8A02F800DF;
	Tue,  2 Jul 2019 16:17:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE772F800D3; Tue,  2 Jul 2019 16:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA22F80058
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 16:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA22F80058
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 06:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,443,1557212400"; d="scan'208";a="171794403"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2019 06:23:49 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: broonie@kernel.org
Date: Tue,  2 Jul 2019 16:24:28 +0300
Message-Id: <20190702132428.13129-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190702132428.13129-1-kai.vehmanen@linux.intel.com>
References: <20190702132428.13129-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v2 resend 3/3] ASoC: SOF: Intel: implement
	runtime idle for CNL/APL
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Implement runtime idle for CNL/APL devices using similar runtime
PM idle logic as the Intel AZX HDA driver. If any HDA codecs are
powered when runtime suspend request comes, return -EBUSY. By doing
this, strict ordering is enforced between HDA codec and the HDA
controller.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/cnl.c     |  1 +
 sound/soc/sof/intel/hda-dsp.c | 13 +++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 43d1c9f31ec4c..fd2e26d797961 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -93,6 +93,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.resume			= hda_dsp_resume,
 	.runtime_suspend	= hda_dsp_runtime_suspend,
 	.runtime_resume		= hda_dsp_runtime_resume,
+	.runtime_idle		= hda_dsp_runtime_idle,
 	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
 };
 EXPORT_SYMBOL(sof_apl_ops);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 3840f81767fab..f2b392998f20d 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -251,6 +251,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.resume			= hda_dsp_resume,
 	.runtime_suspend	= hda_dsp_runtime_suspend,
 	.runtime_resume		= hda_dsp_runtime_resume,
+	.runtime_idle		= hda_dsp_runtime_idle,
 	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
 };
 EXPORT_SYMBOL(sof_cnl_ops);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index f2c5a12db930a..91de4785b6a3e 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -418,6 +418,19 @@ int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 	return hda_resume(sdev);
 }
 
+int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *hbus = sof_to_bus(sdev);
+
+	if (hbus->codec_powered) {
+		dev_dbg(sdev->dev, "some codecs still powered (%08X), not idle\n",
+			(unsigned int)hbus->codec_powered);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev, int state)
 {
 	/* stop hda controller and power dsp off */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
