Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE54258F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 14:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 679FB175C;
	Wed, 12 Jun 2019 14:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 679FB175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560342348;
	bh=MOdeMK2qHMPgdIV5hGMpMcw376vHPFA+HVwfrsQvwbc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUg/qYPi2/p4GgX0hxWw1Zpo1MsDeh/x+oPi/nOdht7z+yNNFNXs73YqkwAvu0+3H
	 uJdUdz28NMMWef7pTGaOpW8PKwMPbBrxPRos/A8mdWm6GwZA7awjGNunh6zg2C7saa
	 0y9Oiq2QvYd/CMQLY0NugvRbHAlcjhLDoZ187Qe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82629F89735;
	Wed, 12 Jun 2019 14:22:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B278BF89716; Wed, 12 Jun 2019 14:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC378F80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 14:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC378F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 05:22:15 -0700
X-ExtLoop1: 1
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jun 2019 05:22:14 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 15:22:58 +0300
Message-Id: <20190612122258.4363-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612122258.4363-1-kai.vehmanen@linux.intel.com>
References: <20190612122258.4363-1-kai.vehmanen@linux.intel.com>
Cc: kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 3/3] ASoC: SOF: Intel: implement runtime idle
	for CNL/APL
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
---
 sound/soc/sof/intel/apl.c     |  1 +
 sound/soc/sof/intel/cnl.c     |  1 +
 sound/soc/sof/intel/hda-dsp.c | 13 +++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index f215d80dce2c3..e91eda86dba00 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -92,6 +92,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.resume			= hda_dsp_resume,
 	.runtime_suspend	= hda_dsp_runtime_suspend,
 	.runtime_resume		= hda_dsp_runtime_resume,
+	.runtime_idle		= hda_dsp_runtime_idle,
 	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
 };
 EXPORT_SYMBOL(sof_apl_ops);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 9a4927b6b6ae5..83aeb3f72e8ef 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -248,6 +248,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.resume			= hda_dsp_resume,
 	.runtime_suspend	= hda_dsp_runtime_suspend,
 	.runtime_resume		= hda_dsp_runtime_resume,
+	.runtime_idle		= hda_dsp_runtime_idle,
 	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
 };
 EXPORT_SYMBOL(sof_cnl_ops);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 5b73115a0b787..7deef22131ddb 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -433,6 +433,19 @@ int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
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
