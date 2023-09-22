Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48757AAB6B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 10:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0920DF0;
	Fri, 22 Sep 2023 10:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0920DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695369868;
	bh=fSTDixOXC7lW4cZiLjI1z6bcmGZrjvdoUNd1MUhgAR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NP69ZtsW1wb+Jz7I8dme25rS83u9QwNEjik5waoX/aGHT+Y6XcaKwq9e4h6HO9xVM
	 VGugZA0aM88bIeI6DJCbC0+cDp5mwX5Z/dEhKkbEIEzDVaYxxME4+3+0cG+KgB1jT0
	 Re42hARL3tDY77FVh4wWYU5t8vqzMbIKeJkadPHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AFA5F8060D; Fri, 22 Sep 2023 10:00:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D84F80614;
	Fri, 22 Sep 2023 10:00:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10C5F8060D; Fri, 22 Sep 2023 10:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34FE0F80602
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 10:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FE0F80602
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YY8q3tbT
Received: by mail.gandi.net (Postfix) with ESMTPA id 939351BF217;
	Fri, 22 Sep 2023 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695369613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzUuWhRDgVHjZPWx1zQHs1eer0WBNpuWBkiimoMaxFw=;
	b=YY8q3tbTHusqkO5Tp7dhqdsPMLPnOU/CGtlgBnGKt7BLxihHk7BFPZEJkUGSY+netSE+6A
	UlpnZmr9ULw1WPoe4J7BynlYgQqotb0TP4JvDtP/VGLVkKD5d/1tTYq4+9RMqx7tPGYwV3
	o1/Ya6QbHm99t0ToUm9VYiFfCbHxaI3rkyXOm9jw+Qh0q9BRMW10TjS0Zor//bgY/plwlm
	b+742DlV5QEJ8VgrP/ljdklFzuTuPKcyJr1ByhtZzEI2Co5N4KvHYUevXdk9IHIpTLK8ph
	zZ3FkNNK51qOBXzrXVlLlAe1KK3wj8f6QMOw6YtIiCZdQWr17kHmv+oX6TOmQA==
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
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v6 13/30] soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to
 qmc_init_tsa*
Date: Fri, 22 Sep 2023 09:58:48 +0200
Message-ID: <20230922075913.422435-14-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922075913.422435-1-herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: CXWZULRYTG454W4ZMYLHZ7D47GDMCOMO
X-Message-ID-Hash: CXWZULRYTG454W4ZMYLHZ7D47GDMCOMO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXWZULRYTG454W4ZMYLHZ7D47GDMCOMO/>
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
index 653d458b84b6..28acf4c8a141 100644
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

