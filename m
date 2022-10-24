Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E847860B2F2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C106F29;
	Mon, 24 Oct 2022 18:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C106F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630515;
	bh=OhENCqBXCVCRLqTLl75SxKjgJaDvk3tae2WdVfgE5lo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CR53ikffYuE+umRmausEtedh9Ran+aaoytwECWT31oPAs4eFb6imeLNPhC+Vq8Iha
	 uJHMi16Zn4Dt7N8j0sCpK3G5g/Keou/h/RxaQICC9e4T2ZnRYqBUi4sGlIrUMUIJzL
	 iJwEXeTvi4bRtmLI0NcLnEVozuFqo9bd7LxHD1YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13278F80570;
	Mon, 24 Oct 2022 18:53:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEE34F80558; Mon, 24 Oct 2022 18:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3591DF8053D
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3591DF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WWP2xWwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630408; x=1698166408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhENCqBXCVCRLqTLl75SxKjgJaDvk3tae2WdVfgE5lo=;
 b=WWP2xWwesNca7i1oZXty8XJRV1zXwnfqcITKt+CcZD7Xe2sKIqguNs67
 bSnB3mBXTy7SRBZ04/n7X1mEQD/YLFvDYA/tVR6revHKv/rgw/y1oWmYX
 sQ51SV/gMcRo/7xuBmhMPH4JwcQHtfqb1dI3WizH5GgtUaVSP/GSQxy2U
 EB9Kx5g6X0Jb51LUDCYW4E3LY+M9VNQ5ZTC2hG6/cDoCnwPri5SUuXKYF
 a4EF0LSf3p6bDzi2aTimCP1zfbDDkGU37ELsPOepCiJgA029L/Qh5Y/7h
 VYmqdlqz9iwft/k+HUq3AO9j7nCG4Pe2res48J+lS7qhWRauSEy2Ohnrt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="393787381"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="393787381"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263042"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263042"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/16] ASoC: SOF: ops: fallback to mmio in helpers
Date: Mon, 24 Oct 2022 11:52:55 -0500
Message-Id: <20221024165310.246183-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Returning an error when a read/write is not implemented makes no
sense, especially on read where no return value makes sense.

Change the logic to directly fallback to mmio. If a platform truly
wants other read/writes that are not plain vanilla mmio, it needs to
implement its own routines.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ops.h | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 55d43adb6a295..a72f8043be64d 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -305,23 +305,19 @@ static inline int snd_sof_debugfs_add_region_item(struct snd_sof_dev *sdev,
 static inline void snd_sof_dsp_write(struct snd_sof_dev *sdev, u32 bar,
 				     u32 offset, u32 value)
 {
-	if (sof_ops(sdev)->write) {
+	if (sof_ops(sdev)->write)
 		sof_ops(sdev)->write(sdev, sdev->bar[bar] + offset, value);
-		return;
-	}
-
-	dev_err_ratelimited(sdev->dev, "error: %s not defined\n", __func__);
+	else
+		writel(value,  sdev->bar[bar] + offset);
 }
 
 static inline void snd_sof_dsp_write64(struct snd_sof_dev *sdev, u32 bar,
 				       u32 offset, u64 value)
 {
-	if (sof_ops(sdev)->write64) {
+	if (sof_ops(sdev)->write64)
 		sof_ops(sdev)->write64(sdev, sdev->bar[bar] + offset, value);
-		return;
-	}
-
-	dev_err_ratelimited(sdev->dev, "error: %s not defined\n", __func__);
+	else
+		writeq(value, sdev->bar[bar] + offset);
 }
 
 static inline u32 snd_sof_dsp_read(struct snd_sof_dev *sdev, u32 bar,
@@ -329,9 +325,8 @@ static inline u32 snd_sof_dsp_read(struct snd_sof_dev *sdev, u32 bar,
 {
 	if (sof_ops(sdev)->read)
 		return sof_ops(sdev)->read(sdev, sdev->bar[bar] + offset);
-
-	dev_err(sdev->dev, "error: %s not defined\n", __func__);
-	return -ENOTSUPP;
+	else
+		return readl(sdev->bar[bar] + offset);
 }
 
 static inline u64 snd_sof_dsp_read64(struct snd_sof_dev *sdev, u32 bar,
@@ -339,9 +334,8 @@ static inline u64 snd_sof_dsp_read64(struct snd_sof_dev *sdev, u32 bar,
 {
 	if (sof_ops(sdev)->read64)
 		return sof_ops(sdev)->read64(sdev, sdev->bar[bar] + offset);
-
-	dev_err(sdev->dev, "error: %s not defined\n", __func__);
-	return -ENOTSUPP;
+	else
+		return readq(sdev->bar[bar] + offset);
 }
 
 /* block IO */
-- 
2.34.1

