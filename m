Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD1A2115
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 18:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D02316B1;
	Thu, 29 Aug 2019 18:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D02316B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567096762;
	bh=WvLKTLAVSOuRBSaqh7/E9tNDLwb8tZpXtEGzAHlaROc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoWkY9Bn9X0EpWZehM/ZdV/j4xMFZxiZLTYKqGpToWilwQLSDw1geZQVNjgqslkWO
	 xrdxMC+in+xlh5sMtAz5evuwtfF4Xd1C4pohWxKIlQiTMKPeB4m261QXZk+f0edIwk
	 CvXzaimjP3ITECfDAZgxd/U/Yr+58Cf59Ixl2JH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB40F80377;
	Thu, 29 Aug 2019 18:36:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 432BAF801ED; Thu, 29 Aug 2019 18:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75FA0F80142
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 18:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75FA0F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SPqD7twG"
Received: by mail-wr1-x444.google.com with SMTP id j16so4097883wrr.8
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0y/VQ+YRgpX5o2wxlaY+4cXYuAJOmCwTGDSCpRsawzo=;
 b=SPqD7twGvwKp/3dAhbuIEpOkZ9eaeoucN5AdbkgdF4l5oJwK1hz+UjQBg4gOXRhsSw
 uUEovH7aQyS6TaurJffN7ndkPrgHURGFkcxhxPuy1mqZAWZXbbCpdVH42AvFrbnECxGv
 ymHg9IcprUCOxLa7gVLxYoJkucRxYFsqyQ/VjpNX51Jsi4VchHHAo1fxQfTNETLrBdMh
 UMJo+o/eqMr5JyhOUayxGfsARNQ6V38hgnnPL3L79a3RKc1zu5+C86RsnIK/0LPwNvoP
 yhXmmRr3rvBtawUA4kapypIc2cX6yar6nGq5TKsCIGIZ24QGky6MGJkz7uf8/FAa0XfY
 jCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0y/VQ+YRgpX5o2wxlaY+4cXYuAJOmCwTGDSCpRsawzo=;
 b=YfNeqlpQR1NZbwFUOJXtx4fWKzPXFEOwVjV/PJ177/NnFkvue/n++MGNkFaHpdJ+VA
 o6dQjCll0t/DWHk+9Qe2hhsyXQBRt03Gz/XnIIhxiUDprNNnwrwdI2JrtMgNjf3bo3QA
 nk5Hwn0WnvVbO3A/q7zyU6jDBf2q1PYnOI0FEJHXmNUwjT2pbGhITs+G6KeGGYlScAwB
 s6RWkEqlnensM7F8Wefh1FIt9JbVBjbKT4LniZrz4xaX3oslWE+EYzfbnse4gPp0mpd6
 NCW6E+QuPAC0XrQNZiqPAfkH2ySdOsYILNUk3eNcd1XmiAw3VWCaA+KGUZAq7DshtdfV
 0drQ==
X-Gm-Message-State: APjAAAULLdJ1Wz1i182doRbOy89dPvDljWp5+x+SQQVYsTUqIkhznp2b
 Ova53lwllSzwcBBFaKY4Haydhg==
X-Google-Smtp-Source: APXvYqxvtmZUogvHXPqiYxAGddjYnxODN6Beze5/yBnrfXMIqABIfOyxUyI7Dt9l7ZDVsWl1bPiyWA==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr10168260wrt.20.1567096598266; 
 Thu, 29 Aug 2019 09:36:38 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id k9sm4398243wrq.15.2019.08.29.09.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 09:36:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 29 Aug 2019 17:35:12 +0100
Message-Id: <20190829163514.11221-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 2/4] soundwire: core: add device tree
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
 drivers/soundwire/slave.c | 52 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 728db3ebad6e..d83d89b3b15a 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -79,6 +79,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	 */
 	if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(bus->dev))
 		ret = sdw_acpi_find_slaves(bus);
+	else if (IS_ENABLED(CONFIG_OF) && bus->dev->of_node)
+		ret = sdw_of_find_slaves(bus);
 	else
 		ret = -ENOTSUPP; /* No ACPI/DT so error out */
 
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 9d6ea7e447ff..cb482da914da 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -15,6 +15,7 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 }
 #endif
 
+int sdw_of_find_slaves(struct sdw_bus *bus);
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
 
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 4b522f6d1238..48a63ca130d2 100644
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
@@ -113,3 +115,53 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
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
+		int link_id, sdw_version, ret, len;
+		const char *compat = NULL;
+		struct sdw_slave_id id;
+		const __be32 *addr;
+
+		compat = of_get_property(node, "compatible", NULL);
+		if (!compat)
+			continue;
+
+		ret = sscanf(compat, "sdw%01x%04hx%04hx%02hhx", &sdw_version,
+			     &id.mfg_id, &id.part_id, &id.class_id);
+
+		if (ret != 4) {
+			dev_err(dev, "Invalid compatible string found %s\n",
+				compat);
+			continue;
+		}
+
+		addr = of_get_property(node, "reg", &len);
+		if (!addr || (len < 2 * sizeof(u32))) {
+			dev_err(dev, "Invalid Link and Instance ID\n");
+			continue;
+		}
+
+		link_id = be32_to_cpup(addr++);
+		id.unique_id = be32_to_cpup(addr);
+		id.sdw_version = sdw_version;
+
+		/* Check for link_id match */
+		if (link_id != bus->link_id)
+			continue;
+
+		sdw_slave_add(bus, &id, of_fwnode_handle(node));
+	}
+
+	return 0;
+}
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
