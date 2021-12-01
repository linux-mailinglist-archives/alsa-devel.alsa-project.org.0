Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D980465436
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 18:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE3FD2603;
	Wed,  1 Dec 2021 18:44:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE3FD2603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638380739;
	bh=kzLfFAz9YwNWzZvJVYpBzCo0ACwCdFLPzpUKYKlz8Zs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qtKfyCczSGhkKqF+xaxCuitdEJ/xBb7eXKLsWGaC2/ve06iwp6bi0x1fvyGytWLDh
	 cEFE74ccuH5O7pF1ObYkw4GAglL6HzyHP7jPgBXzVgTvyghMJWE0UcM1E8RAkeBwi5
	 +V5fgyLaq+AelTCyM5jKMJIAmzdwTzQ/QK9iklcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 136E1F80256;
	Wed,  1 Dec 2021 18:44:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 803F4F80217; Wed,  1 Dec 2021 18:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88384F80240
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 18:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88384F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="O0th2ZEo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B150FNZ020440;
 Wed, 1 Dec 2021 11:43:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=jG8pIfE91LgyMS9/4/aLCFnG3IFrTHhZ2SXgW23k44U=;
 b=O0th2ZEodW3oPKgYz9kU+dGXvr5E8PwZsC+falLy+ijijMaKcBtmqUZRnrG8HjTSzKUX
 LJeMjQeRJT4s7xK9n/GBARHUrFi0BasAYK/is58eV1ZrhtBudOIFlBvxSgAKCbrtPv4n
 byRKoUMlcBd4nNQUFv1Ogg025GekRgP9USeTuTACppPBGVFKNiPGRNtuFnhv22TvuTH8
 A8jjSvYZmS8iCaYpZhAEjJYM1flW2OqvuIAh4x4Eqtu/a6jr4ql7dax2mqk4JiIAaHH/
 Gb6oqK0Jd7D9y5jZRmTzC2JBd7KIwOaMW2D3py6XuaZxnfDklKgxHN4/L1ZKaEcUY+3Q DA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cp1x10t7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Dec 2021 11:43:43 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 1 Dec
 2021 17:43:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 1 Dec 2021 17:43:42 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.238])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7EBEC2A9;
 Wed,  1 Dec 2021 17:43:41 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Len Brown <lenb@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: amd: Fix dependency for SPI master
Date: Wed, 1 Dec 2021 17:43:06 +0000
Message-ID: <20211201174307.1399625-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: M9v73pw99VeMFerI2gviHjzW9X0R7e7c
X-Proofpoint-ORIG-GUID: M9v73pw99VeMFerI2gviHjzW9X0R7e7c
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

Select SPI_MASTER as is using CS35L41 SPI driver

Fixes: 96792fdd77cd1 ("ASoC: amd: enable vangogh platform machine driver build")

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 092966ff5ea7..8961b8fd23eb 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -68,7 +68,7 @@ config SND_SOC_AMD_VANGOGH_MACH
 	tristate "AMD Vangogh support for NAU8821 CS35L41"
 	select SND_SOC_NAU8821
 	select SND_SOC_CS35L41_SPI
-	depends on SND_SOC_AMD_ACP5x && I2C
+	depends on SND_SOC_AMD_ACP5x && I2C && SPI_MASTER
 	help
 	  This option enables machine driver for Vangogh platform
 	  using NAU8821 and CS35L41 codecs.
-- 
2.34.1

