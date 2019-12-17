Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310B122C0A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 13:41:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F2671616;
	Tue, 17 Dec 2019 13:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F2671616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576586465;
	bh=ctlIfudYRzqGF8bY4cMq3trNDdWHvC9WQ4DNUQ7FmSI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=igR4alX8WMSjTVfqfbt8ct1E8v/jWmXNP7xyYdwE4bmVZXdVQP+A/saWOLDWlzIIE
	 d9yIWlynMxrR4vd/A9nMdcvWr5jIBkWy+0idTF2l/b1Ldw+nhPMTcyP1mm0s6LXQik
	 gRBKEiYTq9CljkWpWYdmmR8rRpaWfGe4XZi/h6Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6523F80256;
	Tue, 17 Dec 2019 13:39:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A51FFF80234; Tue, 17 Dec 2019 13:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D3B16F8020B
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 13:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B16F8020B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FBD631B;
 Tue, 17 Dec 2019 04:39:15 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8336B3F718;
 Tue, 17 Dec 2019 04:39:14 -0800 (PST)
Date: Tue, 17 Dec 2019 12:39:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20191217095851.19629-7-cezary.rojewski@intel.com>
Message-Id: <applied-20191217095851.19629-7-cezary.rojewski@intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: compress: Add pm_runtime support" to
	the asoc tree
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

   ASoC: compress: Add pm_runtime support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 4137f4b65df7608e52f307f4aa9792b984bad7de Mon Sep 17 00:00:00 2001
From: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Tue, 17 Dec 2019 10:58:50 +0100
Subject: [PATCH] ASoC: compress: Add pm_runtime support

For some devices, components need to be powered-up before stream startup
sequence commences. Update soc_compr_open to provide such functionality.
Based on soc_pcm_open. Adjust soc_compr_free accordingly to power down
components once compress stream is closed.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20191217095851.19629-7-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-compress.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 6615ef64c7f5..b2a5351b1a11 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -19,6 +19,7 @@
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/soc-dpcm.h>
+#include <linux/pm_runtime.h>
 
 static int soc_compr_components_open(struct snd_compr_stream *cstream,
 				     struct snd_soc_component **last)
@@ -72,10 +73,20 @@ static int soc_compr_components_free(struct snd_compr_stream *cstream,
 static int soc_compr_open(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_component *component;
+	struct snd_soc_component *component, *save = NULL;
+	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	int ret;
 
+	for_each_rtd_components(rtd, rtdcom, component) {
+		ret = pm_runtime_get_sync(component->dev);
+		if (ret < 0 && ret != -EACCES) {
+			pm_runtime_put_noidle(component->dev);
+			save = component;
+			goto pm_err;
+		}
+	}
+
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->startup) {
@@ -115,6 +126,14 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 		cpu_dai->driver->cops->shutdown(cstream, cpu_dai);
 out:
 	mutex_unlock(&rtd->card->pcm_mutex);
+pm_err:
+	for_each_rtd_components(rtd, rtdcom, component) {
+		if (component == save)
+			break;
+		pm_runtime_mark_last_busy(component->dev);
+		pm_runtime_put_autosuspend(component->dev);
+	}
+
 	return ret;
 }
 
@@ -239,6 +258,8 @@ static void close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 static int soc_compr_free(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_soc_component *component;
+	struct snd_soc_rtdcom_list *rtdcom;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	int stream;
@@ -287,6 +308,12 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 	}
 
 	mutex_unlock(&rtd->card->pcm_mutex);
+
+	for_each_rtd_components(rtd, rtdcom, component) {
+		pm_runtime_mark_last_busy(component->dev);
+		pm_runtime_put_autosuspend(component->dev);
+	}
+
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
