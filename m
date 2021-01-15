Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFD2F73E3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 08:55:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9AC17BE;
	Fri, 15 Jan 2021 08:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9AC17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610697314;
	bh=q8S0UB6OEBN+Hv3y1TrymGT9OPTLdSx5LOK7PoeAr7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EXPtAK7DaxDHYvLwSV1FIRx0QcpLx9Ht0BnvHA+dEQliBNq9tIbwoK/Fm78nTaS6+
	 Sl3m2esy3V4n4aXIQrkoyWWSy2XaQYBzCVaeODRfN3EACUWbKPsuHNu+vbkRSiYSrY
	 hn6hS57T9atAn/5tnbjpk4HJhQ6twOLxide5X/xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB1D3F8026D;
	Fri, 15 Jan 2021 08:53:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18579F8016D; Fri, 15 Jan 2021 08:53:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31E07F8016D
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 08:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E07F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Dmse58G/"
Received: by mail-pl1-x635.google.com with SMTP id s15so4282338plr.9
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 23:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MbBZrDP4IrIPZxUvjAYid9N/Fa9d/bofmIE0flpsVB0=;
 b=Dmse58G/vKR25BWNNFJR75Iv5H2awuqE5/NF6KzNjEV+sQ0TtwrrDNUZ9dtpcBTOIi
 IHSQ7Uqlkr3OHOrWjHL0e17tkDBCrnj7zEj32Uh5tLtCJ8DLoCTj5yCtpVy2hQPKMo5G
 u9eSOHRju7b4ZwwQnSSPyWb3ltRx+vN/AjDIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MbBZrDP4IrIPZxUvjAYid9N/Fa9d/bofmIE0flpsVB0=;
 b=j9Tn39NS40W/oX2TrOBMb4OKkaLtv6uFBNsINUqEkV6Wbhk6ymW2cxK7WmjzHX5q5l
 23WJtIhroZbMDM5+3z5kA+df76cxTotmsYG8qz+Uzr3VLvetQmTrYUnyP/yaORCgcXM3
 S2ctAsWJpf8Sl1koHIIYq/yRoIgDPhobc0gT44bfFvVj0MO0GAP3A7peNQQYYkMqAJZu
 iwDI8o19hVqoYhmVmvSzC0FZ9CT2KF5i23mSSXYYe4J5OUL5V3RlrqTIvRIypp+h5Rve
 IOzKx6GPAFo2HwnvGuBYaXYLSrS83zRtfTk8vO664lRn7T2vhNKOVJpW9f3wIX3nuttt
 sQxw==
X-Gm-Message-State: AOAM532WBWGZcGNnbjxBGZ/KDClk5Rb+tIb7/T+jCW4l5jMTL9SWXqLT
 vtlGbfe2wHHvrm9R8Da1dXjb2g==
X-Google-Smtp-Source: ABdhPJwwaXkf6UapnuX17hkLlro4eGY9ncbgFIiB2O6mEloQCt26637wgpmH7rEeVUtD0YWCLmTgGQ==
X-Received: by 2002:a17:90b:78f:: with SMTP id
 l15mr353390pjz.234.1610697196496; 
 Thu, 14 Jan 2021 23:53:16 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id e5sm7531175pjs.0.2021.01.14.23.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 23:53:15 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] ASoC: cros_ec_codec: Reset I2S RX when probing
Date: Fri, 15 Jan 2021 15:53:01 +0800
Message-Id: <20210115075301.47995-2-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
In-Reply-To: <20210115075301.47995-1-yuhsuan@chromium.org>
References: <20210115075301.47995-1-yuhsuan@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Mark Brown <broonie@kernel.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

It is not guaranteed that I2S RX is disabled when the kernel booting.
For example, if the kernel crashes while it is enabled, it will keep
enabled until the next time EC reboots. Reset I2S RX when probing to
fix this issue.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
Updated the info message.

 sound/soc/codecs/cros_ec_codec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index f33a2a9654e7..c4772f82485a 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1011,6 +1011,18 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	}
 	priv->ec_capabilities = r.capabilities;
 
+	/* Reset EC codec i2s rx. */
+	p.cmd = EC_CODEC_I2S_RX_RESET;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret == -ENOPROTOOPT) {
+		dev_info(dev,
+			 "Missing reset command. Please update EC firmware.\n");
+	} else if (ret) {
+		dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
+		return ret;
+	}
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-- 
2.30.0.296.g2bfb1c46d8-goog

