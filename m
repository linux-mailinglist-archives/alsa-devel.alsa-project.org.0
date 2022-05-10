Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F8521F09
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7CD190C;
	Tue, 10 May 2022 17:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7CD190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652196952;
	bh=lXswoZcQoN2RRxktDbC04Xk/2TpTkf+VT659R/72U1o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/Tg533UVfFI9Vrz2YlXwPyIixZ2dPh/HtuEAcURgB/r7Bm6Asnx7OytUe7CCBV3/
	 4Fqp5GQqNOwAYyXDuzMBvtKWSKpY+30ZTYWkwrM4MAHOnTRn4R++MRoxUdPMFwEnEa
	 uPTlB0x/ZR3i0IhOaIkVRhgLUJ4qUC8pbzkKP/oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB61DF8052F;
	Tue, 10 May 2022 17:33:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40E63F80526; Tue, 10 May 2022 17:33:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82CDBF80526
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82CDBF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oeMMxho2"
Received: by mail-pf1-x42f.google.com with SMTP id i24so15234110pfa.7
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JCXe0wXtApkFt+51sQevrUY9NGf5KMQ0zb0sSdWlRTM=;
 b=oeMMxho23U1nt4kB5/OiiGKWPW0aBfGIBhekswXi29AXRBPmAKIp1Vccofvqw7Y73R
 eDkaGyMh1v+OYfQMI5qUgfRDLV28JFQn34l66u4qjN0f8b1NmnL4EqQH1WA1CSO0nV7K
 iqHI5k+Oh4uvS48sKrApyy3d6jfQgZ1Tee+8Jc/5cNoAfE6CHOHlwA0bj+QJ1r/l2TBf
 A411E2agO4eedeIefsR+oKvbirwIjb4Cva3U/q7vjMgRY6PvDo5LMwAQzaVCzI41s/bP
 9KbaxZ0jt56cMXJnHT5ncSPBJ4yPotcRELk51D/CA+YxLGjWtaB4HFGjr/rMOVa/7U1d
 8S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JCXe0wXtApkFt+51sQevrUY9NGf5KMQ0zb0sSdWlRTM=;
 b=NMkZAIlGnX9YTnrIgzd1bqVEn0Iq+m0f5DAHYxQDYXge7TfqANm+l6S+8FgonCw67I
 ENlgakz9TsOD6mqA9npK18x6Eixdazmqhz+bRvc6Lo9Jk9h7Dw5o+ns0JehRJs5BpuuE
 QakODNdk0xMLxSMn77sFZ316TMEMtrn3r4uF18TF0jJVrzedJLOppvm8wI8+qy/sQHGY
 KvTEl/eFctx/hlDdhGW3KBRI0fZsHBSyMhW8e8a+rGqCVz74soOFXjwMKMrkuhbiVCYY
 nE+iBdF/NPFAP8ribm8Q/wDqPHFtw4ohh8D/yEo/BHYxR8JqGBxygVCz0XInzDTULy3e
 8Iyg==
X-Gm-Message-State: AOAM531vW3Ggw7qfpSSry8QDwj3lDUw+LA+TxKwAtyeqOJjG6Yr6SsRr
 xi8Os6aSnxB1xMgbFxVfmA==
X-Google-Smtp-Source: ABdhPJymdQLmnMeadu7zJaG6Axddm9eIn3kMd/AHeVLO1r8GTjTSUp0gO0bYjtmy+WK69CiGNo8cjQ==
X-Received: by 2002:a65:63d1:0:b0:3c6:25b2:22ba with SMTP id
 n17-20020a6563d1000000b003c625b222bamr17306825pgv.360.1652196830491; 
 Tue, 10 May 2022 08:33:50 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm11104248pfb.170.2022.05.10.08.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:33:50 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 oder_chiou@realtek.com
Subject: [PATCH 5/6] ASoC: tas6424: Fix the error handling of
 tas6424_i2c_probe()
Date: Tue, 10 May 2022 23:32:50 +0800
Message-Id: <20220510153251.1741210-6-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510153251.1741210-1-zheyuma97@gmail.com>
References: <20220510153251.1741210-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
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

After enabling the regulator, The driver should disable the regulator
when failing at probing.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/soc/codecs/tas6424.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index d87444efed37..22b53856e691 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -756,7 +756,7 @@ static int tas6424_i2c_probe(struct i2c_client *client)
 				 TAS6424_RESET, TAS6424_RESET);
 	if (ret) {
 		dev_err(dev, "unable to reset device: %d\n", ret);
-		return ret;
+		goto disable_regs;
 	}
 
 	INIT_DELAYED_WORK(&tas6424->fault_check_work, tas6424_fault_check_work);
@@ -765,10 +765,14 @@ static int tas6424_i2c_probe(struct i2c_client *client)
 				     tas6424_dai, ARRAY_SIZE(tas6424_dai));
 	if (ret < 0) {
 		dev_err(dev, "unable to register codec: %d\n", ret);
-		return ret;
+		goto disable_regs;
 	}
 
 	return 0;
+
+disable_regs:
+	regulator_bulk_disable(ARRAY_SIZE(tas6424->supplies), tas6424->supplies);
+	return ret;
 }
 
 static int tas6424_i2c_remove(struct i2c_client *client)
-- 
2.25.1

