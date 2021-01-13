Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A942F4EB1
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:31:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4790173F;
	Wed, 13 Jan 2021 16:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4790173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551903;
	bh=kG+sGYRJa16pOayQj6FoJmpd3Sy3QScQLtIw7WcCQl8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fMZDZGj+vjXdB+1dJ1N6ebqfUCdu2FjDbImGesoWcsD45bUIItFkQsJWCvqJ8ElUY
	 jEvB/CcNIb5nAgWLdePKmqKHY4xqIBCSeli+9T+tPGxt4spG1LThwAGRW5uLKxDlUm
	 gFfd/zwkGriJ4zQL0VFh46nyrpxuMmKILVj2J4uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0626DF804C2;
	Wed, 13 Jan 2021 16:29:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61343F8016D; Wed, 13 Jan 2021 16:29:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B50FF8016D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B50FF8016D
IronPort-SDR: tztmU9MPDBYwIu1U9IfKPT9avjpY8lgpSJBSjnUm7HKe5abdjWCVA3Xq1Bhbg5jgislX9vn1o9
 i5KeHkMJGOXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="175640161"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="175640161"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:29:26 -0800
IronPort-SDR: 5ZQSmvdOXRLWfh7hpI5tpI7LW2wASOjNrnRFr+USNBrgHVAIGAzEmLFDvD3Gwo818CGWIjDVKf
 +hcOZe5e6uDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="569445147"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2021 07:29:24 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/4] ASoC: SOF: add snd_sof_device_shutdown() helper for
 shutdown
Date: Wed, 13 Jan 2021 17:26:15 +0200
Message-Id: <20210113152617.4048541-2-kai.vehmanen@linux.intel.com>
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

Add helper snd_sof_device_shutdown() to wrap the platform specific
.shutdown callbacks for SOF platforms.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2b85ef5d6092..8d13eb13fe08 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -385,6 +385,14 @@ int snd_sof_device_remove(struct device *dev)
 }
 EXPORT_SYMBOL(snd_sof_device_remove);
 
+int snd_sof_device_shutdown(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+
+	return snd_sof_shutdown(sdev);
+}
+EXPORT_SYMBOL(snd_sof_device_shutdown);
+
 MODULE_AUTHOR("Liam Girdwood");
 MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.29.2

