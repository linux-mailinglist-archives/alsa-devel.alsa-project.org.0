Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5B156A219
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED83A169C;
	Thu,  7 Jul 2022 14:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED83A169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197323;
	bh=oPLP+ZZtjRuK42T15AQw9BYYGFEFD/IZVA8eaOBiwKM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BWHxmk6Jj92uBso6Z9hmXK7CodgCky9uPMANIWySVRz8m1h2KpIlJfXr5mpWlPInW
	 j6nZqn1jhJEk4WkFnXJuJgpku3cOPayCcBIm9oFr0zetZn0Tht3W10VQOd6aYcxLed
	 Hqi83MURali34pgBt+Jnjqk9RpqDvewxH5pqGO4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A0C3F80579;
	Thu,  7 Jul 2022 14:32:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE450F80567; Thu,  7 Jul 2022 14:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A27A5F8055A
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A27A5F8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ha8fQrHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197133; x=1688733133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPLP+ZZtjRuK42T15AQw9BYYGFEFD/IZVA8eaOBiwKM=;
 b=ha8fQrHv1B43xyBk7eFERuPWAdjt/IcJBNTAqy2wlT1hHkrfYUHpazJg
 euG1TppMTooEOXoU8IuZHjqJjUiJQVElOGFJF1Jvbcqc2AyygqpARACEM
 p3X/vciKZA3FgUA8qQE4mFrF5P/u0dT4K1lZHjI/Yj8qrVnEX6ixB80Sg
 KGcRXDADx7J8p0LynaqbnSp94Hca2zZ5/iSJHOy6PO9pYqc6YOcinTGVk
 IXNhN45ewKqhRO1a1y/JsoBJti+4R39My2dPonyLx8FKdLNkks3Yui/f8
 bQL8zjD80nUnGCogaQde8sxZqmZk386A+SDRMc5EpcUmMPA7/R5U6egBd w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805962"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805962"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720708"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:32:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 12/12] ASoC: Intel: avs: Update AVS_FW_INIT_TIMEOUT_US
 declaration
Date: Thu,  7 Jul 2022 14:41:53 +0200
Message-Id: <20220707124153.1858249-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

To reduce the number of places to update if timeouts would have to
change, modify the constant declaration.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 542fd44aa501..9e3f8ff33a87 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -27,8 +27,8 @@
 #define APL_ROM_INIT_RETRIES		3
 
 #define AVS_FW_INIT_POLLING_US		500
-#define AVS_FW_INIT_TIMEOUT_US		3000000
 #define AVS_FW_INIT_TIMEOUT_MS		3000
+#define AVS_FW_INIT_TIMEOUT_US		(AVS_FW_INIT_TIMEOUT_MS * 1000)
 
 #define AVS_CLDMA_START_DELAY_MS	100
 
-- 
2.25.1

