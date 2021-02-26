Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC632660D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 18:06:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 746E31697;
	Fri, 26 Feb 2021 18:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 746E31697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614359160;
	bh=5h3qos7ymzOqYGDA+D+G7h5L6HAXs4MTdmoxK5AsUCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDXtX7iw1qd8NgWt02J8HpYsnzT3FUw/rL5JhB9RGrNXEWUFcmuyXWg0CJhbB9vo7
	 E0JY/iY4SEH8T+BFOHlKFJORzJn4yxKo2CnuQmuriEjLX+K+24rHbN2Fekq4Tqw2Gx
	 mxYR/y9LgkLhUgAl5/Nl/5JyLW0FQ9kgwAD06xlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C6E8F8012C;
	Fri, 26 Feb 2021 18:04:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 493C2F802DF; Fri, 26 Feb 2021 18:04:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBCB3F80159
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 18:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBCB3F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DhVCpG1b"
Received: by mail-wm1-x32e.google.com with SMTP id n4so6985467wmq.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 09:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iLW7TG6PQ/0kvCqPaH5WN248jwpEuDggns1w04ucp9A=;
 b=DhVCpG1b3UIO7vBqa299+9V3CVzR+D2K8X0luCS83Fpzq3cIZT4QIf+hMGusbsJllV
 rH3xaEu4TzO7/3quut3Vnw76bQtOs7YPIiBsvn1jmbT64UBAkXhcFBE3cyGgbg8sUA6N
 QgsnlCsdXDlOJoNNZBbnAavcBHnh/PN+c+YvmiJqjorMBuL/ABM+WVi6RC3hfFQnJVRg
 iIZSsA9yyxPQNMCbtTE9y1PI0dzKhez4zH9bOlYY5WIgG+opDFfqxKuCBTshONza1xei
 SvAiNH0+pXyU6TC3PiEpei8jp1kREzd0D3GGdlx6iDwKx0hzxEzSroo2yfRZa1Rk98Qx
 YSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iLW7TG6PQ/0kvCqPaH5WN248jwpEuDggns1w04ucp9A=;
 b=CwjLDwZut3bWTtqmh3Bypz9WDgV6HQ4RW/UijwAhHAiSP8LdvgXpxCxW1jUB0UuaZO
 BZB63WVcNnl3mTx9eTz6NQjeG5oLV4OozgtnuhnaM1xxI5rSoWQs7ZF5xki9PZpN3nKo
 60QMDM1r4gyDoMDQ8pr3DvzXWUjJdcUFqXVx5BuHlKZOFqCuzMQvaHyj8wBAnlvyX6RK
 GgnfRYV9uGelTVqhrgCoEi7YOhs8cXbI4ENswmicJbHKXYRWVTSFjLxok91SJmT6lcnI
 HK40JuNvpzd+YXYAZ0RBbFw2uT2ejRlouJsfhg1B6yFo6jMTLoFkIi3u/hjtreQIoK5E
 FvoQ==
X-Gm-Message-State: AOAM531d/xeWsArmvMvPrbX07zov00EgFpjjf9lNpj6fm39rBTeinos3
 e0C9e9am7HQWEvHgodO+zXiGdw==
X-Google-Smtp-Source: ABdhPJyUXSITxg36zpAW/xYF0AI81gVx9H48Rv/wd7mnuryjH/YPlLYBY9l2jnWcCivpj4MfTxDcog==
X-Received: by 2002:a1c:1b4d:: with SMTP id b74mr3876434wmb.31.1614359049269; 
 Fri, 26 Feb 2021 09:04:09 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id w13sm15962972wre.2.2021.02.26.09.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 09:04:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 1/3] soundwire: export sdw_compare_devid() and
 sdw_extract_slave_id()
Date: Fri, 26 Feb 2021 17:02:48 +0000
Message-Id: <20210226170250.9067-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
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

