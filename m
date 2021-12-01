Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C644654A5
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:01:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29269262C;
	Wed,  1 Dec 2021 19:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29269262C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638381698;
	bh=r5ZH+LiPCW885wZA/w7dlTgQyluJjIGjz70wgx05EnU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V17cVzEmsyDOb5q5GjgFuPoZ8odP6aHn6U6rLTDpVJIac5NXhetXmE/8O3kYGeNiL
	 SomZiw4jZ/11goYRDOEhbUQbXzCdBFBQ8iGcDTsVUvIaFsIQeTJ8D3kT4f75WcMWbg
	 BwBFYuAGRb5w8WneWd1vqmyrzzW7BLz62R8KGWEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B82F80249;
	Wed,  1 Dec 2021 19:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E43F80217; Wed,  1 Dec 2021 19:00:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8916BF80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8916BF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nuXJm8oe"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B19Mp5U027293;
 Wed, 1 Dec 2021 12:00:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=eMCFmkQjX/ILps9PWRRmzwjXAbHNQbPiwPbQV6ydNDw=;
 b=nuXJm8oejWaaTHL7WHPFd+vhKn7cWSGze0JeNDGqEPbcQzIKykc7AaxCfIQKlNqJ2apV
 iDTOGjnwVmB7tXxfbHegClSHGEDleX7TTF28Nzz48r/0lyOztGq/hrh02dCkq49vJpEp
 3RZjnQhXPvpFEM6np3WkNyxPIeY4ztR/KlMvmqu/1EtNY6GEkgB3nFGThwQzSrIxLlgC
 oAMfH8HLinwLgfQYzxQEeLBcYtBm2HefJxCxY+2ZNVWcsMhxlKuz6dW90oHdGECAW5+I
 m2Yt9wFMRRprDMGZDn2rmK80GmiskgSKPjEHfwmtO0xlLoVKC+AyhrxOmr8Jkxh/LmLa wQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cp6c88kpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Dec 2021 12:00:08 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 18:00:06 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 1 Dec 2021 18:00:06 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.238])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 784B7B10;
 Wed,  1 Dec 2021 18:00:06 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Len Brown <lenb@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v2 2/2] ASoC: cs35l41: Fix undefined reference to core
 functions
Date: Wed, 1 Dec 2021 18:00:04 +0000
Message-ID: <20211201180004.1402156-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201180004.1402156-1-tanureal@opensource.cirrus.com>
References: <20211201180004.1402156-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: h7bfjpBZCzYeFAjTd4uWDXJ7S1fGyff5
X-Proofpoint-GUID: h7bfjpBZCzYeFAjTd4uWDXJ7S1fGyff5
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 kernel test robot <lkp@intel.com>
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

Auto select core driver if i2c or spi bus drivers are
selected

Fixes: a5e0091d62ab ("ASoC: cs35l41: Fix link problem")

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Reported-by: kernel test robot <lkp@intel.com>
---
v2 -> none

 sound/soc/codecs/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index b4f70e27342c..c033ee7d82e4 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -614,17 +614,19 @@ config SND_SOC_CS35L36
 
 config SND_SOC_CS35L41
 	tristate
+	default y if SND_SOC_CS35L41_SPI=y
+	default y if SND_SOC_CS35L41_I2C=y
+	default m if SND_SOC_CS35L41_SPI=m
+	default m if SND_SOC_CS35L41_I2C=m
 
 config SND_SOC_CS35L41_SPI
 	tristate "Cirrus Logic CS35L41 CODEC (SPI)"
 	depends on SPI_MASTER
-	select SND_SOC_CS35L41
 	select REGMAP_SPI
 
 config SND_SOC_CS35L41_I2C
 	tristate "Cirrus Logic CS35L41 CODEC (I2C)"
 	depends on I2C
-	select SND_SOC_CS35L41
 	select REGMAP_I2C
 
 config SND_SOC_CS42L42
-- 
2.34.1

