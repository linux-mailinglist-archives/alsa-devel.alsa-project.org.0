Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F087B6C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 15:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165EA1615;
	Fri,  9 Aug 2019 15:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165EA1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565357862;
	bh=VYXeTtZT7WAnR7e2DjE90Bm5AlJtgcS8um/8m3Qwg3c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nv9uGJHhqAheNcRxilx+cyTZyXmdusDHt4DAlLQRK7WiSqnTL2Gf1xtew2S0kd7NS
	 iiZFH5D7gEG6QvlsYIawxJVgxMkUKzts3oxwaUgoAt8ri6rxdmzOKsvKgrzvWnrMUZ
	 ppFEBpDkAG6p1wG9CRJM75jTtBWugUaGIuG/Nof0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE5B0F805FB;
	Fri,  9 Aug 2019 15:34:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B4F1F805E2; Fri,  9 Aug 2019 15:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 946ABF805AF
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 15:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946ABF805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PsLHerYo"
Received: by mail-wr1-x441.google.com with SMTP id p17so98253765wrf.11
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSA7ezdPPag+s30NiG1INKw2c+i3SxQK3zdXCLkhRcc=;
 b=PsLHerYoUVRKASnwTKpiAHQR0yPELiRX+g+NPh9prYQur1qyuSIfRI9PXP0Ob5CJp2
 HPSso9SxnVC7il0jzaoVV9lJC6Ex7sVcFdBqN/S3qOmWNjZMJ8rm0TEGcsqbB0CAcH5K
 fyZbwFQD3D/CnClOZa2uSp5cr/QjbAktrc4mFi1VK8uSKqaex2aNsIEgcg7+IdI7zYi0
 xJX5+xEAyIYNbHAARfShnXDBAftp15zQHxpDPB2AAU9xbMcZxVIVBcpC5QD1peeHs+TV
 oHBwA+QBhimbf9/kN9APXDT3/9VvtWTAOTgNcJVKr8OOeFTUSJjQNUsvDC3qBFv9B6Bf
 YYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSA7ezdPPag+s30NiG1INKw2c+i3SxQK3zdXCLkhRcc=;
 b=VMAisTamtTO9wsl2Wh4uzfvpNKMxQQLkeaEDQb3IH+mdDyxo25EK0Zpox4das0Okjt
 o5SRns4IMowxixvmea7Jn4a6mt9OaLX5/22+6ZXMKG65netnVFwPd8NX9HJ/qS+aQLeS
 5IDggg5klMUFr0gvvVrxXC8DeSRGXx9nnQyE21gcW8ezed5UFVarBYR17QauzNBPaEBN
 eYJ+N6uSMkYQ+KtZSXzfI3LtP0UMemDh/okVNfGe+we5jxopMbxC+FRJDyrSgJj7D2XU
 cx8PgkTgRydQtRCbwwDY5ptIGp1o8FZu6LLaaYeX67idyM9+mBDAfmp/RJQ5unGLJarN
 iQtA==
X-Gm-Message-State: APjAAAUlx/uMcfAMEXj6XoCrZue8F1LctaRojMvK+NSkimZZ8urWtaJR
 q5oNs8X2wYRICidcVmED5N2UZQ==
X-Google-Smtp-Source: APXvYqwlUmqdetUDTyTK+lXVK3bZa3Ttblwj2qzFWoaZD/WRa1755r4Jj/b9Aq2U0IDNuwXtzb074g==
X-Received: by 2002:adf:f206:: with SMTP id p6mr24947252wro.216.1565357670593; 
 Fri, 09 Aug 2019 06:34:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y18sm5674641wmi.23.2019.08.09.06.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2019 06:34:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Fri,  9 Aug 2019 14:34:05 +0100
Message-Id: <20190809133407.25918-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
References: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 2/4] soundwire: core: add device tree
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
 drivers/soundwire/slave.c | 44 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

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
index f39a5815e25d..c0dd79fc4fc5 100644
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
@@ -112,3 +114,45 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
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
+		int unique_id, link_id, sdw_version, ret;
+
+		compat = of_get_property(node, "compatible", NULL);
+		if (!compat)
+			continue;
+
+		ret = sscanf(compat, "sdw%01x%01x%01x%04hx%04hx%02hhx",
+			     &link_id, &sdw_version, &unique_id, &id.mfg_id,
+			     &id.part_id, &id.class_id);
+
+		if (ret != 6) {
+			dev_err(dev, "Invalid compatible string found %s\n",
+				compat);
+			continue;
+		}
+
+		/* Check for link_id match */
+		if (link_id != bus->link_id)
+			continue;
+
+		id.sdw_version = sdw_version;
+		id.unique_id = unique_id;
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
