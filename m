Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB0C2D3ABA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 06:37:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66DA416F3;
	Wed,  9 Dec 2020 06:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66DA416F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607492278;
	bh=CYn5LKDR5x31RpzAFZ4UNGrqJBdXucnTc8Nv62JrtG0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qY9F7eC1PHMw9GDlesiELHohH/1pC19oUavU9kPZj8UnzFYwNGNga+iCdDU1CmAEF
	 DM67WJdOoMVflQ+3VyEf0CzZo5/zmpyKTzmVchLS5jfBKqRG/MrwFlzoBJ2XmOWhVs
	 PKmynWMve0lx0jc5frLXsyBSaNTjLLIqmO67q7Tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9806BF804E0;
	Wed,  9 Dec 2020 06:35:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B46F1F804C2; Wed,  9 Dec 2020 06:35:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E881DF8020D
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 06:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E881DF8020D
IronPort-SDR: LljyTigUHEmBNczjhOL7rMY7N3W8lgiOR4RtSVXOfeMbrx+wRUkNR6xTWilJXzy2DlA5nrW94Q
 L0S7K/pthi0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153259010"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="153259010"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:24 -0800
IronPort-SDR: rVpbxNAJ+9/MISNX5YXxqtIQmR4T6B4r0iPODUITV3OpS4yBrHsvUoWrmN+OZ2sj+3hHld3kJx
 X6k/QBDd6zLw==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="363989498"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:20 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/9] soundwire: export sdw_write/read_no_pm functions
Date: Wed,  9 Dec 2020 13:34:54 +0800
Message-Id: <20201209053459.5515-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
References: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

sdw_write_no_pm and sdw_read_no_pm are useful when we want to do IO
without touching PM.

Fixes: 0231453bc08f ('soundwire: bus: add clock stop helpers')
Fixes: 60ee9be25571 ('soundwire: bus: add PM/no-PM versions of
read/write functions')
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c       | 7 ++++---
 include/linux/soundwire/sdw.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 86c339d77a39..4eaeeb4090f0 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -405,10 +405,11 @@ sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 	return sdw_transfer(slave->bus, &msg);
 }
 
-static int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
+int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
 {
 	return sdw_nwrite_no_pm(slave, addr, 1, &value);
 }
+EXPORT_SYMBOL(sdw_write_no_pm);
 
 static int
 sdw_bread_no_pm(struct sdw_bus *bus, u16 dev_num, u32 addr)
@@ -476,8 +477,7 @@ int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 val
 }
 EXPORT_SYMBOL(sdw_bwrite_no_pm_unlocked);
 
-static int
-sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
+int sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
 {
 	u8 buf;
 	int ret;
@@ -488,6 +488,7 @@ sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
 	else
 		return buf;
 }
+EXPORT_SYMBOL(sdw_read_no_pm);
 
 static int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f0b01b728640..d08039d65825 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1005,6 +1005,8 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
+int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
+int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
 
-- 
2.17.1

