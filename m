Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F312813539
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61EED183C;
	Sat,  4 May 2019 00:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61EED183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921160;
	bh=5bMUfrYsrou7WVsNTll0rmRLIu3mw0nWGLRiFAjx3lc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJnXCbktz3ibdHboO6hXcP9WkElhle5T5AhDh/VmoGZpYnZcEK/IelybaCRrvNbz2
	 28jEZwfDpbfOEZkCbPxmNrPKf8dUsruWtJE1v7wk+kvA/wxzJ/wb6cBjMBh9NVc4Qt
	 6ZgErnXpKczqoaX/MocwR9o1urnBGbTEGzw92OK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D647F8972E;
	Sat,  4 May 2019 00:03:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CFE0F896B7; Sat,  4 May 2019 00:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A25AF896B6
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A25AF896B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FtEmcK2E"
Received: by mail-pf1-x443.google.com with SMTP id y13so3526852pfm.11
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1fjM9w2h70QiUrv+LoNu/lNneSjRxxrzXxb5mmKI3w=;
 b=FtEmcK2EAsDc4lbuEYIbz39AL2xpoQyeXHy70UQfD4vEaamR56r1fcjMjYeclr5ne+
 8aMYs0G65xWKu9T1R1ALpUd/xolxscn024lKVRLu6q8Y3XgjnqFezpNeaLw7iWT8YROL
 9SieAdZYRkUmvxrjX3nTBWP1rZhBUOQiklSdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1fjM9w2h70QiUrv+LoNu/lNneSjRxxrzXxb5mmKI3w=;
 b=MWENOHc3ISEprHobXWBqzjGBGmA7Ak/bYkjjO1DzUjCMQgCuomP7CAX01OEnNdkb6m
 M/M7RmVdH+E6GH/6LK7oSyNkE1GBMugZ95tcS2N4kgkPk6SAyD7b0/UtJqse34k5slqm
 kb7XmwkX1PvBRsA2Du8tMRokDR1G2/J1jK5X1sVJYApKoJRuTGi3e8o0ETiQt83srRu4
 KXH9XTBo27dnJDuun0/V9LuZ8M3oy0BQno2VRuHLKAMeGHlC/FsRkL6DsJSN4k4n+ic6
 TyLCq8fwc3W3Omr3Qm9GoDRvl2TuzHbhB4pjLO5eUgKqn4hRRMMamlPZn8ryImISBcDY
 W5sw==
X-Gm-Message-State: APjAAAUhngV0AsSOsIYiX16Nzq7UEODXHID1UNfv0E8MHvUOwR/kUEAa
 B7hjq/ExlASRzfC9vvh0/n9rkg==
X-Google-Smtp-Source: APXvYqyBJeOEF7xV0itUAXuRjhzZi8P2TOqSE1YE4DuxpYkK5TmwtKSlV6hXJc5Hd0s8mGFtfiURxA==
X-Received: by 2002:a63:6ac1:: with SMTP id f184mr14167742pgc.25.1556920965411; 
 Fri, 03 May 2019 15:02:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id v64sm4256040pfv.106.2019.05.03.15.02.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:02:44 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:05 -0700
Message-Id: <20190503220233.64546-3-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 02/30] mfd: cros_ec: Zero BUILD_ macro
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

Defined out build macro used when compiling embedded controller
firmware.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 6fa508643da3..374f64caeb5f 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -13,6 +13,11 @@
 #ifndef __CROS_EC_COMMANDS_H
 #define __CROS_EC_COMMANDS_H
 
+
+
+
+#define BUILD_ASSERT(_cond)
+
 /*
  * Current version of this protocol
  *
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
