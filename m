Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AED3A6E07
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 20:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E3E16A8;
	Mon, 14 Jun 2021 20:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E3E16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623694330;
	bh=UrfyM19Gzr1IPLHE8IrRlP8ldlC+LoFnsjbE7B5yO6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tq0E2S/ePTGbyW5/29zbwobll7uTzqPuEqQwr4ZX0QTvt/pJFC33ELtUKLLMeQAZC
	 UBrRNeo0L+9o9Y9NC/4iIaWJ8fQRObZU4B1E/6B6N7D8ANJx6Hi99Z2hOP8MIOe3vT
	 bqo1SaYX6Kw5vEL8YuWEVFT4NDTOkYEfSTfgrscc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 760BDF804E1;
	Mon, 14 Jun 2021 20:09:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F847F8028B; Mon, 14 Jun 2021 20:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8A30F804B0
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8A30F804B0
IronPort-SDR: DE187v1OTQOl6HsdfP81MwD6G1wsUov0V9KOsZZL7yOk22IqvM53vDrMqq/rULMFcXj3yf7Q2C
 4QyYRpFw71aw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="192969572"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="192969572"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:43 -0700
IronPort-SDR: epK+xTlGYHENtncTLXGdA6WyMiw/vl1OD/KZoeuxdbIk3sesVcf4S5kDKrTVL6uzmlq3N5E6HR
 5nxDiOhEVZ4A==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="484166413"
Received: from jepowell-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.114.106])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 1/5] soundwire: export sdw_update() and sdw_update_no_pm()
Date: Mon, 14 Jun 2021 13:08:11 -0500
Message-Id: <20210614180815.153711-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
References: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 open list <linux-kernel@vger.kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 Shuming Fan <shumingf@realtek.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

We currently export sdw_read() and sdw_write() but the sdw_update()
and sdw_update_no_pm() are currently available only to the bus
code. This was missed in an earlier contribution.

Export both functions so that codec drivers can perform
read-modify-write operations without duplicating the code.

Fixes: b04c975e654c ('soundwire: bus: use sdw_update_no_pm when initializing a device')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/bus.c       | 17 ++++++++++++++++-
 drivers/soundwire/bus.h       | 13 -------------
 include/linux/soundwire/sdw.h |  3 +++
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index a9e0aa72654d..5d5b0bd59ae3 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -492,7 +492,7 @@ int sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
 }
 EXPORT_SYMBOL(sdw_read_no_pm);
 
-static int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
+int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 {
 	int tmp;
 
@@ -503,6 +503,21 @@ static int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 	tmp = (tmp & ~mask) | val;
 	return sdw_write_no_pm(slave, addr, tmp);
 }
+EXPORT_SYMBOL(sdw_update_no_pm);
+
+/* Read-Modify-Write Slave register */
+int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
+{
+	int tmp;
+
+	tmp = sdw_read(slave, addr);
+	if (tmp < 0)
+		return tmp;
+
+	tmp = (tmp & ~mask) | val;
+	return sdw_write(slave, addr, tmp);
+}
+EXPORT_SYMBOL(sdw_update);
 
 /**
  * sdw_nread() - Read "n" contiguous SDW Slave registers
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 40354469860a..7631ef5e71fb 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -201,19 +201,6 @@ static inline void sdw_fill_port_params(struct sdw_port_params *params,
 	params->data_mode = data_mode;
 }
 
-/* Read-Modify-Write Slave register */
-static inline int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
-{
-	int tmp;
-
-	tmp = sdw_read(slave, addr);
-	if (tmp < 0)
-		return tmp;
-
-	tmp = (tmp & ~mask) | val;
-	return sdw_write(slave, addr, tmp);
-}
-
 /* broadcast read/write for tests */
 int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr);
 int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index ced07f8fde87..de9802a24e7e 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1041,6 +1041,9 @@ int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
+int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
+int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
+
 int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
 void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
-- 
2.25.1

