Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD36230C0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7A5B164F;
	Wed,  9 Nov 2022 17:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7A5B164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668012963;
	bh=MzHl7pk9viWNyXhVOAFEGqxLZpOZJ7GvDwZhl8Ao//U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxN5+MDz3TNCUqT1KGdsc9XMWEmF8cmXvy43JJQDyMvUuCvszAFyUREsznf9XTj8+
	 RVRkrkaTdxwY+DOm+Krni73xCeLnn4JC6Bswp0a5+OKUiIFJILs1TBik417mf5E+1w
	 deRPGzskJJBUF95jpwrv64SqnPbQtrDbo2q/C1F8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0BF1F805A1;
	Wed,  9 Nov 2022 17:53:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69DCFF8057C; Wed,  9 Nov 2022 17:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5378F804FB
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:53:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5378F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="aHl5/FYs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9EDNjU027347; Wed, 9 Nov 2022 10:53:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PbgpNffsH6yRXzQNXNDtOnf8nTURcBJoWScHT08Ed6Q=;
 b=aHl5/FYsB6Lo4X/iwT7k8cJTRaduWd/jZddWKU9nRmjjDnKc7g0m5WMHlQOEv7muuk+M
 sfIvpc7QPLYRlEKsqLdlDhYhH7d9BEBjcx9S/nfIM05UZyWNvKMrt3sZKZ2VLAzUYkEY
 jZz9mC58L72/EH8GdggD+hK3YMnFVllUHnhoU8sk0ttlLy57JcsaOwd5jUmy2NOCOCLh
 hhq80cS0bEvvAyTcbt8wswld+wjBbPnSJICQ9j8bS4J5C+E9e3X3g0tpeV9zm5+ukF8L
 zneGM2ry1Q9uW1oBX9bdGG5BUimr7XlTWH2GnxDhEFdQ4HWmosPdtwl+kAITnBhRrYoo 4w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3knm8pde7v-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 10:53:37 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Wed, 9 Nov
 2022 10:53:36 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Wed, 9 Nov 2022 10:53:36 -0600
Received: from debianA11184.ad.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.92])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 881E0478;
 Wed,  9 Nov 2022 16:53:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
 <broonie@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [PATCH 07/12] regulator: arizona-micsupp: Don't use a common
 regulator name
Date: Wed, 9 Nov 2022 16:53:26 +0000
Message-ID: <20221109165331.29332-8-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221109165331.29332-1-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JnpQQAGo045iAXegME2a1rfJrvmbhA6H
X-Proofpoint-GUID: JnpQQAGo045iAXegME2a1rfJrvmbhA6H
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Arizona and Madera codecs all have a datasheet name of "MICVDD"
for the regulator output. But future codecs with a regulator that
can be controlled by this driver have different naming convention
for the output of the regulator.

Move the setting of the supply name from arizona_micsupp_common_init()
to arizona_micsupp_probe() and madera_micsupp_probe().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/regulator/arizona-micsupp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/arizona-micsupp.c b/drivers/regulator/arizona-micsupp.c
index 21c36972a8e9..596ecd8041cd 100644
--- a/drivers/regulator/arizona-micsupp.c
+++ b/drivers/regulator/arizona-micsupp.c
@@ -262,7 +262,6 @@ static int arizona_micsupp_common_init(struct platform_device *pdev,
 	INIT_WORK(&micsupp->check_cp_work, arizona_micsupp_check_cp);
 
 	micsupp->init_data.consumer_supplies = &micsupp->supply;
-	micsupp->supply.supply = "MICVDD";
 	micsupp->supply.dev_name = dev_name(micsupp->dev);
 	micsupp->desc = desc;
 
@@ -319,6 +318,8 @@ static int arizona_micsupp_probe(struct platform_device *pdev)
 	micsupp->dapm = &arizona->dapm;
 	micsupp->dev = arizona->dev;
 
+	micsupp->supply.supply = "MICVDD";
+
 	/*
 	 * Since the chip usually supplies itself we provide some
 	 * default init_data for it.  This will be overridden with
@@ -354,6 +355,8 @@ static int madera_micsupp_probe(struct platform_device *pdev)
 	micsupp->dev = madera->dev;
 	micsupp->init_data = arizona_micsupp_ext_default;
 
+	micsupp->supply.supply = "MICVDD";
+
 	return arizona_micsupp_common_init(pdev, micsupp, &madera_micsupp,
 					   &madera->pdata.micvdd);
 }
-- 
2.30.2

