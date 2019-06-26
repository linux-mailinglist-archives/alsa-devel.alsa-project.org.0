Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D63562E1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 09:06:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22BF71614;
	Wed, 26 Jun 2019 09:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22BF71614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561532790;
	bh=ZxicDke8PcGhOzdJQbH0htp/WgN9R5NgLymMSr6P+jI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oBVCQsFryWiB2Vz2Fm3h/XFw5oRQnO5ktba89iNLSjw1Q3lKeGf3Y3z0l0nV/QVDH
	 MOWjfyihBb1f4Y8n5xPOZS4qRLJXL6NTm34lZMB6Cr+kPbp+rXZ0KabZtLtO3dosMN
	 dSQS1B/46A4zcwLWL6VG/+nEpqwf3M3XnumNquFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9C77F896EC;
	Wed, 26 Jun 2019 09:05:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91D6DF8070C; Wed, 26 Jun 2019 09:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30638F8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 09:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30638F8070C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 00:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; d="scan'208";a="152549183"
Received: from rlanex-mobl.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.251.157.231])
 by orsmga007.jf.intel.com with ESMTP; 26 Jun 2019 00:04:50 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 26 Jun 2019 00:04:50 -0700
Message-Id: <20190626070450.7229-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, libin.yang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2] ASoC: SOF: Intel: hda: Make hdac_device
	device-managed
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

snd_hdac_ext_bus_device_exit() has been recently modified
to no longer free the hdac device. SOF allocates memory for
hdac_device and hda_hda_priv with kzalloc. Make them
device-managed instead so that they will be freed when the
SOF driver is unloaded.

Because of the above change, hda_codec is device-managed and
it will be freed when the ASoC device is removed. Freeing
the codec in snd_hda_codec_dev_release() leads to kernel
panic while unloading and reloading the ASoC driver. So,
avoid freeing the hda_codec for ASoC driver. This is done in
the same patch to avoid bisect failure.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/pci/hda/hda_codec.c       | 8 +++++++-
 sound/soc/sof/intel/hda-codec.c | 6 ++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 6c51b8363f8b..a2e23d7e768f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -846,7 +846,13 @@ static void snd_hda_codec_dev_release(struct device *dev)
 	snd_hda_sysfs_clear(codec);
 	kfree(codec->modelname);
 	kfree(codec->wcaps);
-	kfree(codec);
+
+	/*
+	 * In the case of ASoC HD-audio, hda_codec is device managed.
+	 * It will be freed when the ASoC device is removed.
+	 */
+	if (codec->core.type == HDA_DEV_LEGACY)
+		kfree(codec);
 }
 
 #define DEV_NAME_LEN 31
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index b8b37f082309..0d8437b080bf 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -62,8 +62,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 		address, resp);
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
-	/* snd_hdac_ext_bus_device_exit will use kfree to free hdev */
-	hda_priv = kzalloc(sizeof(*hda_priv), GFP_KERNEL);
+	hda_priv = devm_kzalloc(sdev->dev, sizeof(*hda_priv), GFP_KERNEL);
 	if (!hda_priv)
 		return -ENOMEM;
 
@@ -82,8 +81,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 
 	return 0;
 #else
-	/* snd_hdac_ext_bus_device_exit will use kfree to free hdev */
-	hdev = kzalloc(sizeof(*hdev), GFP_KERNEL);
+	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
 	if (!hdev)
 		return -ENOMEM;
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
