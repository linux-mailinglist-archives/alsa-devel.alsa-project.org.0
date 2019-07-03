Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2B5E40B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 14:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B40D41693;
	Wed,  3 Jul 2019 14:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B40D41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562157289;
	bh=veWbSH4+oi9lAfQQcCHyDvstQo1Cr6jgmOIOJKWefVM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uD8cI4Vj6OQOz/ZGkmVbhtxpMPeITHsxYCbGu6jwdqjOra1EiYvwnGPXQxVap7rgq
	 P9D9hxvX/iuZ/36Bcfmq2mPb0Ad5jJnbIVE9ZI7EaBeP7Ci5eogGI22Hw7WGq2/xt4
	 UrkC1JGOytCKCWj1WNj2QCTTVKIxPk6D29GBpNbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9FCBF800EA;
	Wed,  3 Jul 2019 14:33:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D5DEF800EA; Wed,  3 Jul 2019 14:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5D45F800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 14:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5D45F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lijGmtWq"
Received: by mail-wm1-x343.google.com with SMTP id a15so2020357wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjO3V+UX6vh5Mu28TxXECXbVCg9js/SZ+Ofw478Q6MI=;
 b=lijGmtWqR/Ej83Ci+HFtTZWHRbozsRAxCyOhell7587whgHelOwdfEYDS7PNf5nXOV
 IEuCOWpjxLO1aO5IbLEmNXcchs+IvlOuK6CG9FDDih0ADRhlPAJQ4XCmBKR1CBeSoPdY
 2HI138oQq5SBSsph6ssCV4mgKsPN70RcjhZnSIhHnw3RJRfS/nuaxNt34Gti/CUl0Je3
 poUJVYvi/fFdYEEI4unNXqCK3tYeZ3fq81g2x/LO2/wKwZPIGreru8dzpdeSXNVfPS3O
 XB3apTDXHEwNQPOnoPIlhxo5cGl9MTqTrq8Y2MMR8RWDJx7RoFTVGVP6GJNjgZ0fi3Oh
 sQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AjO3V+UX6vh5Mu28TxXECXbVCg9js/SZ+Ofw478Q6MI=;
 b=lSAPsJ6gefWyKkXJjxQ8uytRYy07XhPGKT7qS+mYfYennyt+0zZvJ3rN3eDkCOb0hW
 y8GK3LU0/gKBwAH4A7KOxARf0UUhAAyp1y5Wd63PFtP0iAm7ErQjC4x1itdLqpSkWJ6X
 Go2eaMI2Nr/IzHU0FUcWG1vtBdelXusJm6EzaCMDdBN/9rh8X0Ww5wOf6v9xq1Ko3EG0
 3yJyLzGnC0chXET6bjzZ1N8+v6QW3H5VSvl+Gq53PJH9GSYZuNYrMswyYuHnSYdpiVj1
 CiqtKS/0/hukO30J0ULBP0PX6z8suZURu6d/Jezj762vJQLu71rVMk9e9cXZBmo/a+lu
 H8mw==
X-Gm-Message-State: APjAAAVzirzPuT9vIRBK5Q3Qx7c5OW5ypteur487gXwe7QDy2Q07ZzzM
 FKOiFBtgXeGnsgMNyHmKJbukJA==
X-Google-Smtp-Source: APXvYqwwlegLws6K4NSerP+3pRRV0y8s6sLXlI8GaLwJ/PQfp8H+FaNcFgG5BuOya7tBcNWMZ9i8MA==
X-Received: by 2002:a1c:2d8b:: with SMTP id t133mr7946631wmt.57.1562157180009; 
 Wed, 03 Jul 2019 05:33:00 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id r3sm2084195wmh.47.2019.07.03.05.32.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:32:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Wed,  3 Jul 2019 13:32:57 +0100
Message-Id: <20190703123257.27228-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: wcd9335: remove multiple defines.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Found during review that there are multiple defines of same constants.
This patch removes them!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 6f205638a8b8..da6c50ccecd9 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -87,11 +87,6 @@
 #define WCD9335_DEC_PWR_LVL_HP 0x04
 #define WCD9335_DEC_PWR_LVL_DF 0x00
 
-#define  TX_HPF_CUT_OFF_FREQ_MASK	0x60
-#define  CF_MIN_3DB_4HZ			0x0
-#define  CF_MIN_3DB_75HZ		0x1
-#define  CF_MIN_3DB_150HZ		0x2
-
 #define WCD9335_MBHC_MAX_BUTTONS	(8)
 
 #define WCD9335_SLIM_RX_CH(p) \
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
