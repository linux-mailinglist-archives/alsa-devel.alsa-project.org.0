Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02442F4ECE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:32:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 672EB1751;
	Wed, 13 Jan 2021 16:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 672EB1751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551953;
	bh=J+WmqlVRiFX4q8k8E1bHf+5qHKQU4Hx3/NRgYWy6/rI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3s7oCTjZgXk7aCAZbNU6EnfLLCotqCYKSz0W2EKG3ynBwwV6g3fE6xXqc2ijyHHB
	 1Aj/n/NhJwrAmdVXqLT/9Hjk4XXqsAH8vTYWuw4Vs1w2z7ah77LaGldTupJctncg61
	 w4/nYBRKkWLv8AT8CvMlNkqgqEhwRLHNR0vWtHQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5902F804FC;
	Wed, 13 Jan 2021 16:29:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA08F804D6; Wed, 13 Jan 2021 16:29:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59D3CF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D3CF80085
IronPort-SDR: bHINAyhofW//s0nAdERtDiuiD+mblFC9PHUid5F5dVNxOxAz97/4ToLdpkUfgFQJCyYTm9xzTE
 Sh77sEKisDEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="175640176"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="175640176"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:29:32 -0800
IronPort-SDR: F0vLq5K11pACGGjVxgTdj1TT7g20v4Chv9dqPseCi67wea5zi0p05n0wiiVZzrW7HrlgucEi+l
 Cd8irh+vHOqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="569445155"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2021 07:29:30 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/4] ASoC: SOF: Intel: tgl: do thorough remove at .shutdown()
 callback
Date: Wed, 13 Jan 2021 17:26:17 +0200
Message-Id: <20210113152617.4048541-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113152617.4048541-1-kai.vehmanen@linux.intel.com>
References: <20210113152617.4048541-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

From: Keyon Jie <yang.jie@linux.intel.com>

Invoke hda_dsp_remove() as the .shutdown() callback. This will help to
perform shutdown of the DSP safely on TGL platforms before shutting down
or rebooting the system.

BugLink: https://github.com/thesofproject/linux/issues/2571
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/tgl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 2252ca38ff4b..419f05ba1920 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -22,9 +22,10 @@ static const struct snd_sof_debugfs_map tgl_dsp_debugfs[] = {
 
 /* Tigerlake ops */
 const struct snd_sof_dsp_ops sof_tgl_ops = {
-	/* probe and remove */
+	/* probe/remove/shutdown */
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
+	.shutdown	= hda_dsp_remove,
 
 	/* Register IO */
 	.write		= sof_io_write,
-- 
2.29.2

