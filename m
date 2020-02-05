Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4C153F16
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 08:06:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0C9F86E;
	Thu,  6 Feb 2020 08:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0C9F86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580972770;
	bh=1AtDdSqSpxIuW+Y7X7qZrdvXJ8IbMBnurl7eZcbm/6A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KNE/UNgUEl/wmTNzB+jAufehcpSAoJKAgg/lfE0HrDMeQ1o49zKq7KYc3YM0r+fxy
	 lDRZWS3xRqoYIAmLJIKjL1oLI6y2xt69vTGjVNY8AUMPYSFM+U7PWXUCkVXAnzak7h
	 Poyo7Ma2rEWkn0RoiDYO7GqvqUulo/LVztWMHnQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E99FF80276;
	Thu,  6 Feb 2020 08:03:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C98BAF80148; Wed,  5 Feb 2020 20:03:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC2AF800AB
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 20:03:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC2AF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WUYDJw1n"
Received: by mail-pg1-x543.google.com with SMTP id j4so1423629pgi.1
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 11:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U0hDZ/T3s6jenHRShy6wdmjO1R+/oIqX00gnqVLCe8o=;
 b=WUYDJw1nn5RPuLuDrh5Z6KXJbadPmb+K+AxD04NEZFS7MR2WwJfS7hLZgZlIoi371U
 fn1g0F1rK/X9slqqB0ppOY8AVHNMDNmBXC4FgZuR94QXYSZrC5Z0HYHXqAYGz/TfxHLv
 rZqYxhU/mFuED5u7inNxP/LSMaRw6rmpb//Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0hDZ/T3s6jenHRShy6wdmjO1R+/oIqX00gnqVLCe8o=;
 b=bzf9axyWIft4f++3l1hWwVYZ3YHLhKH1dfLRCiRSr2qkkyj58XfxPVwF3wkb8FdnU/
 jK6Fzq15HahApbKhGwKe5kJuVCUzI14+qXP3mawJYsjnygk7gZnOIrRbHlNneDkTJVBt
 VYQ5CjiHLyVf45gmZJvFjheSqX/NnHMtRqg62XBji+UFciXa8et2uGG2TJdcbJiWOl2Q
 eEycZqG6CPdY7korVC6R4U0NgJVsTTrEQedaAbJNjHY49EqfvXAuqF9M2A9wT5AivpWF
 9Gl7S3S+LzRLOLejK6F/C0gZhcst+8ZdKesuwaMeNezOPstTbHPrUxuWkZzT1qlIbAow
 aU7g==
X-Gm-Message-State: APjAAAXdOVmcK+HE7VxSFGGvkgefuzMpnAH5XYY9i2mzUhNrsaEv9cKx
 RxbXz40/SmTa33kZXJfFtu+SGA==
X-Google-Smtp-Source: APXvYqz226eTOZbYc/vDVh0iaMg6CVQ5WyVJUyf723entXT5ro1cbWZK+HmRsxBagvdpPHZDRBsyzQ==
X-Received: by 2002:a63:7053:: with SMTP id a19mr36139371pgn.377.1580929407989; 
 Wed, 05 Feb 2020 11:03:27 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com
 ([2620:15c:202:201:172e:4646:c089:ce59])
 by smtp.gmail.com with ESMTPSA id u23sm257224pfm.29.2020.02.05.11.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 11:03:27 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  5 Feb 2020 10:59:55 -0800
Message-Id: <20200205190028.183069-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205190028.183069-1-pmalani@chromium.org>
References: <20200205190028.183069-1-pmalani@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:03:55 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wolfram Sang <wsa@the-dreams.de>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Guenter Roeck <groeck@chromium.org>,
 Fabien Lahoudere <fabien.lahoudere@collabora.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 "open list:REAL TIME CLOCK RTC SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Evan Green <evgreen@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "open list:MEDIA INPUT INFRASTRUCTURE V4L/DVB" <linux-media@vger.kernel.org>,
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 "open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS"
 <linux-pm@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Enrico Granata <egranata@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Prashant Malani <pmalani@chromium.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jonathan Cameron <jic23@kernel.org>
Subject: [alsa-devel] [PATCH v2 01/17] platform/chrome: Add EC command msg
	wrapper
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

Many callers of cros_ec_cmd_xfer_status() use a similar set up of
allocating and filling a message buffer and then copying any received
data to a target buffer.

Create a utility function cros_ec_cmd() that performs this setup so that
callers can use this function instead. Subsequent patches will convert
callers of cros_ec_cmd_xfer_status() to the new function instead.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- Renamed function to cros_ec_cmd()
- Added result pointer parameter.
- Removed references to cros_ec_cmd_xfer() or cros_ec_cmd_xfer_status()
  from documentation.

 drivers/platform/chrome/cros_ec_proto.c     | 58 +++++++++++++++++++++
 include/linux/platform_data/cros_ec_proto.h |  4 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 3cfa643f1d073d..b3d5368f596813 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -572,6 +572,64 @@ int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
 }
 EXPORT_SYMBOL(cros_ec_cmd_xfer_status);
 
+/**
+ * cros_ec_cmd() - Utility function to send commands to ChromeOS EC.
+ * @ec: EC device struct.
+ * @version: Command version number (often 0).
+ * @command: Command ID including offset.
+ * @outdata: Data to be sent to the EC.
+ * @outsize: Size of the &outdata buffer.
+ * @indata: Data to be received from the EC.
+ * @insize: Size of the &indata buffer.
+ * @result: Result of the transfer command.
+ *
+ * This function sends a command to the EC and also performs some of the common
+ * setup involved in doing so. This includes allocating and filling up a
+ * &struct cros_ec_command message buffer, and copying the received data to
+ * another buffer.
+ *
+ * Return: The number of bytes transferred on success or negative error code.
+ */
+int cros_ec_cmd(struct cros_ec_device *ec, u32 version, u32 command,
+		void *outdata, u32 outsize, void *indata,
+		u32 insize, u32 *result)
+{
+	struct cros_ec_command *msg;
+	int ret;
+
+	msg = kzalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
+
+	msg->version = version;
+	msg->command = command;
+	msg->outsize = outsize;
+	msg->insize = insize;
+
+	if (outdata && outsize > 0)
+		memcpy(msg->data, outdata, outsize);
+
+	ret = cros_ec_cmd_xfer(ec, msg);
+	if (result)
+		*result = msg->result;
+	if (ret < 0) {
+		dev_err(ec->dev, "Command xfer error (err:%d)\n", ret);
+		goto cleanup;
+	} else if (msg->result != EC_RES_SUCCESS) {
+		dev_dbg(ec->dev, "Command result (err: %d)\n", msg->result);
+		ret = -EPROTO;
+		goto cleanup;
+	}
+
+	if (insize)
+		memcpy(indata, msg->data, insize);
+
+cleanup:
+	kfree(msg);
+	return ret;
+}
+EXPORT_SYMBOL(cros_ec_cmd);
+
 static int get_next_event_xfer(struct cros_ec_device *ec_dev,
 			       struct cros_ec_command *msg,
 			       struct ec_response_get_next_event_v1 *event,
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index ba591477019180..54b9bbf9a07c0c 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -218,6 +218,10 @@ int cros_ec_cmd_xfer(struct cros_ec_device *ec_dev,
 int cros_ec_cmd_xfer_status(struct cros_ec_device *ec_dev,
 			    struct cros_ec_command *msg);
 
+int cros_ec_cmd(struct cros_ec_device *ec_dev, u32 version, u32 command,
+		void *outdata, u32 outsize, void *indata, u32 insize,
+		u32 *result);
+
 int cros_ec_query_all(struct cros_ec_device *ec_dev);
 
 int cros_ec_get_next_event(struct cros_ec_device *ec_dev,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
