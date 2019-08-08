Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CAD864C2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 16:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E901671;
	Thu,  8 Aug 2019 16:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E901671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565275744;
	bh=N8lSjYSb3WqplxTzF9IKhLyFSr6xwcIgpHuiAHxHcgE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tnkzSg7hMdbCnKQeU4cBbTHH+aBM6XE77XIztr6bbshnPZJWR0Av2ELMEXjDfAHTe
	 ATgIdTvST+Ne8LTF9tt1Sk26CLvUylVaEambpYKiPPoIr3vWoNjYPYuetCJrb0Xc6h
	 nY9OaEgtn3tCgymHtXTbgpN25eaBjASSFw585/00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71670F805FE;
	Thu,  8 Aug 2019 16:45:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC96F805AF; Thu,  8 Aug 2019 16:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30512F8053A
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 16:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30512F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bBg9hWmJ"
Received: by mail-wr1-x444.google.com with SMTP id b3so2818448wro.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 07:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQsUN9otz53i+798oCmjIwQ25lOeJMqsNq1+5ZSboe4=;
 b=bBg9hWmJ7y9ITXnf/RUpzMmBm1dMxkO3dvI8GcOVJr+uDNPvAmb1nZyu7wE2NUjhuS
 j0Dxmis8+SqxdC+JpHAuH+366y7SZTF/lJHSsfZmViAE6unZX3s9OogyzcNCtQzGl2sd
 btP+oUVJoezzejYE8df8B1ZE3S4MAMGMOWGA9KfnDSgcY7p5WMPKnp48A/T25pHVxnMc
 efW31wyjURCwcDUXb3bUMByjsrqRFlpSxTG7ztDuZGx+yWrmLFqYMk6nhE+B6ZISVnVS
 b9ifriddy/Ucc3FG2BTdKRd+JBysy5nzJ8a3jfNUDUHXDN4kGq+/Z8dfyV5lKg59QxK7
 RzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQsUN9otz53i+798oCmjIwQ25lOeJMqsNq1+5ZSboe4=;
 b=fvU1WpmVoECxRT7BqpLg6HONYwOL+x9aDD2bgg2WTcLkJ4W6zqM3IVVxCLP0MisqDH
 /v6k6P0y9IcKls/a1YI/aXy9fV47896TbwFqqJvwA4Z+ccZTtsbX4R1KAxvwZKxkd6ZB
 vH1Fq3IkyuKxCI8fNJW4zkSVL5Oj9C1YQjF7LMuaLcbgOrtT6/od7OlMbEbTv0IC1xOT
 /8HVbieNQYJIwc+1VYC8vaklOeQEn1GiHqmTT+bsVQF2cScbXFQoDnLnO5i4mb++fFxZ
 UQRpKfuEycY+MRzd6KIv4BgaSIp3i3xMh7cMTlOd+iK+3p421yRKfyxYxMQ7JozFSFFM
 l5cg==
X-Gm-Message-State: APjAAAWBNiZpte4sRW+0aCAQz4S39ALZlCXHi1ShBfxqsqJ60Jyhc9+C
 lLhI7+PPFCoRauRBnSzSxCPXGw==
X-Google-Smtp-Source: APXvYqwYN1kfXVb5OXtdJdb4wj7sUrc0VGffou0emoMZdi2bIfubp1+8+fs7XsR6b/O3BS6L9vqENQ==
X-Received: by 2002:a5d:5348:: with SMTP id t8mr17003994wrv.159.1565275526729; 
 Thu, 08 Aug 2019 07:45:26 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id g15sm2009060wrp.29.2019.08.08.07.45.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:45:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Thu,  8 Aug 2019 15:45:02 +0100
Message-Id: <20190808144504.24823-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v2 2/4] soundwire: core: add device tree
	support for slave devices
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

This patch adds support to parsing device tree based
SoundWire slave devices.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/bus.c   |  2 ++
 drivers/soundwire/bus.h   |  1 +
 drivers/soundwire/slave.c | 47 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe745830a261..324c54dc52fb 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -77,6 +77,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	 */
 	if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(bus->dev))
 		ret = sdw_acpi_find_slaves(bus);
+	else if (IS_ENABLED(CONFIG_OF) && bus->dev->of_node)
+		ret = sdw_of_find_slaves(bus);
 	else
 		ret = -ENOTSUPP; /* No ACPI/DT so error out */
 
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 3048ca153f22..ee46befedbd1 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -15,6 +15,7 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 }
 #endif
 
+int sdw_of_find_slaves(struct sdw_bus *bus);
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
 
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index f39a5815e25d..8ab76f5d5a56 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -2,6 +2,7 @@
 // Copyright(c) 2015-17 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/of.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include "bus.h"
@@ -35,6 +36,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
 
 	slave->dev.release = sdw_slave_release;
 	slave->dev.bus = &sdw_bus_type;
+	slave->dev.of_node = of_node_get(to_of_node(fwnode));
 	slave->bus = bus;
 	slave->status = SDW_SLAVE_UNATTACHED;
 	slave->dev_num = 0;
@@ -112,3 +114,48 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
 }
 
 #endif
+
+/*
+ * sdw_of_find_slaves() - Find Slave devices in master device tree node
+ * @bus: SDW bus instance
+ *
+ * Scans Master DT node for SDW child Slave devices and registers it.
+ */
+int sdw_of_find_slaves(struct sdw_bus *bus)
+{
+	struct device *dev = bus->dev;
+	struct device_node *node;
+
+	for_each_child_of_node(bus->dev->of_node, node) {
+		struct sdw_slave_id id;
+		const char *compat = NULL;
+		int unique_id, ret;
+		int ver, mfg_id, part_id, class_id;
+
+		compat = of_get_property(node, "compatible", NULL);
+		if (!compat)
+			continue;
+
+		ret = sscanf(compat, "sdw%x,%x,%x,%x",
+			     &ver, &mfg_id, &part_id, &class_id);
+		if (ret != 4) {
+			dev_err(dev, "Manf ID & Product code not found %s\n",
+				compat);
+			continue;
+		}
+
+		ret = of_property_read_u32(node, "sdw-instance-id", &unique_id);
+		if (ret) {
+			dev_err(dev, "Instance id not found:%d\n", ret);
+			continue;
+		}
+
+		id.sdw_version = ver - 0xF;
+		id.unique_id = unique_id;
+		id.mfg_id = mfg_id;
+		id.part_id = part_id;
+		id.class_id = class_id;
+		sdw_slave_add(bus, &id, of_fwnode_handle(node));
+	}
+	return 0;
+}
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
