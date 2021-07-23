Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCBE3D39DD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 13:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 824A21705;
	Fri, 23 Jul 2021 13:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 824A21705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627041519;
	bh=YT1MyTVF81kJp02unFYB356BJDdGykEtivTrtV6i844=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCxl6FGtnTehXxATqYAHovfkNw2Tgy2/yO6Kq5acvta9Tzd0wDDAhBvyo24UBjVcl
	 Y1gGAVOlFZVv9E72f1T5KxkKXyRfjYV+oMt0oUqqsFO+J7luQyljUfQW+vF4fIzN/G
	 irFuPK/p6LmHY1FDom9YdtiwDl6zWa7VUWnT0Zbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A944EF804FD;
	Fri, 23 Jul 2021 13:55:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8C15F804F3; Fri, 23 Jul 2021 13:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99D32F804CB
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 13:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D32F804CB
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="209972210"
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="209972210"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 04:55:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="455069789"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 04:55:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/6] ASoC: SOF: intel: move sof_intel_dsp_desc() forward
Date: Fri, 23 Jul 2021 19:54:49 +0800
Message-Id: <20210723115451.7245-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
References: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

sof_intel_dsp_desc() will be used by hda_dsp_check_sdw_irq() in the
following commit.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index e48e030f6005..79388489c4e2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -41,6 +41,17 @@
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define HDA_EXT_ROM_STATUS_SIZE 8
 
+static const struct sof_intel_dsp_desc
+	*get_chip_info(struct snd_sof_pdata *pdata)
+{
+	const struct sof_dev_desc *desc = pdata->desc;
+	const struct sof_intel_dsp_desc *chip_info;
+
+	chip_info = desc->chip_info;
+
+	return chip_info;
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
@@ -668,17 +679,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static const struct sof_intel_dsp_desc
-	*get_chip_info(struct snd_sof_pdata *pdata)
-{
-	const struct sof_dev_desc *desc = pdata->desc;
-	const struct sof_intel_dsp_desc *chip_info;
-
-	chip_info = desc->chip_info;
-
-	return chip_info;
-}
-
 static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
-- 
2.17.1

