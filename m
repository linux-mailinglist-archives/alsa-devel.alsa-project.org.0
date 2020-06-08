Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D11F366D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 10:52:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13BE2168D;
	Tue,  9 Jun 2020 10:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13BE2168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591692720;
	bh=34zUH0alBhNzOTA4DMa08/Nt3PpaQUdLMLDivtgTjtg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYhF1OXEC6bNe+QglA+gaTRS+ytSpjUgFkGlPHKgmKg14iX2AZkGHF3za4EHkUSL0
	 UPQrtVPdi5utwtSStRCJKpoXe17HTI4+KcleFkEA/lrg2DXUOMLM/EVe5YK6PjK04E
	 p/Pdq2yW6mIrQpuVVw4WnOyTq/k1MmRFXcC9U2U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37207F802BC;
	Tue,  9 Jun 2020 10:49:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 169E3F8029A; Tue,  9 Jun 2020 10:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F24DF80278
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 10:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F24DF80278
IronPort-SDR: +5/oLeIAHQ4NLU/tVsyTq3j0b7zAup/ivyuK+HVADcalMydJDB8G3yjYZ0EBBjhuSaQAyVXYkO
 exI35rLZejTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 01:49:08 -0700
IronPort-SDR: TAuzf9FAVa0ej0iNgEXXXcNry8h+SH7RMisvAZTx+xjJ4/c4PGSguy8jvmorGan/6Rud/BLsYp
 3eyVDKqDhaxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; d="scan'208";a="473001950"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2020 01:49:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/4] soundwire: bus: initialize bus clock base and scale
 registers
Date: Tue,  9 Jun 2020 04:54:36 +0800
Message-Id: <20200608205436.2402-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608205436.2402-1-yung-chuan.liao@linux.intel.com>
References: <20200608205436.2402-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The SoundWire 1.2 specification adds new registers to allow for
seamless clock changes while audio transfers are on-going. Program
them following the specification.

Note that dynamic clock changes are not supported for now, this only
adds the register initialization.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c                 | 107 ++++++++++++++++++++++++
 include/linux/soundwire/sdw_registers.h |  10 +++
 2 files changed, 117 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 24ba77226376..83f9d7e0de80 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1059,12 +1059,119 @@ int sdw_configure_dpn_intr(struct sdw_slave *slave,
 	return ret;
 }
 
+static int sdw_slave_set_frequency(struct sdw_slave *slave)
+{
+	u32 mclk_freq = slave->bus->prop.mclk_freq;
+	u32 curr_freq = slave->bus->params.curr_dr_freq >> 1;
+	unsigned int scale;
+	u8 scale_index;
+	u8 base;
+	int ret;
+
+	/*
+	 * frequency base and scale registers are required for SDCA
+	 * devices. They may also be used for 1.2+/non-SDCA devices,
+	 * but we will need a DisCo property to cover this case
+	 */
+	if (!slave->id.class_id)
+		return 0;
+
+	if (!mclk_freq) {
+		dev_err(&slave->dev,
+			"no bus MCLK, cannot set SDW_SCP_BUS_CLOCK_BASE\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * map base frequency using Table 89 of SoundWire 1.2 spec.
+	 * The order of the tests just follows the specification, this
+	 * is not a selection between possible values or a search for
+	 * the best value but just a mapping.  Only one case per platform
+	 * is relevant.
+	 * Some BIOS have inconsistent values for mclk_freq but a
+	 * correct root so we force the mclk_freq to avoid variations.
+	 */
+	if (!(19200000 % mclk_freq)) {
+		mclk_freq = 19200000;
+		base = SDW_SCP_BASE_CLOCK_19200000_HZ;
+	} else if (!(24000000 % mclk_freq)) {
+		mclk_freq = 24000000;
+		base = SDW_SCP_BASE_CLOCK_24000000_HZ;
+	} else if (!(24576000 % mclk_freq)) {
+		mclk_freq = 24576000;
+		base = SDW_SCP_BASE_CLOCK_24576000_HZ;
+	} else if (!(22579200 % mclk_freq)) {
+		mclk_freq = 22579200;
+		base = SDW_SCP_BASE_CLOCK_22579200_HZ;
+	} else if (!(32000000 % mclk_freq)) {
+		mclk_freq = 32000000;
+		base = SDW_SCP_BASE_CLOCK_32000000_HZ;
+	} else {
+		dev_err(&slave->dev,
+			"Unsupported clock base, mclk %d\n",
+			mclk_freq);
+		return -EINVAL;
+	}
+
+	if (mclk_freq % curr_freq) {
+		dev_err(&slave->dev,
+			"mclk %d is not multiple of bus curr_freq %d\n",
+			mclk_freq, curr_freq);
+		return -EINVAL;
+	}
+
+	scale = mclk_freq / curr_freq;
+
+	/*
+	 * map scale to Table 90 of SoundWire 1.2 spec - and check
+	 * that the scale is a power of two and maximum 64
+	 */
+	scale_index = ilog2(scale);
+
+	if (BIT(scale_index) != scale || scale_index > 6) {
+		dev_err(&slave->dev,
+			"No match found for scale %d, bus mclk %d curr_freq %d\n",
+			scale, mclk_freq, curr_freq);
+		return -EINVAL;
+	}
+	scale_index++;
+
+	ret = sdw_write(slave, SDW_SCP_BUS_CLOCK_BASE, base);
+	if (ret < 0) {
+		dev_err(&slave->dev,
+			"SDW_SCP_BUS_CLOCK_BASE write failed:%d\n", ret);
+		return ret;
+	}
+
+	/* initialize scale for both banks */
+	ret = sdw_write(slave, SDW_SCP_BUSCLOCK_SCALE_B0, scale_index);
+	if (ret < 0) {
+		dev_err(&slave->dev,
+			"SDW_SCP_BUSCLOCK_SCALE_B0 write failed:%d\n", ret);
+		return ret;
+	}
+	ret = sdw_write(slave, SDW_SCP_BUSCLOCK_SCALE_B1, scale_index);
+	if (ret < 0)
+		dev_err(&slave->dev,
+			"SDW_SCP_BUSCLOCK_SCALE_B1 write failed:%d\n", ret);
+
+	dev_dbg(&slave->dev,
+		"Configured bus base %d, scale %d, mclk %d, curr_freq %d\n",
+		base, scale_index, mclk_freq, curr_freq);
+
+	return ret;
+}
+
 static int sdw_initialize_slave(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
 	int ret;
 	u8 val;
 
+	ret = sdw_slave_set_frequency(slave);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Set bus clash, parity and SCP implementation
 	 * defined interrupt mask
diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index 12f9ffc3eb3b..5d3c271af7d1 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -109,8 +109,18 @@
 #define SDW_SCP_KEEPEREN			0x4A
 #define SDW_SCP_BANKDELAY			0x4B
 #define SDW_SCP_COMMIT				0x4C
+
 #define SDW_SCP_BUS_CLOCK_BASE			0x4D
 #define SDW_SCP_BASE_CLOCK_FREQ			GENMASK(2, 0)
+#define SDW_SCP_BASE_CLOCK_UNKNOWN		0x0
+#define SDW_SCP_BASE_CLOCK_19200000_HZ		0x1
+#define SDW_SCP_BASE_CLOCK_24000000_HZ		0x2
+#define SDW_SCP_BASE_CLOCK_24576000_HZ		0x3
+#define SDW_SCP_BASE_CLOCK_22579200_HZ		0x4
+#define SDW_SCP_BASE_CLOCK_32000000_HZ		0x5
+#define SDW_SCP_BASE_CLOCK_RESERVED		0x6
+#define SDW_SCP_BASE_CLOCK_IMP_DEF		0x7
+
 /* 0x4E is not allocated in SoundWire specification 1.2 */
 #define SDW_SCP_TESTMODE			0x4F
 #define SDW_SCP_DEVID_0				0x50
-- 
2.17.1

