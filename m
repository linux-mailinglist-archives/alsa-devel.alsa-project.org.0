Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 685772A7D65
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 12:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E72551687;
	Thu,  5 Nov 2020 12:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E72551687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604576570;
	bh=CplBM2vUz7W1Uwm4DEa/jmX0irLpd3nI21CTssO1WSE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ufqZbDyOIz7kQMBOCHm/11U9DMwrWoMABFI4jXKlXU+4/Toh91Mntg2k4PpcFulWs
	 daPSo0KWBdPMVwGKXPUugkaZDk3SviyMt4HLd+prk7DO5iQo5EZAIENHhqhD9o1ZZN
	 QIkE8G8UGlMEJXJ4b+ogJhffeRBkI7MnKN9wPSs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A21BF80245;
	Thu,  5 Nov 2020 12:41:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C56AF80171; Thu,  5 Nov 2020 12:41:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E87BFF800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 12:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E87BFF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x0u6INKs"
Received: by mail-wm1-x344.google.com with SMTP id s13so1284889wmh.4
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 03:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2NT4L8anxXm4wXPLVLxmm3DEteISuGR3FP/KLGJpviU=;
 b=x0u6INKsJMHOufY/7/lCh0VyNCFWbYUaHN7ctfYL+qRWXrEuAZumb1autNdeoQlnrV
 k1g3HVrRhdTNG+/Z/co8PwrnifK2W2rH8k9MeUM9i8KAuQ3MzWrUkTPmgthz2rR4YAwQ
 posQdFV148EG+os9lAobSB1P9ka4rxkuxeDc+mBbO2q2hKxTlCEtw1KbrBApiw3OUCyW
 HAKyKjpEw+VCGeiRmbSLQ3FxEtocBrYIirVV87VbPv3UQO4sfgNJWHPYydlUb73SO2Z9
 AOXDP/pjEyLWtkl4+xYcWAV+C2mShsY/EY3nyNz1JF0qQjQSKWeXZvUYVTSugBTRd59d
 aTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2NT4L8anxXm4wXPLVLxmm3DEteISuGR3FP/KLGJpviU=;
 b=lUo0+ECQ+5+kOM4ynkzEy1DATkkW/5PYzIEQJ1dxFvcu5+1sVxHGBY4AesIzBKxHFg
 1TAYB2kQorQigLhEf74pMPqImNg2qS8xyg8fcgEA6mOouIbgOBHqsEFT4Q/WeR/KALI1
 CZYEU95uGSaAJBl9KLuAlKlto+18B2SHzCKZgMoNqbn5E96D0hpw5x+FD+UyN6cZ/oY1
 UIBbd/tyyNpN6WTKPGUIfoT5vkwyaGcIeXxZJssbxK2+bZMAERwSX02RWyeV7W2W/yRL
 ftY37rLnAX8iXbW7OYOAoUP01Byqi3qeHUJo6f87MjkAND4dl5+KPHw2zOqmJnN2Juv3
 WTCQ==
X-Gm-Message-State: AOAM531GQZh7s+SYjLfdFhvVmvsN6GM+KrYak90D1NIOuDEGIYWQzH3D
 jKFxBN9yN1OPwso424PNMxXu4q/pEoGGeOSt
X-Google-Smtp-Source: ABdhPJyyPzkxO4wkBPYj9UA0OxF6Y7OTNGnkUAcf2gff0pcr11t6FZpC3LD9ZIv71Hlwcujx/5IFXg==
X-Received: by 2002:a7b:c242:: with SMTP id b2mr2319563wmj.162.1604576469577; 
 Thu, 05 Nov 2020 03:41:09 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id z19sm2154352wmk.12.2020.11.05.03.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 03:41:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoc: qcom: lpass-cpu: fix warning on symbol scope
Date: Thu,  5 Nov 2020 11:41:00 +0000
Message-Id: <20201105114100.18647-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

This patch fixes below warning when module is compiled with W=1 C=1

lpass-cpu.c:677:22: warning: symbol 'lpass_hdmi_regmap_config'
was not declared. Should it be static?

Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 9d17c87445a9..1fd862e3fd8a 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -674,7 +674,7 @@ static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
 	return false;
 }
 
-struct regmap_config lpass_hdmi_regmap_config = {
+static struct regmap_config lpass_hdmi_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-- 
2.21.0

