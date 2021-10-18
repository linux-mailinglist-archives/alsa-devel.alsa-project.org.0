Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A33432013
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 16:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 647AF179A;
	Mon, 18 Oct 2021 16:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 647AF179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634568091;
	bh=CTX7dXOuTctR52B74Rw0JZQ3Le4/z644yXeLROIUZwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MtUWIhVuhBUtxR14N7XIXOTayCIYSz5fv1e/9+xEt0Uowmaf4W/M3GpmBrU52Xn/y
	 YrYl42z0FvZtzioVBNqx0Jzq9supNFPifHD6/o7LtcrCTvSluZS84WCp9LBJXdieMl
	 6Dmj2PdtX1m2khh1oxw3tKU+A3WoLujMg2/AaTTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F74F804F2;
	Mon, 18 Oct 2021 16:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FE1DF804ED; Mon, 18 Oct 2021 16:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BAC3F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BAC3F801DB
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="291731899"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="291731899"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 07:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="629218956"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2021 07:39:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ALSA: hda: Simplify DMIC-in-NHLT check
Date: Mon, 18 Oct 2021 16:40:53 +0200
Message-Id: <20211018144054.286268-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018144054.286268-1-cezary.rojewski@intel.com>
References: <20211018144054.286268-1-cezary.rojewski@intel.com>
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
---
 sound/hda/intel-dsp-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 64b6c6ab591e..d97152a3a331 100644
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

