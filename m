Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D287B6D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 15:38:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA3EB1668;
	Fri,  9 Aug 2019 15:37:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA3EB1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565357885;
	bh=YH4YPYd7MAOVUUb1bcQhP2rTsfrct1p5HjF1luw4zeM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rgUbmU1w0FwSBMs52msUVYYNxMQdHMujrlUKZAIv5h6ee6cJYjoh/Wq9wWK27rn4+
	 V7+Xj9P+t/sKHOk+GhjDhIl5reGttHIzVFw+9k2BGLfw2ja1nqnM5+QBkfQZwagaub
	 REa4O4Ux3uhcoKyx4eH1kFx85N8h0QpPH7ss6CWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE67CF805FE;
	Fri,  9 Aug 2019 15:34:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4C68F805F6; Fri,  9 Aug 2019 15:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48CF1F805AA
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 15:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48CF1F805AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aAqbD1pC"
Received: by mail-wr1-x444.google.com with SMTP id k2so12419134wrq.2
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nGnMhbFLMwKaZqSRo6t069vkX6KSorhAL/bGFm/B64c=;
 b=aAqbD1pCduSPQug8H068mIGYwMnydpfRqfrz+BhIM7QDXpCnKaDTBmgbLS3bw4E5fQ
 Mxx2pqI6DZ3uA3kwtP6MZ0kRP11HNB/rIrla8eGBzN5j/t83ccDZW+RPEvTvILLkAD6d
 /jAdkObQN2ftOjazZIIcWBgRjGriE7wnZEn5qAYdaFroH5G+/P4omqlvFmQegmorffWV
 pFttMgy2AobZBENQkjHwUKunOfXRlyQIvwJbdTTjue2iBtJrTWEDawQhYCZJ2jXpGDn5
 NWLWbjGIZ7GqlFa0xt2HDiguu5ym5TJmRYfdfmZZpF6mYjNtIVx0yMtOgQjf+5HNQnhI
 z8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nGnMhbFLMwKaZqSRo6t069vkX6KSorhAL/bGFm/B64c=;
 b=j56Z4OT85UFKzAeUl7Agtla5p5oO/lUx4m4B87/UGxCNTU2aW7jbhTKEPFA1OjLhB2
 f0Nficp7QITpiKtZadz5u3Cl4U1HohZNZhTfRU+WqQdPkjVFu+no7nrtoBz7reCt2lDV
 I9ofwr9BaWqXwxOAsypybLUKGIDhHsVcf4C+jrzkPqw8BDendcZKFkAEgEWGSdrAdrtA
 jXLoJDEjO0bj9Sbm8sOlgt3HVxOHUuyMCLyMT+9FI6oD9ShpyS5vqn4STrpgxiCqkfrL
 lAGVSqcM3nH7Wfta1n3wx0BvK6bVZOx0XDWA3lOBDna3B8b046HMCK6cBWkz/FNpYgjp
 4jTw==
X-Gm-Message-State: APjAAAXGUxhpR7txUyIK28De+XauM6+3PnWlPuS+7FmXA1vzwLxDZR2T
 5qIUTpOq4fuDApjVvoxeCK/ftg==
X-Google-Smtp-Source: APXvYqzU83AJ7CB0CJokv1UGB18ihZ8yZDXGXOlPR8Dh+H1ArA13WdVyGEPj1S3ihkchxV2DRtWsKQ==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr23637150wrv.146.1565357671795; 
 Fri, 09 Aug 2019 06:34:31 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y18sm5674641wmi.23.2019.08.09.06.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2019 06:34:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Fri,  9 Aug 2019 14:34:06 +0100
Message-Id: <20190809133407.25918-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 3/4] dt-bindings: ASoC: Add WSA881x bindings
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

This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
Amplifier. This Amplifier also has a simple thermal sensor for
over temperature and speaker protection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wsa881x.txt           | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.txt b/Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
new file mode 100644
index 000000000000..d2aeb5c58d30
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
@@ -0,0 +1,24 @@
+Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
+
+WSA8810 is a class-D smart speaker amplifier and WSA8815 is a high-output
+power class-D smart speaker amplifier. This amplifier uses SoundWire
+digital audio as primary interface.
+
+Required properties with SoundWire Interface:
+
+- compatible:		Should be textual representation of SoundWire Enumeration
+			address.
+			Refer to soundwire/slave.txt for details.
+			Should be "sdw0110217201000" for WSA8810
+
+- pd-gpios: 		Should be phandle and gpio pair for
+			Powerdown/Shutdown pin.
+- #thermal-sensor-cells: Should be 0 
+
+Example:
+
+spkr_left:wsa8810-left{
+	compatible = "sdw0110217201000";
+	#thermal-sensor-cells = <0>;
+	...
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
