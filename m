Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A89B7FBC49
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 15:10:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4B8E75;
	Tue, 28 Nov 2023 15:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4B8E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701180632;
	bh=9Nyu7ROa79DJ3LulSYZfUuWNslyuFbC5Qp8HxCFXAcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g4RRP8o2Z0LofwhpuSblEla59tI+9nCvrQf5lTHf/aM+75vJbAwi1ff6gXdp+J1lh
	 4OOynjlWuPcO21Fa+tcM3PYCRO7uPDt/3zw+edkcZjfDkBHrDIpC6/WRn5qlRcreij
	 PG75P+ADt63cSZcPF3ZPdLRJDhmxjb5eZEMwFlw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A452F8067E; Tue, 28 Nov 2023 15:08:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A866F8067D;
	Tue, 28 Nov 2023 15:08:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A07AFF805C2; Tue, 28 Nov 2023 15:08:43 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4975EF80246
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 15:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4975EF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SzXb9TkY
Received: by mail.gandi.net (Postfix) with ESMTPA id 2FC336000A;
	Tue, 28 Nov 2023 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701180510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJosuVS67B3SR/85nZ6Wx85Kw09CqGjLv+oPzD8Rn2U=;
	b=SzXb9TkYchl0rTqkA3UtYkw9S5Q63KYUYtkv5muVcQhY2Mpmbp8AnNpltvyuXQk2SbD68s
	2ah8fH3AJ16Xepf4+iflodsNaMjSCN+rJSVyTA5X6RDtdHdFdEZHQg6XSBAZUOKhFOGRNJ
	qAw5orshx7JWBNbHrJuVFBQOe9GQxBmZyN1T6O876SbXJZEwxxwWEB5dB2I7Uj2wwOipQC
	aVXtQb0If9te8ku9Ge+q9aszV1h813xL1ijHyv+AnY5vI03RW2nWDivkE47IJ4guK/ZRhr
	W7rYGAb+mLqFnujI3aXdI+d6XsmJ1srK4ECpTfAw2UyjD8Rv/1r71VKdJsztjg==
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
Subject: [PATCH 07/17] soc: fsl: cpm1: qmc: Introduce available timeslots
 masks
Date: Tue, 28 Nov 2023 15:08:06 +0100
Message-ID: <20231128140818.261541-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128140818.261541-1-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: OXDDVY4ETAX3JQAPRAP6PKD2GIZZXWPM
X-Message-ID-Hash: OXDDVY4ETAX3JQAPRAP6PKD2GIZZXWPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXDDVY4ETAX3JQAPRAP6PKD2GIZZXWPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Available timeslots masks define timeslots available for the related
channel. These timeslots are defined by the QMC binding.

Timeslots used are initialized to available timeslots but can be a
subset of available timeslots.
This prepares the dynamic timeslots management (ie. changing timeslots
at runtime).

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index e716f13669a0..0413e25d4c67 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -177,7 +177,9 @@ struct qmc_chan {
 	struct qmc *qmc;
 	void __iomem *s_param;
 	enum qmc_mode mode;
+	u64	tx_ts_mask_avail;
 	u64	tx_ts_mask;
+	u64	rx_ts_mask_avail;
 	u64	rx_ts_mask;
 	bool is_reverse_data;
 
@@ -875,7 +877,8 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 			of_node_put(chan_np);
 			return ret;
 		}
-		chan->tx_ts_mask = ts_mask;
+		chan->tx_ts_mask_avail = ts_mask;
+		chan->tx_ts_mask = chan->tx_ts_mask_avail;
 
 		ret = of_property_read_u64(chan_np, "fsl,rx-ts-mask", &ts_mask);
 		if (ret) {
@@ -884,7 +887,8 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 			of_node_put(chan_np);
 			return ret;
 		}
-		chan->rx_ts_mask = ts_mask;
+		chan->rx_ts_mask_avail = ts_mask;
+		chan->rx_ts_mask = chan->rx_ts_mask_avail;
 
 		mode = "transparent";
 		ret = of_property_read_string(chan_np, "fsl,operational-mode", &mode);
-- 
2.42.0

