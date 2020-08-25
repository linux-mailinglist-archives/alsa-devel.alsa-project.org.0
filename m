Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B4251E26
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 19:21:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0BD1696;
	Tue, 25 Aug 2020 19:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0BD1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598376065;
	bh=y34yMPWeq+8JpoMn4MeMLzIQSVx4BB8E14Vv/15jW/0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/KOJVV/QBxC31ta+ihRfO4N70Ok6IxcjYTSzELIqIDQXjHiDwOmwN9aYgxJYUD0u
	 1M9Qi6gDUj6eDFk/iRwjA00ZcoEWrf/w239+dG21gHG15z4km1eH74oyYMihGfLeka
	 INp4sk8mUCDAaKi8tq8a+HAOX48lCLlSkfjN+mII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74074F802DD;
	Tue, 25 Aug 2020 19:17:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9BAFF802D2; Tue, 25 Aug 2020 19:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODY_21,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D48D6F8027B
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 19:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D48D6F8027B
IronPort-SDR: pIYXb267PoRL0bNjFHKPcNBN3dHzVQ2oxWEnE8uaR9712nGI/luKGq2KJEPD3l67JGbVaXEWe9
 /4gGPxdc9B6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="135708964"
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="135708964"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 10:17:17 -0700
IronPort-SDR: PBop5Lx7VvOJchCK1BWtuHjsg7bvEWt1wT488uBs4HceJPLmVXxtd7bdfOJ4PT28OHLA1Ufmia
 Ou/g8wqVtZlQ==
X-IronPort-AV: E=Sophos;i="5.76,353,1592895600"; d="scan'208";a="331478445"
Received: from bgarring-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.4.243])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 10:17:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] soundwire: SDCA: add helper macro to access controls
Date: Tue, 25 Aug 2020 12:16:55 -0500
Message-Id: <20200825171656.75836-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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
---
 include/linux/soundwire/sdw_registers.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index 5d3c271af7d1..906dadda7387 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -305,4 +305,17 @@
 #define SDW_CASC_PORT_MASK_INTSTAT3		1
 #define SDW_CASC_PORT_REG_OFFSET_INTSTAT3	2
 
+/* v1.2 device - SDCA address mapping */
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
2.25.1

