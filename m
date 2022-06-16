Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618454EAE6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D68C1B02;
	Thu, 16 Jun 2022 22:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D68C1B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655410822;
	bh=jc7KKG8eBXydP8elEvM0qSTFVzMLTE5DFGwRLb1ulW0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oCc63CboDzqcjftZhdX+L/QBOJqZTX3VrPj0ownlqY4oq7GD+CK5HDcWtStqkQfdm
	 CJsQ+2beip+U+RK+pjc8Jzc7b4nVTHnCDWFw/Ga6b5ktdZZERKR7g5a0+JrU9Serdh
	 YT2MoZ0IcTX9TsiTvbPzWb4OYdBhtz5/RRBk9eeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 243DCF80423;
	Thu, 16 Jun 2022 22:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9595DF804D0; Thu, 16 Jun 2022 22:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4303BF8012A
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4303BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ndGIvnSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655410727; x=1686946727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jc7KKG8eBXydP8elEvM0qSTFVzMLTE5DFGwRLb1ulW0=;
 b=ndGIvnSmGZ/RvXG5/E4Hk02vv+EZWXi174fAMknuoVcjPadqYYTss7Tv
 4TMcj/P5WBjgQfJki9buGAVTGlNlKoXebK7k5RchiP9ewr3q8biKHlAOQ
 Cgz+D64nxt2Sj6mhaM7c//omdT+Uiq3NjnOXyHZrLxbaOL2SM7/+TbCBk
 h/YOTsMyw0c1VOO8ZjSUzhvAXUO3dDWX52EUlgUJ9VYpYrP+VURYEi7Wb
 bbHB6/NA6lsotGeuRNromfH7yDBeFQxy88UCS7mAEKxfwad9ffYtzd8Ez
 qNWcJkZ6w0HRhPn/11aTMGJ249sjdmku4lS+zkF2JFpNVkr9XyWgu/0cy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259803608"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259803608"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="583771737"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 13:18:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: SOF: pm: add definitions for S4 and S5 states
Date: Thu, 16 Jun 2022 15:18:17 -0500
Message-Id: <20220616201818.130802-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616201818.130802-1-pierre-louis.bossart@linux.intel.com>
References: <20220616201818.130802-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

We currently don't have a means to differentiate between S3, S4 and
S5. Add definitions so that we have select different code paths
depending on the target state in follow-up patches.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pm.c       | 9 +++++++++
 sound/soc/sof/sof-priv.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 239f39a5166a4..df740be645e84 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -23,6 +23,9 @@ static u32 snd_sof_dsp_power_target(struct snd_sof_dev *sdev)
 	u32 target_dsp_state;
 
 	switch (sdev->system_suspend_target) {
+	case SOF_SUSPEND_S5:
+	case SOF_SUSPEND_S4:
+		/* DSP should be in D3 if the system is suspending to S3+ */
 	case SOF_SUSPEND_S3:
 		/* DSP should be in D3 if the system is suspending to S3 */
 		target_dsp_state = SOF_DSP_PM_D3;
@@ -344,6 +347,12 @@ int snd_sof_prepare(struct device *dev)
 	case ACPI_STATE_S3:
 		sdev->system_suspend_target = SOF_SUSPEND_S3;
 		break;
+	case ACPI_STATE_S4:
+		sdev->system_suspend_target = SOF_SUSPEND_S4;
+		break;
+	case ACPI_STATE_S5:
+		sdev->system_suspend_target = SOF_SUSPEND_S5;
+		break;
 	default:
 		break;
 	}
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 52396f38dcec2..8bbc94907c624 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -91,6 +91,8 @@ enum sof_system_suspend_state {
 	SOF_SUSPEND_NONE = 0,
 	SOF_SUSPEND_S0IX,
 	SOF_SUSPEND_S3,
+	SOF_SUSPEND_S4,
+	SOF_SUSPEND_S5,
 };
 
 enum sof_dfsentry_type {
-- 
2.34.1

