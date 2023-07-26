Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15A763A4A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 17:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A5583A;
	Wed, 26 Jul 2023 17:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A5583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690384025;
	bh=aq7qYki8wmuX/Y4zmcGZ+tEAHPuniz3P2QK32j5L8Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=toxV+9RC4pdXDs3K3XH9trWOC5t70OVBiUijSHPPn+4cah75MTrEXAhGHQ1Zivqpu
	 PPm5nIZDGTzdhuQBb8P9KaVRwN/GVx1DewyVZ7JIYm7oZY//jvnvRdmfjQ8ZKIB5H7
	 n676J2rCHsZnEvpY1h5AclcdECHSLdE9i8JEFGrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACB5EF805F6; Wed, 26 Jul 2023 17:03:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BAB3F805E0;
	Wed, 26 Jul 2023 17:03:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3672F805CA; Wed, 26 Jul 2023 17:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F1ADF805C5
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 17:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F1ADF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jLpaUYyL
Received: by mail.gandi.net (Postfix) with ESMTPA id C240A1C000E;
	Wed, 26 Jul 2023 15:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690383806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7apDwjx9/8uO9n+ufyQhZ3ncaFdyB8ZdXZa/oGvwoPc=;
	b=jLpaUYyLgtyZpfY/rM/UmGTtYfR74hu/qBfAdl+wmUcRmphN9e9nCqReT3yJ65NB7Ue8ck
	2bHcRMIZp2MV+GbKoIeDeik94gVrfb3gvlQ0ZAupN3Z+FiFQNBH6AGyCTbEvDNK3G73J5d
	Gb/IR+VXBdbiPfGjzDhDUZ8b1jWeRCeX08hBq8ivb13gZT8IGjGxvmX2+6JDCjfx7X73HF
	H73qyaL8vhfUgJ4jdenFnetnymNeEQPabITt1u4n5gBykzDKndKWOt7cUMKpTXQrZu+Gl+
	NIsj0d8bFjBF0jxccsE1JpTqnQnzoE0yqpRFHPhT1PLXktehqzKvTKf9UgJMGg==
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
Subject: [PATCH v2 13/28] soc: fsl: cpm1: qmc: Add support for disabling
 channel TSA entries
Date: Wed, 26 Jul 2023 17:02:09 +0200
Message-ID: <20230726150225.483464-14-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726150225.483464-1-herve.codina@bootlin.com>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: N2YE6TJLH4UFHSNBW5A73Z3FVGEMYYPB
X-Message-ID-Hash: N2YE6TJLH4UFHSNBW5A73Z3FVGEMYYPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2YE6TJLH4UFHSNBW5A73Z3FVGEMYYPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to allow runtime timeslot route changes, disabling channel TSA
entries needs to be supported.

Add support for this new feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 82405915f2a4..146eebc12737 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -567,7 +567,8 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 }
 
-static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_serial_info *info,
+				     bool enable)
 {
 	unsigned int i;
 	u16 curr;
@@ -603,13 +604,14 @@ static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_ser
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
-				 ~QMC_TSA_WRAP, val);
+				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 
 	return 0;
 }
 
-static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_serial_info *info,
+					bool enable)
 {
 	unsigned int i;
 	u16 curr;
@@ -650,7 +652,7 @@ static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
-				 ~QMC_TSA_WRAP, val);
+				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 	/* Set entries based on Tx stuff */
 	for (i = 0; i < info->nb_tx_ts; i++) {
@@ -658,13 +660,13 @@ static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATTX + (i * 2),
-				 ~QMC_TSA_WRAP, val);
+				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 
 	return 0;
 }
 
-static int qmc_chan_setup_tsa(struct qmc_chan *chan)
+static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
 {
 	struct tsa_serial_info info;
 	int ret;
@@ -679,8 +681,8 @@ static int qmc_chan_setup_tsa(struct qmc_chan *chan)
 	 * and one for Tx) according to assigned TS numbers.
 	 */
 	return ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) ?
-		qmc_chan_setup_tsa_64rxtx(chan, &info) :
-		qmc_chan_setup_tsa_32rx_32tx(chan, &info);
+		qmc_chan_setup_tsa_64rxtx(chan, &info, enable) :
+		qmc_chan_setup_tsa_32rx_32tx(chan, &info, enable);
 }
 
 static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
@@ -1146,7 +1148,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	chan->qmc = qmc;
 
-	ret = qmc_chan_setup_tsa(chan);
+	ret = qmc_chan_setup_tsa(chan, true);
 	if (ret)
 		return ret;
 
-- 
2.41.0

