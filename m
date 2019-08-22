Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B014599FBC
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC69851;
	Thu, 22 Aug 2019 21:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC69851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501572;
	bh=GSf6UaJyqn2nFwTZCNomjr9eI4YWKRaCKag7D+HOwfE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/YBrxyVOG/h8MaPQbnJbP+Ti3JUBxF8tsU5uHqmWTvEAXLkmvmbp5m7D2DFAkfAH
	 1tU1OcFw9EqP6ccQQe2SaFIusVA8sDQss54nf9MwuKS5DEZ0CdfouycfqgsxzgSW53
	 THPHUijTWHpR5K0KyXPAKkGr+/Nj2PMmBagq1fLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5957F80766;
	Thu, 22 Aug 2019 21:06:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37240F806E8; Thu, 22 Aug 2019 21:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35157F8060D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35157F8060D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524437"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:09 +0200
Message-Id: <20190822190425.23001-20-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 19/35] ASoC: Intel: Skylake: Remove redundant
	W0 and W1 macros
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

The existing upling, downling and FW register size macros are
duplicates. Remove these and replace by global mailbox size macro - FW
register-area size is represented by SKL_FW_REGS_SIZE added in
precedding change.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c     |  5 +++--
 sound/soc/intel/skylake/cnl-sst-dsp.h |  6 ------
 sound/soc/intel/skylake/cnl-sst.c     | 10 +++++-----
 sound/soc/intel/skylake/skl-sst-dsp.h |  7 +------
 sound/soc/intel/skylake/skl-sst-ipc.c | 12 ++++++------
 sound/soc/intel/skylake/skl-sst.c     |  5 +++--
 6 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index 641d5cf4aeb1..fdd94711c3b4 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -566,8 +566,9 @@ int bxt_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->addr.sram0_base = BXT_ADSP_SRAM0_BASE;
 	sst->addr.sram1_base = BXT_ADSP_SRAM1_BASE;
 
-	sst_dsp_mailbox_init(sst, (BXT_ADSP_SRAM0_BASE + SKL_ADSP_W0_STAT_SZ),
-			SKL_ADSP_W0_UP_SZ, BXT_ADSP_SRAM1_BASE, SKL_ADSP_W1_SZ);
+	sst_dsp_mailbox_init(sst,
+		(BXT_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
+		BXT_ADSP_SRAM1_BASE, SKL_MAILBOX_SIZE);
 
 	ret = skl_ipc_init(dev, skl);
 	if (ret) {
diff --git a/sound/soc/intel/skylake/cnl-sst-dsp.h b/sound/soc/intel/skylake/cnl-sst-dsp.h
index 70da4f312f53..a465cc42b7e8 100644
--- a/sound/soc/intel/skylake/cnl-sst-dsp.h
+++ b/sound/soc/intel/skylake/cnl-sst-dsp.h
@@ -52,12 +52,6 @@ struct sst_generic_ipc;
 
 #define CNL_ADSP_MMIO_LEN		0x10000
 
-#define CNL_ADSP_W0_STAT_SZ		0x1000
-
-#define CNL_ADSP_W0_UP_SZ		0x1000
-
-#define CNL_ADSP_W1_SZ			0x1000
-
 #define CNL_FW_STS_MASK			0xf
 
 #define CNL_ADSPIC_IPC			0x1
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 64971966af38..d3da23e0ef05 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -390,8 +390,8 @@ static int cnl_ipc_init(struct device *dev, struct skl_dev *cnl)
 	ipc->dsp = cnl->dsp;
 	ipc->dev = dev;
 
-	ipc->tx_data_max_size = CNL_ADSP_W1_SZ;
-	ipc->rx_data_max_size = CNL_ADSP_W0_UP_SZ;
+	ipc->tx_data_max_size = SKL_MAILBOX_SIZE;
+	ipc->rx_data_max_size = SKL_MAILBOX_SIZE;
 
 	err = sst_ipc_init(ipc);
 	if (err)
@@ -443,9 +443,9 @@ int cnl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->addr.sram0_base = CNL_ADSP_SRAM0_BASE;
 	sst->addr.sram1_base = CNL_ADSP_SRAM1_BASE;
 
-	sst_dsp_mailbox_init(sst, (CNL_ADSP_SRAM0_BASE + CNL_ADSP_W0_STAT_SZ),
-			     CNL_ADSP_W0_UP_SZ, CNL_ADSP_SRAM1_BASE,
-			     CNL_ADSP_W1_SZ);
+	sst_dsp_mailbox_init(sst,
+		(CNL_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
+		CNL_ADSP_SRAM1_BASE, SKL_MAILBOX_SIZE);
 
 	ret = cnl_ipc_init(dev, cnl);
 	if (ret) {
diff --git a/sound/soc/intel/skylake/skl-sst-dsp.h b/sound/soc/intel/skylake/skl-sst-dsp.h
index 5a0cb7f3d57e..3c92b1d849e4 100644
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -57,12 +57,7 @@ struct skl_dev;
 
 #define SKL_ADSP_MMIO_LEN		0x10000
 
-#define SKL_ADSP_W0_STAT_SZ		0x1000
-
-#define SKL_ADSP_W0_UP_SZ		0x1000
-
-#define SKL_ADSP_W1_SZ			0x1000
-
+#define SKL_MAILBOX_SIZE		PAGE_SIZE
 #define SKL_FW_REGS_SIZE		PAGE_SIZE
 #define SKL_FW_STS_MASK			0xf
 
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 2700f882103d..72d7284d2fff 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -606,8 +606,8 @@ int skl_ipc_init(struct device *dev, struct skl_dev *skl)
 	ipc->dsp = skl->dsp;
 	ipc->dev = dev;
 
-	ipc->tx_data_max_size = SKL_ADSP_W1_SZ;
-	ipc->rx_data_max_size = SKL_ADSP_W0_UP_SZ;
+	ipc->tx_data_max_size = SKL_MAILBOX_SIZE;
+	ipc->rx_data_max_size = SKL_MAILBOX_SIZE;
 
 	err = sst_ipc_init(ipc);
 	if (err)
@@ -922,8 +922,8 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
 	sz_remaining = msg->param_data_size;
 	data_offset = 0;
 	while (sz_remaining != 0) {
-		tx_size = sz_remaining > SKL_ADSP_W1_SZ
-				? SKL_ADSP_W1_SZ : sz_remaining;
+		tx_size = sz_remaining > SKL_MAILBOX_SIZE
+				? SKL_MAILBOX_SIZE : sz_remaining;
 		if (tx_size == sz_remaining)
 			header.extension |= IPC_FINAL_BLOCK(1);
 
@@ -965,7 +965,7 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 	unsigned int *buf;
 	int ret;
 
-	reply.data = kzalloc(SKL_ADSP_W1_SZ, GFP_KERNEL);
+	reply.data = kzalloc(SKL_MAILBOX_SIZE, GFP_KERNEL);
 	if (!reply.data)
 		return -ENOMEM;
 
@@ -983,7 +983,7 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 	request.header = *(u64 *)&header;
 	request.data = *payload;
 	request.size = *bytes;
-	reply.size = SKL_ADSP_W1_SZ;
+	reply.size = SKL_MAILBOX_SIZE;
 
 	ret = sst_ipc_tx_message_wait(ipc, request, &reply);
 	if (ret < 0)
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 7e63c91cea54..191931578fd2 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -536,8 +536,9 @@ int skl_sst_dsp_init(struct device *dev, void __iomem *mmio_base, int irq,
 	sst->addr.sram0_base = SKL_ADSP_SRAM0_BASE;
 	sst->addr.sram1_base = SKL_ADSP_SRAM1_BASE;
 
-	sst_dsp_mailbox_init(sst, (SKL_ADSP_SRAM0_BASE + SKL_ADSP_W0_STAT_SZ),
-			SKL_ADSP_W0_UP_SZ, SKL_ADSP_SRAM1_BASE, SKL_ADSP_W1_SZ);
+	sst_dsp_mailbox_init(sst,
+		(SKL_ADSP_SRAM0_BASE + SKL_FW_REGS_SIZE), SKL_MAILBOX_SIZE,
+		SKL_ADSP_SRAM1_BASE, SKL_MAILBOX_SIZE);
 
 	ret = skl_ipc_init(dev, skl);
 	if (ret) {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
