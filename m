Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4857427D4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 15:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FFA7F8;
	Thu, 29 Jun 2023 15:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FFA7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688047167;
	bh=LX65sx3ebIwtVGlnvjEDeuEZKzll8UngfF+qA6/0ZMw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J7Kdj5TB83wHuf/loQVU0qzWPSiGDZAX3P2keY5y/pf4D9uSsLwECBy0OIMGW9v4B
	 nV78VHAFNkgOkSg7gkBdTgtriXKjBg1deBL3dB3AeDo0AEVcnD+MFy2I4dC2Jp8yB+
	 N89uS+vKmQ+CUGNCfaef9NdHSkCYPIMg5xEIISzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41A71F8053B; Thu, 29 Jun 2023 15:58:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD571F80246;
	Thu, 29 Jun 2023 15:58:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF87F8027B; Thu, 29 Jun 2023 15:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 220DEF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 15:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 220DEF80169
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsAC-0002Of-MN; Thu, 29 Jun 2023 15:58:24 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsAB-00Aujm-8U; Thu, 29 Jun 2023 15:58:23 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1qEsAA-00B7Nm-EJ; Thu, 29 Jun 2023 15:58:22 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 0/2] ASoC: fsl_sai: Fill Tx FIFO to avoid initial underruns
Date: Thu, 29 Jun 2023 15:58:18 +0200
Message-Id: <20230629135820.2631908-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: XPTAZWSJVQFNA3LFQKE2HKANRZPL3MMS
X-Message-ID-Hash: XPTAZWSJVQFNA3LFQKE2HKANRZPL3MMS
X-MailFrom: sha@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPTAZWSJVQFNA3LFQKE2HKANRZPL3MMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series fixes initial underruns that can occur in the TX queue of the
fsl_sai interface when starting playback. These patches are around here
for quite some time and have proven useful. Time to upstream them.

Sascha

Ahmad Fatoum (2):
  ASoC: fsl_sai: refactor TDM slots calculation into helper function
  ASoC: fsl_sai: Fill Tx FIFO to avoid initial underruns

 sound/soc/fsl/fsl_sai.c | 38 +++++++++++++++++++++++++++++++++-----
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 34 insertions(+), 5 deletions(-)

-- 
2.39.2

