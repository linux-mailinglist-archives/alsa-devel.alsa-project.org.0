Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2B63787F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 13:05:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B0301706;
	Thu, 24 Nov 2022 13:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B0301706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669291514;
	bh=P7NuUmC5ASUn3Jj2ugGju59+Z+HBcwVTXcuyQg5bFuU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3ZmuguVU9MnQ8FXfrkJ8cTAznVNsWlWu66NIUdkSUt5xzqFyaexHN72u+GDc8KSA
	 RGMSem0upCz10O5WQqfjOThmOsELTAP2xfE3ktoB8nNRC1LNrQxK3jMNtZQ3ue6qgF
	 QNN7UiFSxlQhThIQIe1+JdqrbjjGYW6grbVWJzxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0125F804E5;
	Thu, 24 Nov 2022 13:04:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE238F8049E; Thu, 24 Nov 2022 13:03:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 439C9F8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 13:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 439C9F8014E
Received: from NTHCCAS04.nuvoton.com (NTHCCAS04.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id B677F1C811FE;
 Thu, 24 Nov 2022 20:03:39 +0800 (CST)
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Nov 2022 20:03:39 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 24 Nov 2022 20:03:39 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: nau8315: add new acpi id and compatible id
Date: Thu, 24 Nov 2022 20:03:30 +0800
Message-ID: <20221124120330.55845-2-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124120330.55845-1-CTLIN0@nuvoton.com>
References: <20221124120330.55845-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, David Lin <CTLIN0@nuvoton.com>
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

Add new acpi id and compatible id for nau8315.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8315.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/nau8315.c b/sound/soc/codecs/nau8315.c
index ad4dce9e5080..125742601f88 100644
--- a/sound/soc/codecs/nau8315.c
+++ b/sound/soc/codecs/nau8315.c
@@ -137,6 +137,7 @@ static int nau8315_platform_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id nau8315_device_id[] = {
 	{ .compatible = "nuvoton,nau8315" },
+	{ .compatible = "nuvoton,nau8318" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, nau8315_device_id);
@@ -145,6 +146,7 @@ MODULE_DEVICE_TABLE(of, nau8315_device_id);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id nau8315_acpi_match[] = {
 	{ "NVTN2010", 0 },
+	{ "NVTN2012", 0},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, nau8315_acpi_match);
-- 
2.25.1

