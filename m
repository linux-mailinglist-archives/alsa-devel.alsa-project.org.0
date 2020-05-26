Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6773B1E2978
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 19:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44C8176B;
	Tue, 26 May 2020 19:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44C8176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590515709;
	bh=UnKOSSIs7Zdox0/p3ZVewR7CMoP/oUSpBmgWRGG1pZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oN5jsZ0RMVUgDP+2XNglrhL54TqhgzUUj+GF4/2sXAXpdI8D9k3T0NCQdYhP/b20u
	 U6aHJ6t0YRxIcFHbJ7Q5qyoBDvHEmZnbGFCG9V1QZrWADZ8c8KclIrUkusDR1esG5F
	 CCw/FgpNzkdnZUQSObU2ZCYNa4t/PHP3TV14t6Bg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B42DDF80100;
	Tue, 26 May 2020 19:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7FE8F80150; Tue, 26 May 2020 19:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B329DF80146
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 19:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B329DF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IPEzv0tC"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QHrFmK035070;
 Tue, 26 May 2020 12:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590515595;
 bh=mTjyA08DkTl9/UxPwDQR7QnPE9aXKDpzBvfiE5znuqQ=;
 h=From:To:CC:Subject:Date;
 b=IPEzv0tCFFDQw7n4vfV24DixgLOT2M28LGIPOQM1DWeJ5vM/AzygY1sRE3XlZsPYY
 oUHugbWKcJlWoLzBXVYswhts2Ai4LtTYW/NaQzm7d4weVrQutaCcIR2iNGDlzC7AuX
 y6wwY5SBpSnCdr8XUXM9p2BpFTCU0LZ6M5r4AhA0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QHrFKv094636
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 May 2020 12:53:15 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 12:52:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 12:52:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QHqmCI095113;
 Tue, 26 May 2020 12:52:48 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tlv320adcx140: Fix warnings when using W=1
Date: Tue, 26 May 2020 12:52:47 -0500
Message-ID: <20200526175247.15309-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
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

Fix the warnings when using the W=1 compiler flag.

sound/soc/codecs/tlv320adcx140.c: In function ‘adcx140_reset’:
sound/soc/codecs/tlv320adcx140.c:570:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
  570 |  int ret = 0;
      |      ^~~

This was set but only used in case where the reset GPIO is not defined.
Have the function return the value of ret.

sound/soc/codecs/tlv320adcx140.c: In function ‘adcx140_codec_probe’:
sound/soc/codecs/tlv320adcx140.c:778:18: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  778 |  if (bias_source < ADCX140_MIC_BIAS_VAL_VREF ||
      |                  ^
sound/soc/codecs/tlv320adcx140.c:789:18: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  789 |  if (vref_source < ADCX140_MIC_BIAS_VREF_275V ||

This condition will not occur since if the dt property is not set then
the *_source variable is set to the default value.  So there is no way
that *_source can be less then 0.  Which is what each #define is set to.
The code just needs to make sure that the dt property is not out of the
upper bounds.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tlv320adcx140.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 472d759ba8a3..2fe0df3b7550 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -582,7 +582,7 @@ static int adcx140_reset(struct adcx140_priv *adcx140)
 	/* 8.4.2: wait >= 10 ms after entering sleep mode. */
 	usleep_range(10000, 100000);
 
-	return 0;
+	return ret;
 }
 
 static int adcx140_hw_params(struct snd_pcm_substream *substream,
@@ -772,8 +772,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		bias_source = ADCX140_MIC_BIAS_VAL_VREF;
 
-	if (bias_source < ADCX140_MIC_BIAS_VAL_VREF ||
-	    bias_source > ADCX140_MIC_BIAS_VAL_AVDD) {
+	if (bias_source > ADCX140_MIC_BIAS_VAL_AVDD) {
 		dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
 		return -EINVAL;
 	}
@@ -783,8 +782,7 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		vref_source = ADCX140_MIC_BIAS_VREF_275V;
 
-	if (vref_source < ADCX140_MIC_BIAS_VREF_275V ||
-	    vref_source > ADCX140_MIC_BIAS_VREF_1375V) {
+	if (vref_source > ADCX140_MIC_BIAS_VREF_1375V) {
 		dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
 		return -EINVAL;
 	}
-- 
2.26.2

