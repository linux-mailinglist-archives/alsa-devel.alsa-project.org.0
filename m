Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEAD567C5
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 13:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6926E1692;
	Wed, 26 Jun 2019 13:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6926E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561549080;
	bh=iU1FJlXJTC1aVK8MjriaVWtqLisKtFoZKl5FN/Z+J5Q=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Cz8n2VrMqnFygDA5w41ho+XTZxYYbnYBZqw0Z++ICZSCMgek1vvV6CmdzltjNtz6v
	 V3UTDn7dy2+HUY1RXkI4InUhzlqnHpIY7IZPhYapZYvjkLYr7g6U7aXYfjYPbSKLQf
	 ueu/L8nnMayBjSvcxasz52MsMWStJqsJbaQ6V3p4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97513F89748;
	Wed, 26 Jun 2019 13:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CE4AF89721; Wed, 26 Jun 2019 13:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DFCCF896EC
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 13:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DFCCF896EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ENV5OxqN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4I+AHzJnKieZO2LKAAebHVSoVhaWOv3vNYTz6WzbvgM=; b=ENV5OxqNSmLE
 ZH4mGFjOiXvXUt/fisRpfG7O7s+aqpx7Y8nXAr6Al8+79Ly6NIzNljDehYAI5j8zPlDZ5GEoViLkd
 wBzLTo7a/UCHgqGUZP10Qh94E/ABWWsr/T4G+mS0Q47uTxxsmDSaZmrLLV6tLjFyZ/N3vdvVZBAJ6
 i/pcs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hg6AP-0007nL-IG; Wed, 26 Jun 2019 11:32:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 16FC3440050; Wed, 26 Jun 2019 12:32:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20190613190436.20156-4-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190626113245.16FC3440050@finisterre.sirena.org.uk>
Date: Wed, 26 Jun 2019 12:32:45 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: Skylake: Read HIPCT extension
	before clearing DONE bit" to the asoc tree
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

The patch

   ASoC: Intel: Skylake: Read HIPCT extension before clearing DONE bit

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 078759399ff74e2e6f5e208c61924d1b7d66e5d8 Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 13 Jun 2019 21:04:32 +0200
Subject: [PATCH] ASoC: Intel: Skylake: Read HIPCT extension before clearing
 DONE bit

Host clears DONE bit to signal IPC target it has completed the
operation. Once this is done, IPC target i.e. DSP may proceed with the
next reply, filling registers with new portion of data.

Because of this, host should always read all registers prior to clearing
DONE and BUSY bits to ensure no desynchronization happens the time in
between clearing bits and reading message data (here, extension).

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
