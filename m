Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF2323F1E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 15:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F58D1678;
	Wed, 24 Feb 2021 15:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F58D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614176475;
	bh=gW62Hid1CJEzNu2xEA6iCBx3qIYHX2RtWBuzQ1CXP7c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gze0abZiRvuBUxikUWZyG8r2h+36CfecObsnrM4XtlA6rxUkxUFRTWGXPSJqi/mty
	 suN/9jHQ994zbYBNOmKpSCcgDhDJm3GL7zmhMb4ul7PktaMtR3Veua/aAg/CkGK5SH
	 pdDMa1D0kZtM8RRINA+IO4SM4UFNSN8vKmzZe+ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A7BF80161;
	Wed, 24 Feb 2021 15:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EEE7F8016C; Wed, 24 Feb 2021 15:19:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77D11F800F2
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 15:19:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D11F800F2
IronPort-SDR: Xg2KRdfsoHTYwKKmEurKsgv3sImRD/TkR6LE65lqWfDi+rW6KmjAypSMu8sUxxtXySQlb15JnX
 2nuPZsWZnS5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="172308836"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="172308836"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 06:19:28 -0800
IronPort-SDR: 8b+FBkADVaB1iwslwnr6RxkEPOOD0RZuEa1OMmZVciCRaasHb6hInkMjEFWndXTn4FMwoKS3TS
 ax2SDavONLCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="431691321"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2021 06:19:26 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda: turn off display power in resume
Date: Wed, 24 Feb 2021 16:15:41 +0200
Message-Id: <20210224141541.3331254-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
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

Turn off display power at the end of controller resume flow. This is now
possible with the changes done in commit 87fc20e4a0cb ("ASoC: SOF:
Intel: hda: use hdac_ext fine-grained link management"). As codec driver
is able to request the HDA link to be brought back up, the controller
no longer needs to blindly keep display power enabled.

Co-developed-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 5788fe356960..9900a058ba6e 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -678,7 +678,7 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to start controller after resume\n");
-		return ret;
+		goto cleanup;
 	}
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
@@ -704,6 +704,10 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 	hda_dsp_ctrl_ppcap_enable(sdev, true);
 	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
 
+cleanup:
+	/* display codec can powered off after controller init */
+	hda_codec_i915_display_power(sdev, false);
+
 	return 0;
 }
 

base-commit: 9fd914d917da05641b42cab7d40bdf8ab06dac3b
-- 
2.29.2

