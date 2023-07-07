Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D69A74ABF2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 09:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73EDB210;
	Fri,  7 Jul 2023 09:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73EDB210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688715095;
	bh=ATBd52TaKOlfloh33Q6+S7orQv45N8aLSwgbiFvEc1Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ctZUxaqLzE3XAv+IbMrbEEn2yRT5Kii2qTb0+xj6TBEGuuDBbpA5npOcOU30AYf6l
	 gD0tTOQwJA7zUSgv2ZVGwj4pZaC639tcqAsVkfpfMZ020ExVag1C7bguPxA0Bh0NqM
	 5Ku0EDDGdXAlik4+OSxEeUql5AdQ4ArDD0xqz9zs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A34CEF80124; Fri,  7 Jul 2023 09:30:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D64CF80124;
	Fri,  7 Jul 2023 09:30:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 286CCF80153; Fri,  7 Jul 2023 09:29:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EE85F80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 09:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE85F80104
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftX-0002hV-Jm; Fri, 07 Jul 2023 09:28:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftV-00CgFV-4w; Fri, 07 Jul 2023 09:28:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftU-002wns-25; Fri, 07 Jul 2023 09:28:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de,
	Walker Chen <walker.chen@starfivetech.com>
Subject: [PATCH 0/2] ASoC: Another set of platform remove conversions
Date: Fri,  7 Jul 2023 09:28:28 +0200
Message-Id: <20230707072830.3395789-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=606;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ATBd52TaKOlfloh33Q6+S7orQv45N8aLSwgbiFvEc1Y=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkp76YvJnH1DeEICzKuRXEDvx8xl3OyrzwdQoPv
 WcAPvC2XcWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKe+mAAKCRCPgPtYfRL+
 Tj3zB/sH117O8bJnaj5wdBdF6K3tgGnDkso1dVbze+DB45pgXg6P50K25RWhWQto7oJJw5wLnLF
 /sSIJYqif1436ltMSyOS8TDJau0xhp4TsNYA1131Lv6zFWmRIvBNAtkdbrQAjDEE+D4S81woPaU
 bfinO6pvU2fuH0fQJrgsHyI5uU62NEAI3tJs8YyRoKe9ENSvxXKcXnF+Gsgifwr/7N2XnqDLkzQ
 8u4JwG8wAe62LAy+ot/UtgrBJxGp+kIQ1noQmSXK8EWDIiMIFVFR1PLB7bwwTh0CNUQ0GhSDMgG
 nbJ3I/LcBczfUQy976IVKpOeGe+vkxR4F8kp4OR8ywRuF2F0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: KYLDWGX4YXWBR5HCYENAZPJQ2G57JGIO
X-Message-ID-Hash: KYLDWGX4YXWBR5HCYENAZPJQ2G57JGIO
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYLDWGX4YXWBR5HCYENAZPJQ2G57JGIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

two more drivers were added during the current merge window that
are users of the original .remove callback that I plan to get rid of.
Convert them to .remove_new.

Best regards
Uwe

Uwe Kleine-König (2):
  ASoC: amd: ps-sdw-dma: Convert to platform remove callback returning
    void
  ASoC: starfive: jh7110_tdm: Convert to platform remove callback
    returning void

 sound/soc/amd/ps/ps-sdw-dma.c   | 5 ++---
 sound/soc/starfive/jh7110_tdm.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)


base-commit: 5133c9e51de41bfa902153888e11add3342ede18
-- 
2.39.2

