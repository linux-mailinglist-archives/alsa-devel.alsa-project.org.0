Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 020943782FD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 12:40:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6255116B2;
	Mon, 10 May 2021 12:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6255116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620643224;
	bh=pw8lkg9Y4NwZR01MUli12m9JgVNevbjcP/JFg6j2CSM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iAmRHrty7MuEyPR7xeKukNXOwklNO6TrtWTjHUXMj9MrWiZ+34ja42oHtREh0bBl4
	 1u3m4itm53E8lRma/0Cpj62jjUlYhaG3w1OOnzc1pyDagussGw+DvtxkltTZoQs0jg
	 aTNLInhUqrjYPFBPjRh2fvsKBIXTNTdf9rOehIsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1351F8020C;
	Mon, 10 May 2021 12:38:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AC1EF80240; Mon, 10 May 2021 12:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18C4CF800E9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 12:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C4CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NuhWo+54"
Received: by mail-wr1-x42b.google.com with SMTP id l13so16048373wru.11
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 03:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Prd7IRa+ZjrFAJ2l9tG9om0bmi1tNmgIcFpqkLdVso8=;
 b=NuhWo+54thqqc6supEKfQxC6/OlcJeHSBZV2wKNM8FXf1rp/G+p34TWHidArw4GZK7
 Qo/UGOk5atuqwWGVqARjwx6G3ZFQqw7c/SeJL3FR9C5lHrA124/ClYt3hNvMrXTHFsh7
 wqplJa90tPOPGEWwUMTCwyErLOYYigo4akoRNht5C1jSBTbowLBeMgITVQ9AVtAKesxO
 rOD+7dl+1nmOrCLZbqLBy4GD/agqRW1Zn5zIqYm/FUOiHx9QoVnafgZOFsZ31jWw6Kbq
 O27l1HXZ4B9H2Y38yInMxBYf9eQpCYHW9uwQ1M2OE7JK+RCQyt/CUTk2QW0l6vqNvJJS
 DuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Prd7IRa+ZjrFAJ2l9tG9om0bmi1tNmgIcFpqkLdVso8=;
 b=BtGVOfhlS2uaxcfTOt0PlGgV7XDS+DmxSUDuJ8VtGucQIp8Vf/YfGlcEY83ChPirWi
 l1uUYM6nFYAHJb6GBsXmDAOygixZ3xxYD2AG4fLhmmZv/YeOFoGE7aDACVPYxDK7zaOe
 pKquS1RJ7Jqu5L7/QhFqiMQcLUfxA6Ubqj1BE6kWxa9PGa6vEY4qQP40woF1u0/DHpXH
 BWT4Y0X+ks0/3Kf07w4To7yKKVdutMTcaVs/qCvruwbTCKDr4gEzTRotaqr3c1YTuu85
 1AhXDjMUu0/LUYRfqlG/bRECR+w4bdHTtEx34WihY4+YignrHkFPBav6hkhYohwvJsn1
 jOuw==
X-Gm-Message-State: AOAM531koUFzTNyBDZjoinG8qW+R5VrvjyERH+xKc9jXlSyZxPVKo2sO
 Qab/k+V2QS77H5yRQqerO+t0xQ==
X-Google-Smtp-Source: ABdhPJwa6IkT8s5sItmkcKt+12m+tAbUxpwWn0JQHjuk3Z7CgKM3vnSR2vC1+VQFJherkPDIUIMrlw==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr30213979wrp.159.1620643127467; 
 Mon, 10 May 2021 03:38:47 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d127sm25055313wmd.14.2021.05.10.03.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 03:38:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: lpass-rx-macro: add missing MODULE_DEVICE_TABLE
Date: Mon, 10 May 2021 11:38:44 +0100
Message-Id: <20210510103844.1532-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
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

Fix module loading by adding missing MODULE_DEVICE_TABLE.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index b0ebfc8d180c..171ab7f519c0 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3579,6 +3579,7 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 
 static struct platform_driver rx_macro_driver = {
 	.driver = {
-- 
2.21.0

