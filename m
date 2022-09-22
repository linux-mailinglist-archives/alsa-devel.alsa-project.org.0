Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2255E6E7C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 23:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2306847;
	Thu, 22 Sep 2022 23:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2306847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663882705;
	bh=OgnU7KxwBJxa9g4IaopFx0Pbsmxfrs7KgiNvT+oOTTk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B3bn8BR/MUIO6qj/0azBDJzrE4pLTQJ9GI/xejFnhgGOle2a0PyOcmUk0xmPV7ZpJ
	 HEbbsaUuOVuTle8bgOE1A7qZ2wTq1vq2nNEwC907vx/FbP83PUBqLo5GWx37NsQrq/
	 749QXxkyzYF/HTdDYCeex2EA7eVdfxgGtQXQ2nL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45489F8053C;
	Thu, 22 Sep 2022 23:37:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02CBDF8053D; Thu, 22 Sep 2022 23:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54311F80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 23:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54311F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="oCDLq3T7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663882617; x=1695418617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OgnU7KxwBJxa9g4IaopFx0Pbsmxfrs7KgiNvT+oOTTk=;
 b=oCDLq3T7V7qz3Ev8ZmxgVS0lbcQtfgy03yVuWkYT902EDic66cEx5932
 7RquerT+wj6mzLNtJsFgCIfYUJgsIsAhxo4YaTZIwqJ62wRmi9gICai3R
 ROTsRNC1P8adczBIjCpudDLK8PapoDfcCRsoinkWfxnCaHoMf1ivdh8eA
 wJuYw6E2/5QKgCFrjh/8eXP/yGuAGV2HSPsCh8OZU15SmHEJtmS87qk2c
 rDdqsD0hO96lZUJvKLgSh9UzuGKFfvghxUvPTYQR3nrYz5uCx/tn+oJI+
 WSHA3ACHgAOW0BT+wQiae0qwQkJohzksZR/ydPWHY0OocYxiNAD9R1w/4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386725759"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="386725759"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="745550840"
Received: from jpwarner-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.13.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 14:36:50 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ASoC: SOF: Intel: introduce new op to handle dsp power
 down
Date: Thu, 22 Sep 2022 14:36:35 -0700
Message-Id: <20220922213644.666315-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
References: <20220922213644.666315-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Fred Oh <fred.oh@linux.intel.com>,
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

From: Fred Oh <fred.oh@linux.intel.com>

DSP core power down sequences are different between cavs platforms and MTL.

Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/shim.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 638159bee864..c7b4b1e0a824 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -186,6 +186,7 @@ struct sof_intel_dsp_desc {
 	enum sof_intel_hw_ip_version hw_ip_version;
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 	bool (*check_ipc_irq)(struct snd_sof_dev *sdev);
+	int (*power_down_dsp)(struct snd_sof_dev *sdev);
 	int (*cl_init)(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
 };
 
-- 
2.25.1

