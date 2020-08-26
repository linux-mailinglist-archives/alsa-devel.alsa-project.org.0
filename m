Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB225321A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 16:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4A8175C;
	Wed, 26 Aug 2020 16:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4A8175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598453552;
	bh=rf7zsP6dACnKfYBm9zRmVe9qedTxdc/aAmPH+PZPZZU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ptyYfK7T4Vmk41hSlDSP6S3opvW90EQPcHT6PJAwJxAFnAhNEvAUrEYv/XXKHXdQK
	 EpbcPrIhmrwHzbwdExQrNxLL9iyS++h0xs8oPMhjRT6rS3yT+LMqrlEyyUZJrxzkol
	 SLwTb/OrJgXtgSATtg/GA7N1XrPJf+p7JbViP+CE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC958F80299;
	Wed, 26 Aug 2020 16:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D55DF801D9; Wed, 26 Aug 2020 16:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4B92F8016F
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 16:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4B92F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c9Xiglad"
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 859FF21741;
 Wed, 26 Aug 2020 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598453383;
 bh=rf7zsP6dACnKfYBm9zRmVe9qedTxdc/aAmPH+PZPZZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c9Xiglad3I74ATAeJSFUx4soE1XJFBfIApc63HcQhhtLj7XmewZG5doK5QdqT1aIT
 OFE6+VAxfJMgJSmeBVZn7XXhGTdI0pKt1UQt9H5IOW4lupScq5ZhHckGhZ8Z2z4GOS
 3XY6HI9kEePSFWod5449v5PbX+s/Fdsk3B6PdaFA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] mfd: stmfx: Simplify with dev_err_probe()
Date: Wed, 26 Aug 2020 16:49:34 +0200
Message-Id: <20200826144935.10067-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826144935.10067-1-krzk@kernel.org>
References: <20200826144935.10067-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/stmfx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 711979afd90a..5e680bfdf5c9 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -331,11 +331,9 @@ static int stmfx_chip_init(struct i2c_client *client)
 	ret = PTR_ERR_OR_ZERO(stmfx->vdd);
 	if (ret == -ENODEV) {
 		stmfx->vdd = NULL;
-	} else if (ret == -EPROBE_DEFER) {
-		return ret;
-	} else if (ret) {
-		dev_err(&client->dev, "Failed to get VDD regulator: %d\n", ret);
-		return ret;
+	} else {
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to get VDD regulator\n");
 	}
 
 	if (stmfx->vdd) {
-- 
2.17.1

