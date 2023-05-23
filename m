Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0292070DA9E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 12:35:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4500883B;
	Tue, 23 May 2023 12:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4500883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684838117;
	bh=YhYlVHuTPUgKz2Kr6kzVOAvGYVNPbVP6crHZXP4gfCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RVeKJ8YjPP4f6xe4ENOa+04O8CRbPZr2mEpGt5bVcekOgov1VBp49gc6LlLVj/0pu
	 360g1UHkBqE30csFQe82eAc9pnuvhX+mm58Rvm06SLpQVHtmJqsw5cY3RNZaAb0BpA
	 baLn8qtTp8mgr5Octc48fQENJrnfLUG8dqUyhV5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA9EF8057B; Tue, 23 May 2023 12:33:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52FE3F80558;
	Tue, 23 May 2023 12:33:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CB14F80578; Tue, 23 May 2023 12:33:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCA32F8026A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 12:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCA32F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NNFaTnTj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684838001; x=1716374001;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YhYlVHuTPUgKz2Kr6kzVOAvGYVNPbVP6crHZXP4gfCE=;
  b=NNFaTnTjI/Scww8GHL2gyNXve1k+yIfc0kYVKp+qanRIf78fZP6xZfoj
   V8+6unPAkmUXsZdgzDr/6fuoZtVIa1WK3CLydjjMw83ybRQf5aoSdwELs
   8QPgvs6svO2eEQCwyh9/apKOnUaiPS0uDfQDvvsgG+eDgH1H4foEjm5KX
   4jzozRCXRCCPuXtpZh8rOxQcpdeD3iQTSe6yjStR191g50nTs+Zk11QRf
   Gd7BXwfoTNH+d3eUl5ANJxH9GLEdkMBQO4yOH+AT2vnZVshoNTqkLFsLq
   8AV0gEdw3DqVQCqjvVrjcCShwYs1reM5eRQuDhGm7jJiC9wO5OiZJduN8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333562979"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400";
   d="scan'208";a="333562979"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="681333532"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400";
   d="scan'208";a="681333532"
Received: from nmkenne1-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.53.154])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 03:31:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 3/3] ASoC: SOF: Intel: tgl: unify core_put on IPC3 & IPC4 path
Date: Tue, 23 May 2023 13:32:17 +0300
Message-Id: <20230523103217.20412-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
References: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S3YQFXSZ6CVI3BCSE2CYBJM5XFNJNIUD
X-Message-ID-Hash: S3YQFXSZ6CVI3BCSE2CYBJM5XFNJNIUD
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3YQFXSZ6CVI3BCSE2CYBJM5XFNJNIUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Firmware may do context saving before powering off primary core, so driver
needs to send ipc msg by set_core_state. In IPC4 path, firmware needs to
save current context to IMR before powering off primary core. Firmware
does nothing for set_core_state message in IPC3 path. So IPC4 and IPC3
can share the same operation sequence.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/tgl.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 2713b7dc7931..8e2b07e1612b 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -39,14 +39,18 @@ static int tgl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 static int tgl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 {
 	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
+	int ret;
+
+	if (pm_ops->set_core_state) {
+		ret = pm_ops->set_core_state(sdev, core, false);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* power down primary core and return */
 	if (core == SOF_DSP_PRIMARY_CORE)
 		return hda_dsp_core_reset_power_down(sdev, BIT(core));
 
-	if (pm_ops->set_core_state)
-		return pm_ops->set_core_state(sdev, core, false);
-
 	return 0;
 }
 
-- 
2.40.1

