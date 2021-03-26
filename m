Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8234A22A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 07:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D97165E;
	Fri, 26 Mar 2021 07:45:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D97165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616741186;
	bh=VqDjOTIFZqwAXbPIIzjvF2Zl91Se0O8aM8sxV4R7EUw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JG2iRX5hA0ymnpvusX49NXB7mQ3INhyMOyfDwaHC3GdXIGF3uK2Svn+dzjCtTXVET
	 JzefDZPHU4lnDN3poh+EnWYGo7142S5nwETEbbBhm45b6G76D+oxfwVVloTvaTOGR9
	 lnuf7sxiP/aLr+1zjHBtD/N5fSxNxTg3Q7nPy+g0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80F86F804EC;
	Fri, 26 Mar 2021 07:42:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15D9EF804E4; Fri, 26 Mar 2021 07:42:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A48FDF801EB
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 07:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A48FDF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="r/SymDir"
Received: by mail-ed1-x532.google.com with SMTP id e7so5037776edu.10
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 23:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8VaQolGFCOR51eNrv/jk6ZLBrbbZ7X7Ltpf1LoAnjQ=;
 b=r/SymDirP7YsfplabAthL2rjNIEsp2UpQhJ6IQeQAt3/I84Eynq5qj3dKhWsBQR25L
 EBBsBag5vV+/5jRLbAvlnNuKJfLDGFuctI6aeFt8PvZSCh6r1xcAO2czt/JbOeomouuc
 aW0dptOiPwQYDJiYCZkgHXSdkJpNqoGgQxnldzOvvj0NGKKnn0Qg1Po74+7FMe5YbLCv
 tNCDYWEdxvXieEB0EVWMuDx/nh11yG+8tnj58Q639qX0mSHLMcVe4XYVLMQ52Uob4PuR
 rrJS+hycvoLfGbgY6Gr4k/vE3013BDdBejvCU0kPC2go8TstO2TooFkSAiHnmL5aRvw1
 5Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8VaQolGFCOR51eNrv/jk6ZLBrbbZ7X7Ltpf1LoAnjQ=;
 b=CDtApNGk8UjmcBLYTiLhd3WtoeNTNI+bUAvl1TsDN5s+yjIBgdueXIDvWvmpGnzoo5
 H88sb+q5is34lWAGfUb9yiMSUV7ItkNKIZhwjce4fFORShnJeP56wiSw5KCO/slr3EZK
 edqeVlHjSfwYS94rjb0cdjyknEKU48Y/qPemUFgdMmd7uinrSHCREySYOL+rlUa1g0wG
 dhyBWF/a9cZ0P6fJGrM31IJVNYQCO5BI6objwWed/rrCIjje6nh/Yxo5PMS8sT/KRuHo
 ryBdVx9Nc2LWS2U0SUDY3wlB9G8jXfq3EOFRZkysiSYIgbDaDq98n+oXRR1+aVzL0oZ9
 y/6w==
X-Gm-Message-State: AOAM530v0FerENgytjz2/PEesXIkN2savDZraKnfy38tO9zMt1vdwLez
 MduEQPx18JEMgNgKVS37iPnj6g==
X-Google-Smtp-Source: ABdhPJw0rOE3qXvEVF6WI9EL9K/FwKG5NOBkx2tZumsUnD+MCA3hyDs5WB9yIpydUIEdhMFsax2CNA==
X-Received: by 2002:a05:6402:2695:: with SMTP id
 w21mr13146872edd.99.1616740883626; 
 Thu, 25 Mar 2021 23:41:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id ci22sm125325ejc.54.2021.03.25.23.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:41:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v5 7/9] soundwire: export sdw_compare_devid,
 sdw_extract_slave_id and sdw_slave_add
Date: Fri, 26 Mar 2021 06:39:42 +0000
Message-Id: <20210326063944.31683-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
References: <20210326063944.31683-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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
index 46885429928a..6d7708964735 100644
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
index 180f38bd003b..92850e150d36 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -88,6 +88,7 @@ int sdw_slave_add(struct sdw_bus *bus,
 
 	return ret;
 }
+EXPORT_SYMBOL(sdw_slave_add);
 
 #if IS_ENABLED(CONFIG_ACPI)
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 2f52d6609076..f9003ba056ba 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1011,5 +1011,7 @@ int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
+int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
+void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
 #endif /* __SOUNDWIRE_H */
-- 
2.21.0

