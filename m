Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8FA7FBC60
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 15:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01FDE73;
	Tue, 28 Nov 2023 15:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01FDE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701180710;
	bh=EGfaDGAHLuR6voBQdhTslXuow64JAhZfRniGzJFd8TY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhwxb/s1x0O3NM92otT0ksp5c0cj5hUIGqt7lmp6zqvCA+XWLeTO94+SHb//ysxxA
	 2fhwrgEAq3PalrG+hBtRCHtkaH9SLVtr5goZkEsrDw28TIKzCArI1UTo8E6m82Ycfe
	 +WYgWwBin/8VxmGvQOCYxEEi3DB9pnTQ+OCCjnbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA789F8072C; Tue, 28 Nov 2023 15:09:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC56CF8075A;
	Tue, 28 Nov 2023 15:09:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59ABAF80652; Tue, 28 Nov 2023 15:08:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94696F80588
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 15:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94696F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HKz663bg
Received: by mail.gandi.net (Postfix) with ESMTPA id EFBDE60004;
	Tue, 28 Nov 2023 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701180513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVuTwhCVXrXaMm3ot/4hj4miUNcKZkq86yB6yXDjnng=;
	b=HKz663bgEeldH0FU4o0nXL2LMX4R7SR7bzpTq5c6vtJm+dl/suNEd6Q9bMNFyD28OZOccm
	eTsl2HYEBDxBUjhXxvKqotKhagx7OZGxHMZcsyOF9jJjFb5rdnWnefgMKoYN/CIqikpLWm
	+EZ5BnefMkg+HkYKly+LQk5fc8ZrPNZTfT8P2lbCYJYzKAzbpuZfmAN8g/QgLfoBxDa9Ho
	gH1xl3Zbnxu8obHdxl6IjGzy4R84lGvnPY/nPRKqdLM4J9F5WOyTC/HXXHY+W4vKIq1Ckd
	cwNmlCx8odxBdEYM6g50ldMrEDTJLBypoBMt5HtuFA5+z/8Kq8NE6WCoCVlyMA==
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
Subject: [PATCH 11/17] soc: fsl: cpm1: qmc: Check available timeslots in
 qmc_check_chans()
Date: Tue, 28 Nov 2023 15:08:10 +0100
Message-ID: <20231128140818.261541-12-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128140818.261541-1-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: AKTYYUFRY67A6PDSNINFDY2YIZE5VZNU
X-Message-ID-Hash: AKTYYUFRY67A6PDSNINFDY2YIZE5VZNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKTYYUFRY67A6PDSNINFDY2YIZE5VZNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The timeslots checked in qmc_check_chans() are the timeslots used.
With the introduction of the available timeslots, the used timeslots
are a subset of the available timeslots. The timeslots checked during
the qmc_check_chans() call should be the available ones.

Simply update and check the available timeslots instead of the used
timeslots in qmc_check_chans().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index f2a71a140db7..8d71e63d0f21 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -914,13 +914,13 @@ static int qmc_check_chans(struct qmc *qmc)
 	rx_ts_assigned_mask = info.nb_rx_ts == 64 ? U64_MAX : (((u64)1) << info.nb_rx_ts) - 1;
 
 	list_for_each_entry(chan, &qmc->chan_head, list) {
-		if (chan->tx_ts_mask > tx_ts_assigned_mask) {
-			dev_err(qmc->dev, "chan %u uses TSA unassigned Tx TS\n", chan->id);
+		if (chan->tx_ts_mask_avail > tx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u can use TSA unassigned Tx TS\n", chan->id);
 			return -EINVAL;
 		}
 
-		if (chan->rx_ts_mask > rx_ts_assigned_mask) {
-			dev_err(qmc->dev, "chan %u uses TSA unassigned Rx TS\n", chan->id);
+		if (chan->rx_ts_mask_avail > rx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u can use TSA unassigned Rx TS\n", chan->id);
 			return -EINVAL;
 		}
 	}
-- 
2.42.0

