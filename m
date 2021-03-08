Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B987933100C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 14:53:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 338A318D1;
	Mon,  8 Mar 2021 14:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 338A318D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615211606;
	bh=5h3qos7ymzOqYGDA+D+G7h5L6HAXs4MTdmoxK5AsUCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g3lsufEXxeCbmqAbgiOs4D4sx6viAXBKZrTd2dsBw3KbKSAiFlKRt/aQu8mrpKvKh
	 dYLiIlpfwJ8MtJ/140mUE8+UOriMJ7769ZHubrkw78l3zEI9C2raMHJfwL/utQ8fAi
	 wyjwG//ZaJsEOZeqX7xDuuDaAG+Qtout8ToQcopw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E78EF80424;
	Mon,  8 Mar 2021 14:50:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 408CAF80475; Mon,  8 Mar 2021 14:50:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CBA0F802E7
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 14:50:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CBA0F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oZZbpzSC"
Received: by mail-wm1-x336.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3850733wml.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 05:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLW7TG6PQ/0kvCqPaH5WN248jwpEuDggns1w04ucp9A=;
 b=oZZbpzSCpnqJ1jIlW5MuZ1cSOGKMldFFJr93/JW41dLUh65I46zQkLtkapmwUGuZBI
 1wWJnGqnLp4/UtSElrpgRfZYuwVBiQXWFvaA/hvAPos0JuROOjsfDif9OGjTY4lwL7Qy
 w+CZoQIk9eVkFs0EBrPV1MgxPCoZtYBhoWXWnyG6zOmqEDHsH6VyuIWFs6fCdMOOyOem
 sgHzLC66sP0hhUt/QfYlVG2frDDbQvsHRN12GM7Oh7cEwATZEkZlVPF0+SI3PDDnBqs2
 mcUrYvtsi/LKKxwt6V6Ekdmvi56ttH6n52XmSgjcLdJh03sqQ54XiwSiNDPIRtWwA3/e
 gFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLW7TG6PQ/0kvCqPaH5WN248jwpEuDggns1w04ucp9A=;
 b=t0EUwF9l9dbU83zFmh6wDYdindEeJ1cAhMGp+Em3DM+OggwHM2kWxYzqCuem0xnPzZ
 wCP+ttjyNcx7nLFxXNfsKm9EPv7PxY00VJqxDJVinTlGldue/FvsNMoFA07J83NldaU8
 AIhbvpAqqYYj+Cof6g4COxtTQqMfYQ2U8FRJzyTQI5G5T+qWRej+kfke2emWMMCQjr0H
 FPb4UCLWgBevqDiCV9jqB6pCw9HpRLHYodCub13NAxiLDf3Z03Edj8eTOePpXfES7hHN
 D1fgZ5fKNHdNxt7m//TT+pFBQBD1d7rFPvgKPhKu9lETq5Ii0ufJyQ4k2Xkt0nV/MxIN
 2NoA==
X-Gm-Message-State: AOAM530m3zHHeKzfnsWrMF3Q4WDKJfVmmrkixL2kkatn+wiYSmiKrVGu
 pGTcje0cfd0+isHH1yAa/OwFsA==
X-Google-Smtp-Source: ABdhPJx0qSyvt5qX3+yogFUxNbqoey5sNyKo2gst1GwnoK9XypLSsEJ5udmUhhzBQWLvRrjudZzOQw==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr22683917wmo.155.1615211413109; 
 Mon, 08 Mar 2021 05:50:13 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h22sm19490589wmb.36.2021.03.08.05.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:50:12 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v3 7/9] soundwire: export sdw_compare_devid() and
 sdw_extract_slave_id()
Date: Mon,  8 Mar 2021 13:49:55 +0000
Message-Id: <20210308134957.16024-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
References: <20210308134957.16024-1-srinivas.kandagatla@linaro.org>
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

Exporting these two functions makes sense as it can be used by
other controllers like Qualcomm during auto-enumeration!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/bus.c       | 4 +++-
 include/linux/soundwire/sdw.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 48577b78f282..46d3407c097f 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -608,7 +608,7 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
 	return NULL;
 }
 
-static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
+int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
 {
 	if (slave->id.mfg_id != id.mfg_id ||
 	    slave->id.part_id != id.part_id ||
@@ -619,6 +619,7 @@ static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
 
 	return 0;
 }
+EXPORT_SYMBOL(sdw_compare_devid);
 
 /* called with bus_lock held */
 static int sdw_get_device_num(struct sdw_slave *slave)
@@ -703,6 +704,7 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 		"SDW Slave class_id 0x%02x, mfg_id 0x%04x, part_id 0x%04x, unique_id 0x%x, version 0x%x\n",
 		id->class_id, id->mfg_id, id->part_id, id->unique_id, id->sdw_version);
 }
+EXPORT_SYMBOL(sdw_extract_slave_id);
 
 static int sdw_program_device_num(struct sdw_bus *bus)
 {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index d08039d65825..8478a1f5f833 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1009,5 +1009,7 @@ int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
+int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
+void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
 #endif /* __SOUNDWIRE_H */
-- 
2.21.0

