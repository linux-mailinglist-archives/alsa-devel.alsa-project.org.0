Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 510011AB281
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:31:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBC3A165D;
	Wed, 15 Apr 2020 22:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBC3A165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982710;
	bh=3fesIT905a7VsNuDdR2r1uuGGyqfzQ8R6wDr8SllvHs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ErojFVIsQejABss91hGMCFMIVuHu3y2n0RhyUu0KASoPxTlHntp5bMfRCLkkeQQ8a
	 jNvg+cpPy76zLWsUcJ+zXvMmGPTRv1F8SJfut/jKRGIeKp8NKUq6d7vz+OvmU2O3Qy
	 Atlx1UUIQEuPZz3rZgKmLW37GVu88AP3wuRrD81M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 018F7F8025F;
	Wed, 15 Apr 2020 22:29:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F28DF8027D; Wed, 15 Apr 2020 22:29:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1795DF80245
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1795DF80245
IronPort-SDR: 0A/aEezSVWTGfiK5GSCfRFrYKjPAjelPCkZoLfgGroK6HK4IkxkDroTC/ASK6iVcvlwOXeepVO
 6xE7hAlJnrkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:28:50 -0700
IronPort-SDR: F1e4yPdID7Vpku1o1xUMJlyuneNNBBydXFH3hTziduHkVYU2CmMifwCtBGeiEtBUlW3z/nieHV
 k4+2qI+XPYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656227"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:28:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/24] ASoC: SOF: topology: fix: handle DAI widget connections
 properly with multiple CPU DAI's
Date: Wed, 15 Apr 2020 15:27:53 -0500
Message-Id: <20200415202816.934-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, when connecting a DAI widget to the BE CPU DAI, we overwrite
the previous connections. This worked because we only ever had 1 CPU DAI
for each rtd until now. But with multiple CPU DAI's, a new connection
between a BE CPU DAI and the DAI widget should be established without
affecting the previous connections. So, modify the loop to set the
playback/capture widget for the first BE CPU DAI that does not have a
connection established previously.

Fixes: 4a7e26a4d833 ("ASoC: SOF: topology: connect dai widget to all
cpu-dais")

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index fe8ba3e05e08..3386886fd743 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1257,15 +1257,45 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 
 		switch (w->id) {
 		case snd_soc_dapm_dai_out:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-				cpu_dai->capture_widget = w;
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				/*
+				 * Please create DAI widget in the right order
+				 * to ensure BE will connect to the right DAI
+				 * widget.
+				 */
+				if (!cpu_dai->capture_widget) {
+					cpu_dai->capture_widget = w;
+					break;
+				}
+			}
+			if (i == rtd->num_cpus) {
+				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
+					w->name);
+
+				return -EINVAL;
+			}
 			dai->name = rtd->dai_link->name;
 			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
 				w->name, rtd->dai_link->name);
 			break;
 		case snd_soc_dapm_dai_in:
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
-				cpu_dai->playback_widget = w;
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				/*
+				 * Please create DAI widget in the right order
+				 * to ensure BE will connect to the right DAI
+				 * widget.
+				 */
+				if (!cpu_dai->playback_widget) {
+					cpu_dai->playback_widget = w;
+					break;
+				}
+			}
+			if (i == rtd->num_cpus) {
+				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
+					w->name);
+
+				return -EINVAL;
+			}
 			dai->name = rtd->dai_link->name;
 			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
 				w->name, rtd->dai_link->name);
-- 
2.20.1

