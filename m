Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F58244BBC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0371185D;
	Thu, 13 Jun 2019 21:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0371185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560452933;
	bh=aMfHT1IkRJ6t/TRElWjUFKcKHwCkjAvaXUqzxMcsIHI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RClPM7MoXJkzZtTUXgRTyRDbjqzjhycrIIAFNjjhrA4DhbMUC5SwpAx8LJ3a2Yde/
	 23fSxPbx1wPTrSQzzgkOMcc9ysTlONsm6xcKNhiGIRePBr4+mLDEGjkIv40qe5yGXX
	 gUlobk4V/z81TwQI3mt6N4a5DLNxclLsIU+6H4rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D991DF89733;
	Thu, 13 Jun 2019 21:05:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DC98F89711; Thu, 13 Jun 2019 21:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68BBFF89711
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68BBFF89711
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 12:05:28 -0700
X-ExtLoop1: 1
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2019 12:05:27 -0700
From: cezary.rojewski@intel.com
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 21:04:32 +0200
Message-Id: <20190613190436.20156-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613190436.20156-1-cezary.rojewski@intel.com>
References: <20190613190436.20156-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 3/7] ASoC: Intel: Skylake: Read HIPCT extension
	before clearing DONE bit
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

Host clears DONE bit to signal IPC target it has completed the
operation. Once this is done, IPC target i.e. DSP may proceed with the
next reply, filling registers with new portion of data.

Because of this, host should always read all registers prior to clearing
DONE and BUSY bits to ensure no desynchronization happens the time in
between clearing bits and reading message data (here, extension).

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/cnl-sst.c     | 2 +-
 sound/soc/intel/skylake/skl-sst-ipc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 245df1067ba8..759ea59615ca 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -313,6 +313,7 @@ static irqreturn_t cnl_dsp_irq_thread_handler(int irq, void *context)
 
 	hipcida = sst_dsp_shim_read_unlocked(dsp, CNL_ADSP_REG_HIPCIDA);
 	hipctdr = sst_dsp_shim_read_unlocked(dsp, CNL_ADSP_REG_HIPCTDR);
+	hipctdd = sst_dsp_shim_read_unlocked(dsp, CNL_ADSP_REG_HIPCTDD);
 
 	/* reply message from dsp */
 	if (hipcida & CNL_ADSP_REG_HIPCIDA_DONE) {
@@ -332,7 +333,6 @@ static irqreturn_t cnl_dsp_irq_thread_handler(int irq, void *context)
 
 	/* new message from dsp */
 	if (hipctdr & CNL_ADSP_REG_HIPCTDR_BUSY) {
-		hipctdd = sst_dsp_shim_read_unlocked(dsp, CNL_ADSP_REG_HIPCTDD);
 		header.primary = hipctdr;
 		header.extension = hipctdd;
 		dev_dbg(dsp->dev, "IPC irq: Firmware respond primary:%x",
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 9f3ce73593ae..5c9206dc7932 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -511,6 +511,7 @@ irqreturn_t skl_dsp_irq_thread_handler(int irq, void *context)
 
 	hipcie = sst_dsp_shim_read_unlocked(dsp, SKL_ADSP_REG_HIPCIE);
 	hipct = sst_dsp_shim_read_unlocked(dsp, SKL_ADSP_REG_HIPCT);
+	hipcte = sst_dsp_shim_read_unlocked(dsp, SKL_ADSP_REG_HIPCTE);
 
 	/* reply message from DSP */
 	if (hipcie & SKL_ADSP_REG_HIPCIE_DONE) {
@@ -530,7 +531,6 @@ irqreturn_t skl_dsp_irq_thread_handler(int irq, void *context)
 
 	/* New message from DSP */
 	if (hipct & SKL_ADSP_REG_HIPCT_BUSY) {
-		hipcte = sst_dsp_shim_read_unlocked(dsp, SKL_ADSP_REG_HIPCTE);
 		header.primary = hipct;
 		header.extension = hipcte;
 		dev_dbg(dsp->dev, "IPC irq: Firmware respond primary:%x\n",
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
