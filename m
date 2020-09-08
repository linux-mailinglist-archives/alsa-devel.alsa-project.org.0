Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2EE2610B7
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 13:34:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3885A1732;
	Tue,  8 Sep 2020 13:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3885A1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599564843;
	bh=PkDdnb8I+XkGWiuK/7VaNdakudJAt5coPWYeNbztzlA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oDz4Iu4q6pfSgiZYQFo5HzIhLdGQjiUK3P2E36i9Cv5aBv1Me+zi6KosedV+3jUJ3
	 8vqSsaWh89zG09vcTEAx5r4qPx6YGAHeXBJlR0qIW2RqlumTvy3zz+6ZVbsKIeaT/w
	 awWEfBr3FubGWK/D1EIZXEUSGhllJGieSG7VyIzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 438C7F800FD;
	Tue,  8 Sep 2020 13:32:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE7BBF80264; Tue,  8 Sep 2020 13:32:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F5B8F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 13:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F5B8F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x28zp9Lc"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088BW7pE015586;
 Tue, 8 Sep 2020 06:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599564727;
 bh=2CU6qzJ+xSIn/0tGzT7zMzny6tGNfCY0nP0F0leZGKE=;
 h=From:To:CC:Subject:Date;
 b=x28zp9Lcz/qFCG8TDtVEV4X+cbtNqTLei1qt7OU5Q+xezDhG+2NgtZzVSDsx5nRO8
 Dk8I80v36q0GNbHju6bVUk4TxSX3l/xg9iHdTgGUTaf/Z35N41reqvevYO60uJSW6f
 1raEie/XHiPkhjAqK7mcSt5xFNVjHr/s142xSiVI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088BW7ba109908
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Sep 2020 06:32:07 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 06:32:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 06:32:06 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088BW5tD011232;
 Tue, 8 Sep 2020 06:32:05 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: ti: Kconfig: Allow the j721e machine driver to be
 used on K3 platform
Date: Tue, 8 Sep 2020 14:32:04 +0300
Message-ID: <20200908113204.12012-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org
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

The initial machine driver supports only j721e-cpb and the ivi addon, but
other EVMs for different K3 SoC can have similar audio setup which can
be supported by the driver with small or no modification.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
Hi,

Changes since v1:
- Fixed the typo in subject and refined the commit message

Regards,
Peter

 sound/soc/ti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 1e6ab87e4460..9775393d46b6 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -221,7 +221,7 @@ config SND_SOC_DM365_VOICE_CODEC_MODULE
 
 config SND_SOC_J721E_EVM
 	tristate "SoC Audio support for j721e EVM"
-	depends on ARCH_K3_J721E_SOC || COMPILE_TEST
+	depends on ARCH_K3 || COMPILE_TEST
 	depends on I2C
 	select SND_SOC_PCM3168A_I2C
 	select SND_SOC_DAVINCI_MCASP
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

