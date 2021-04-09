Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6335A897
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 00:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0EE169D;
	Sat, 10 Apr 2021 00:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0EE169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618005889;
	bh=c3YSePEGFC7S+qr7jf40HKsbqSOPQJEEIT7blFOURSM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=heB8TlBjK6HoZV4Iqr5/+ILUUfu1yKmuuZXaU5DAib/fRm7wsR8c/HVMQbpYoOj6L
	 OWjlVhm1YtAjOfuYTmVROPK2LYPMHMY3X0EsqEOcojOG/6QrvaK/YKwcI5U2ShtsmG
	 xoYLNl8hSsNOAXIuBdJ/nWkSZdVhpV1CowLdaDqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 282B6F804AB;
	Sat, 10 Apr 2021 00:01:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F84CF80425; Sat, 10 Apr 2021 00:01:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7F38F80245
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 00:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F38F80245
IronPort-SDR: FoQsVf5BZcwPstayectz2RqQg3zQekGPweE8vhpWkO13AKdQ52KN8EoKBp46rcIm5RdOu82R4H
 CHhKVQ32JVlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="214284731"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="214284731"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:39 -0700
IronPort-SDR: BKfVkOQ2YcPI4VvuOAwqV+Ijfn/pRpmuruG5GU4ddnxtf0bkNeybAOcXQFSdvlZ71Uke48WZ2V
 Yw3xJdZezh4g==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="599290635"
Received: from ukorat-mobl2.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.104.152])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 15:01:36 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: SOF: Intel: update set_mach_params()
Date: Fri,  9 Apr 2021 15:01:19 -0700
Message-Id: <20210409220121.1542362-5-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
References: <20210409220121.1542362-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Add information for num_dai_drivers and dai_drivers[], which will be
used in the refactored nocodec implementation

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c | 4 ++++
 sound/soc/sof/intel/byt.c | 4 ++++
 sound/soc/sof/intel/hda.c | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 28e049ac9c5e..89a6c1f04a55 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -561,10 +561,14 @@ static void bdw_machine_select(struct snd_sof_dev *sdev)
 static void bdw_set_mach_params(const struct snd_soc_acpi_mach *mach,
 				struct snd_sof_dev *sdev)
 {
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = pdata->desc;
 	struct snd_soc_acpi_mach_params *mach_params;
 
 	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
 	mach_params->platform = dev_name(sdev->dev);
+	mach_params->num_dai_drivers = desc->ops->num_drv;
+	mach_params->dai_drivers = desc->ops->drv;
 }
 
 /* Broadwell DAIs */
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index bed26d96dc50..d9803e2ba67f 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -500,10 +500,14 @@ static struct snd_soc_dai_driver byt_dai[] = {
 static void byt_set_mach_params(const struct snd_soc_acpi_mach *mach,
 				struct snd_sof_dev *sdev)
 {
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = pdata->desc;
 	struct snd_soc_acpi_mach_params *mach_params;
 
 	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
 	mach_params->platform = dev_name(sdev->dev);
+	mach_params->num_dai_drivers = desc->ops->num_drv;
+	mach_params->dai_drivers = desc->ops->drv;
 }
 
 /*
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 065b85285450..b00e8fcb2312 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1215,10 +1215,14 @@ static int hda_sdw_machine_select(struct snd_sof_dev *sdev)
 void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
 			 struct snd_sof_dev *sdev)
 {
+	struct snd_sof_pdata *pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = pdata->desc;
 	struct snd_soc_acpi_mach_params *mach_params;
 
 	mach_params = (struct snd_soc_acpi_mach_params *)&mach->mach_params;
 	mach_params->platform = dev_name(sdev->dev);
+	mach_params->num_dai_drivers = desc->ops->num_drv;
+	mach_params->dai_drivers = desc->ops->drv;
 }
 
 void hda_machine_select(struct snd_sof_dev *sdev)
-- 
2.25.1

