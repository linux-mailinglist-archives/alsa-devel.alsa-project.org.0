Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D609E45EF68
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 14:47:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6882F1933;
	Fri, 26 Nov 2021 14:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6882F1933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637934449;
	bh=KaXf430BfV9mmIbbc9OEz5j0SKc2m7Hfhfz+dmTOvSA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFTVrcJpykKelTMlXnrcqnXKmIYv2kMBCiGKicQvM45epqGtZPHLxKrzI5E2YjtsT
	 1BM87yUXeO9tMMBP3gomVYezJe7sb6ooi8CFDEt9fJ5PxPzJ0gvKiixuntsMYomIYP
	 MGtmddPZL/0uzsza1CU18NHenSRZJH4VmDBOI/1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2533EF804FB;
	Fri, 26 Nov 2021 14:45:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15AD4F804F3; Fri, 26 Nov 2021 14:45:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B87F801F7
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 14:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B87F801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215689420"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="215689420"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 05:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="675566591"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 26 Nov 2021 05:45:14 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 2/3] ALSA: hda: Simplify DMIC-in-NHLT check
Date: Fri, 26 Nov 2021 14:47:38 +0100
Message-Id: <20211126134739.1041596-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126134739.1041596-1-cezary.rojewski@intel.com>
References: <20211126134739.1041596-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Only DMIC endpoint presence is relevant, not its configuration.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-dsp-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index b9ac9e9e45a4..26f8665da689 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -384,7 +384,7 @@ static int snd_intel_dsp_check_dmic(struct pci_dev *pci)
 
 	nhlt = intel_nhlt_init(&pci->dev);
 	if (nhlt) {
-		if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt))
+		if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_DMIC))
 			ret = 1;
 		intel_nhlt_free(nhlt);
 	}
-- 
2.25.1

