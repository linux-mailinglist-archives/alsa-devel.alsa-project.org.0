Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B1AB7FAD
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AF1261E0B;
	Thu, 15 May 2025 09:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AF1261E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295813;
	bh=KFQjHqN1oAAjo1RJOok3ueSzjmFOYcaYRIZfi3T0bSo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AmrgN2+kxM+ZBQMnGyejPfTKUbXc3sTsCsVxRYYZBxICJsb13sAgDx4d0m+hW4486
	 PQGbb7VCFGDRNeZjrIk9k52aGKfemqX3jrYXSlCVeZrkV3DgDPUM1nJOVf49wjYDUf
	 Sjt+ARA2WJ4eaH7TzjcnzfRovNtpEo0pvrUkAdXg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EFFFF89A75; Mon, 12 May 2025 20:57:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA39F89A6D;
	Mon, 12 May 2025 20:57:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BCF2F89A65; Mon, 12 May 2025 20:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4573BF89A15
	for <alsa-devel@alsa-project.org>; Mon, 12 May 2025 20:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4573BF89A15
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=aEPTGW77
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIveRZ2645208
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747076260;
	bh=Qb6JfIhSW1h4eYzfuOi/aq/Oo6JyXU+LA8+sA4fY1EM=;
	h=From:To:CC:Subject:Date;
	b=aEPTGW77Nm0yJMUYEB67Sfa18JFqrsYzbyXC2cCwZ737aMBr86iDu8Kb7orp/BnxK
	 BoBR4tai6/H+i7fPcnQ72Kyo41/vyGOJqXoSCVgx488xN6av7Zvd1PWgu7wfS9ZalB
	 cze6GTp4OnFctEjPWnLS5dl2SkpM2udmv45lHl8U=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIveZE018109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 13:57:40 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 13:57:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 13:57:39 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CIvddH072850;
	Mon, 12 May 2025 13:57:39 -0500
From: Nishanth Menon <nm@ti.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
        Mark
 Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Nishanth
 Menon <nm@ti.com>
Subject: [PATCH] ASoC: tlv320aic3x: Use dev_err_probe
Date: Mon, 12 May 2025 13:57:39 -0500
Message-ID: <20250512185739.2907466-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: ZTWSBHX4WMM5I57QLCZVHJW4LPMVDFUC
X-Message-ID-Hash: ZTWSBHX4WMM5I57QLCZVHJW4LPMVDFUC
X-MailFrom: nm@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTWSBHX4WMM5I57QLCZVHJW4LPMVDFUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During probe the regulator supply drivers may not yet be available.
Use dev_err_probe to provide just the pertinent log.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Testing based on next-20250512 (includes additional patch) on AM62a7-sk
Before: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-before-L851
After: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-after-L806
 sound/soc/codecs/tlv320aic3x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index 56e795a00e22..f1649df19738 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1818,10 +1818,8 @@ int aic3x_probe(struct device *dev, struct regmap *regmap, kernel_ulong_t driver
 
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(aic3x->supplies),
 				      aic3x->supplies);
-	if (ret) {
-		dev_err(dev, "Failed to request supplies: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request supplies\n");
 
 	aic3x_configure_ocmv(dev, aic3x);
 
-- 
2.47.0

