Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6479A31B
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 00:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C7F84A;
	Fri, 23 Aug 2019 00:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C7F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566513592;
	bh=3O8xJaJv56+EPIk3FxQuHnhzHil/ymV0PT3xbhF3mLI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JV9i6r90Tr7Trr0g+Bha15MA10O5GzFaf6qFoPF92Vo2tWQPBpOYyca/u/Fnk4PN5
	 kzcrcXPXdskgGwjZDH66PLHGfI3Uxc0u/z2UuxeCMJzVJmCKOUQaZM/op7zxaZa0O8
	 Xb4sLvVZgiIQhw3ckkPE7hnVzhGANkPyufmFzKp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A9DF805E2;
	Fri, 23 Aug 2019 00:36:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B60F80529; Fri, 23 Aug 2019 00:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB369F8036D
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 00:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB369F8036D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jsAQfXr+"
Received: by mail-wm1-x344.google.com with SMTP id k1so7122866wmi.1
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 15:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEysXn0BHtJ7BnPMP+dSrHUvSy8/goLl6VzMxecNkns=;
 b=jsAQfXr+7d6NgmgJ41qH3Mu0sKABLrrvJCn4SK1J7CG8z0noPF0Y+A+5XSuZNqkS91
 5/2KcuI/YxULBHSC24f07+n+RffjQWhFiPtMHzCjNhg7t1PSLcXMB5XD9eiAkaT6gCHx
 YKCMHSYbPSRaioeHQM8gjafeFEzRGi9ETLCbqNiYhtqbWwOzfFoJqiL7vH6mMiVhVxxy
 rWthZkileeFCD3AIuohYC8B8nSM9JURPH9wSCJeDg44z16pkmd0n3qY3JHfwJw59VK5X
 1GkBXVzMMZPYeX5xzHZhHn+/kaD7rMPmNr9xHGPgLcBozfomQJkkWvXtTVcq01WSaTFe
 j8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEysXn0BHtJ7BnPMP+dSrHUvSy8/goLl6VzMxecNkns=;
 b=hAufBU+Ibq4Xkq3rRgWEeCknqd8tX7R4p085GrFSEJM7M6Sw9oFp2bi9wKHDcXDM13
 nn7aP7Pq6i98fiKQUFvbuVKCnKDTjjTmlg5upI06EjxvNHUAagnHEcxMA+ShxHerdniw
 lMz7+bYyNPKR+2vnZygJHBgacVyssbD9IntGpsT6nVI366sxm0q9fMaz1i3gdph6GtZe
 k4JGpuQKM63J5oawyAs1K5+uPC7oiu+4LjugByyD7qKtXl3GWTFKVUwyIYGMCqLoAZpc
 lT1lMdkJoUskOUaiHkYVjl7bXfpW1REEXlRlGiXHfOfRVa1O18U0m6/OVHBWz42/WD0X
 5VBQ==
X-Gm-Message-State: APjAAAXhTd9lncITHXb95y5hsJOYMkCVavVpOGfetOvjzm71uHieq+lg
 0dvKe6iJDvMxqlscKORorU3//A==
X-Google-Smtp-Source: APXvYqwcSpNSV6achN4zzlZQGUbq02JsajoyaVpGGk8j/JNIuQk3zkThhTljDwdQETSdVgHYzK6b4w==
X-Received: by 2002:a1c:f910:: with SMTP id x16mr1194320wmh.69.1566513383887; 
 Thu, 22 Aug 2019 15:36:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id m188sm1886380wmm.32.2019.08.22.15.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 15:36:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	vkoul@kernel.org
Date: Thu, 22 Aug 2019 23:36:04 +0100
Message-Id: <20190822223606.6775-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822223606.6775-1-srinivas.kandagatla@linaro.org>
References: <20190822223606.6775-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v4 2/4] soundwire: core: add device tree
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
index 49f64b2115b9..c2eaeb5c38ed 100644
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
index f39a5815e25d..3ef265d2ee89 100644
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
@@ -112,3 +114,53 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
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
+			dev_err(dev, "Invalid Instance and Link ID\n");
+			continue;
+		}
+
+		id.unique_id = be32_to_cpup(addr++);
+		link_id = be32_to_cpup(addr);
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
