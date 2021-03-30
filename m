Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D334EB10
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:51:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF03A16AA;
	Tue, 30 Mar 2021 16:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF03A16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617115915;
	bh=1unqGfWHlBSRK1X7KEqfkSquVN8I3u0sC5j+ZU8OyK8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K9Mkr6gtc4EJFErH1j+O4p4xR/3zlyKj/53fHmipA+STwiX6YkDEMCp6brf2OEtUl
	 9iAVRh/p1y7SsDBDP747D0qX7iO/tcWSwrJSLKrbDFDcWWUyt1oI66AE7IuI75Vu1C
	 KuMqYafHtIzy6U6wfDtSry5AfQBbFljIjuhU9vps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F758F804D8;
	Tue, 30 Mar 2021 16:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35E82F8049C; Tue, 30 Mar 2021 16:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A99CF8014E
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A99CF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TijfAYCV"
Received: by mail-ed1-x52a.google.com with SMTP id w18so18616699edc.0
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p958/KgSVdF5+9QpbHuTIEsCC6E24Ycmg43m5LKY0o4=;
 b=TijfAYCV9yntgSN/zpB4NqshxbZFEgPMvpo6bQnDNJenVWSFlXYCDW5B7GD/pPU1EZ
 e1PnMb1qRT3KM/JmPorV7rQQFFR10NzUOUjQk3FSITerXhbD+t98MYD791dndRthzCDK
 UxaMM5CyIjEphTUUWlydQDAv/oSzcbFw4+5IhCLrhFu14+gJB3I2Y3ScqiR5zsg1w9yt
 chPtx8zuQxg3U1TpWAiiKB1cQ04ito8ghvAe7ta274P9FXr2cXlV15x2t56CYdMOiWeJ
 OdSrh4cfNQdwONHa6IvIh05sQaOJu48JGQZpMPQKadVCQdJTUAz3fzF6Eyiec+Z78N92
 QfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p958/KgSVdF5+9QpbHuTIEsCC6E24Ycmg43m5LKY0o4=;
 b=cekk4kXbSxZpKJlqSnyzo+WFRs4BRt3xgTMQZBGkbb9c9XCRpqvmyauektP2WYDNQV
 gnYh3BWIaaX0eKDuhhh7wpg2tOeUyS6lf1R8Zj55PAn2HqIkpY/9npkccjqwvx2km0gZ
 feHzpE2X1EIugFqMyGLp+zSlgRxrPO3imi0drWtbzEB7oC5OiE5aAlCX3AF/x+/fdw/C
 QWhDGsRwp6KC624YLe3undN76wALXifKRKItrZG/QlEsFFOn+fcOWzxZr5i93GFPbXiS
 mQCkb40Sr20n/5yua7bWMn5JJEJB8S43pI68i//8F/nqiy5fMOgXK6lLUUlj/iBEbWf2
 2Xyg==
X-Gm-Message-State: AOAM5326CBgDJ87ILMlnXOUglOj6rM5dJ2+H0W7shG3CfvLN/RTtXRrX
 H7M8FCwrrobly91ffuZpJNgb1A==
X-Google-Smtp-Source: ABdhPJzIHvntJkZ9WV5oSDo3ZFuqPz9D9jEZRRnTk/jw9MFc4rQZbkPeJhwBvErP//sZ08l6DNe1LA==
X-Received: by 2002:a50:e80c:: with SMTP id e12mr34395379edn.229.1617115656985; 
 Tue, 30 Mar 2021 07:47:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n16sm11520383edr.42.2021.03.30.07.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:47:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v6 7/9] soundwire: export sdw_compare_devid,
 sdw_extract_slave_id and sdw_slave_add
Date: Tue, 30 Mar 2021 15:47:17 +0100
Message-Id: <20210330144719.13284-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
References: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Exporting these three functions makes sense as it can be used by
other controllers like Qualcomm during auto-enumeration!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/bus.c       | 4 +++-
 drivers/soundwire/slave.c     | 1 +
 include/linux/soundwire/sdw.h | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 9bd83c91a873..a9e0aa72654d 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -603,7 +603,7 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
 	return NULL;
 }
 
-static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
+int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
 {
 	if (slave->id.mfg_id != id.mfg_id ||
 	    slave->id.part_id != id.part_id ||
@@ -614,6 +614,7 @@ static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
 
 	return 0;
 }
+EXPORT_SYMBOL(sdw_compare_devid);
 
 /* called with bus_lock held */
 static int sdw_get_device_num(struct sdw_slave *slave)
@@ -698,6 +699,7 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 		"SDW Slave class_id 0x%02x, mfg_id 0x%04x, part_id 0x%04x, unique_id 0x%x, version 0x%x\n",
 		id->class_id, id->mfg_id, id->part_id, id->unique_id, id->sdw_version);
 }
+EXPORT_SYMBOL(sdw_extract_slave_id);
 
 static int sdw_program_device_num(struct sdw_bus *bus)
 {
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 112b21967c7a..0eed38a79c6d 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -88,6 +88,7 @@ int sdw_slave_add(struct sdw_bus *bus,
 
 	return ret;
 }
+EXPORT_SYMBOL(sdw_slave_add);
 
 #if IS_ENABLED(CONFIG_ACPI)
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 350436db6ddb..5ff9a8f37e91 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1039,5 +1039,7 @@ int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
+int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
+void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
 #endif /* __SOUNDWIRE_H */
-- 
2.21.0

