Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A438C346
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 11:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9971E16A5;
	Fri, 21 May 2021 11:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9971E16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621589757;
	bh=bh7kRNJVXneiaNMrsQBNXr/d+iuvVv5w1DGxkQkhxK8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khSDr6cHCslGjrX2jDFV1rgEYy8Knttrf4p+kGGuL7aRoTJbo7bHzTTcKUcnuwP2H
	 AsBV+sbECHTELITq6zLd13ha+oWZEAtmSLUiNq2dbLGg9ORXMrw773gJ3qsh/NMSFp
	 nJJK0q33Plqsqr0+MqauI24xan4MGBy40l3wkI/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 623E5F804AE;
	Fri, 21 May 2021 11:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0595F80259; Fri, 21 May 2021 11:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27AACF800E5
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27AACF800E5
IronPort-SDR: MoLzDKF4m/28ktN/suDHwKOXmiB0+iwQfmkGYs9YWYuLXzmvH3rXTn9bpaZVSXZq71ezrwrnS5
 4qZ7mYCYjR4w==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="262664188"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="262664188"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 02:33:17 -0700
IronPort-SDR: kDR/XFhFF15+uaZ6HcZCK3f0ATAF/KidtFUNasZ4HriXxCtq0ddsNedni+/6cE0lh316O1ZVFY
 s6QN0MDWXVqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="475640864"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 21 May 2021 02:33:15 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/7] ASoC: SOF: ops: print out the polling register
Date: Fri, 21 May 2021 12:28:00 +0300
Message-Id: <20210521092804.3721324-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
References: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 Keyon Jie <yang.jie@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

Print the register offset out to provide more useful information for the
register polling debugging.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ops.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 323a0b3f561b..2763059c3d4b 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -546,14 +546,16 @@ static inline const struct snd_sof_dsp_ops
 		(val) = snd_sof_dsp_read(sdev, bar, offset);		\
 		if (cond) { \
 			dev_dbg(sdev->dev, \
-				"FW Poll Status: reg=%#x successful\n", (val)); \
+				"FW Poll Status: reg[%#x]=%#x successful\n", \
+				(offset), (val)); \
 			break; \
 		} \
 		if (__timeout_us && \
 		    ktime_compare(ktime_get(), __timeout) > 0) { \
 			(val) = snd_sof_dsp_read(sdev, bar, offset); \
 			dev_dbg(sdev->dev, \
-				"FW Poll Status: reg=%#x timedout\n", (val)); \
+				"FW Poll Status: reg[%#x]=%#x timedout\n", \
+				(offset), (val)); \
 			break; \
 		} \
 		if (__sleep_us) \
-- 
2.31.0

