Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D591E153F15
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 08:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CA01682;
	Thu,  6 Feb 2020 08:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CA01682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580972745;
	bh=UIbNFNq2ueZDMhOzV3jBB7G8+i5I+5CcWIv3Kr11RKU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OO+Jxndz2R3WtsAUQ6xOpj8EJa065HhLO/PvQPt712m5dXdxxOrniktJL0i0mC2Y0
	 kTChiQIehdtv+JGiAkPVaxQsfGoEbrIgPZTS9/kmvVlz3Jm6gW2UB4MkHaNbENNEpO
	 wySWnR3jimkXIty50q4EYl4l9gnLuNlWmanOnvIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA362F801DB;
	Thu,  6 Feb 2020 08:03:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22B5BF80148; Wed,  5 Feb 2020 20:01:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42B27F800E2
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 20:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B27F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bR9weuLc"
Received: by mail-pj1-x1042.google.com with SMTP id d5so1363007pjz.5
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 11:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FLjc0JgPDo6YSjN7JXnggvc84UnImf4k6JPXCkUl0v0=;
 b=bR9weuLclU24y9eL3hxVwCblZjrsjNamwVklbwW09hJwVbch7JZc0gxQN1ejhtHpFH
 4PsUr/VhknEEzS+7GaaKOPgobRKvdHXBLEkU2Kb3xAcydxtFm+HCCrdOBXjI1gUE21OB
 TACFuCNW60qXMBisphE3xH1VgP8H/mi1Pox44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FLjc0JgPDo6YSjN7JXnggvc84UnImf4k6JPXCkUl0v0=;
 b=PO0IZg6+zRAfyhykzYM0WUn5SXHHSA5edIVxqJl1gEtI811aFIEjTcc+IGEuOmYj95
 5W7ge86vFCZYD8keJXj0gB4nStI0oIKccEkeEC119Ps5alpY0ycIPGOauujsChHiQ6f9
 7FoEcZVACYQmDVB+72astvjAA9WYukeGbTMhHiBGTg4WrCy5zl0JOBVdHcmu5U3xii3r
 2Je0MSN4GekVN97GvXuR4Ufiz5Ar6YLJxoh7qPnzsIQvd6lJtlQP11x2xvW8wcCa2l1s
 EirK2xr+6CqcPG2pdWALtL8CXo5/J3kBC/8PMp9Vo9smWoJcbnTerPW+oyfoC/jF+ZCB
 U97g==
X-Gm-Message-State: APjAAAWcmNDZqd1LVU4AKfHi3U31i06L9URzHf3pinqQHOB4icmbd3rZ
 +ggxBvF0DXSV2Agpmdo6JePGaQ==
X-Google-Smtp-Source: APXvYqxwndnH6icf+nujrNxPvSLToK8gpjcvNLigfeOHRVMdA3Av1KaK3pTOeyI+0EA4c5+TdQ92sw==
X-Received: by 2002:a17:90a:71c1:: with SMTP id
 m1mr7138445pjs.34.1580929267864; 
 Wed, 05 Feb 2020 11:01:07 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com
 ([2620:15c:202:201:172e:4646:c089:ce59])
 by smtp.gmail.com with ESMTPSA id u23sm257224pfm.29.2020.02.05.11.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 11:01:07 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  5 Feb 2020 10:59:53 -0800
Message-Id: <20200205190028.183069-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:03:55 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Guenter Roeck <groeck@chromium.org>,
 Fabien Lahoudere <fabien.lahoudere@collabora.com>,
 Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 "open list:REAL TIME CLOCK RTC SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Evan Green <evgreen@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Wolfram Sang <wsa@the-dreams.de>,
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
 Liam Girdwood <lgirdwood@gmail.com>, Akshu Agrawal <akshu.agrawal@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Prashant Malani <pmalani@chromium.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jonathan Cameron <jic23@kernel.org>
Subject: [alsa-devel] [PATCH v2 00/17] platform/chrome: Replace
	cros_ec_cmd_xfer_status
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

Many callers of cros_ec_cmd_xfer_status() use similar setup and cleanup
code, including setting up the cros_ec_command message struct and
copying the received buffer.

This series introduces a replacement function cros_ec_cmd() that
performs this setup and teardown, and then updates all call sites that
used xfer_status() to use the new function instead.

The final patch in the series drops cros_ec_cmd_xfer_status() altogether.

Changes in v2:
- Renamed new function to cros_ec_cmd()
- Added a "result" pointer argument, for call-sites that are interested
  in the EC command result.
- Updated subsequent patches to new function name and parameter list.
- Used C99 element setting to initialize some structs directly rather
  than zeroing them, then setting them.

v1: https://lkml.org/lkml/2020/1/30/802

Prashant Malani (17):
  platform/chrome: Add EC command msg wrapper
  platform/chrome: chardev: Use cros_ec_cmd()
  platform/chrome: proto: Use cros_ec_cmd()
  platform/chrome: usbpd_logger: Use cros_ec_cmd()
  platform/chrome: sensorhub: Use cros_ec_cmd()
  platform/chrome: debugfs: Use cros_ec_cmd()
  platform/chrome: sysfs: Use cros_ec_cmd()
  extcon: cros_ec: Use cros_ec_cmd()
  hid: google-hammer: Use cros_ec_cmd()
  iio: cros_ec: Use cros_ec_cmd()
  ASoC: cros_ec_codec: Use cros_ec_cmd()
  power: supply: cros: Use cros_ec_cmd()
  pwm: cros-ec: Remove cros_ec_cmd_xfer_status()
  rtc: cros-ec: Use cros_ec_cmd()
  media: cros-ec-cec: Use cros_ec_cmd()
  i2c: cros-ec-tunnel: Use cros_ec_cmd()
  platform/chrome: Drop cros_ec_cmd_xfer_status()

 drivers/extcon/extcon-usbc-cros-ec.c          |  61 ++------
 drivers/hid/hid-google-hammer.c               |  23 +--
 drivers/i2c/busses/i2c-cros-ec-tunnel.c       |  22 ++-
 .../cros_ec_sensors/cros_ec_sensors_core.c    |  25 ++--
 .../media/platform/cros-ec-cec/cros-ec-cec.c  |  45 +++---
 drivers/platform/chrome/cros_ec_chardev.c     |  17 +--
 drivers/platform/chrome/cros_ec_debugfs.c     | 131 ++++++------------
 drivers/platform/chrome/cros_ec_proto.c       |  76 ++++++----
 drivers/platform/chrome/cros_ec_sensorhub.c   |  30 ++--
 drivers/platform/chrome/cros_ec_sysfs.c       | 103 ++++++--------
 drivers/platform/chrome/cros_usbpd_logger.c   |  12 +-
 drivers/power/supply/cros_usbpd-charger.c     |  58 ++------
 drivers/pwm/pwm-cros-ec.c                     |  59 +++-----
 drivers/rtc/rtc-cros-ec.c                     |  27 ++--
 include/linux/platform_data/cros_ec_proto.h   |   5 +-
 sound/soc/codecs/cros_ec_codec.c              | 119 ++++++----------
 16 files changed, 277 insertions(+), 536 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
