Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3983AE456
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 09:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65D916BD;
	Mon, 21 Jun 2021 09:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65D916BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624261422;
	bh=FDk7tLKzBImEqf54cmh7+rVnANAoHJfCgpsgCKqC8tM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fx0GcT8vQsAlm/yDdEibyfqtJs6b6mM1eUrioa3ajhGKHPxlaTLLhZ5Z1Hx41AdRx
	 7DjUcR9KHpCSaIsx68m4aWoKZU3HJSP/RoH524TM4LDfdwjMXo/mpMjufnyFVTcz2i
	 j0Bg8LizeB3AeSx8yE8LPXnqqXYHkz5RqGfx+JTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23E5EF80111;
	Mon, 21 Jun 2021 09:42:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98699F8016B; Mon, 21 Jun 2021 09:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95492F80163
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 09:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95492F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PW1xTA2/"
Received: by mail-pg1-x534.google.com with SMTP id y14so2039451pgs.12
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 00:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcRAvrQip+1WJuNclasUdgOdAuaWVTSb28lQVa+Hq0U=;
 b=PW1xTA2/2xO4PqExn5V1DOomUzRaLUlMK7VPvDZAnglAjgj3HF0HR4tTvM1Jyq4Xo/
 lbz8+BPcBz3r6RVcMPnk5m2CUnlfe6Y1yZGbO3GZ9ucEhXHnuWrpQe9DBX2P9BN4xpy/
 k0U3/0P/720ja+nHXJ775gb7N3AE3nuCG4Z3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcRAvrQip+1WJuNclasUdgOdAuaWVTSb28lQVa+Hq0U=;
 b=QUSeVTaC7stgLuOTlx0fqevCnT/GXdgWIVlhOpkQtihWlxhN9VNXaFR00wImKoUrq/
 c2VOsqUP9CO61wZ0+FMGhCrxLfvWGYYpzWoP4KTOskzvTP/YDi/igPoXY6RW6vQNIm3x
 O5/TzWZJeOyZSpxS8fgqeWFWGXSXdXt3VUEodLP9sLrxKL/raupbjrmFf3ihJrKlFAsY
 qWUztdksS4GaXwRx64dH7iaRTnM92VJfQvIBKjiIZLKdqKJS33/+HXJ0Y/JXmeZ1KR9k
 IjZleRm8FMFClVMQZKub7LT2y6M9FN4c6yIIuuB7Kzomt1zSG/WMpqBYaB6nSeTP0ovn
 cklw==
X-Gm-Message-State: AOAM5335PU5cvniw2FHIoe15eiWYEnC32S2USHj/twkZBdGFp18G8a/y
 Egtc1CbEgSY7jARuuC3rAAnLPg==
X-Google-Smtp-Source: ABdhPJxkwpEFihejVk1nobo1GrlcMvMr+6qs8f9VpwqRVo8xZY9eo8LzrK9zu5A5PICZlxCe0KZu7w==
X-Received: by 2002:a63:e245:: with SMTP id y5mr22455461pgj.171.1624261320340; 
 Mon, 21 Jun 2021 00:42:00 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:5a92:9d6d:3875:d2ba])
 by smtp.gmail.com with ESMTPSA id 10sm11954195pfh.174.2021.06.21.00.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:41:59 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
Date: Mon, 21 Jun 2021 15:41:52 +0800
Message-Id: <20210621074152.306362-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, judyhsiao@google.com, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>,
 Judy Hsiao <judyhsiao@chromium.org>
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

Support for loading the snd-soc-dummy via DeviceTree.
This is useful to create dummy codec devices where we need to have some
DAI links without a real Codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 .../devicetree/bindings/sound/snd-soc-dummy.txt  | 16 ++++++++++++++++
 sound/soc/soc-utils.c                            | 11 +++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/snd-soc-dummy.txt

diff --git a/Documentation/devicetree/bindings/sound/snd-soc-dummy.txt b/Documentation/devicetree/bindings/sound/snd-soc-dummy.txt
new file mode 100644
index 000000000000..7fa8c5751e62
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/snd-soc-dummy.txt
@@ -0,0 +1,16 @@
+* snd-soc-dummy
+
+This node models the snd-soc-dummy.
+This is useful to create dummy codec devices where we need to have
+some DAI links without a real Codec.
+
+Required properties:
+- compatible   : "asoc,snd-soc-dummy"
+
+
+Example:
+
+dummy_codec {
+	compatible = "asoc,snd-soc-dummy";
+	#sound-dai-cells = <0>;
+};
diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 299b5d6ebfd1..def2cc687415 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -7,6 +7,8 @@
 // Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
 //         Liam Girdwood <lrg@slimlogic.co.uk>
 
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/export.h>
 #include <sound/core.h>
@@ -181,9 +183,18 @@ static int snd_soc_dummy_probe(struct platform_device *pdev)
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id soc_dummy_device_id[] = {
+	{ .compatible = "asoc,snd-soc-dummy" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, soc_dummy_device_id);
+#endif
+
 static struct platform_driver soc_dummy_driver = {
 	.driver = {
 		.name = "snd-soc-dummy",
+		.of_match_table = of_match_ptr(soc_dummy_device_id),
 	},
 	.probe = snd_soc_dummy_probe,
 };
-- 
2.31.0

