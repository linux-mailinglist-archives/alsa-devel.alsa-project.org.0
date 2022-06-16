Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF854ED15
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 00:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217AC1AEF;
	Fri, 17 Jun 2022 00:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217AC1AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655417192;
	bh=dtS68tJQspJzkn5mxiwBgJrb7I6MfCT13tBpLas9pUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9BQzuL/daZ+9cK1LblBTsgZ8PpcbF3GNd0yMbQQmIxaUht5ShHhbh3g/uwr6vJWI
	 W+NLnIq2ik9zy+OjBp1sNKpSl1VF4S8ATgph9IPnf0dgCfe5dELoiMgGglx0Ew2oKx
	 BlQxJ7n29dFTIR+lIKihj/TdE3aMLtQjV33qXwI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A55CDF80533;
	Fri, 17 Jun 2022 00:04:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 068D2F8052E; Fri, 17 Jun 2022 00:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26A38F8012A
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 00:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A38F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hrnlO5xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655417082; x=1686953082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dtS68tJQspJzkn5mxiwBgJrb7I6MfCT13tBpLas9pUs=;
 b=hrnlO5xa2vSdrSNm8U1zwFg0mop0OQH1tdKO/kBW0jZZykfefRr3Q7pP
 SrvMZH6HjeReB9xaqj0/C/3ymeDM78AFfgbbk/vcAOOjra5AKNWWGxNl0
 ZJP90z7wled5/wXLh1FYnMnHSCRQ8HfsbS5uyAtG353SXtJgM7a81iK7P
 pm4cGjU/XL1NrSYTpjV0tYRqSRKvolnyQqNIEGTjn0SYqoOwAYWSxcU4L
 3CiDaS/m3Z4RgzNOtuNDEg0hZnDOQAfFWdizD/H/YloaM3cB7fqY5lOi6
 NvN2HGsBLf9otOHaWW/+csrX1/5LR5g5M3+LmTdUYt8pOyd/GyIul9vZC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304810898"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304810898"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="728084954"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:04:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/11] ASoC: Intel: catpt: use pm_runtime_resume_and_get()
Date: Thu, 16 Jun 2022 17:04:17 -0500
Message-Id: <20220616220427.136036-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, broonie@kernel.org,
 Lianjie Zhang <zhanglianjie@uniontech.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
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

The current code does not check for errors and does not release the
reference on errors.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/catpt/pcm.c   | 26 ++++++++++++++++++++------
 sound/soc/intel/catpt/sysfs.c |  4 +++-
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index a26000cd5cebc..30ca5416c9a3f 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -667,7 +667,9 @@ static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 	if (!memcmp(&cdev->devfmt[devfmt.iface], &devfmt, sizeof(devfmt)))
 		return 0;
 
-	pm_runtime_get_sync(cdev->dev);
+	ret = pm_runtime_resume_and_get(cdev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
 
 	ret = catpt_ipc_set_device_format(cdev, &devfmt);
 
@@ -853,9 +855,12 @@ static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	u32 dspvol;
+	int ret;
 	int i;
 
-	pm_runtime_get_sync(cdev->dev);
+	ret = pm_runtime_resume_and_get(cdev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
 
 	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
 		dspvol = catpt_mixer_volume(cdev, &cdev->mixer, i);
@@ -876,7 +881,9 @@ static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	int ret;
 
-	pm_runtime_get_sync(cdev->dev);
+	ret = pm_runtime_resume_and_get(cdev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
 
 	ret = catpt_set_dspvol(cdev, cdev->mixer.mixer_hw_id,
 			       ucontrol->value.integer.value);
@@ -897,6 +904,7 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
 	long *ctlvol = (long *)kcontrol->private_value;
 	u32 dspvol;
+	int ret;
 	int i;
 
 	stream = catpt_stream_find(cdev, pin_id);
@@ -906,7 +914,9 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 		return 0;
 	}
 
-	pm_runtime_get_sync(cdev->dev);
+	ret = pm_runtime_resume_and_get(cdev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
 
 	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
 		dspvol = catpt_stream_volume(cdev, stream, i);
@@ -937,7 +947,9 @@ static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
 		return 0;
 	}
 
-	pm_runtime_get_sync(cdev->dev);
+	ret = pm_runtime_resume_and_get(cdev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
 
 	ret = catpt_set_dspvol(cdev, stream->info.stream_hw_id,
 			       ucontrol->value.integer.value);
@@ -1013,7 +1025,9 @@ static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 		return 0;
 	}
 
-	pm_runtime_get_sync(cdev->dev);
+	ret = pm_runtime_resume_and_get(cdev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
 
 	ret = catpt_ipc_mute_loopback(cdev, stream->info.stream_hw_id, mute);
 
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index 9579e233a15db..1bdbcc04dc712 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -15,7 +15,9 @@ static ssize_t fw_version_show(struct device *dev,
 	struct catpt_fw_version version;
 	int ret;
 
-	pm_runtime_get_sync(cdev->dev);
+	ret = pm_runtime_resume_and_get(cdev->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
 
 	ret = catpt_ipc_get_fw_version(cdev, &version);
 
-- 
2.34.1

