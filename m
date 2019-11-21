Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FD105838
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 18:14:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02F11798;
	Thu, 21 Nov 2019 18:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02F11798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574356443;
	bh=Yco2H4Wz/2GZY+uz1xLsCAeKvY60o0BeTAtCvGUlr2U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AbbNbd+Ny6WYrfE/idvNr9wzpHArGCu1ZlQSojecOjPL19Pk9Phv1tftMqOjvqX8p
	 2yoo7bL8Q29N9ZoqPNixhbgCkI/pfogMKPso276zXB8K3rhZTfQEnuTdSq3/1wpmog
	 ycvrdklLF8a6JK85YFcYSCWTjIio9j/PC9NwV3Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CC42F80260;
	Thu, 21 Nov 2019 18:06:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04BEAF80255; Thu, 21 Nov 2019 18:06:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6972F80234
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 18:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6972F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OiGjZ/6H"
Received: by mail-wr1-x442.google.com with SMTP id b18so5327697wrj.8
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
 b=OiGjZ/6HgFqifxkfowVtJjQqTqFfdS/ToscQHYZuAZ457wTJBcCYUY+ZlWODG59Bha
 GghowrjEwvVNEf8bryAhzrQm36CGD+RvjQpy6Z5PWKv5tmhsXmuTJpd2JjpPV6vrC+iv
 AM7zvsDjFlJY9Pn/ieonZa0PmbpX2NUPvzn+APuOy8HBuOrvBXuevczg+Nh2fLbz+I7R
 ZxCE148bKqFoPCYxbQ8SCeTh3k9c+/cdJ91DJxX9YjomlnMhaOEEbuE3f4L4HPCgvBxw
 F1e5g7qgsWnrgyDbPl70cSDThUZ8WFcRBIL4GJ/3erLwkKfg8FAh7oBKe0ebBWEDmVQo
 petA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
 b=hBH7w3tfxt5l4QRQdn5/c79nfGTKZqzWF1A6Mg/BlalGYorsYwjS4vc9Y1rvW/AOj3
 IXsRodqPFkkTCvjoQJHCXPdWRNdeo4hzzjXe2IqM3e8IRmuo69MN4D278lweP5gWtEyB
 Ov1fcNoWp0g99hc0MaUZNFnLExL0UPP+2JLsV5/7SeYTqniZwA9m6gJnj21jw3Mx/ibk
 t8Hab2GO3G9nnwOJ0lwobSfEk2dKn6uRpma7qfRGiOoveZQqpbtXj21aEsK0vI3ZHU81
 YrRMStmCwXfwa6n4TWx5LkvPV0Ks7yFMH2OeJ/NNtmS4hcmhPN+L6QBKSQuOvL8vH8dw
 4oAg==
X-Gm-Message-State: APjAAAXafBwoeLsWBw6NHqwmRcRnxMctFmTi4pLwGV4hWJXLUwkvUwCe
 gvLuWOlgI4AydOPKkNmfkdfuxA==
X-Google-Smtp-Source: APXvYqxxTp8LzEjyKmHdLa9JtltjBFMatq0lqKOl/TmxVgxr67cJZBCxg7paChQjot9qRNj/gCVHQw==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr12049689wro.322.1574355960208; 
 Thu, 21 Nov 2019 09:06:00 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id i71sm4423731wri.68.2019.11.21.09.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 09:05:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Thu, 21 Nov 2019 17:05:08 +0000
Message-Id: <20191121170509.10579-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 11/12] ASoC: qcom: dt-bindings: Add
	compatible for DB845c and Lenovo Yoga
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

This patch adds compatible strings for DB845c and Lenovo Yoga C630
soundcard. Based on this compatible strings common machine driver
will be in better position to setup board specific configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index 408c4837e6d5..ca8c89e88bfa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -5,7 +5,10 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 - compatible:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "qcom,sdm845-sndcard"
+	Definition: must be one of this
+			"qcom,sdm845-sndcard"
+			"qcom,db845c-sndcard"
+			"lenovo,yoga-c630-sndcard"
 
 - audio-routing:
 	Usage: Optional
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
