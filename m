Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E159344BDD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 17:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47B71607;
	Mon, 22 Mar 2021 17:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47B71607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616431230;
	bh=EkrMpy2wrIpOzgaV47V1Xwi1WBT3pLcDeqd+iehi2Jo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+72KCr/7YFOKVZJKHFEmfCyt+VIX0SA6UbSrDKXnp9AcL6jv60ANBj7zQWRNYtC+
	 0GMdBTdfu7MlKuMxE6V1qyDKGz6XxSJVy6MX9WxBox7jjPqhIBIpbZ7Pu81dc2F9Mm
	 O2gaHF4X5tS3XwEiFUT5U0hIpM7DPPx57Ntn+EO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A00C5F8025F;
	Mon, 22 Mar 2021 17:38:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AF6AF8032C; Mon, 22 Mar 2021 17:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEE7CF8012F
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 17:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE7CF8012F
IronPort-SDR: vEM3mPJr0ysLKBeMKyHdvjI0i8c9Dq21vIY9HpgaAdDP3D0RxmGTkq1PEPRQmVfgPhYGmjavw8
 mzp2cztfaNDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210376621"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="210376621"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:44 -0700
IronPort-SDR: nnKhsYmJq+/gZ6MXRCkebPuzoMV09dKcbi2giaO9/t8Mua0kFtYjNgDSSfNrZusElVGrIm137u
 SnIO4thHXg5g==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407899100"
Received: from josemari-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.40.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ASoC: SOF: Intel: TGL: set shutdown callback to
 hda_dsp_shutdown
Date: Mon, 22 Mar 2021 11:37:24 -0500
Message-Id: <20210322163728.16616-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
References: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, tiwai@suse.de,
 Pan Xiuli <xiuli.pan@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Libin Yang <libin.yang@intel.com>

According to hardware spec and PMC FW requirement, the DSP must be
in D3 state before entering S5. Define the shutdown function to use
snd_sof_suspend as shutdown callback to make sure DSP is in D3 state.

Fixes: 44a4cfad8d78 ("ASoC: SOF: Intel: tgl: do thorough remove at .shutdown() callback")
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 6 ++++++
 sound/soc/sof/intel/hda.h     | 1 +
 sound/soc/sof/intel/tgl.c     | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 1f1ce7036764..09a5d9040a90 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -896,6 +896,12 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
 }
 
+int hda_dsp_shutdown(struct snd_sof_dev *sdev)
+{
+	sdev->system_suspend_target = SOF_SUSPEND_S3;
+	return snd_sof_suspend(sdev->dev);
+}
+
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7c7579daee7f..ae80725b0e33 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -517,6 +517,7 @@ int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_idle(struct snd_sof_dev *sdev);
+int hda_dsp_shutdown(struct snd_sof_dev *sdev);
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
 void hda_ipc_dump(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 419f05ba1920..3e46fac53f78 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -25,7 +25,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 	/* probe/remove/shutdown */
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
-	.shutdown	= hda_dsp_remove,
+	.shutdown	= hda_dsp_shutdown,
 
 	/* Register IO */
 	.write		= sof_io_write,
-- 
2.25.1

