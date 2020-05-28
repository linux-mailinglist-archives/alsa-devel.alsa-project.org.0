Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674011E5839
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 09:10:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0112117DC;
	Thu, 28 May 2020 09:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0112117DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590649815;
	bh=QhVt9IkZloZcvmGx/9coOpQ1lSMet2fRX1RQoXPwyHk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s0Bombyd62Ln3/fYodChxDbW3kPc0kyAVsRr8oFpKFVicPc5ndnSOFLFCrZKcCnCz
	 vmMBFRUhBjrMwk3dF7t2KibGDbM5zFeo9P1dnzJTSR0IznDDgYvAhBiRNEkvqQcyfC
	 HIVaBOrWBDPuBR8FL2B+npUszUsONfi6jsyWZVok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 240D0F8015C;
	Thu, 28 May 2020 09:08:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C41F7F80150; Thu, 28 May 2020 09:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 9DB4BF80107
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 09:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB4BF80107
Received: from NTHCCAS02.nuvoton.com (nthccas02.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 81B591C805F6;
 Thu, 28 May 2020 15:08:20 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.9.121) by NTHCCAS02.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Thu, 28 May 2020
 15:08:20 +0800
Received: from NTHCCAS04.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Thu, 28 May
 2020 15:08:20 +0800
Received: from localhost.localdomain (10.4.36.27) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.1847.3 via Frontend
 Transport; Thu, 28 May 2020 15:08:19 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] add I2C device and compatible ID
Date: Thu, 28 May 2020 15:05:10 +0800
Message-ID: <20200528070510.29959-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Seven Lee <wtli@nuvoton.com>,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 KCHSU0@nuvoton.comgit
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

The nau8810 driver can also compatible with nau8812 and nau8814.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 Documentation/devicetree/bindings/sound/nau8810.txt | 5 +++--
 sound/soc/codecs/nau8810.c                          | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nau8810.txt b/Documentation/devicetree/bindings/sound/nau8810.txt
index 05830e477acd..7deaa452b200 100644
--- a/Documentation/devicetree/bindings/sound/nau8810.txt
+++ b/Documentation/devicetree/bindings/sound/nau8810.txt
@@ -1,10 +1,11 @@
-NAU8810 audio CODEC
+NAU8810/NAU8812/NAU8814 audio CODEC
 
 This device supports I2C only.
 
 Required properties:
 
-  - compatible : "nuvoton,nau8810"
+  - compatible : One of "nuvoton,nau8810" or "nuvoton,nau8812" or
+	"nuvoton,nau8814"
 
   - reg : the I2C address of the device.
 
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index efe9fb3fb225..33ebc6398426 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -895,6 +895,8 @@ static int nau8810_i2c_probe(struct i2c_client *i2c,
 
 static const struct i2c_device_id nau8810_i2c_id[] = {
 	{ "nau8810", 0 },
+	{ "nau8812", 0 },
+	{ "nau8814", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8810_i2c_id);
@@ -902,6 +904,8 @@ MODULE_DEVICE_TABLE(i2c, nau8810_i2c_id);
 #ifdef CONFIG_OF
 static const struct of_device_id nau8810_of_match[] = {
 	{ .compatible = "nuvoton,nau8810", },
+	{ .compatible = "nuvoton,nau8812", },
+	{ .compatible = "nuvoton,nau8814", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, nau8810_of_match);
-- 
2.26.2

