Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAEA80589A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 16:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7A6ED5;
	Tue,  5 Dec 2023 16:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7A6ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701790006;
	bh=wkTrZdwN+HvnXnOXlbxQGgDQH6aMtMpZlq4og4RCZMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pnfmyrbjd/Nw4sIPwEuxiR+DQbVphWjGqPxk+4A0DwtkVXXjPLZrVRnF1FSnUILl0
	 DRaEC/I85HAOdUOj69tZiCdjoI12lomnx+tzYxgEJpMCTJChREFfV8aLBtgt5n6h+h
	 Zc8bEJci7W/mFCr7tS+h6uZTjEN8mjEG6VwQr/m8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CC06F80C8F; Tue,  5 Dec 2023 16:22:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D773F80C8B;
	Tue,  5 Dec 2023 16:22:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2814F807B5; Tue,  5 Dec 2023 16:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2235CF80571
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 16:21:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2235CF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sh2cL8Ov
Received: by mail.gandi.net (Postfix) with ESMTPA id 168D34001D;
	Tue,  5 Dec 2023 15:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bd6V9l+8bS6As2+K/MjWt5mahUE4lNX5ObA4PLj5bLk=;
	b=Sh2cL8Ov+o9ZZqjkwW8K8DMYAiHqzR5NIEQFEvynU5/wZwaaenOWr/feHREqR0XB+bNdcM
	RTE5Fg3auuphyfk2J5FGUUZsBpym8JTRs3TXa7FNr6vFfFbFCM/Bo53KjowK4W+riuS1fN
	rmYBMKWFgZC+bsQtt9s19sm0Rx2wVcW88Spqu21Ba/S5ofMvZzaAT3xHWJQE8DwMPUPDZU
	POQKmHoMI4B5oP2X6LWiDH+U0ed+cukNoR7q9/86qW8xcNJCFAkfC0FVTHw7rFP/IoAJ+Y
	MQKzwAJdpt5nonEhonw80Ya7k1PFLu6Le6B7wnEWZGB5vX0cNzxfysPT/w6qpw==
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
Subject: [PATCH v2 16/17] soc: fsl: cpm1: qmc: Remove timeslots handling from
 setup_chan()
Date: Tue,  5 Dec 2023 16:21:13 +0100
Message-ID: <20231205152116.122512-17-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205152116.122512-1-herve.codina@bootlin.com>
References: <20231205152116.122512-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: NRZ4NDPSAFNJODR3PYPK4ARIENXIHE5G
X-Message-ID-Hash: NRZ4NDPSAFNJODR3PYPK4ARIENXIHE5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRZ4NDPSAFNJODR3PYPK4ARIENXIHE5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Timeslots setting is done at channel start() and stop().
There is no more need to do that during setup_chan().

Simply remove timeslot setting from setup_chan().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index bc72c1bc0ec4..45d9cb40a118 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -723,30 +723,6 @@ static int qmc_chan_setup_tsa_rx(struct qmc_chan *chan, bool enable)
 	return qmc_chan_setup_tsa_32rx(chan, &info, enable);
 }
 
-static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
-{
-	struct tsa_serial_info info;
-	int ret;
-
-	/* Retrieve info from the TSA related serial */
-	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
-	if (ret)
-		return ret;
-
-	/*
-	 * Setup one common 64 entries table or two 32 entries (one for Tx
-	 * and one for Tx) according to assigned TS numbers.
-	 */
-	if (chan->qmc->is_tsa_64rxtx)
-		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
-
-	ret = qmc_chan_setup_tsa_32rx(chan, &info, enable);
-	if (ret)
-		return ret;
-
-	return qmc_chan_setup_tsa_32tx(chan, &info, enable);
-}
-
 static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
 {
 	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
@@ -1321,10 +1297,6 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	chan->qmc = qmc;
 
-	ret = qmc_chan_setup_tsa(chan, true);
-	if (ret)
-		return ret;
-
 	/* Set channel specific parameter base address */
 	chan->s_param = qmc->dpram + (chan->id * 64);
 	/* 16 bd per channel (8 rx and 8 tx) */
-- 
2.43.0

