Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7C57FD2F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 12:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4866015C1;
	Mon, 25 Jul 2022 12:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4866015C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658743892;
	bh=WwU9nxdctQsI4jH9K6IXqln2aORb9QSIuV6qe2LWzS8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcLu6+8YGEi45DfEgzV81h8JHZWil5dy6ENlMviLE7XYablNrmcdSWOOMHsKY9X6+
	 T+SqD+EXfy/Y8hiXNP3tllbHnD8qvhtaSc153RODaEMgtvormxzSfLw7jO8Til50m7
	 QpQ1vUcHfcTUPXuFNWRRRzqFMD1tO9o+CeEy0oxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40803F80558;
	Mon, 25 Jul 2022 12:09:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F128F802DF; Mon, 25 Jul 2022 12:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F4AF802DF
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 12:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F4AF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="s1t0vh6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1658743758; x=1690279758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WwU9nxdctQsI4jH9K6IXqln2aORb9QSIuV6qe2LWzS8=;
 b=s1t0vh6vy/EpXWtkWZe+AYMrP5W/lydGi9/0IHTbsc6bB0AqHYonNYsm
 YXPCiUM5LyzNXyPg/sq7MOSEvUiu2+AvSjdnJRPDMG+VrcTVHdP/It/Su
 zKDwhQ/OvCGd9l28Y37qQbqmPUNXqSU+eLziJvDM6JdBSpOXehuqqKFmz
 JWKtUM81PHfUSTBHjhGx2ToRkC9ED/pQNblmpfUoRFYZFwMQEyOyVh74h
 E9qmbPbTkiL2upR/99+Hv9eSjkIsPUZx8nGrz4VTNGKjIW1wsNQoA/EIG
 6smQL/YDNVGa4xS3aN18IBKgopCTEqN5ha9vxgkJETu32Upk3zoFh0R1i g==;
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="173666606"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2022 03:09:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 25 Jul 2022 03:09:17 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 25 Jul 2022 03:09:14 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/5] ASoC: mchp-spdiftx: return directly ret
Date: Mon, 25 Jul 2022 13:11:29 +0300
Message-ID: <20220725101130.1780393-5-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220725101130.1780393-1-claudiu.beznea@microchip.com>
References: <20220725101130.1780393-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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

Avoid having patterns like:

int ret;

// ...
ret = 0;
// ...

ret = call_function();
if (ret)
	return ret;

return 0;

and return directly ret for all cases.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 20e77b374f7e..74729ec8423b 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -340,12 +340,10 @@ static int mchp_spdiftx_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	ret = regmap_write(dev->regmap, SPDIFTX_MR, mr);
 	spin_unlock(&ctrl->lock);
-	if (ret) {
+	if (ret)
 		dev_err(dev->dev, "unable to disable TX: %d\n", ret);
-		return ret;
-	}
 
-	return 0;
+	return ret;
 }
 
 static int mchp_spdiftx_hw_params(struct snd_pcm_substream *substream,
@@ -841,12 +839,10 @@ static int mchp_spdiftx_probe(struct platform_device *pdev)
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &mchp_spdiftx_component,
 					      &mchp_spdiftx_dai, 1);
-	if (err) {
+	if (err)
 		dev_err(&pdev->dev, "failed to register component: %d\n", err);
-		return err;
-	}
 
-	return 0;
+	return err;
 }
 
 static struct platform_driver mchp_spdiftx_driver = {
-- 
2.34.1

