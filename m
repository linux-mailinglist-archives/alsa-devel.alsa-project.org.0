Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22033307303
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 10:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F1916C1;
	Thu, 28 Jan 2021 10:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F1916C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611827136;
	bh=K48H2EhD27Dn0AkwLDFed0MWw7enloflHk2Dc0C49YQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AaR0oU5ZIXqJh3tksOchLxQCxXfJ3grqkg/eKbfWRiC8AuEO3PRBgJ28CyCOjJYey
	 zfRV1G8NdE373R5ppNMKF/mZXLdyLN+fjw4k0on2G44xHt8EGAdzvdrb2LH9py0WrB
	 F8ogy+J6447njTn0GxQvp9AqGfaHOsPUyY4cLyU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B44C1F804E2;
	Thu, 28 Jan 2021 10:42:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CC45F804D6; Thu, 28 Jan 2021 10:42:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D663F804C3
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 10:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D663F804C3
IronPort-SDR: 31y9F9/b9oCCLbzFzRq5PcpH3PI/YHlXF840vgXOEDmIIdISCa5qBdbAW3oofKjWEnD6P42c9D
 pcNPxupe5LBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="159380112"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="159380112"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 01:42:20 -0800
IronPort-SDR: 9kLYArVsw30CDidl5x/VFeNM2jGin97KYvJJhyq+bOUoAMfGIY5fUeKXghKRvzMRipkDrTmqYV
 Pw9ERsB1xq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="369789145"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 28 Jan 2021 01:42:19 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/5] ASoC: SOF: Filter out unneeded core power up/downs
Date: Thu, 28 Jan 2021 11:38:49 +0200
Message-Id: <20210128093850.1041387-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128093850.1041387-1-kai.vehmanen@linux.intel.com>
References: <20210128093850.1041387-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Exclude cores that are already powered on/off correctly. This allows to
simplify dsp_power_up/down() implementations and avoid unexpected error.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ops.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 2e9a8da53d57..5099ad03df72 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -78,7 +78,8 @@ static inline int snd_sof_dsp_core_power_up(struct snd_sof_dev *sdev,
 {
 	int ret = 0;
 
-	if (sof_ops(sdev)->core_power_up) {
+	core_mask &= ~sdev->enabled_cores_mask;
+	if (sof_ops(sdev)->core_power_up && core_mask) {
 		ret = sof_ops(sdev)->core_power_up(sdev, core_mask);
 		if (!ret)
 			sdev->enabled_cores_mask |= core_mask;
@@ -92,7 +93,8 @@ static inline int snd_sof_dsp_core_power_down(struct snd_sof_dev *sdev,
 {
 	int ret = 0;
 
-	if (sof_ops(sdev)->core_power_down) {
+	core_mask &= sdev->enabled_cores_mask;
+	if (sof_ops(sdev)->core_power_down && core_mask) {
 		ret = sof_ops(sdev)->core_power_down(sdev, core_mask);
 		if (!ret)
 			sdev->enabled_cores_mask &= ~core_mask;
-- 
2.29.2

