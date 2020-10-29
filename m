Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1232B2A0041
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 09:45:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6E78852;
	Fri, 30 Oct 2020 09:44:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6E78852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604047512;
	bh=8JeDQ9vOe5SW/3W3gwVnoygOLGWy8L5szpmqA4F4Qdw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JJknuIEg/4vu9aKTAgXHJEbrUxXKBf+btfrJwyfsBZ4gVehMzyQg918ga2wZM9wV7
	 uG9x8cQBDL4zA9T6a90RcWr0P2Ve8WaEItGBIQyLHI2DtzCE0Cw+eXTtiCBBFhkJbx
	 tADbYg/pQr3Ky1DXEi3ym9My81ZKJf6kHrlPqqgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E59FF801D5;
	Fri, 30 Oct 2020 09:43:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B15B8F80212; Fri, 30 Oct 2020 09:43:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=DATE_IN_PAST_06_12, PRX_BODY_21,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B6BFF800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 09:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B6BFF800FF
IronPort-SDR: kj9OcrTFPTrOPS6SAnwocvhVzTXuN6xcCsZAfg7zVGpkyhAzugAh2W2p49GDIDPy60ts4zkqAf
 3DvV7/TBufPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="165992603"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="165992603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 01:43:26 -0700
IronPort-SDR: XjSnM+vJX1VrgkPr2onDnCG6DkgeY4rc7kXe01SYfsNPR9Qc79h8hEtXmgdG90cB0/3Y1T8bMn
 9Wd7cMCb5OLA==
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="536993206"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 01:43:23 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v3] soundwire: SDCA: add helper macro to access controls
Date: Fri, 30 Oct 2020 04:49:55 +0800
Message-Id: <20201029204955.8568-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

The upcoming SDCA (SoundWire Device Class Audio) specification defines
a hierarchical encoding to interface with Class-defined capabilities.

The specification is not yet accessible to the general public but this
information is released with explicit permission from the MIPI Board
to avoid delays with SDCA support on Linux platforms.

A block of 64 MBytes of register addresses are allocated to SDCA
controls, starting at address 0x40000000. The 26 LSBs which identify
individual controls are set based on the following variables:

- Function Number. An SCDA device can be split in up to 8 independent
  Functions. Each of these Functions is described in the SDCA
  specification, e.g. Smart Amplifier, Smart Microphone, Simple
  Microphone, Jack codec, HID, etc.

- Entity Number.  Within each Function,  an Entity is  an identifiable
  block.  Up   to  127  Entities   are  connected  in   a  pre-defined
  graph  (similar to  USB), with  Entity0 reserved  for Function-level
  configurations.  In  contrast  to  USB, the  SDCA  spec  pre-defines
  Function Types, topologies, and allowed  options, i.e. the degree of
  freedom  is not  unlimited to  limit  the possibility  of errors  in
  descriptors leading to software quirks.

- Control Selector. Within each Entity, the SDCA specification defines
  48 controls such as Mute, Gain, AGC, etc, and 16 implementation
  defined ones. Some Control Selectors might be used for low-level
  platform setup, and other exposed to applications and users. Note
  that the same Control Selector capability, e.g. Latency control,
  might be located at different offsets in different entities, the
  Control Selector mapping is Entity-specific.

- Control Number. Some Control Selectors allow channel-specific values
  to be set, with up to 64 channels allowed. This is mostly used for
  volume control.

- Current/Next values. Some Control Selectors are
  'Dual-Ranked'. Software may either update the Current value directly
  for immediate effect. Alternatively, software may write into the
  'Next' values and update the SoundWire 1.2 'Commit Groups' register
  to copy 'Next' values into 'Current' ones in a synchronized
  manner. This is different from bank switching which is typically
  used to change the bus configuration only.

- MBQ. the Multi-Byte Quantity bit is used to provide atomic updates
  when accessing more that one byte, for example a 16-bit volume
  control would be updated consistently, the intermediate values
  mixing old MSB with new LSB are not applied.

These 6 parameters are used to build a 32-bit address to access the
desired Controls. Because of address range, paging is required, but
the most often used parameter values are placed in the lower 16 bits
of the address. This helps to keep the paging registers constant while
updating Controls for a specific Device/Function.

Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
Changelog:

v2:
 - add SDW_SDCA_MBQ_CTL

v3:
 - add SDW_SDCA_NEXT_CTL

---
 include/linux/soundwire/sdw_registers.h | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index f420e8059779..e14dff9a9c7f 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -298,4 +298,36 @@
 #define SDW_CASC_PORT_MASK_INTSTAT3		1
 #define SDW_CASC_PORT_REG_OFFSET_INTSTAT3	2
 
+/*
+ * v1.2 device - SDCA address mapping
+ *
+ * Spec definition
+ *	Bits		Contents
+ *	31		0 (required by addressing range)
+ *	30:26		0b10000 (Control Prefix)
+ *	25		0 (Reserved)
+ *	24:22		Function Number [2:0]
+ *	21		Entity[6]
+ *	20:19		Control Selector[5:4]
+ *	18		0 (Reserved)
+ *	17:15		Control Number[5:3]
+ *	14		Next
+ *	13		MBQ
+ *	12:7		Entity[5:0]
+ *	6:3		Control Selector[3:0]
+ *	2:0		Control Number[2:0]
+ */
+
+#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |			\
+						 (((fun) & 0x7) << 22) |	\
+						 (((ent) & 0x40) << 15) |	\
+						 (((ent) & 0x3f) << 7) |	\
+						 (((ctl) & 0x30) << 15) |	\
+						 (((ctl) & 0x0f) << 3) |	\
+						 (((ch) & 0x38) << 12) |	\
+						 ((ch) & 0x07))
+
+#define SDW_SDCA_MBQ_CTL(reg)			((reg) | BIT(13))
+#define SDW_SDCA_NEXT_CTL(reg)			((reg) | BIT(14))
+
 #endif /* __SDW_REGISTERS_H */
-- 
2.17.1

