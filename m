Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8C77FBC70
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 15:13:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59CD482C;
	Tue, 28 Nov 2023 15:13:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59CD482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701180810;
	bh=sci+yFO8o9XZ6Xcp7DmRE+wxi9TaqsCyLYQbqWydl/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bTNvU5GjNZIblBoJMZ1JgJ7EEfoC8oxOZxrh/NgPJdiFha5ednUR9Xd0MOGXWL/v6
	 XOggB34Tam0d/Kz0yz7g+MzF2VBpDnWq7i5k4Wz/BmyYACx6ghP/6Wblnd1tPhPnvY
	 8eyX+j7rjftasryGEtSJPldrDkKFlA6a3aI53Kx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AE75F80C7B; Tue, 28 Nov 2023 15:09:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42F40F80CB9;
	Tue, 28 Nov 2023 15:09:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81D20F8075A; Tue, 28 Nov 2023 15:09:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0B02F80609
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 15:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0B02F80609
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ed6RUCNm
Received: by mail.gandi.net (Postfix) with ESMTPA id D33656000B;
	Tue, 28 Nov 2023 14:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701180519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qB5PQIsjg4vNdEztMunF8K802tA8yt3Tver1m2WVF68=;
	b=ed6RUCNm7a7brdsSg9wc5Qc1Y1ptEjdyXGcpjOjS8tt9TPY7J1Zm00ocuG+1r+Aj5mjkLn
	8k01XwTM9iM8kgXPBgG1oz/1iVQ95LdYUxkaogcDe9qI5yKtssOfA9kKjrqAZAb4O7wQUD
	d1/mkVaUE0N5ZxrRG6OVDlgG2LwKZzKGA2y4pRXUNSq8llJqTSES3uPQkp433T9LVyWsjc
	Mze/Z6YlVrBgq4G8ipe32F4IIGbwoh4ZVRJRRr9/HS9N/iaJHiTxmiZ7X41sKgOJIlTxoe
	ZclZCzDritqoGY6QeqQcz/8FN3HJ1XBCIVJJBopoz1wMS7igDPecTgua1Bdg5A==
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
Subject: [PATCH 17/17] soc: fsl: cpm1: qmc: Introduce functions to change
 timeslots at runtime
Date: Tue, 28 Nov 2023 15:08:16 +0100
Message-ID: <20231128140818.261541-18-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128140818.261541-1-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: MERDCCRDDPSVWMBB5YR4CHZCT4KYGVOD
X-Message-ID-Hash: MERDCCRDDPSVWMBB5YR4CHZCT4KYGVOD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MERDCCRDDPSVWMBB5YR4CHZCT4KYGVOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce qmc_chan_{get,set}_ts_info() function to allow timeslots
modification at runtime.

The modification is provided using qmc_chan_set_ts_info() and will be
applied on next qmc_chan_start().
qmc_chan_set_ts_info() must be called with the channel rx and/or tx
stopped.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 51 ++++++++++++++++++++++++++++++++++++++++
 include/soc/fsl/qe/qmc.h | 10 ++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 73903ce31695..79fe79b9464f 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -290,6 +290,57 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 }
 EXPORT_SYMBOL(qmc_chan_get_info);
 
+int qmc_chan_get_ts_info(struct qmc_chan *chan, struct qmc_chan_ts_info *ts_info)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->ts_lock, flags);
+
+	ts_info->rx_ts_mask_avail = chan->rx_ts_mask_avail;
+	ts_info->tx_ts_mask_avail = chan->tx_ts_mask_avail;
+	ts_info->rx_ts_mask = chan->rx_ts_mask;
+	ts_info->tx_ts_mask = chan->tx_ts_mask;
+
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(qmc_chan_get_ts_info);
+
+int qmc_chan_set_ts_info(struct qmc_chan *chan, const struct qmc_chan_ts_info *ts_info)
+{
+	unsigned long flags;
+	int ret;
+
+	/* Only a subset of available timeslots is allowed */
+	if ((ts_info->rx_ts_mask & chan->rx_ts_mask_avail) != ts_info->rx_ts_mask)
+		return -EINVAL;
+	if ((ts_info->tx_ts_mask & chan->tx_ts_mask_avail) != ts_info->tx_ts_mask)
+		return -EINVAL;
+
+	/* In case of common rx/tx table, rx/tx masks must be identical */
+	if (chan->qmc->is_tsa_64rxtx) {
+		if (ts_info->rx_ts_mask != ts_info->tx_ts_mask)
+			return -EINVAL;
+	}
+
+	spin_lock_irqsave(&chan->ts_lock, flags);
+
+	if ((chan->tx_ts_mask != ts_info->tx_ts_mask && !chan->is_tx_stopped) ||
+	    (chan->rx_ts_mask != ts_info->rx_ts_mask && !chan->is_rx_stopped)) {
+		dev_err(chan->qmc->dev, "Channel rx and/or tx not stopped\n");
+		ret = -EBUSY;
+	} else {
+		chan->tx_ts_mask = ts_info->tx_ts_mask;
+		chan->rx_ts_mask = ts_info->rx_ts_mask;
+		ret = 0;
+	}
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(qmc_chan_set_ts_info);
+
 int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param)
 {
 	if (param->mode != chan->mode)
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 166484bb4294..2a333fc1ea81 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -40,6 +40,16 @@ struct qmc_chan_info {
 
 int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info);
 
+struct qmc_chan_ts_info {
+	u64 rx_ts_mask_avail;
+	u64 tx_ts_mask_avail;
+	u64 rx_ts_mask;
+	u64 tx_ts_mask;
+};
+
+int qmc_chan_get_ts_info(struct qmc_chan *chan, struct qmc_chan_ts_info *ts_info);
+int qmc_chan_set_ts_info(struct qmc_chan *chan, const struct qmc_chan_ts_info *ts_info);
+
 struct qmc_chan_param {
 	enum qmc_mode mode;
 	union {
-- 
2.42.0

