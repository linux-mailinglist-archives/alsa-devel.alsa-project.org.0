Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB97760F8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 15:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9B1828;
	Wed,  9 Aug 2023 15:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9B1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691587867;
	bh=8oXgrLbfuXmHuoDhOqGjIVZVwhUzYSWut4RflP+yhR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AHRoWD0gTYaQT9kE71aczPLq1IPJT44M91dWhLFG1kNEMSczUzo8UhJ+kLBM0pLn/
	 /dEPVzbkhct25ELqOmFp4zThJa+KI20h0x11eJXJPAY1tGhPk5jUzqOuCp+p6W9icr
	 s45QKeGidZgNpM7g5a470+aE8m2l6elHmXSHk8q4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EC38F805D8; Wed,  9 Aug 2023 15:28:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35644F805D3;
	Wed,  9 Aug 2023 15:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60103F8057A; Wed,  9 Aug 2023 15:28:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EF2BF80551
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 15:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF2BF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FPe4Sm5J
Received: by mail.gandi.net (Postfix) with ESMTPA id DE80D40005;
	Wed,  9 Aug 2023 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691587707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=34x90YsndQHjiMtkYLuUo6cQmXNJdgMPBORbQdQ2044=;
	b=FPe4Sm5JvM5qHTxhKVStMje3aq/RhVqu/h82q71c5NFEVf11KsCRlZs3QjyFTbLsfJfPzF
	nCX52n0QfnO4d92X9wqEh/umkFknISp0fwP8xqw/iNnHDJv8Xf/Nk6IT5vHQgJawFOtapJ
	onSb1tIERuWYdcxaUNjrlcpy1MwaNUQN3Cg5EdWGPF4Y5uLPhgvldbPVGAOsEeOiI9uuit
	c0NlN/NgWASGSweCuDemQC6vYYQ0wegz14x01GLlLZ5k+fTnKKIoY0EDAG2qnsjon4O9fx
	3YYGQLfCPLqtYhAdtRoZQQX6jeFsrAjoSHcvRgHtV8imQyS6Qovp0Mv4gnAoKA==
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 10/28] soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to
 qmc_init_tsa*
Date: Wed,  9 Aug 2023 15:27:37 +0200
Message-ID: <20230809132757.2470544-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809132757.2470544-1-herve.codina@bootlin.com>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: Q6N4365SIPTEXGTHXWKWEG6AAIOMGB37
X-Message-ID-Hash: Q6N4365SIPTEXGTHXWKWEG6AAIOMGB37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6N4365SIPTEXGTHXWKWEG6AAIOMGB37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

qmc_setup_tsa* are called once at initialisation.
They initialize the QMC TSA table.
In order to introduce setup function later on for dynamic timeslots
management, rename the function to avoid later confusion.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 1bc2af58e829..261958e3199f 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -919,7 +919,7 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 	return qmc_check_chans(qmc);
 }
 
-static int qmc_setup_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *info)
+static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
 	struct qmc_chan *chan;
 	unsigned int i;
@@ -961,7 +961,7 @@ static int qmc_setup_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *i
 	return 0;
 }
 
-static int qmc_setup_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info *info)
+static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
 	struct qmc_chan *chan;
 	unsigned int i;
@@ -1019,7 +1019,7 @@ static int qmc_setup_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info
 	return 0;
 }
 
-static int qmc_setup_tsa(struct qmc *qmc)
+static int qmc_init_tsa(struct qmc *qmc)
 {
 	struct tsa_serial_info info;
 	int ret;
@@ -1030,12 +1030,12 @@ static int qmc_setup_tsa(struct qmc *qmc)
 		return ret;
 
 	/*
-	 * Setup one common 64 entries table or two 32 entries (one for Tx and
-	 * one for Tx) according to assigned TS numbers.
+	 * Initialize one common 64 entries table or two 32 entries (one for Tx
+	 * and one for Tx) according to assigned TS numbers.
 	 */
 	return ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) ?
-		qmc_setup_tsa_64rxtx(qmc, &info) :
-		qmc_setup_tsa_32rx_32tx(qmc, &info);
+		qmc_init_tsa_64rxtx(qmc, &info) :
+		qmc_init_tsa_32rx_32tx(qmc, &info);
 }
 
 static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
@@ -1391,7 +1391,7 @@ static int qmc_probe(struct platform_device *pdev)
 	qmc_write32(qmc->scc_pram + QMC_GBL_C_MASK32, 0xDEBB20E3);
 	qmc_write16(qmc->scc_pram + QMC_GBL_C_MASK16, 0xF0B8);
 
-	ret = qmc_setup_tsa(qmc);
+	ret = qmc_init_tsa(qmc);
 	if (ret)
 		goto err_tsa_serial_disconnect;
 
-- 
2.41.0

