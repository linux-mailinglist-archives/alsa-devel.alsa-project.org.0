Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D280F81CFF3
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Dec 2023 23:52:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55490A4E;
	Fri, 22 Dec 2023 23:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55490A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703285577;
	bh=v7ypKlogWSytD7lf1SVbYFZwVbn6mIgx5yAUcapzsz0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mTMHIhnfwzKg8Z78wJNYmC8IMAyDDn8A11bnclVM3XVhSbVJUPHinKGgbguFdgIYJ
	 WkVH6iQWG0XJIxeEHmB1rRyTUvkUeNYoSFv0y7FpSHgNZHV6LpADIN4flZOstAPJrT
	 iK5+073wycuadlGXbMUfnn6yu0Ji41OMFc9XEBq0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF976F8056F; Fri, 22 Dec 2023 23:52:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AD3F80579;
	Fri, 22 Dec 2023 23:52:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D4AEF80587; Fri, 22 Dec 2023 23:51:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26B0BF80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 23:51:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B0BF80124
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGoMN-0005ZT-6G; Fri, 22 Dec 2023 23:51:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGoMJ-000qus-6T; Fri, 22 Dec 2023 23:51:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rGoMK-000Ff0-0a;
	Fri, 22 Dec 2023 23:51:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	kernel@pengutronix.de
Subject: [PATCH 00/13] irqchip: Convert to platform remove callback returning
 void
Date: Fri, 22 Dec 2023 23:50:31 +0100
Message-ID: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=v7ypKlogWSytD7lf1SVbYFZwVbn6mIgx5yAUcapzsz0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlhhK27tJuAJCvbukbs16KJeuc3ApgCd8jJ8GTK
 l8H4WsKneuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYYStgAKCRCPgPtYfRL+
 TkK3CACh/9LhWoUb7uG4ZFk74M/1Wv7x80WVfz/wC3medJ17C55KyYQ/zbGzeV3ZqDEs8dkKGRr
 H1kdYdtDzZ6UbfeMGe77IfZiVoG3qmk1nV6i/EAugMPQlwLXhUXnFV3TORzeXtLyW57YO1slDs8
 TnBRPg9ewko76aj9/nV+RSjsNZqjULCDuEEuTM/l9BowT+eLuFEINuiXBqBKjpSuSlbjXq0xWdF
 MWtK8hBR+9mWftaTGWNXGJjhfYw+MuIgj67jPhies0kQdC4wzpgDeZMG9Oh7fZhhVUVRoBol+cn
 xAN1YXJwjax3mT9f8wCFhZ8G61WtWZe8UShwnwTp48ztg9Ik
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: IOCEWWIVJH72MLOPRJ2B5BBPJLUOYORM
X-Message-ID-Hash: IOCEWWIVJH72MLOPRJ2B5BBPJLUOYORM
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOCEWWIVJH72MLOPRJ2B5BBPJLUOYORM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

this series converts all drivers below drivers/irqchip to use
.remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
callback that returns no value") for an extended explanation and the
eventual goal. The TL;DR; is to make it harder for driver authors to
leak resources.

The drivers touched here are all fine though and don't return early in
.remove(). So all conversions in this series are trivial.

Best regards
Uwe

Uwe Kleine-König (13):
  irqchip/imgpdc: Convert to platform remove callback returning void
  irqchip/imx-intmux: Convert to platform remove callback returning void
  irqchip/imx-irqsteer: Convert to platform remove callback returning void
  irqchip/keystone: Convert to platform remove callback returning void
  irqchip/ls-scfg-msi: Convert to platform remove callback returning void
  irqchip/madera: Convert to platform remove callback returning void
  irqchip/mvebu-pic: Convert to platform remove callback returning void
  irqchip/pruss-intc: Convert to platform remove callback returning void
  irqchip/renesas-intc-irqpin: Convert to platform remove callback returning void
  irqchip/renesas-irqc: Convert to platform remove callback returning void
  irqchip/renesas-rza1: Convert to platform remove callback returning void
  irqchip/stm32-exti: Convert to platform remove callback returning void
  irqchip/ts4800: Convert to platform remove callback returning void

 drivers/irqchip/irq-imgpdc.c              | 5 ++---
 drivers/irqchip/irq-imx-intmux.c          | 6 ++----
 drivers/irqchip/irq-imx-irqsteer.c        | 6 ++----
 drivers/irqchip/irq-keystone.c            | 5 ++---
 drivers/irqchip/irq-ls-scfg-msi.c         | 6 ++----
 drivers/irqchip/irq-madera.c              | 6 ++----
 drivers/irqchip/irq-mvebu-pic.c           | 6 ++----
 drivers/irqchip/irq-pruss-intc.c          | 6 ++----
 drivers/irqchip/irq-renesas-intc-irqpin.c | 5 ++---
 drivers/irqchip/irq-renesas-irqc.c        | 5 ++---
 drivers/irqchip/irq-renesas-rza1.c        | 5 ++---
 drivers/irqchip/irq-stm32-exti.c          | 5 ++---
 drivers/irqchip/irq-ts4800.c              | 6 ++----
 13 files changed, 26 insertions(+), 46 deletions(-)

base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
-- 
2.42.0

