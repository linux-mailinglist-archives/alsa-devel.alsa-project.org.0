Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7178686A
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:35:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23A56886;
	Thu, 24 Aug 2023 09:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23A56886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692862541;
	bh=gco6GF5g5JpbNtl/ECuotx4YVchsPbamM/dmJFqO58k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eyWAC0vLwXiOJJOYA57wYCwaS9fysaJCZvYaH/yoj4WqjawKYpxhDwGSWQLzQQmCK
	 zwxJFBw9U9trotz2P+Xhjv0F7NoOYPkpJDULceGlzoo3CsBNb0izv4/8izS5ffxJS4
	 QMAmNAprMvrtjP700J/cB1E9Ph9ltVxySOAT002o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E25F7F805CA; Thu, 24 Aug 2023 09:32:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AE07F805CA;
	Thu, 24 Aug 2023 09:32:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65D6CF80199; Mon, 21 Aug 2023 16:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2266EF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2266EF800BF
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 58A8B24E2A7;
	Mon, 21 Aug 2023 22:41:54 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:54 +0800
Received: from localhost.localdomain (113.72.145.205) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:53 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 2/5] ASoC: dwc: Use ops to get platform data
Date: Mon, 21 Aug 2023 22:41:48 +0800
Message-ID: <20230821144151.207339-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.145.205]
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
Message-ID-Hash: E4H7CUTMQN6XY5CDYI7RVMBD6CTF4UEG
X-Message-ID-Hash: E4H7CUTMQN6XY5CDYI7RVMBD6CTF4UEG
X-Mailman-Approved-At: Thu, 24 Aug 2023 07:30:04 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4H7CUTMQN6XY5CDYI7RVMBD6CTF4UEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use of_device_get_match_data() to get platform data.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 sound/soc/dwc/dwc-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 0a4698008d64..e70d41d57dfd 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -691,7 +691,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *=
dev,
=20
 static int dw_i2s_probe(struct platform_device *pdev)
 {
-	const struct i2s_platform_data *pdata =3D pdev->dev.platform_data;
+	const struct i2s_platform_data *pdata =3D of_device_get_match_data(&pde=
v->dev);
 	struct dw_i2s_dev *dev;
 	struct resource *res;
 	int ret, irq;
--=20
2.25.1

