Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5B80586B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 16:22:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC05E0D;
	Tue,  5 Dec 2023 16:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC05E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701789748;
	bh=+gxUCbKhHi1k9vzOs+nZ5DmTzSru3Y+rInUAtgzYBRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ym8Rf1cszhc3/SnKA0aAK1mEj6Cm+WxqcLr0UWy5uqqnEryQ/c7a7LZX+qDXdg5PP
	 aCzRdcE3CqWAH/yf7yQf+dHnVtGHIdqNgliAEJVJ1LVXwmJst5Pb0N20VZUxlo72rg
	 16lRwjPrjG89NK8xYal2+67Cz74VxtWy/mYkdmuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 173B7F805BE; Tue,  5 Dec 2023 16:21:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9331BF805B6;
	Tue,  5 Dec 2023 16:21:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0488F80564; Tue,  5 Dec 2023 16:21:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48B9CF8024E
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 16:21:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B9CF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QfHYP7YA
Received: by mail.gandi.net (Postfix) with ESMTPA id 49D614000D;
	Tue,  5 Dec 2023 15:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lu03dEE+d4O3eVLkV3wm5Z7ZRpmxelDisaYnU0Q3dCo=;
	b=QfHYP7YAsbfIrnfYD+YYv5ttYiAL9xfCYIBW+yUepDsvEeHnnyd+5Tbqh+vCjxQNLNYMnl
	MyZjFaaQOwg/7RH9zcYAJlzBdkIEstrXKURDTLPe3FlJOMO38uj9daX1/svStUi1d53rLy
	SI0GD61JdB8mfRBeXnurjR5mzW94TmarXkiexSQ+hNqGqgurMoZAZ1qWnyedRABe9AIt5W
	ExiwptsqJEOMnhH+XFE1K2wFKtuP2rRlTPPLSuzzOp9X1teiz9qBt1xJrGriGaKv0iu6em
	qf8r5iICCk8PSthz/YfGhxC3Uz1ziIKDvmhMlXP3x//qSXXrt1Wo0VcNfq6tlg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 02/17] soc: fsl: cpm1: qmc: Fix __iomem addresses
 declaration
Date: Tue,  5 Dec 2023 16:20:59 +0100
Message-ID: <20231205152116.122512-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205152116.122512-1-herve.codina@bootlin.com>
References: <20231205152116.122512-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: EHGS7CMV5XSFOSVKLLV4CLEKRGMPSLPT
X-Message-ID-Hash: EHGS7CMV5XSFOSVKLLV4CLEKRGMPSLPT
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHGS7CMV5XSFOSVKLLV4CLEKRGMPSLPT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Running sparse (make C=1) on qmc.c raises a lot of warning such as:
  ...
  warning: incorrect type in assignment (different address spaces)
     expected struct cpm_buf_desc [usertype] *[noderef] __iomem bd
     got struct cpm_buf_desc [noderef] [usertype] __iomem *txbd_free
  ...

Indeed, some variable were declared 'type *__iomem var' instead of
'type __iomem *var'.

Use the correct declaration to remove these warnings.

Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 92ec76c03965..3f3de1351c96 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -175,7 +175,7 @@ struct qmc_chan {
 	struct list_head list;
 	unsigned int id;
 	struct qmc *qmc;
-	void *__iomem s_param;
+	void __iomem *s_param;
 	enum qmc_mode mode;
 	u64	tx_ts_mask;
 	u64	rx_ts_mask;
@@ -203,9 +203,9 @@ struct qmc_chan {
 struct qmc {
 	struct device *dev;
 	struct tsa_serial *tsa_serial;
-	void *__iomem scc_regs;
-	void *__iomem scc_pram;
-	void *__iomem dpram;
+	void __iomem *scc_regs;
+	void __iomem *scc_pram;
+	void __iomem *dpram;
 	u16 scc_pram_offset;
 	cbd_t __iomem *bd_table;
 	dma_addr_t bd_dma_addr;
@@ -218,37 +218,37 @@ struct qmc {
 	struct qmc_chan *chans[64];
 };
 
-static inline void qmc_write16(void *__iomem addr, u16 val)
+static inline void qmc_write16(void __iomem *addr, u16 val)
 {
 	iowrite16be(val, addr);
 }
 
-static inline u16 qmc_read16(void *__iomem addr)
+static inline u16 qmc_read16(void __iomem *addr)
 {
 	return ioread16be(addr);
 }
 
-static inline void qmc_setbits16(void *__iomem addr, u16 set)
+static inline void qmc_setbits16(void __iomem *addr, u16 set)
 {
 	qmc_write16(addr, qmc_read16(addr) | set);
 }
 
-static inline void qmc_clrbits16(void *__iomem addr, u16 clr)
+static inline void qmc_clrbits16(void __iomem *addr, u16 clr)
 {
 	qmc_write16(addr, qmc_read16(addr) & ~clr);
 }
 
-static inline void qmc_write32(void *__iomem addr, u32 val)
+static inline void qmc_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
 }
 
-static inline u32 qmc_read32(void *__iomem addr)
+static inline u32 qmc_read32(void __iomem *addr)
 {
 	return ioread32be(addr);
 }
 
-static inline void qmc_setbits32(void *__iomem addr, u32 set)
+static inline void qmc_setbits32(void __iomem *addr, u32 set)
 {
 	qmc_write32(addr, qmc_read32(addr) | set);
 }
@@ -318,7 +318,7 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 	int ret;
 
@@ -374,7 +374,7 @@ static void qmc_chan_write_done(struct qmc_chan *chan)
 	void (*complete)(void *context);
 	unsigned long flags;
 	void *context;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 
 	/*
@@ -425,7 +425,7 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 	int ret;
 
@@ -488,7 +488,7 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 	void (*complete)(void *context, size_t size);
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	void *context;
 	u16 datalen;
 	u16 ctrl;
@@ -663,7 +663,7 @@ static void qmc_chan_reset_rx(struct qmc_chan *chan)
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
@@ -694,7 +694,7 @@ static void qmc_chan_reset_tx(struct qmc_chan *chan)
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
-	cbd_t *__iomem bd;
+	cbd_t __iomem *bd;
 	u16 ctrl;
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
-- 
2.43.0

