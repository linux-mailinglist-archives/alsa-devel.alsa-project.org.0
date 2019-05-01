Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E9E10ABF
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F2CB1713;
	Wed,  1 May 2019 18:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F2CB1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556726973;
	bh=sXQ2DxT5EK4cIZaIDNHcdZQwLVSvv7ztzWOvIYGhZgc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arFxMGWh+tMXw4GQo5KertOvNuQ2OJXbhP6sZ4F17C9pbzMt87IqCrG9IbkE2FhMZ
	 IBwunmQPIKDM18yCDE4mQcw8t3vBwSiWd+wgdSQoJ/A1XwPrVwWsC6rJHGaD3Hs6WZ
	 Q7wQOcXWSpSPMgdmHF6O7zHtKkXaZrETTlOUJx1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A2AF8976A;
	Wed,  1 May 2019 17:59:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CAB6F8974E; Wed,  1 May 2019 17:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D06EF89744
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D06EF89744
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115736"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:39 -0500
Message-Id: <20190501155745.21806-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 16/22] soundwire: intel: protect macro
	parameters
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Extra parentheses required here

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 56d6c1dda0ff..8c653a563534 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -24,18 +24,18 @@
 #define SDW_SHIM_IPPTR			0x8
 #define SDW_SHIM_SYNC			0xC
 
-#define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * x)
-#define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * x)
-#define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * x)
-#define SDW_SHIM_CTLS2CM(x)		(0x016 + 0x60 * x)
-#define SDW_SHIM_CTLS3CM(x)		(0x018 + 0x60 * x)
-#define SDW_SHIM_PCMSCAP(x)		(0x020 + 0x60 * x)
-
-#define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * x) + (0x2 * y))
-#define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * x) + (0x2 * y))
-#define SDW_SHIM_PDMSCAP(x)		(0x062 + 0x60 * x)
-#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * x)
-#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * x)
+#define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
+#define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * (x))
+#define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * (x))
+#define SDW_SHIM_CTLS2CM(x)		(0x016 + 0x60 * (x))
+#define SDW_SHIM_CTLS3CM(x)		(0x018 + 0x60 * (x))
+#define SDW_SHIM_PCMSCAP(x)		(0x020 + 0x60 * (x))
+
+#define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 * (y)))
+#define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * (x)) + (0x2 * (y)))
+#define SDW_SHIM_PDMSCAP(x)		(0x062 + 0x60 * (x))
+#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
+#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
 
 #define SDW_SHIM_WAKEEN			0x190
 #define SDW_SHIM_WAKESTS		0x192
@@ -82,7 +82,7 @@
 #define SDW_SHIM_WAKESTS_STATUS		BIT(0)
 
 /* Intel ALH Register definitions */
-#define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * x))
+#define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * (x)))
 
 #define SDW_ALH_STRMZCFG_DMAT_VAL	0x3
 #define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
