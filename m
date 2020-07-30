Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0560A233458
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 16:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF7C1790;
	Thu, 30 Jul 2020 16:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF7C1790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596119229;
	bh=4SNr9U9n2VqCsk7aFsbLKDBElxT5xp2izbQnFCj64sk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J9aLMKHW4bnBlFJUR1wOjDkzzV1OWC6JYqweETNwL2QRxysl20Uq+8ZXKXPIXF2YK
	 WnRff76S5xTsTdIeMvQtz85yjZdhyQ5o614j0c1AJ0K4e0f6U6mngxXzUvTmW7FNt7
	 omgGdiAblZLacpyqXfbM7yPNj9mX7XOZrbd7Qhmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0EEAF8027B;
	Thu, 30 Jul 2020 16:24:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B44F8027B; Thu, 30 Jul 2020 16:24:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AF9DF8021C
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 16:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF9DF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OpFrdnzI"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06UEOU1u045357;
 Thu, 30 Jul 2020 09:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596119070;
 bh=4n4tczlb66rZ2sALZ2WA0y87szWgkh6JUgil+Oe8bG4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OpFrdnzIw7wxmHUPgpKtZ37mhzn5rW/q0d/QPd4pN9CXUTJ4hXb6bjnz0D2NGYr5N
 7qYpdMRtw5INaLMXh96vNv3rCRP87aY5HCsDTv/pCcMnN2t0Gl+84klcjPBXbwp4ks
 F7y3UBy6m4ov9kBPadPDKstBcPzDTqH0shvsfBDE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06UEOU9r002073
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 09:24:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Jul 2020 09:24:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Jul 2020 09:24:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06UEOUbr023307;
 Thu, 30 Jul 2020 09:24:30 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: tlv320adcx140: Move device reset to before
 programming
Date: Thu, 30 Jul 2020 09:24:19 -0500
Message-ID: <20200730142419.28205-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730142419.28205-1-dmurphy@ti.com>
References: <20200730142419.28205-1-dmurphy@ti.com>
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

Reset the device before programming the registers or all programming
will be lost as the device resets registers to default settings.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index fc7616dcf9b5..5cd50d841177 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -838,6 +838,10 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 
 	bias_cfg = bias_source << ADCX140_MIC_BIAS_SHIFT | vref_source;
 
+	ret = adcx140_reset(adcx140);
+	if (ret)
+		goto out;
+
 	pdm_count = device_property_count_u32(adcx140->dev,
 					      "ti,pdm-edge-select");
 	if (pdm_count <= ADCX140_NUM_PDM_EDGES && pdm_count > 0) {
@@ -885,10 +889,6 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		goto out;
 
-	ret = adcx140_reset(adcx140);
-	if (ret)
-		goto out;
-
 	if (adcx140->supply_areg == NULL)
 		sleep_cfg_val |= ADCX140_AREG_INTERNAL;
 
-- 
2.28.0

