Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2F189E32
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 15:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7781746;
	Wed, 18 Mar 2020 15:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7781746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584542736;
	bh=ThSiuj2Zu/xile/8tjkCnZYoCrioGuUGeDdgoTqXjfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8vAI8pvi1wF8Ve2ZLf7+k1aZSDM04Eepl4weZ8CymoPLgZBSCGMsc0fauO0aL/Ej
	 Hwg3SjibU3sVJQhCiYi3Z9Am6yhQUt5o1Q10MqE2XHQ5pISv2x9vH4bbzjhFeXQY8a
	 tk/wnvED2Sk0ialXh9mpK9U34CRpgRYq0JS1H81o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F6B5F802A0;
	Wed, 18 Mar 2020 15:42:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7F6BF8022D; Wed, 18 Mar 2020 15:42:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71337F80212
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 15:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71337F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="TbVj8OhF"
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IEcsvs022631; Wed, 18 Mar 2020 15:42:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qmRrscMq5Bm23UmAjzqLg4xvf0NZtoGZEA7BhOJb94E=;
 b=TbVj8OhFuzNmHhA0OWHk0QYdoahepFdELxVgfVl9jg5UmrciYbZ40CODzLUxVrCckg0Y
 Y2tI2JL39ei2SUegWJYeIGogBmsHdMCKMpwmUjW2OLq4E2B9Okw963GhA8scniEMqb11
 Ieh8NP3loRLqg2oxYTNCmlbMo+7Dk1qaZGNoLgI/sr+rbsBsNLeM2Vmoib6RFkgoC768
 Q8nQaH4wCxBr9Lp/Vy51tU+IJX6otXkX7GFrrvEc2vqRuLoThbKImKSmwW4rTxGoGIGP
 7+c2SHsseqpf1yJAZUYgQURcqY3Tx0xieXmfpzC2SiOaG40+8ELoLD5Hge9zrn10w/5B vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdckqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 15:42:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C0C210002A;
 Wed, 18 Mar 2020 15:42:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F1522AE6C9;
 Wed, 18 Mar 2020 15:42:28 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 18 Mar 2020 15:42:26 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>
Subject: [PATCH 3/3] ASoC: stm32: i2s: manage rebind issue
Date: Wed, 18 Mar 2020 15:41:25 +0100
Message-ID: <20200318144125.9163-4-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318144125.9163-1-olivier.moysan@st.com>
References: <20200318144125.9163-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_06:2020-03-18,
 2020-03-18 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The commit e894efef9ac7 ("ASoC: core: add support to card rebind")
allows to rebind the sound card after a rebind of one of its component.
With this commit, the sound card is actually rebound,
but may be no more functional.

Corrections:
- Call snd_dmaengine_pcm_register() before snd_soc_register_component().
- Call snd_dmaengine_pcm_unregister() and snd_soc_unregister_component()
explicitly from I2S driver.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_i2s.c | 40 ++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 2478405727c3..7c4d63c33f15 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -888,6 +888,14 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
+static int stm32_i2s_remove(struct platform_device *pdev)
+{
+	snd_dmaengine_pcm_unregister(&pdev->dev);
+	snd_soc_unregister_component(&pdev->dev);
+
+	return 0;
+}
+
 static int stm32_i2s_probe(struct platform_device *pdev)
 {
 	struct stm32_i2s_data *i2s;
@@ -921,47 +929,56 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s->regmap);
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
-					      i2s->dai_drv, 1);
-	if (ret)
-		return ret;
-
-	ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
-					      &stm32_i2s_pcm_config, 0);
+	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "PCM DMA register error %d\n", ret);
 		return ret;
 	}
 
+	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
+					 i2s->dai_drv, 1);
+	if (ret) {
+		snd_dmaengine_pcm_unregister(&pdev->dev);
+		return ret;
+	}
+
 	/* Set SPI/I2S in i2s mode */
 	ret = regmap_update_bits(i2s->regmap, STM32_I2S_CGFR_REG,
 				 I2S_CGFR_I2SMOD, I2S_CGFR_I2SMOD);
 	if (ret)
-		return ret;
+		goto error;
 
 	ret = regmap_read(i2s->regmap, STM32_I2S_IPIDR_REG, &val);
 	if (ret)
-		return ret;
+		goto error;
 
 	if (val == I2S_IPIDR_NUMBER) {
 		ret = regmap_read(i2s->regmap, STM32_I2S_HWCFGR_REG, &val);
 		if (ret)
-			return ret;
+			goto error;
 
 		if (!FIELD_GET(I2S_HWCFGR_I2S_SUPPORT_MASK, val)) {
 			dev_err(&pdev->dev,
 				"Device does not support i2s mode\n");
-			return -EPERM;
+			ret = -EPERM;
+			goto error;
 		}
 
 		ret = regmap_read(i2s->regmap, STM32_I2S_VERR_REG, &val);
+		if (ret)
+			goto error;
 
 		dev_dbg(&pdev->dev, "I2S version: %lu.%lu registered\n",
 			FIELD_GET(I2S_VERR_MAJ_MASK, val),
 			FIELD_GET(I2S_VERR_MIN_MASK, val));
 	}
 
+	return ret;
+
+error:
+	stm32_i2s_remove(pdev);
+
 	return ret;
 }
 
@@ -998,6 +1015,7 @@ static struct platform_driver stm32_i2s_driver = {
 		.pm = &stm32_i2s_pm_ops,
 	},
 	.probe = stm32_i2s_probe,
+	.remove = stm32_i2s_remove,
 };
 
 module_platform_driver(stm32_i2s_driver);
-- 
2.17.1

