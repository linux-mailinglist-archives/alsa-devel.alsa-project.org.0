Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF578C726
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63460DF6;
	Tue, 29 Aug 2023 16:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63460DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318641;
	bh=9sN5w62JVh2IP9g875wPq5gv975stG2wgUF70ZlNEaE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k72V5PTPyPi10DLOsab/V8vMvnspUybzt56+Rut9QpTp7gBG/KHBPa7LC2RJgakm/
	 lR3JSjskNrV6Rpci+Vbtw/tSweyRQjIwJVXNignZ+bgs4nAe4Pk3PPA4+xUoRd0T3+
	 6Tj386UkANbUPucpWOqdHyvCq+YRGPjfwuqioBGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 471A2F805E0; Tue, 29 Aug 2023 16:14:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3984F805D5;
	Tue, 29 Aug 2023 16:14:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38CEDF80158; Tue, 29 Aug 2023 05:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA47BF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 05:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA47BF800F5
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AC0AC809C;
	Tue, 29 Aug 2023 11:36:59 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 11:36:59 +0800
Received: from localhost.localdomain (113.72.145.245) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 11:36:58 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: [PATCH v1] ASoC: dwc: Fix the warnnings about JH7110 ops
Date: Tue, 29 Aug 2023 11:36:58 +0800
Message-ID: <20230829033658.225713-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.145.245]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RZGTMULTKFJUNJCVCPVT53P4QTGCBKTT
X-Message-ID-Hash: RZGTMULTKFJUNJCVCPVT53P4QTGCBKTT
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZGTMULTKFJUNJCVCPVT53P4QTGCBKTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a check of CONFIG_OF before the JH7110 ops to fix the warnings
that the JH7110 ops are defined but not used when CONFIG_OF is disabled.

Fixes: 1a512d13837a ("Add I2S support for the StarFive JH7110 SoC")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308250433.nhzrhYEo-lkp@i=
ntel.com/
Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
Hi Mark,

This patch fixes the issue about the warning of JH7110 ops when CONFIG_OF
is disabled. So add a check of CONFIG_OF before defining JH7110 ops.

Thanks,
Xingyu Wu
---
 sound/soc/dwc/dwc-i2s.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 5ab1b3eb2d28..329015ef1d1e 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -729,6 +729,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *=
dev,
=20
 }
=20
+#ifdef CONFIG_OF
 /* clocks initialization with master mode on JH7110 SoC */
 static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 {
@@ -912,6 +913,7 @@ static int jh7110_i2stx0_clk_cfg(struct i2s_clk_confi=
g_data *config)
=20
 	return clk_set_rate(dev->clk, bclk_rate);
 }
+#endif
=20
 static int dw_i2s_probe(struct platform_device *pdev)
 {
--=20
2.25.1

