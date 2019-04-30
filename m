Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B549610334
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:15:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 557F916AF;
	Wed,  1 May 2019 01:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 557F916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556666140;
	bh=YyCBNnLTVc+6JBXk24egIVOk4AZxvf1W9dB129ZItSA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlZTrf4XLSI4pv7zDmsRDc59ouWhB7+XjGRkY7t6eEbl46WIA+046z7JtJpHwvUlI
	 XjiXHgCvHEgiM48uS8LLvLo+I/efEr7EVTzUpTPM7fUM7ckTrXBNag7lH0FFb2Fpm1
	 VFCDj7frOFTZMtGW1ylolc0cPfd6bD/h5bm8SDi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 222D5F89729;
	Wed,  1 May 2019 01:10:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FD2AF89735; Wed,  1 May 2019 01:10:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0368F896AA
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0368F896AA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:09:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540908"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:09:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:18 -0500
Message-Id: <20190430230934.4321-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 03/19] ASoC: SOF: topology: add support for
	stricter ABI checks
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

Fail early if topology is more recent than kernel and Kconfig is
selected.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 43 ++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 2b9de1b97447..b04b99cc0ff8 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3051,6 +3051,7 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	u32 size;
+	u32 abi_version;
 
 	size = le32_to_cpu(man->priv.size);
 
@@ -3060,20 +3061,36 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
 		return 0;
 	}
 
-	if (size == SOF_TPLG_ABI_SIZE) {
-		dev_info(sdev->dev,
-			 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
-			 man->priv.data[0], man->priv.data[1],
-			 man->priv.data[2], SOF_ABI_MAJOR, SOF_ABI_MINOR,
-			 SOF_ABI_PATCH);
-		if (SOF_ABI_VER(man->priv.data[0], man->priv.data[1],
-				man->priv.data[2]) <= SOF_ABI_VERSION)
-			return 0;
+	if (size != SOF_TPLG_ABI_SIZE) {
+		dev_err(sdev->dev, "error: invalid topology ABI size\n");
+		return -EINVAL;
 	}
-	dev_err(sdev->dev,
-		"error: Incompatible ABI version %d:%d:%d\n",
-		man->priv.data[0], man->priv.data[1], man->priv.data[2]);
-	return -EINVAL;
+
+	dev_info(sdev->dev,
+		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
+		 man->priv.data[0], man->priv.data[1],
+		 man->priv.data[2], SOF_ABI_MAJOR, SOF_ABI_MINOR,
+		 SOF_ABI_PATCH);
+
+	abi_version = SOF_ABI_VER(man->priv.data[0],
+				  man->priv.data[1],
+				  man->priv.data[2]);
+
+	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, abi_version)) {
+		dev_err(sdev->dev, "error: incompatible topology ABI version\n");
+		return -EINVAL;
+	}
+
+	if (abi_version > SOF_ABI_VERSION) {
+		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
+			dev_warn(sdev->dev, "warn: topology ABI is more recent than kernel\n");
+		} else {
+			dev_err(sdev->dev, "error: topology ABI is more recent than kernel\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
 }
 
 /* vendor specific kcontrol handlers available for binding */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
