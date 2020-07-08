Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 579EC218086
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 09:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16E61654;
	Wed,  8 Jul 2020 09:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16E61654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594192404;
	bh=0xhIDkxi2urpYLrfJ27GRGtoflGby4z2+mUU8u2mMrQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RBD3/2ctcwfV79dJy40Wo9N/2J3/0izN+KegL/NVGo4ZBAN4iGcsdeY+/Lxbxl5l+
	 jp3a0IakVoNtXODY+35etaoJdp9m5Wqsr7tGk35VoEh+m9cYlQ4k7Ukv8C68cIpmL9
	 qwgmSwN6JKNOZuExb/9V9YR+gqtj0TK5eSxzWCuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA434F8015C;
	Wed,  8 Jul 2020 09:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7497F8015A; Wed,  8 Jul 2020 09:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75240F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 09:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75240F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MFfhw4Ca"
Received: by mail-pg1-x543.google.com with SMTP id z5so21225183pgb.6
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+a5Yprqxr4YrC8ddRW3zptpr1c8vgN9ZuXvWQPKlFVg=;
 b=MFfhw4CakjJVB9f0UmWu8pC0qAsbx035oeNJnZ8AZNdtg7Ji/ZCHbJVR3yXwhItAPs
 F0QRtUCO6DB/ikQWHkEDO36hf7A63FNsqRaDtQPm3wBHQpkrORRfGYteBm9LFZNjOtFN
 IT+sXoF6yYRCFgT+8Y9qMWQMJ4r1ku5nRbo+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+a5Yprqxr4YrC8ddRW3zptpr1c8vgN9ZuXvWQPKlFVg=;
 b=sx8f7O178A80V70JDdTJfhOtkeYyMCO0s8UGrFACPmMX2XnrA0yzS1SdzN5cpyzVtd
 5ZGWqyZr7KcD6LMM6QxTGj79kIO554MCqN9FM5wKwX5igpJo6QCVpvWj0ceMerazpd8t
 wR1RR4u82cQPryIOt8KOJCT9sbmBYHUxMrZDhK+ChJa6GBjZ8QozsRIilQ24B/syg8ub
 OSa3JYag5NsDQ9U3ILMybfWwsn2Gx3cFBX27mTnXneurYsuhdANuNW7NuCGGzv0m/6dR
 ritacm0M7aLXGlwHXfmLzkaLWE9S+jxukUoIupksbuQLUXtBElZxIcGR7drQ0vo6z2YT
 MXGQ==
X-Gm-Message-State: AOAM532aO3bCpVqrsf7hIFnNtoTAoGKbNCYGGuQI17INqe2gl/ZDepO8
 AhH7iGQbyMRNk2el8j2u28318A==
X-Google-Smtp-Source: ABdhPJxPe+FrQXu/yLvuqwBRWqt2yTo1MAuvXoVYQVlzKsLdn7kZhMgTOxEwJgHQeWcJeGRJFQd3jg==
X-Received: by 2002:aa7:9abc:: with SMTP id x28mr27241417pfi.145.1594192287030; 
 Wed, 08 Jul 2020 00:11:27 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id q13sm4694320pjc.21.2020.07.08.00.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 00:11:25 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: cros_ec_codec: Reset I2S RX when probing
Date: Wed,  8 Jul 2020 15:11:17 +0800
Message-Id: <20200708071117.3070707-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 Tzung-Bi Shih <tzungbi@google.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Yicheng Li <yichengli@chromium.org>,
 Mark Brown <broonie@kernel.org>,
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
 include/linux/platform_data/cros_ec_commands.h | 1 +
 sound/soc/codecs/cros_ec_codec.c               | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 69210881ebac8..11ce917ca924c 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4598,6 +4598,7 @@ enum ec_codec_i2s_rx_subcmd {
 	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
 	EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
 	EC_CODEC_I2S_RX_SET_BCLK = 0x4,
+	EC_CODEC_I2S_RX_RESET = 0x5,
 	EC_CODEC_I2S_RX_SUBCMD_COUNT,
 };
 
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 8d45c628e988e..5495214e73e68 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1034,6 +1034,13 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	}
 	priv->ec_capabilities = r.capabilities;
 
+	/* Reset EC codec I2S RX. */
+	p.cmd = EC_CODEC_I2S_RX_RESET;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret)
+		dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-- 
2.27.0.383.g050319c2ae-goog

