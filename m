Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4389332356
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 11:50:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6053217C0;
	Tue,  9 Mar 2021 11:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6053217C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615287003;
	bh=a50AnmqGRkxOoLaK/tLO9zC+R+s+oliuWfu14EDV0yI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O2tQp8qXtqfmntCTmfxBZjJuTdnmwyBl6qmZ0XDE5N4zYsrZx404W1HYqbzbDQkCZ
	 yjpT7K1fELekI02SBh+Hvvl4LHxDy8ifXXqPNHdJUEiIsXAk7nHSCgv9jGmIGB5a+F
	 tqg50h3GhBDU5KycgY1UynqKlMOJk7hKVWmd5MUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0982F80256;
	Tue,  9 Mar 2021 11:48:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FB3EF80227; Tue,  9 Mar 2021 11:48:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31467F80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 11:48:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31467F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="R1/XwJB2"
Received: by mail-wm1-x329.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo5668314wmq.4
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 02:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+dOe7qqGADyTHvXYPJam0BAUL8HHo8ONmP3uU3g+NA=;
 b=R1/XwJB29aodPHns+iAOiEvLf/bDRHI+RtO3GFJGLmzuMlcrjThtNhsri50BBhU+vD
 BX8GVi2XqXlshi+sQbfgK3bCWo7rENlBIFwC0Gp7Cg1H2pD0Gvj5sFVQ6fmPMVrJBWzY
 WYKtNyQ2czFqgFHhws6gxDvQ5/JBt0Edwf8843Uz8ycyxBYGWtRG2bscxyDzCDFdtnvs
 7mR3+3kbw0oMen21hPmZDkp5AW3wnmQzVjeLOvp4N2S3xNa+wHMBxIQ0BkIKax+U93nB
 9TGWfptnjoFQF0sYARsR5r60E+cUkehPkhaj+dP58iEkzt41E5asx7vBOysVUGh1cy/z
 VrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+dOe7qqGADyTHvXYPJam0BAUL8HHo8ONmP3uU3g+NA=;
 b=q0K07+odKlsWWbkdH1uSZ/njbAOBL2UBhMR6W3h/HRaBuKyEuM8WAiot8nS1QMG2bt
 9rfkuWu8PHIAK9x2+VR2iu7QMlOWJ51aaKVwk0IDwg9WDsoXDKAFtTSWzGDOGqzcmdgs
 o9kkYtIBRos0Oz2px+3bKabOowBvTyrQz9DWY+6wOcmWU7tz1aeT0YrsTIrTj155BUMf
 fG+xhZ7S/lAjZAa0ednra4YUHtdh3PQvU6eYd9AaDr+1XDzZiAuoZaI9wyTBUIQDLYtU
 esjE8AsPjuzFIFOyDb0ROawtVj2pTY2RvYqQREGAMUv6lVhZmHR05kx6nX4kRHJOLo8Q
 IDqg==
X-Gm-Message-State: AOAM531X8CZ16a7dbR6ntzdPvEAh8EjCWCvt/+VFaOT4dtg30eojAteH
 NCWlPsKcC35BRzlVBNJbdx2P4w==
X-Google-Smtp-Source: ABdhPJz+lHXmJhbhL2RIdUBaCEF3gJnahgXfhOirnUrrEWQB8LpPRGdRGx8zfZNPPBQvwDa8v7125Q==
X-Received: by 2002:a05:600c:2cb9:: with SMTP id
 h25mr3356223wmc.110.1615286900145; 
 Tue, 09 Mar 2021 02:48:20 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o11sm24747758wrq.74.2021.03.09.02.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 02:48:19 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [RESEND PATCH v2] soundwire: bus: Fix device found flag correctly
Date: Tue,  9 Mar 2021 10:48:16 +0000
Message-Id: <20210309104816.20350-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

found flag is used to indicate SoundWire devices that are
both enumerated on the bus and available in the device list.
However this flag is not reset correctly after one iteration,
This could miss some of the devices that are enumerated on the
bus but not in device list. So reset this correctly to fix this issue!

Fixes: d52d7a1be02c ("soundwire: Add Slave status handling helpers")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
For some reason I ended up deleting Fixes tag so resending with it!

 drivers/soundwire/bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index a9ab4a6264e0..188e391c5a83 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -712,7 +712,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 	struct sdw_slave *slave, *_s;
 	struct sdw_slave_id id;
 	struct sdw_msg msg;
-	bool found = false;
+	bool found;
 	int count = 0, ret;
 	u64 addr;
 
@@ -744,6 +744,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 
 		sdw_extract_slave_id(bus, addr, &id);
 
+		found = false;
 		/* Now compare with entries */
 		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
 			if (sdw_compare_devid(slave, id) == 0) {
-- 
2.21.0

