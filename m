Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F261473
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 10:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7D51672;
	Sun,  7 Jul 2019 10:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7D51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562488213;
	bh=z8jgI8BTxD92Xu6jttZWT8bhPejokv6Kwn7bwuYBuC0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C2Qj1msG6x7BBsp+Ze2G2ct6Lrs/UNdtol26jJU2utP7A6UkzW+NkY2gz9yDOD/rh
	 r+VYzbuJEIOQ9+iSHWYt9j22nMrYt5dbLrwLOlfzQSxtZo4wG8K5w4ad8DZro/8dmr
	 nXMqSwfBqJJuFgMtpigX/KVbM/MdZFpdwkC6D4xQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A62EF801ED;
	Sun,  7 Jul 2019 10:28:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27A7EF80212; Sun,  7 Jul 2019 10:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 498A6F800E6
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 10:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498A6F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RtK4rURu"
Received: by mail-ed1-x542.google.com with SMTP id e3so11688247edr.10
 for <alsa-devel@alsa-project.org>; Sun, 07 Jul 2019 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0Y4cjzHcvVmq7KzUPJtwccJDPm0PfTiZlto8ZH/pcY=;
 b=RtK4rURu7nLX5Xm5CJI5KcPO8pT1dFNz89scG04MqjKRRPCfo09V7gJM5OrXuVL+mW
 iPncJ22lQ30pMj8eqEJ5ETrFw4zOyW/8ReKLWPP+uG/2MmbutDotykioZGPj75U3n9sJ
 WhtRTFAVAkx+dY/otRi2D+e+UoRGLwxCcMR1S0qZvWFiAjYNO6uo9gJItnKT2cVEy1vu
 lzRwOMmwYARZw1QzLRE9z+KUkXOByH3GAdAVETVY32l1fRiofyZ06VttaMw6armI83I2
 eddp0QS3BMww5M+P7YaQaTd/ORM8jCKSIWLGCTadqc65oGtX9Soop5ZYWTHLYgFVqaZh
 roEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0Y4cjzHcvVmq7KzUPJtwccJDPm0PfTiZlto8ZH/pcY=;
 b=b0N4yDx8G5oZfJa4/m5ugtd/ERstECBdkXcmO5v37yXhP13w9Xv9TSIgl5akbKiACo
 QlXZ2ppI5GCMBIo3ur9yaUf1eGT0JPRLsY903X/0rgUef0PC8nvR4jMYOvoECQmAGujZ
 uUia8hPmW1nFmv1xwEa+0twc63BMOKtOb1utqj90zQwE3/zjcGC1QNEJ3/ehTipGyhV2
 YC9BTS7JwbJ9nXRZPZ6sAtcvN1xmpE0fUMpql+yhoQgtnXkB7KZICi49a+54VZqit9tS
 Ql8QkUiT/1VAESJFBJ3U/3CyTw+8BM6kMlfKz1iMWSJk+qXOcR4gyGCVv6yMDzahAPOY
 la9g==
X-Gm-Message-State: APjAAAXY9DZKgjVK0SWAz4OY0Am2cdWz5hQDf1lNGNjSUG7EwfLVhhDu
 i2VOidbz4sz2L5G61YWVxRed5KbY
X-Google-Smtp-Source: APXvYqz3d0o/dxMwjKXSjP1Hn81Xq3lQXc01OhqkuNRzl+3D7bHeT3vTeiabg41E4MLogAZUnAa8hg==
X-Received: by 2002:a17:906:3956:: with SMTP id
 g22mr11068919eje.292.1562488098545; 
 Sun, 07 Jul 2019 01:28:18 -0700 (PDT)
Received: from localhost.localdomain ([89.100.119.28])
 by smtp.gmail.com with ESMTPSA id z16sm2659249eji.31.2019.07.07.01.28.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 01:28:17 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: alsa-devel@alsa-project.org
Date: Sun,  7 Jul 2019 09:27:34 +0100
Message-Id: <20190707082734.25829-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Jussi Laako <jussi@sonarnerd.net>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Nicola Lunghi <nick83ola@gmail.com>,
 Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH v2] ALSA: usb-audio: fix Line6 Helix audio
	format rates
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

Line6 Helix and HX stomp devices don't support retrieving
the number of clock sample rate.

Add a quirk to set it to 48Khz by default.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 sound/usb/format.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index c02b51a82775..31780dfb8eb9 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -285,6 +285,33 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 	return nr_rates;
 }
 
+/* Line6 Helix series don't support the UAC2_CS_RANGE usb function
+ * call. Return a static table of known clock rates.
+ */
+static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
+						struct audioformat *fp)
+{
+	switch (chip->usb_id) {
+	case USB_ID(0x0E41, 0x4241): /* Line6 Helix */
+	case USB_ID(0x0E41, 0x4242): /* Line6 Helix Rack */
+	case USB_ID(0x0E41, 0x4244): /* Line6 Helix LT */
+	case USB_ID(0x0E41, 0x4246): /* Line6 HX-Stomp */
+		/* supported rates: 48Khz */
+		kfree(fp->rate_table);
+		fp->rate_table = kmalloc(sizeof(int), GFP_KERNEL);
+		if (!fp->rate_table)
+			return -ENOMEM;
+		fp->nr_rates = 1;
+		fp->rate_min = 48000;
+		fp->rate_max = 48000;
+		fp->rates = SNDRV_PCM_RATE_48000;
+		fp->rate_table[0] = 48000;
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 /*
  * parse the format descriptor and stores the possible sample rates
  * on the audioformat table (audio class v2 and v3).
@@ -294,7 +321,7 @@ static int parse_audio_format_rates_v2v3(struct snd_usb_audio *chip,
 {
 	struct usb_device *dev = chip->dev;
 	unsigned char tmp[2], *data;
-	int nr_triplets, data_size, ret = 0;
+	int nr_triplets, data_size, ret, ret_l6 = 0;
 	int clock = snd_usb_clock_find_source(chip, fp->protocol,
 					      fp->clock, false);
 
@@ -313,9 +340,22 @@ static int parse_audio_format_rates_v2v3(struct snd_usb_audio *chip,
 			      tmp, sizeof(tmp));
 
 	if (ret < 0) {
-		dev_err(&dev->dev,
-			"%s(): unable to retrieve number of sample rates (clock %d)\n",
+		/* line6 helix devices don't support UAC2_CS_CONTROL_SAM_FREQ call */
+		ret_l6 = line6_parse_audio_format_rates_quirk(chip, fp);
+		if (ret_l6 == -ENODEV) {
+			/* no line6 device found continue showing the error */
+			dev_err(&dev->dev,
+				"%s(): unable to retrieve number of sample rates (clock %d)\n",
+				__func__, clock);
+			goto err;
+		}
+		if (ret_l6 == 0) {
+			dev_info(&dev->dev,
+				"%s(): unable to retrieve number of sample rates: set it to a predefined value (clock %d).\n",
 				__func__, clock);
+			return 0;
+		}
+		ret = ret_l6;
 		goto err;
 	}
 
-- 
2.19.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
