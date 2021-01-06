Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8F2EB934
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 06:08:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08AD686E;
	Wed,  6 Jan 2021 06:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08AD686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609909683;
	bh=qq8btwwNVAS26MkIndQR7HvnBqko/OuI+G6k1r3Oqqw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZpAKvfcWUo9R6cJZZa2hMBZycpraZEgdrbyTzahy9I2+SvZD+DCR7fbun3lHG+Gbu
	 Z7/d7nkCA9Zd5AEeL2+w+aoKbn6pZxeBjyoyIE6WtN1SD+P7X1FE8lQfUICwMqcajo
	 QAChi22XxZE0wLdldruuFEnTasMGDiUazzAI4hk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73D7DF80167;
	Wed,  6 Jan 2021 06:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E85F80166; Wed,  6 Jan 2021 06:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8917EF800DD
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 06:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8917EF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="n6ErXUBc"
Received: by mail-pl1-x632.google.com with SMTP id x18so964895pln.6
 for <alsa-devel@alsa-project.org>; Tue, 05 Jan 2021 21:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+jp8aijiy58DxcPOl4wMV4A6IsbTlkbWpcRF+h39no=;
 b=n6ErXUBc9DzTkG9itHjGJ+eQztJ4nFXJ0bEjylysEqFfyomIYNiuZEeopa9+2QrQFb
 dgXajEXrK3vArf7eJM0inY9jm4f6O+quKZZWNf8KY7Mu4te/M+crpoedpBfQjeo0sn2j
 W7DWx2Msdwgc239HhH7U79VtA9+bjoAJG+nBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a+jp8aijiy58DxcPOl4wMV4A6IsbTlkbWpcRF+h39no=;
 b=Tncy9FxtQVCYFcUrE4Pc1ERT2z/Zr+8VJD6kmZvI2gaJgBrQYET6lBlGFdp17R4fhP
 jzPmQlTauBlpgXcIRpqnU4rUxgll0v1bFcwutr5+ZsWMgG2zZKncZtuwYIxFgIpyFLdv
 VAc6PB/J/Q5e0abS0AVE6SENLzXehkqdITYI1ygg6Pm0pF8REfngvKCRzgv9XQvamLw+
 2sgcjuoEfn778nMw7X/7Xmcfg1EZQC3xeS+iANvrqNsOeWy0IXEBzpSeGtWIyrnaoYgw
 TW3mLyqOGG3r0oFvoKAuo6O43AlkLXHLewYU4G56JgPUWebP5Dns8MfACAzXVBNuEFWz
 Rvag==
X-Gm-Message-State: AOAM533M9ZyWlVG0n3+NWHSzdOtUzbwJYTBMFIp7LjB//saL24uM10PF
 mLDXEbclFg4QCoDKmYFcfbs6zQ==
X-Google-Smtp-Source: ABdhPJyCbhXlMX97B3jAUFrMxSj9rBddxh5FIX/r5Xx2XIEuyf28wNRiNg+HEbpL3MWu6IcVctaf8w==
X-Received: by 2002:a17:90b:1983:: with SMTP id
 mv3mr2580134pjb.211.1609909567741; 
 Tue, 05 Jan 2021 21:06:07 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id h16sm931002pgd.62.2021.01.05.21.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 21:06:07 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: cros_ec_codec: Reset I2S RX when probing
Date: Wed,  6 Jan 2021 13:05:59 +0800
Message-Id: <20210106050559.1459027-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
 include/linux/platform_data/cros_ec_commands.h | 1 +
 sound/soc/codecs/cros_ec_codec.c               | 7 +++++++
 2 files changed, 8 insertions(+)

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
index f33a2a9654e7..28b3e2c48c86 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1011,6 +1011,13 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	}
 	priv->ec_capabilities = r.capabilities;
 
+	/* Reset EC codec i2s rx. */
+	p.cmd = EC_CODEC_I2S_RX_RESET;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret)
+		dev_warn(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-- 
2.29.2.729.g45daf8777d-goog

