Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5169760F1E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1652DEF2;
	Tue, 25 Jul 2023 11:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1652DEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690277377;
	bh=wuFcY3VD6XPSDq2WFucXvE3SQkupTyA0eDJRriLcm3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qG/ESsOMm5ndPuMAg0wAq82P8Cpjc2BD3lNBwXRbDMAjIwdErxj52mDc1vaAQfGnC
	 NNJf0lhNXfkw1Egy5uzpEWvVeMboYmermtDMXYwMUZN3DfZliQ4be2bxfoOHOqF/bx
	 mWQCLwV9pLziACZsc13O33nLdJ+NGJQAhy3Ep0WU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BB89F8060A; Tue, 25 Jul 2023 11:25:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D9EF80607;
	Tue, 25 Jul 2023 11:25:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A53FAF805FB; Tue, 25 Jul 2023 11:25:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D005F805E8
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D005F805E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Arr4B1OD
Received: by mail.gandi.net (Postfix) with ESMTPA id B27334000C;
	Tue, 25 Jul 2023 09:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690277134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+R+GTumz5qYOmYomZ46g92lb+8mxRs70UbJ/9psqII=;
	b=Arr4B1ODQraTz314IedecEdkYovPd/wZulnVFH/cw4RJpub7m84vUhtTBPgidgOZUh94dC
	e3LMsfdkAJlltonYMX8Et032vhOKm1wJ9f6+m2UMqE3gcB7RTOMw/eYiGsNLuW6m3ocFSv
	fVc+qy2ZtdITu9ogkfYWzc2wXplPVwi7RriAwX3SLAvBDneb6LojK+NiZ+TrpAoKVxQYuo
	xGHxHGocO3l4XcwMU7Mg1CqD1mG09X5iylGuwo3xMZrTUY2mF/SESKU/BsCbkFX0A1hA0k
	MJCcbYbz386gfI0zeP8vyEBGo0Gf/3h3RmBPBS84UC1PhF1EJkogCg8k4/2NGg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 14/26] soc: fsl: cpm1: qmc: Handle timeslot entries at channel
 start() and stop()
Date: Tue, 25 Jul 2023 11:23:50 +0200
Message-ID: <20230725092417.43706-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725092417.43706-1-herve.codina@bootlin.com>
References: <20230725092417.43706-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: T2YYDEQYVPVG7P5Z7TSY4KHTYH2H37PM
X-Message-ID-Hash: T2YYDEQYVPVG7P5Z7TSY4KHTYH2H37PM
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2YYDEQYVPVG7P5Z7TSY4KHTYH2H37PM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to support runtime timeslot route changes, enable the
channel timeslot entries at channel start() and disable them at
channel stop().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 175 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 163 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 64c3bfc16010..6d1cd203abd2 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -177,6 +177,7 @@ struct qmc_chan {
 	struct qmc *qmc;
 	void *__iomem s_param;
 	enum qmc_mode mode;
+	spinlock_t	ts_lock; /* Protect timeslots */
 	u64	tx_ts_mask_avail;
 	u64	tx_ts_mask;
 	u64	rx_ts_mask_avail;
@@ -265,6 +266,7 @@ static inline void qmc_setbits32(void *__iomem addr, u32 set)
 int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 {
 	struct tsa_serial_info tsa_info;
+	unsigned long flags;
 	int ret;
 
 	/* Retrieve info from the TSA related serial */
@@ -272,6 +274,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 	if (ret)
 		return ret;
 
+	spin_lock_irqsave(&chan->ts_lock, flags);
+
 	info->mode = chan->mode;
 	info->rx_fs_rate = tsa_info.rx_fs_rate;
 	info->rx_bit_rate = tsa_info.rx_bit_rate;
@@ -280,6 +284,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 	info->tx_bit_rate = tsa_info.tx_bit_rate;
 	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
 
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+
 	return 0;
 }
 EXPORT_SYMBOL(qmc_chan_get_info);
@@ -683,6 +689,40 @@ static int qmc_chan_setup_tsa_32tx(struct qmc_chan *chan, const struct tsa_seria
 	return 0;
 }
 
+static int qmc_chan_setup_tsa_tx(struct qmc_chan *chan, bool enable)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/* Setup entries */
+	if (chan->qmc->is_tsa_64rxtx)
+		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
+
+	return qmc_chan_setup_tsa_32tx(chan, &info, enable);
+}
+
+static int qmc_chan_setup_tsa_rx(struct qmc_chan *chan, bool enable)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/* Setup entries */
+	if (chan->qmc->is_tsa_64rxtx)
+		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
+
+	return qmc_chan_setup_tsa_32rx(chan, &info, enable);
+}
+
 static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
 {
 	struct tsa_serial_info info;
@@ -719,6 +759,12 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
 
+	if (chan->is_rx_stopped) {
+		/* The channel is already stopped -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
 	/* Send STOP RECEIVE command */
 	ret = qmc_chan_command(chan, 0x0);
 	if (ret) {
@@ -729,6 +775,15 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
 
 	chan->is_rx_stopped = true;
 
+	if (!chan->qmc->is_tsa_64rxtx || chan->is_tx_stopped) {
+		ret = qmc_chan_setup_tsa_rx(chan, false);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: Disable tsa entries failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
+	}
+
 end:
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 	return ret;
@@ -741,6 +796,12 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
 
+	if (chan->is_tx_stopped) {
+		/* The channel is already stopped -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
 	/* Send STOP TRANSMIT command */
 	ret = qmc_chan_command(chan, 0x1);
 	if (ret) {
@@ -751,37 +812,82 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
 
 	chan->is_tx_stopped = true;
 
+	if (!chan->qmc->is_tsa_64rxtx || chan->is_rx_stopped) {
+		ret = qmc_chan_setup_tsa_tx(chan, false);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: Disable tsa entries failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
+	}
+
 end:
 	spin_unlock_irqrestore(&chan->tx_lock, flags);
 	return ret;
 }
 
+static int qmc_chan_start_rx(struct qmc_chan *chan);
+
 int qmc_chan_stop(struct qmc_chan *chan, int direction)
 {
-	int ret;
+	bool is_rx_rollback_needed = false;
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&chan->ts_lock, flags);
 
 	if (direction & QMC_CHAN_READ) {
+		is_rx_rollback_needed = !chan->is_rx_stopped;
 		ret = qmc_chan_stop_rx(chan);
 		if (ret)
-			return ret;
+			goto end;
 	}
 
 	if (direction & QMC_CHAN_WRITE) {
 		ret = qmc_chan_stop_tx(chan);
-		if (ret)
-			return ret;
+		if (ret) {
+			/* Restart rx if needed */
+			if (is_rx_rollback_needed)
+				qmc_chan_start_rx(chan);
+			goto end;
+		}
 	}
 
-	return 0;
+end:
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+	return ret;
 }
 EXPORT_SYMBOL(qmc_chan_stop);
 
-static void qmc_chan_start_rx(struct qmc_chan *chan)
+static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan);
+
+static int qmc_chan_start_rx(struct qmc_chan *chan)
 {
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
 
+	if (!chan->is_rx_stopped) {
+		/* The channel is already started -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
+	ret = qmc_chan_setup_tsa_rx(chan, true);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Enable tsa entries failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
 	/* Restart the receiver */
 	if (chan->mode == QMC_TRANSPARENT)
 		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
@@ -792,15 +898,38 @@ static void qmc_chan_start_rx(struct qmc_chan *chan)
 
 	chan->is_rx_stopped = false;
 
+end:
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
+	return ret;
 }
 
-static void qmc_chan_start_tx(struct qmc_chan *chan)
+static int qmc_chan_start_tx(struct qmc_chan *chan)
 {
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
 
+	if (!chan->is_tx_stopped) {
+		/* The channel is already started -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
+	ret = qmc_chan_setup_tsa_tx(chan, true);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Enable tsa entries failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
 	/*
 	 * Enable channel transmitter as it could be disabled if
 	 * qmc_chan_reset() was called.
@@ -812,18 +941,39 @@ static void qmc_chan_start_tx(struct qmc_chan *chan)
 
 	chan->is_tx_stopped = false;
 
+end:
 	spin_unlock_irqrestore(&chan->tx_lock, flags);
+	return ret;
 }
 
 int qmc_chan_start(struct qmc_chan *chan, int direction)
 {
-	if (direction & QMC_CHAN_READ)
-		qmc_chan_start_rx(chan);
+	bool is_rx_rollback_needed = false;
+	unsigned long flags;
+	int ret = 0;
 
-	if (direction & QMC_CHAN_WRITE)
-		qmc_chan_start_tx(chan);
+	spin_lock_irqsave(&chan->ts_lock, flags);
 
-	return 0;
+	if (direction & QMC_CHAN_READ) {
+		is_rx_rollback_needed = chan->is_rx_stopped;
+		ret = qmc_chan_start_rx(chan);
+		if (ret)
+			goto end;
+	}
+
+	if (direction & QMC_CHAN_WRITE) {
+		ret = qmc_chan_start_tx(chan);
+		if (ret) {
+			/* Restop rx if needed */
+			if (is_rx_rollback_needed)
+				qmc_chan_stop_rx(chan);
+			goto end;
+		}
+	}
+
+end:
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+	return ret;
 }
 EXPORT_SYMBOL(qmc_chan_start);
 
@@ -992,6 +1142,7 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		}
 
 		chan->id = chan_id;
+		spin_lock_init(&chan->ts_lock);
 		spin_lock_init(&chan->rx_lock);
 		spin_lock_init(&chan->tx_lock);
 
-- 
2.41.0

