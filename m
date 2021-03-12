Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496A338C54
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:03:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F2B1715;
	Fri, 12 Mar 2021 13:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F2B1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550638;
	bh=MoVHCwrCS6yhYV2r+9+cU0wJEQPgzCa7pDlPKfot+sA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C1uz+Q+iffwPROLBpxLPWZ8XGDrinjrT93299q6d9MRAQhx8KmL1DdNEm41IGB4Zd
	 /MJeLp/mw3bmjGInihNVyfbcpmrb0L9JSXuC0vuPKSGa96WZG0P+V+7ZLypunewvWh
	 O4NMNcw8AW1Hqbb2Jxp/Zt9heVOLiIskaU0D6qCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24237F804B2;
	Fri, 12 Mar 2021 13:00:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 565E1F804A9; Fri, 12 Mar 2021 13:00:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90952F8016C
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90952F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="P6+peZvD"
Received: by mail-wr1-x429.google.com with SMTP id x16so1631342wrn.4
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ns+tspE3TpNVqG5EYUwkfh0nuT4Nkt3p2sWFNFRFG3w=;
 b=P6+peZvDODkplKd7B975gw81MJr7jqWIWBOCgEwcQ6jwIjBbL1A4fSfPMJubO9u/HI
 klsjbXDAggxVo9agrb0jMULcytEzWovafXLqeTCJPvnRVuG451MUOen4ZgTsVM2xkmPx
 DP9VCq/2rpA3kT9bLXvhQb/qWsKgd860Kvp4RuYkjt82c9UgfGZHbDma2ONT3f5uiqjL
 Pwj//Vr/Sac6hv2F4v3XuEZEVPoDILbXRZzgFSDFcTzf49sp9XrwfQ4NBP6fpT2Cs8IF
 hIS8V8ZOPlc4RmjO3OSHfUKRPmjyHP8VyroNx0+sTrQT0WluViH1T5wWPBQy0ZEpZsNU
 feew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ns+tspE3TpNVqG5EYUwkfh0nuT4Nkt3p2sWFNFRFG3w=;
 b=bJfrOO+yJfPmUpaIY1SZBW2OU9aCheZ+GeLv6SEBeElppndNbdWLPhhrovFd9tTN+E
 pT+W2XeIPIkDxUZE1aQ+e/FwIYR04ELAbOPKFn+HGUTo2gujmWwZbqFQvqTcGJWj1/Jk
 KXrgYxu/x9AT7J6e3YlOb36C5AC+t2Py1ZcI4yW7cQ0d2u8LEv1+ln+iHDzGI+c8GKAi
 42/+XiS5FMSP49pvv44GtiDU5iHHDXhdvy/OBvpNyggU5xNFwceFE2HHGkBMEEhTzQeA
 eMqTbrPQzi6pi76FnZezKth9HMdtP7S5d5v9QSAW2PtVgGQTi0UDRpUgx2VhHu8IVcGQ
 EH2w==
X-Gm-Message-State: AOAM5317oluu5rr/70nGyX2v55aH7hVvpce5dO/T8eSdlY1CRAFBwT+2
 UWlXbS/CaDfgjQbUxsXAPEw0bstngTuHxQ==
X-Google-Smtp-Source: ABdhPJzSUeK2qRXfZNTLJGfilhw5GBIt689/i+iQfv9UnkTEj5vCg6xatpfddnC7X66twH0g4f5VAg==
X-Received: by 2002:adf:fe48:: with SMTP id m8mr13403133wrs.135.1615550430888; 
 Fri, 12 Mar 2021 04:00:30 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h25sm2268315wml.32.2021.03.12.04.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:00:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v4 7/9] soundwire: export sdw_compare_devid() and
 sdw_extract_slave_id()
Date: Fri, 12 Mar 2021 12:00:07 +0000
Message-Id: <20210312120009.22386-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
References: <20210312120009.22386-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
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

Exporting these two functions makes sense as it can be used by
other controllers like Qualcomm during auto-enumeration!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/bus.c       | 4 +++-
 include/linux/soundwire/sdw.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

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
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b032d6ac0b39..c677ab1013ab 100644
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

