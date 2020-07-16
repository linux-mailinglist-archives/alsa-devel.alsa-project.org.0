Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C113B2228BE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 19:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1B11672;
	Thu, 16 Jul 2020 19:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1B11672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594919513;
	bh=gqKRr1l6blf7Fw5bGNIj3XapwL4vaMQtEQRs+h41xFc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dIeNa4NHewJvSnWZ5ZJF6wiFmojl1xvmvTKfSY/6Mk7x8nVqjKrpc7+oOGvOY6NEu
	 3ijqxq7dQulvzjWRI4werZF29Ymsv1KoRSM1NOw6uilbTPHBTYxb65Eh3XZIAG77H3
	 6cz6rPUZiQU2I6rJr7PYzHmvG2QxEiS++dPSSDp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F03F8014E;
	Thu, 16 Jul 2020 19:09:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C01EF8026A; Thu, 16 Jul 2020 19:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B814F801F2
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 19:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B814F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ScABqrn1"
Received: by mail-pg1-x544.google.com with SMTP id s189so5140122pgc.13
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 10:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YUV7baZS3QMy6H9iHTF1vq422tSxwwdhocsQIIKpJ8=;
 b=ScABqrn1IiApBTOd3uwWZ9zcKyBA/0MYgYViGsTpujPuZnW3GdtFtgxyBI5AFAzYl3
 fUrxQg8yGnew+6F9JimmYfj2uOabAogHKPhV3U7stmqIjUvfIAn3FmaffVO5I3+Cc4Bc
 vhXwlBO1ze/qqLGqmg/EgekmFJZAfA2nMSGkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YUV7baZS3QMy6H9iHTF1vq422tSxwwdhocsQIIKpJ8=;
 b=YAnPR9ppUaVcElU1CNsxGeZT1RhVEU6VXMfxki/2Y1dkgg1JUjD22KzUIH53TE4eZc
 j3AZA07b+yi1yqrbk2CDdNlQo9K+rccjIUnjABTLr4VoMI9FKOqYVgMfGXt1vdWxrFpC
 pTW6lu5rhzGb+Uoa7SK4f2Nfst0tWh7xuVRcZ/h61VTqjPYZg0HRo9N7dvad6zwWV0Rq
 n+lTUfBj70YrQIWyR+qdk8CsQKJv971xAZRm6PaB2Fr+33hrGakxSTevQ7E/prY9iWRv
 Y+IQ8XjKiBLm7XIb7eWaYb9fqsPn7CJh2bqH0lsxxbFbSJRPCMUUNWkNNQ0/hueVnogT
 E+Ng==
X-Gm-Message-State: AOAM5306Tmp6w1ySdDjqIF4+ysv7gug+reMgWopayZCq3FfSLdE3uUh2
 IsOoVDajE5S8v8gQWzvIDYFlCw==
X-Google-Smtp-Source: ABdhPJwER+Qj87J/ACr8CCYXvpcmu4jIfvu9bYRFuYv8jUqPfgcWzZLmxBY+kzYo551VD6jFfDqMQQ==
X-Received: by 2002:a63:cb03:: with SMTP id p3mr5023403pgg.444.1594919364719; 
 Thu, 16 Jul 2020 10:09:24 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:725a:fff:fe46:44eb])
 by smtp.gmail.com with ESMTPSA id c71sm651622pje.32.2020.07.16.10.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2020 10:09:22 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: cros_ec_codec: Reset I2S RX when probing
Date: Fri, 17 Jul 2020 01:09:14 +0800
Message-Id: <20200716170914.3623060-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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
 drivers/platform/chrome/cros_ec_proto.c        | 7 ++++++-
 include/linux/platform_data/cros_ec_commands.h | 1 +
 sound/soc/codecs/cros_ec_codec.c               | 9 +++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 3e745e0fe092c..2c60690d7147c 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -572,7 +572,12 @@ int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
 		return -ENOTSUPP;
 	} else if (msg->result != EC_RES_SUCCESS) {
 		dev_dbg(ec_dev->dev, "Command result (err: %d)\n", msg->result);
-		return -EPROTO;
+		switch (msg->result) {
+		case EC_RES_INVALID_PARAM:
+			return -EINVAL;
+		default:
+			return -EPROTO;
+		}
 	}
 
 	return ret;
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
index f23956cf4ed84..b5ff30b7f1aa8 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1034,6 +1034,15 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	}
 	priv->ec_capabilities = r.capabilities;
 
+	/* Reset EC codec I2S RX. */
+	p.cmd = EC_CODEC_I2S_RX_RESET;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret == -EINVAL)
+		dev_info(dev, "Missing reset command. Please update your EC firmware.\n");
+	else if (ret)
+		dev_err(dev, "failed to EC_CODEC_I2S_RESET: %d\n", ret);
+
 	platform_set_drvdata(pdev, priv);
 
 	ret = devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
-- 
2.27.0.389.gc38d7665816-goog

