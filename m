Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4E7FBC63
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 15:12:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA7AA4C;
	Tue, 28 Nov 2023 15:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA7AA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701180735;
	bh=9MkpWVNysXNk3uIfaWsXEhi4AO03kH01HPzxlIy9Zew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I5rAe9U0VHF7aNPya0Dr2KTTobvtd038cQFe55la9MKGFeSZQeiWiPMYntDe4+zFT
	 QSlrx4UMuyq9vQjkA/YirKpvfCXbqeFL7Pj8K+l5xzmwhxxW73m33afVtNsX6WbzXv
	 /IBCuRPN3baJwTeLtWeqJomCFUsOURzi1SzG3xKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EEFFF805A0; Tue, 28 Nov 2023 15:09:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0153F8077B;
	Tue, 28 Nov 2023 15:09:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E1CDF80688; Tue, 28 Nov 2023 15:08:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA326F805AE
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 15:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA326F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CxCVUB/8
Received: by mail.gandi.net (Postfix) with ESMTPA id 119BF60010;
	Tue, 28 Nov 2023 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701180511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zz1ZSWhesx2d8c0NZFELt4xynqYdE38OR15azgcLscQ=;
	b=CxCVUB/8kFinXWaDFzVyzOmSOhktqV1nsk8cs9JGZ5F0LPa+2icfWnnFD3GbAwzlZqMuih
	aAtB8O5ZMuR4Q9OLco5ALg4MaGG8/VWp+Jns0750e7s657DEWuNDtwtVw0hNXlcklyhn9m
	8TVi3uoG69fPGyoNO+0JZcMaNmfVNSVl1L++3j12RY9JfpUFHexpE6jJNaxzaO9Hl6NdYy
	nJhWlUezo6mF2yDJir362r9HIsE/LDNVcuzNopMf/e6xzq8L/jIB0ukeBrtVuyIYL5qYE2
	b7WCvD2UsxPh0Y0yj2jh5gqwdGMHPgV9Qf2+tUyWz19MY2Y6fhBieeE7fKAzWw==
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 09/17] soc: fsl: cpm1: qmc: Introduce qmc_chan_setup_tsa*
Date: Tue, 28 Nov 2023 15:08:08 +0100
Message-ID: <20231128140818.261541-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128140818.261541-1-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: UUZ6QNPYUQORKVAUFUKV5EBALXOQHTDV
X-Message-ID-Hash: UUZ6QNPYUQORKVAUFUKV5EBALXOQHTDV
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce the qmc_chan_setup_tsa* functions to setup entries related
to the given channel.
Use them during QMC channels setup.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 161 ++++++++++++++++++++++++++++++---------
 1 file changed, 125 insertions(+), 36 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index e3f2afb8fa4d..5d7e2ecdd933 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -240,6 +240,11 @@ static void qmc_clrbits16(void __iomem *addr, u16 clr)
 	qmc_write16(addr, qmc_read16(addr) & ~clr);
 }
 
+static void qmc_clrsetbits16(void __iomem *addr, u16 clr, u16 set)
+{
+	qmc_write16(addr, (qmc_read16(addr) & ~clr) | set);
+}
+
 static void qmc_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
@@ -562,6 +567,122 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 }
 
+static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+{
+	unsigned int i;
+	u16 curr;
+	u16 val;
+
+	/*
+	 * Use a common Tx/Rx 64 entries table.
+	 * Tx and Rx related stuffs must be identical
+	 */
+	if (chan->tx_ts_mask != chan->rx_ts_mask) {
+		dev_err(chan->qmc->dev, "chan %u uses different Rx and Tx TS\n", chan->id);
+		return -EINVAL;
+	}
+
+	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
+
+	/* Check entries based on Rx stuff*/
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		curr = qmc_read16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2));
+		if (curr & QMC_TSA_VALID && (curr & ~QMC_TSA_WRAP) != val) {
+			dev_err(chan->qmc->dev, "chan %u TxRx entry %d already used\n",
+				chan->id, i);
+			return -EBUSY;
+		}
+	}
+
+	/* Set entries based on Rx stuff*/
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
+				 ~QMC_TSA_WRAP, val);
+	}
+
+	return 0;
+}
+
+static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+{
+	unsigned int i;
+	u16 curr;
+	u16 val;
+
+	/* Use a Tx 32 entries table and a Rx 32 entries table */
+
+	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
+
+	/* Check entries based on Rx stuff */
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		curr = qmc_read16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2));
+		if (curr & QMC_TSA_VALID && (curr & ~QMC_TSA_WRAP) != val) {
+			dev_err(chan->qmc->dev, "chan %u Rx entry %d already used\n",
+				chan->id, i);
+			return -EBUSY;
+		}
+	}
+	/* Check entries based on Tx stuff */
+	for (i = 0; i < info->nb_tx_ts; i++) {
+		if (!(chan->tx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		curr = qmc_read16(chan->qmc->scc_pram + QMC_GBL_TSATTX + (i * 2));
+		if (curr & QMC_TSA_VALID && (curr & ~QMC_TSA_WRAP) != val) {
+			dev_err(chan->qmc->dev, "chan %u Tx entry %d already used\n",
+				chan->id, i);
+			return -EBUSY;
+		}
+	}
+
+	/* Set entries based on Rx stuff */
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
+				 ~QMC_TSA_WRAP, val);
+	}
+	/* Set entries based on Tx stuff */
+	for (i = 0; i < info->nb_tx_ts; i++) {
+		if (!(chan->tx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATTX + (i * 2),
+				 ~QMC_TSA_WRAP, val);
+	}
+
+	return 0;
+}
+
+static int qmc_chan_setup_tsa(struct qmc_chan *chan)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/*
+	 * Setup one common 64 entries table or two 32 entries (one for Tx
+	 * and one for Tx) according to assigned TS numbers.
+	 */
+	return ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) ?
+		qmc_chan_setup_tsa_64rxtx(chan, &info) :
+		qmc_chan_setup_tsa_32rx_32tx(chan, &info);
+}
+
 static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
 {
 	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
@@ -921,7 +1042,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 
 static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
-	struct qmc_chan *chan;
 	unsigned int i;
 	u16 val;
 
@@ -935,18 +1055,6 @@ static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *in
 	for (i = 0; i < 64; i++)
 		qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), 0x0000);
 
-	/* Set entries based on Rx stuff*/
-	list_for_each_entry(chan, &qmc->chan_head, list) {
-		for (i = 0; i < info->nb_rx_ts; i++) {
-			if (!(chan->rx_ts_mask & (((u64)1) << i)))
-				continue;
-
-			val = QMC_TSA_VALID | QMC_TSA_MASK |
-			      QMC_TSA_CHANNEL(chan->id);
-			qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), val);
-		}
-	}
-
 	/* Set Wrap bit on last entry */
 	qmc_setbits16(qmc->scc_pram + QMC_GBL_TSATRX + ((info->nb_rx_ts - 1) * 2),
 		      QMC_TSA_WRAP);
@@ -963,7 +1071,6 @@ static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *in
 
 static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
-	struct qmc_chan *chan;
 	unsigned int i;
 	u16 val;
 
@@ -978,28 +1085,6 @@ static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info
 		qmc_write16(qmc->scc_pram + QMC_GBL_TSATTX + (i * 2), 0x0000);
 	}
 
-	/* Set entries based on Rx and Tx stuff*/
-	list_for_each_entry(chan, &qmc->chan_head, list) {
-		/* Rx part */
-		for (i = 0; i < info->nb_rx_ts; i++) {
-			if (!(chan->rx_ts_mask & (((u64)1) << i)))
-				continue;
-
-			val = QMC_TSA_VALID | QMC_TSA_MASK |
-			      QMC_TSA_CHANNEL(chan->id);
-			qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), val);
-		}
-		/* Tx part */
-		for (i = 0; i < info->nb_tx_ts; i++) {
-			if (!(chan->tx_ts_mask & (((u64)1) << i)))
-				continue;
-
-			val = QMC_TSA_VALID | QMC_TSA_MASK |
-			      QMC_TSA_CHANNEL(chan->id);
-			qmc_write16(qmc->scc_pram + QMC_GBL_TSATTX + (i * 2), val);
-		}
-	}
-
 	/* Set Wrap bit on last entries */
 	qmc_setbits16(qmc->scc_pram + QMC_GBL_TSATRX + ((info->nb_rx_ts - 1) * 2),
 		      QMC_TSA_WRAP);
@@ -1081,6 +1166,10 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	chan->qmc = qmc;
 
+	ret = qmc_chan_setup_tsa(chan);
+	if (ret)
+		return ret;
+
 	/* Set channel specific parameter base address */
 	chan->s_param = qmc->dpram + (chan->id * 64);
 	/* 16 bd per channel (8 rx and 8 tx) */
-- 
2.42.0

