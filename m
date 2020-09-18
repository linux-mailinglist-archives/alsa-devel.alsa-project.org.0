Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593102701FE
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 18:20:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05C316B4;
	Fri, 18 Sep 2020 18:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05C316B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600446040;
	bh=+mi8moqPWfbART1JEMWeRGM8LGlgHFxfIFyJepgTfqE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IQgYbrTDtemKK0zSgEAn/yXWcHiftydBeFq+Un/otxzTDeOW4iFexoD9epW8+x/Q9
	 Cju/ZJXsPAEKa01bEZrvaaRcb/3yrlmegPa0vkHn3vu5+Qj0KSI6rPHAI0belDVJ+/
	 Ji0VxOAU/KPBhn6dbCTRaxocg0yExKE4PB3PAg1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C26F8015C;
	Fri, 18 Sep 2020 18:18:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9B1BF8015C; Fri, 18 Sep 2020 18:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9CA2F8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 18:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9CA2F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HbR3v7+r"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08IGIibu127362;
 Fri, 18 Sep 2020 11:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600445924;
 bh=6QokZMF6RjHPEWc7NrsYM8QzQWnzdKBphxV83v/HNCQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=HbR3v7+r6RcOZeXd3znZjkqt0+J8qmEw5P6mnitDZ4o+fRAs5o4de/SnyHET9PlUD
 CQhcauE9seb557szWWO1VaxiV6YzkUqXedL0OaS3u7IIXn9Qio22Ql/8T6w9b9Oz7V
 V3OdDCBz7CWCkSMg//SN2ypH+jSCFd3Ixz2IXgVo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08IGIiHs053210
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 18 Sep 2020 11:18:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 18
 Sep 2020 11:18:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 18 Sep 2020 11:18:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08IGIhVp037825;
 Fri, 18 Sep 2020 11:18:43 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: tas2770: Add missing bias level power states
Date: Fri, 18 Sep 2020 11:18:42 -0500
Message-ID: <20200918161842.4451-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918161842.4451-1-dmurphy@ti.com>
References: <20200918161842.4451-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

Add the BIAS_STANDBY and BIAS_PREPARE to the set_bias_level or else the
driver will return -EINVAL which is not correct as they are valid
states.

Fixes: 1a476abc723e6 ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2770.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 03d7ad1885b8..7c6f61946ab3 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -57,7 +57,12 @@ static int tas2770_set_bias_level(struct snd_soc_component *component,
 			TAS2770_PWR_CTRL_MASK,
 			TAS2770_PWR_CTRL_ACTIVE);
 		break;
-
+	case SND_SOC_BIAS_STANDBY:
+	case SND_SOC_BIAS_PREPARE:
+		snd_soc_component_update_bits(component,
+			TAS2770_PWR_CTRL,
+			TAS2770_PWR_CTRL_MASK, TAS2770_PWR_CTRL_MUTE);
+		break;
 	case SND_SOC_BIAS_OFF:
 		snd_soc_component_update_bits(component,
 			TAS2770_PWR_CTRL,
-- 
2.28.0

