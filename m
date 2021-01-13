Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0431A2F4690
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 09:36:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D04A16CD;
	Wed, 13 Jan 2021 09:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D04A16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610525984;
	bh=gZIRajXX5YNojtQIQKJVXoLAyoilxVgCJCy2kNLp3QM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fMBWC//WndKoX50PhKcH3UQeQwsUO+ym/DJOpuYLD76Yh9+EwKij6p8f9KX4dhukx
	 ROjBkHBBsh1/4yhppoE5Y0lTNGc4P06ByoWcR++6eeVwSI54+MQR+rqIqGEbCDzMhk
	 0C76G6g2Pi4HNUrWYdp1NoQR8Zq+L6kziTB1sBL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBFA2F801ED;
	Wed, 13 Jan 2021 09:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE6B2F801ED; Wed, 13 Jan 2021 09:18:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A874F80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 09:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A874F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XWuA0GqQ"
Received: by mail-pf1-x432.google.com with SMTP id m6so781617pfk.1
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 00:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSwrQDNKHkzE/dLDIoYSI3CUIjVfpzTys6BbyA061tg=;
 b=XWuA0GqQJlv9CPO1QVW/xD81wP6jUTcdIxtE7xUYoRhYAFViBwsw3vxHmiEJp6kUms
 Zf2iphER7VLdMPL9ISdkGh8XyH5marNYSPFcGwGlonvueHUD7FO2n9T/soP/jRTH1h1h
 F54mfyb5irhszfs0p/byYQnbDl6d8dXcoFyY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSwrQDNKHkzE/dLDIoYSI3CUIjVfpzTys6BbyA061tg=;
 b=aUfaQsT1VwY4R5DD8XdlfbACCIP1i6F+35xRXXpPkVAJD5Fu/ihYcGvj67uAWFPwUH
 /lG7CoJWivFCP+i6f7s82IFZeJLiU+x6uy7U8N70i5E4shsD6ESvWWMXdtIgQMTDBFzJ
 yctk+IPVJ3hB2aywGkeP10rF37XQnMM80maa9gGtiAjTxU1ZCVpiwUFjQbWm4/XtG8K6
 4EaLTAXA6ZEa8Z3Su2ZKJwmZ01Y0I1lAs1fE/+QVAmNcVsiCC6d07ZmQRyU/NjAzVfDx
 fO5Zhc20rmdcwBoLMwNa8J4wgfBXo1BozeUpJcrngP2M6VVW0NWTO9Y19+Ol1XUk7wKZ
 NWQw==
X-Gm-Message-State: AOAM530mP059m2rrlasZmPC2MqNlE9sSXrny6eD1egwVdb+iBW+Rc2qh
 72ylecZohq3Avvh+T7BNoWji3A==
X-Google-Smtp-Source: ABdhPJwhI66piFVQyHBpPG6KmSS1fIvEVrO+IxPb3NcF8YnYVW5iAr4z92ZPdkY5o3LV+5JWa5aYzQ==
X-Received: by 2002:a63:9dc1:: with SMTP id i184mr1010816pgd.409.1610525875259; 
 Wed, 13 Jan 2021 00:17:55 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id i67sm1675487pfc.153.2021.01.13.00.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 00:17:54 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5] ASoC: cros_ec_codec: Reset I2S RX when probing
Date: Wed, 13 Jan 2021 16:17:45 +0800
Message-Id: <20210113081745.2543882-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
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
This patch checks the return value. If it is -ENOPROTOOPT
(EC_RES_INVALID_VERSION), it will ask clients to update EC firmware.

Previous patches

v1: https://patchwork.kernel.org/project/alsa-devel/patch/20200708071117.3070707-1-yuhsuan@chromium.org/

v2: https://patchwork.kernel.org/project/alsa-devel/patch/20200716170914.3623060-1-yuhsuan@chromium.org/

v3: https://patchwork.kernel.org/project/alsa-devel/patch/20210106050559.1459027-1-yuhsuan@chromium.org/

v4: https://patchwork.kernel.org/project/alsa-devel/patch/20210107085942.2891525-2-yuhsuan@chromium.org/

 include/linux/platform_data/cros_ec_commands.h |  1 +
 sound/soc/codecs/cros_ec_codec.c               | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 86376779ab31..95889ada83a3 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4600,6 +4600,7 @@ enum ec_codec_i2s_rx_subcmd {
 	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
 	EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
 	EC_CODEC_I2S_RX_SET_BCLK = 0x4,
+	EC_CODEC_I2S_RX_RESET = 0x5,
 	EC_CODEC_I2S_RX_SUBCMD_COUNT,
 };
 
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index f33a2a9654e7..d35c57724b45 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1011,6 +1011,17 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	}
 	priv->ec_capabilities = r.capabilities;
 
+	/* Reset EC codec i2s rx. */
+	p.cmd = EC_CODEC_I2S_RX_RESET;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret == -ENOPROTOOPT) {
+		dev_info(dev,
+			 "Command not found. Please update the EC firmware.\n");
+	} else if (ret) {
+		dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
+	}
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-- 
2.30.0.284.gd98b1dd5eaa7-goog

