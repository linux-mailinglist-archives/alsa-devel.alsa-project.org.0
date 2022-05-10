Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E996521EED
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:34:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9D7182D;
	Tue, 10 May 2022 17:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9D7182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652196891;
	bh=UtHvA/2tmkAUzu7O2aW9JjKr0ZJT7KwjmXXw+uM3/pk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTYRtxo1Y7+x5422TmczEznPkkHh2DdANjDcSBnPq4b/IyTysNXcqUofAUgt9D3UE
	 hiAkit0HYjYFmCTDL8nytVdMl3g+7F1FAKaeWisiCZSpvOREawK9IXSKFoUI9QFqqj
	 SkUs3atr/4uf3wVXdjI6ukSQTSdOIOG4dj/ofQdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B510AF8011C;
	Tue, 10 May 2022 17:33:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E71D3F804BB; Tue, 10 May 2022 17:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F5E5F801F5
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F5E5F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SqlnRkOB"
Received: by mail-pj1-x1031.google.com with SMTP id fv2so16190150pjb.4
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XgBcNoHF+H5YHWhoRdIUmpBDPDoFkHi2u+F0mxHHboU=;
 b=SqlnRkOBavZUfRbJwMbK/YH4lJboO/H6W9MGbF1Yr8P3VdOycLTYi6X8sxipFmctzz
 Sip8xnN1tVt+E+KB3GObsdE4JlFanBX/u27osIqtF0PSPAJ1XR1F6QACv6LQIc4U/dyr
 7jwaKmTINGJsQxtoXTY7xQt+ULsVPni3miKhV6QEWS8GpL0apIdYLDp4iizJ0IwJcrGO
 Z1kAXxv/Gg20ZCFB5DSXa7QGkB1NNF9jcxOpv2NgM7kfpcR3+mRvB6jQKpjcoKhg0ZzR
 AlHth8RnP5dD7DJ7f9MwHjTrZuGMgQcr4lFnA96B7sJJvi+GRlZtDzbImfHt7wyaFTvi
 z+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XgBcNoHF+H5YHWhoRdIUmpBDPDoFkHi2u+F0mxHHboU=;
 b=Y/7Z6IcktkcnLqssAfMzUcjUS2YcrdjqW9quWQRX8zPV5+nHKV2zgc95/fwjK9HcuZ
 RG15qCWwl14SMjlQV3mhG2RfXdzSPD/6erUWYc3riDMNv+OdNgg3pI3Hcn4qdp11SbiY
 PhDlFAVxJqVj2KB4iynTc+9pU0bpUf/66tWRZF3j6pcNEFAwjTlcDFAVxY6bzP0xaVXa
 pcWydvevK/9bdHmrDSxF8+c4zE2RUMEqJ+qkF1He1RrxPkgBbzeD8vbDDasGJ82apQXS
 l9S0dT2UoOCc5XXy6gUQ9TSYtNkJUXhcDIgGVl8NBiGlmyu2CSSBiql91+xmoDx3Tenb
 6YQA==
X-Gm-Message-State: AOAM531aCY2gG7GgcBt0fQAsVVvywspM/Cu5Vtti/8clJzuWmCVXbpOy
 WBf65yZah3LcWQQ6cMt4cQ==
X-Google-Smtp-Source: ABdhPJxIg+lFFBXwy/xu/9dN8ld18Dmoa8zxjI0DMkcnvYRYOp5IZmTm31F5Gz51fbFrsofGjLfMyA==
X-Received: by 2002:a17:90b:4a90:b0:1dc:aec3:c04 with SMTP id
 lp16-20020a17090b4a9000b001dcaec30c04mr546709pjb.118.1652196798797; 
 Tue, 10 May 2022 08:33:18 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm11104248pfb.170.2022.05.10.08.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:33:18 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 oder_chiou@realtek.com
Subject: [PATCH 1/6] ASoC: cs42l52: Fix the error handling of
 cs42l56_i2c_probe()
Date: Tue, 10 May 2022 23:32:46 +0800
Message-Id: <20220510153251.1741210-2-zheyuma97@gmail.com>
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

The driver should goto label 'err_enable' when failing at regmap_read().

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/soc/codecs/cs42l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 2c4e09b43199..dc23007336c5 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1245,7 +1245,7 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client)
 	ret = regmap_read(cs42l56->regmap, CS42L56_CHIP_ID_1, &reg);
 	if (ret) {
 		dev_err(&i2c_client->dev, "Failed to read chip ID: %d\n", ret);
-		return ret;
+		goto err_enable;
 	}
 
 	devid = reg & CS42L56_CHIP_ID_MASK;
-- 
2.25.1

