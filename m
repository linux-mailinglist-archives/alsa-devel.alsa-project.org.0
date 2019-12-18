Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014F1252FC
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:16:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2C216A3;
	Wed, 18 Dec 2019 21:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2C216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700204;
	bh=keV8znUxXPt/cm7R8EQh9KidOwxplc8F73jSDa/WXjM=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lQUWIywygPUFgeJ2eYxC722E8OEfe+P589X6Nh3/VNovmLV2j4rH2TmP65KrX08JP
	 UbU1vf/kEX1rK+klP9IXHfyug32D60qybSq580SrGBOCISpAA15GwDhXgkaQb2kTZz
	 /C1MQiUmBKKdEJSMovBzTaQz8duiEjCmLNT+eHgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 576B7F80338;
	Wed, 18 Dec 2019 21:06:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1C24F80308; Wed, 18 Dec 2019 21:06:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A1FA2F80306
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1FA2F80306
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0A71396;
 Wed, 18 Dec 2019 12:06:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 440223F67D;
 Wed, 18 Dec 2019 12:06:02 -0800 (PST)
Date: Wed, 18 Dec 2019 20:06:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
In-Reply-To: <20191218002616.7652-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191218002616.7652-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: log compiler name and version
	information" to the asoc tree
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

   ASoC: SOF: log compiler name and version information

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

From 59283959e82bd272a5e15e4ed5274cdd059fb532 Mon Sep 17 00:00:00 2001
From: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Date: Tue, 17 Dec 2019 18:26:11 -0600
Subject: [PATCH] ASoC: SOF: log compiler name and version information

Log information about used compilator and optimization level
in sof firmware to host system.
It will be helful to catch some compiler dependent bugs.

Signed-off-by: Karol Trzcinski <karolx.trzcinski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191218002616.7652-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/loader.c   | 39 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 31847aa3975d..235be4fc0862 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -32,6 +32,42 @@ static int get_ext_windows(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static int get_cc_info(struct snd_sof_dev *sdev,
+		       struct sof_ipc_ext_data_hdr *ext_hdr)
+{
+	int ret;
+
+	struct sof_ipc_cc_version *cc =
+		container_of(ext_hdr, struct sof_ipc_cc_version, ext_hdr);
+
+	dev_dbg(sdev->dev, "Firmware info: used compiler %s %d:%d:%d%s used optimization flags %s\n",
+		cc->name, cc->major, cc->minor, cc->micro, cc->desc,
+		cc->optim);
+
+	/* create read-only cc_version debugfs to store compiler version info */
+	/* use local copy of the cc_version to prevent data corruption */
+	if (sdev->first_boot) {
+		sdev->cc_version = devm_kmalloc(sdev->dev, cc->ext_hdr.hdr.size,
+						GFP_KERNEL);
+
+		if (!sdev->cc_version)
+			return -ENOMEM;
+
+		memcpy(sdev->cc_version, cc, cc->ext_hdr.hdr.size);
+		ret = snd_sof_debugfs_buf_item(sdev, sdev->cc_version,
+					       cc->ext_hdr.hdr.size,
+					       "cc_version", 0444);
+
+		/* errors are only due to memory allocation, not debugfs */
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: snd_sof_debugfs_buf_item failed\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /* parse the extended FW boot data structures from FW boot message */
 int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 {
@@ -65,6 +101,9 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 		case SOF_IPC_EXT_WINDOW:
 			ret = get_ext_windows(sdev, ext_hdr);
 			break;
+		case SOF_IPC_EXT_CC_INFO:
+			ret = get_cc_info(sdev, ext_hdr);
+			break;
 		default:
 			dev_warn(sdev->dev, "warning: unknown ext header type %d size 0x%x\n",
 				 ext_hdr->type, ext_hdr->hdr.size);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 220b35141c34..3f1e1eb7c55f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -361,6 +361,7 @@ struct snd_sof_dev {
 	struct snd_dma_buffer dmab_bdl;
 	struct sof_ipc_fw_ready fw_ready;
 	struct sof_ipc_fw_version fw_version;
+	struct sof_ipc_cc_version *cc_version;
 
 	/* topology */
 	struct snd_soc_tplg_ops *tplg_ops;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
