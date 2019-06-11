Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC803C933
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:44:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA241718;
	Tue, 11 Jun 2019 12:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA241718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560249856;
	bh=H1/Llrt8UQqcyN30FTC3+qsNLQdsQhstMNkHQRwVsmM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxBdpMsEk5eFL3rLFb4IkeT2liVBGMemCD7ttriaJXzBSsvEVqCk48svVMdPjVae5
	 xTbCoS5kET8ypRte3fmI78xGmM6BJb/aQUZOlhK+QKmh3+4k6LEokcvb0JLU/SezwX
	 tc4I4W6HabuqsYZcnfM2Zkf0SjMpuDZzgk9WsXkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E84D9F89739;
	Tue, 11 Jun 2019 12:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E882F89711; Tue, 11 Jun 2019 12:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A97F896F1
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 12:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A97F896F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RPRC/yHe"
Received: by mail-wr1-x442.google.com with SMTP id m3so12462237wrv.2
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJU4aHR0rVsdWBrGZXQ39RDqJgxX93qjHiD8SWybkaM=;
 b=RPRC/yHewHSIblBTN67aXej0xEEkdQgIhaXh2ybmwsLf+Cosr6xLs0PO0YCnzb4o9k
 hlOqYHb92RjF3YMh/W5dtVSKpxn1JWJgg4bgrkWwd0QG5AP7pmR+x9UINg0gQii3+2RW
 s/jWdAPSOCHS7BQT9tvgNRvplvmqo249sSbf4qNAGHLGchiXPe4LYcigmjeLns/Y2wC0
 qOAwzOhQmMREdx13qIPdtFt50qam581ngygcDOwI0c9qRZDQ7kbuWZI58J1g0iiiYwaW
 Rl7ycVEk7dq0+DngyU+xk7UQo+kQ/3liwt4BsZn//8XZxoAggzsOqjY5BRnMYPLuVhFe
 0UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJU4aHR0rVsdWBrGZXQ39RDqJgxX93qjHiD8SWybkaM=;
 b=CfOFWLxgS/pr5bbBIT9/ZOL4Ftinr8W+LWE3tUIZ13HgiWtJ2OpNNlEgV3fYPWpw6w
 pS6C4jCVFktXhirFrk4Y+ZCJXs/D9VMpDP65TiVJ6PD5D0vHRGTYzA0xARA0l/hwhQ1l
 cRtSfUwjsc8Hj2H2yRGweTR5YBapnGsXqa4wxar2Ueqtz/eVnx8xAZTG9q5Pu2QdBldy
 bMj2Cj6XDEY7nNx05KdY7g7T+p5DPrE3YZpMJar80gZRbT7tkwHdkPpAs3TME768p1+9
 nw8n6O/+rsh3/kGTRjK0rJWFhhhGrYJuWS41PxxPYrK+JMpSw0HlCgHz4IC8Qpv65Fbh
 KTcg==
X-Gm-Message-State: APjAAAWU2o5ujjn+m9fdUpW2Y1MR1ScC+w+0aAlnL6cTphAOVDYDtuJ3
 a1f/+XEFWSQWBseQ2nownUxArw==
X-Google-Smtp-Source: APXvYqzBWw1MjNjHAKzC6fJlE0R8arif02WUl3DHjCYY6cv3RJtRVXlhZ7RHFgMENqoxZfFsJf8Plw==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr48143892wrn.244.1560249660756; 
 Tue, 11 Jun 2019 03:41:00 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c65sm2359614wma.44.2019.06.11.03.40.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 03:41:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Tue, 11 Jun 2019 11:40:40 +0100
Message-Id: <20190611104043.22181-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com
Subject: [alsa-devel] [RFC PATCH 2/5] soundwire: core: add device tree
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
 drivers/soundwire/bus.c   |  2 +-
 drivers/soundwire/bus.h   |  1 +
 drivers/soundwire/slave.c | 54 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe745830a261..20f26cf4ba74 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -78,7 +78,7 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 	if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(bus->dev))
 		ret = sdw_acpi_find_slaves(bus);
 	else
-		ret = -ENOTSUPP; /* No ACPI/DT so error out */
+		ret = sdw_of_find_slaves(bus);
 
 	if (ret) {
 		dev_err(bus->dev, "Finding slaves failed:%d\n", ret);
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
index f39a5815e25d..6e7f5cfeb854 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -2,6 +2,7 @@
 // Copyright(c) 2015-17 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/of.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
 #include "bus.h"
@@ -28,13 +29,14 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev.parent = bus->dev;
 	slave->dev.fwnode = fwnode;
 
-	/* name shall be sdw:link:mfg:part:class:unique */
+	/* name shall be sdw:link:mfg:part:class */
 	dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
 		     bus->link_id, id->mfg_id, id->part_id,
 		     id->class_id, id->unique_id);
 
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
+#if IS_ENABLED(CONFIG_OF)
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
+	if (!bus->dev->of_node)
+		return 0;
+
+	for_each_child_of_node(bus->dev->of_node, node) {
+		struct sdw_slave_id id;
+		const char *compat = NULL;
+		int unique_id, ret;
+		int ver, mfg_id, part_id, class_id;
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
+
+#endif
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
