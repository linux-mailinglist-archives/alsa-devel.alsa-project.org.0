Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5F5262A45
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 10:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F0E170B;
	Wed,  9 Sep 2020 10:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F0E170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599640154;
	bh=l8DmLqUHlq4UsNbHVbhBwLi3vgUPOkD+6gXJMA71JNE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gnlpt2HeMOnvAFvv3l+BQ7jqztE47z0qX3WEPOPq8WFOZTXlb01iWPzlo7vApEXs3
	 QGzCtER6sgnbn7elZ8EwK6QpLV5++BtWBb2UILjZKzljBxmgtBtS47/iW8ClbYJIeS
	 bMCE2nocG49SCeRpV74eM5Pb0etdUkkWN9XQ1SJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4CEF80240;
	Wed,  9 Sep 2020 10:27:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAF6BF80227; Wed,  9 Sep 2020 10:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A20CCF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 10:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A20CCF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="I02lSPEd"
Received: by mail-wr1-x442.google.com with SMTP id s12so1918185wrw.11
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM64L3CcsMa1siJdI4dg24BqXKXYUZtDhge9L0xvdAI=;
 b=I02lSPEdBGwQrP44DPQbz+erJ4x71MpXzgrdn6BPMo3n6Iv616vbsXwuDRbIfLlys0
 Iszj1wODuFSYWrjZyE3SxY3n8QFClt3FmGQ0k51Vb/pK+Vj8ZIy4zKetEyJsJeebNNuV
 ITCGxPR+8dzABuYBNd/A/G16kAbMF0RcJHkMn1MzLH/TkBiRPjrQMzdYayAmUvcwjhRL
 Bal4YbYmDjsnu5YTOM0BD1ZXM99BCdAL8/f4vpQVWkbYWuYBzBZ1q+73J1isfAkiw/LE
 A8yOCkTQLAcuq03aKACXQkKYqBmsxVU/0IpUxaAiNb210akkICy130e561uDbwv5zIqt
 YWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QM64L3CcsMa1siJdI4dg24BqXKXYUZtDhge9L0xvdAI=;
 b=WBtPI9XFy08whaByIqI55bPAUVc3WI1sFOuqdNSsvf0YRfbe/ZzQ7xRxU3FqvtWv+m
 8c2D72iG2UunCv/uXaXPUMYkmlUzHQrGRMkIYmM0Ygnq+/2cC5XpmDha3p7uJbDUGOr7
 KmS+vPh5ntSfqJdX8o+4YdRKEZQV3qDyc8emQzC0Cw+4SPSOaYVOjqMQrJp0Dz0eoJcB
 T5CXUbjvnZHkMRpdjjJKHel4aT42wOt8rESTKMZCN2ayxHvMnaY4FRkKhUXav7hGfrKM
 WLDPZ6sQjTpi5Vx5+D3uByucluqBusKU7Kq4GGcJ3QvXQelyw+RnCO+hc9RcEVLjepNf
 H7qQ==
X-Gm-Message-State: AOAM530uBWLeUYU5h/Oh+NFQO+Qfp/zfhq/tinFNhiRPQZuLowLQAI0f
 dDiAE30Rnjrt435Ewfs8WosUbQ==
X-Google-Smtp-Source: ABdhPJwQe9jOkEvwsrTHtVYwibViPE7q3BlvaqBdPRQ8ec1kaskrGW61AkO+C7wlLNLMuhqt6ZDzZA==
X-Received: by 2002:adf:ff90:: with SMTP id j16mr2850158wrr.105.1599640037528; 
 Wed, 09 Sep 2020 01:27:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f1sm3092574wrx.75.2020.09.09.01.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 01:27:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] soundwire: bus: add enumerated slave to device list
Date: Wed,  9 Sep 2020 09:27:11 +0100
Message-Id: <20200909082711.11670-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Currently slave devices are only added either from device tree or acpi
entries. However lets say, there is wrong or no entry of a slave device
in DT that is enumerated, then there is no way for user to know all
the enumerated devices on the bus.

To fix this add slave device by default if there is no matching dt or
acpi entry, so that we can see this in sysfs entry.

In my case I had a wrong address entry in DT, However I had no way to
know what devices are actually enumerated on the bus!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/bus.c      | 1 +
 drivers/soundwire/bus.h      | 2 ++
 drivers/soundwire/bus_type.c | 6 ++++++
 drivers/soundwire/slave.c    | 4 ++--
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index e6e0fb9a81b4..55d9c22c4ec5 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -699,6 +699,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 
 		if (!found) {
 			/* TODO: Park this device in Group 13 */
+			sdw_slave_add(bus, &id, NULL);
 			dev_err(bus->dev, "Slave Entry not found\n");
 		}
 
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 82484f741168..1517d6789dff 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -19,6 +19,8 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
 int sdw_of_find_slaves(struct sdw_bus *bus);
 void sdw_extract_slave_id(struct sdw_bus *bus,
 			  u64 addr, struct sdw_slave_id *id);
+int sdw_slave_add(struct sdw_bus *bus, struct sdw_slave_id *id,
+		  struct fwnode_handle *fwnode);
 int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
 			  struct fwnode_handle *fwnode);
 int sdw_master_device_del(struct sdw_bus *bus);
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 6fba55898cf0..ac036223046f 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -84,6 +84,12 @@ static int sdw_drv_probe(struct device *dev)
 	const struct sdw_device_id *id;
 	int ret;
 
+	/*
+	 * fw description is mandatory to bind
+	 */
+	if (!dev->fwnode || !dev->of_node)
+		return -ENODEV;
+
 	id = sdw_get_device_id(slave, drv);
 	if (!id)
 		return -ENODEV;
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 0839445ee07b..24a16ebf9ae2 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -20,8 +20,8 @@ struct device_type sdw_slave_type = {
 	.uevent =	sdw_slave_uevent,
 };
 
-static int sdw_slave_add(struct sdw_bus *bus,
-			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
+int sdw_slave_add(struct sdw_bus *bus,
+		  struct sdw_slave_id *id, struct fwnode_handle *fwnode)
 {
 	struct sdw_slave *slave;
 	int ret;
-- 
2.21.0

