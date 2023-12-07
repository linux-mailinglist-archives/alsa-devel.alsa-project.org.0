Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645280956B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90574BC0;
	Thu,  7 Dec 2023 23:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90574BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988377;
	bh=87RWmAuyDOtLnTk/6xzH9RxAxP3WOAWpL88b5Ufejj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CE0fpyhD0xU6KGXLwgz93XMzG/3JESHBJvxwy0RKHNtY6yDJU3Ffr8gOG9OILiJQy
	 ZXLerMfbf/07LIGo2ZrFoxm+IVVppGdhF54zKM5wy9Qymg0wc9QnTEGhydIAP+NHts
	 KHHctaB+m8fXxYJo5D9BTS+4qWc9bop14cKCvFEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBF29F806A0; Thu,  7 Dec 2023 23:31:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 874F9F805AA;
	Thu,  7 Dec 2023 23:31:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F333F8069D; Thu,  7 Dec 2023 23:31:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44219F80557
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44219F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cu0T4Cvc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988220; x=1733524220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=87RWmAuyDOtLnTk/6xzH9RxAxP3WOAWpL88b5Ufejj0=;
  b=Cu0T4CvcxUNy5VAhOq9bHpDNg+/1DIpm4Zy0hvqR54YMwKNTyBWf0XYk
   Fac+MAP/UKw7PIwauBZyLGz5Eq46g5NFO/zmNeF3ydKZAKkhy6ERSRbP2
   5tbSQenuaC89rmEJNnJyOQIeCoAiZwUTJpPt5nBpOPRjrvzp2S29b4Vxs
   1ayT/fmShnrNVYao1GbqDv5m3N+MRuIGCqALBlxtbJYx7+avKY+VSTbqD
   evazi+YN6c42dv+PZTWVxZjoBFRwkCEU+JFij4SjBuBsXPTTfI5gNkbS8
   U+zvwLX/OovhRmcl34/iAeNlgimXcWikPO5lYHoLHRqR/XQqlx9OP+uU3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516654"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516654"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307492"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307492"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:17 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 09/16] soundwire: crc8: add constant table
Date: Thu,  7 Dec 2023 16:29:37 -0600
Message-Id: <20231207222944.663893-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VV4VR2UJVM56J5CYFKGJGQJZMGIX5KAS
X-Message-ID-Hash: VV4VR2UJVM56J5CYFKGJGQJZMGIX5KAS
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VV4VR2UJVM56J5CYFKGJGQJZMGIX5KAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the lookup table required by crc8(). All configuration values were
directly table from the MIPI SoundWire 1.x specification.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile |   4 +-
 drivers/soundwire/crc8.c   | 277 +++++++++++++++++++++++++++++++++++++
 drivers/soundwire/crc8.h   |  11 ++
 3 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/crc8.c
 create mode 100644 drivers/soundwire/crc8.h

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 657f5888a77b..170128dd9318 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -5,7 +5,9 @@
 
 #Bus Objs
 soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
-			sysfs_slave.o sysfs_slave_dpn.o
+			sysfs_slave.o sysfs_slave_dpn.o \
+			crc8.o
+
 obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
 soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
diff --git a/drivers/soundwire/crc8.c b/drivers/soundwire/crc8.c
new file mode 100644
index 000000000000..b6b984d7f39a
--- /dev/null
+++ b/drivers/soundwire/crc8.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2024 Intel Corporation.
+
+#include <linux/crc8.h>
+#include <linux/module.h>
+#include "crc8.h"
+
+/*
+ * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
+ * The value is (1)01001101 = 0x4D
+ *
+ * the table below was generated with
+ *
+ *	u8 crc8_lookup_table[CRC8_TABLE_SIZE];
+ *	crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
+ *
+ */
+
+const u8 sdw_crc8_lookup_msb[CRC8_TABLE_SIZE] = {
+	0x00, /* 0 */
+	0x4d, /* 1 */
+	0x9a, /* 2 */
+	0xd7, /* 3 */
+	0x79, /* 4 */
+	0x34, /* 5 */
+	0xe3, /* 6 */
+	0xae, /* 7 */
+	0xf2, /* 8 */
+	0xbf, /* 9 */
+	0x68, /* 10 */
+	0x25, /* 11 */
+	0x8b, /* 12 */
+	0xc6, /* 13 */
+	0x11, /* 14 */
+	0x5c, /* 15 */
+	0xa9, /* 16 */
+	0xe4, /* 17 */
+	0x33, /* 18 */
+	0x7e, /* 19 */
+	0xd0, /* 20 */
+	0x9d, /* 21 */
+	0x4a, /* 22 */
+	0x07, /* 23 */
+	0x5b, /* 24 */
+	0x16, /* 25 */
+	0xc1, /* 26 */
+	0x8c, /* 27 */
+	0x22, /* 28 */
+	0x6f, /* 29 */
+	0xb8, /* 30 */
+	0xf5, /* 31 */
+	0x1f, /* 32 */
+	0x52, /* 33 */
+	0x85, /* 34 */
+	0xc8, /* 35 */
+	0x66, /* 36 */
+	0x2b, /* 37 */
+	0xfc, /* 38 */
+	0xb1, /* 39 */
+	0xed, /* 40 */
+	0xa0, /* 41 */
+	0x77, /* 42 */
+	0x3a, /* 43 */
+	0x94, /* 44 */
+	0xd9, /* 45 */
+	0x0e, /* 46 */
+	0x43, /* 47 */
+	0xb6, /* 48 */
+	0xfb, /* 49 */
+	0x2c, /* 50 */
+	0x61, /* 51 */
+	0xcf, /* 52 */
+	0x82, /* 53 */
+	0x55, /* 54 */
+	0x18, /* 55 */
+	0x44, /* 56 */
+	0x09, /* 57 */
+	0xde, /* 58 */
+	0x93, /* 59 */
+	0x3d, /* 60 */
+	0x70, /* 61 */
+	0xa7, /* 62 */
+	0xea, /* 63 */
+	0x3e, /* 64 */
+	0x73, /* 65 */
+	0xa4, /* 66 */
+	0xe9, /* 67 */
+	0x47, /* 68 */
+	0x0a, /* 69 */
+	0xdd, /* 70 */
+	0x90, /* 71 */
+	0xcc, /* 72 */
+	0x81, /* 73 */
+	0x56, /* 74 */
+	0x1b, /* 75 */
+	0xb5, /* 76 */
+	0xf8, /* 77 */
+	0x2f, /* 78 */
+	0x62, /* 79 */
+	0x97, /* 80 */
+	0xda, /* 81 */
+	0x0d, /* 82 */
+	0x40, /* 83 */
+	0xee, /* 84 */
+	0xa3, /* 85 */
+	0x74, /* 86 */
+	0x39, /* 87 */
+	0x65, /* 88 */
+	0x28, /* 89 */
+	0xff, /* 90 */
+	0xb2, /* 91 */
+	0x1c, /* 92 */
+	0x51, /* 93 */
+	0x86, /* 94 */
+	0xcb, /* 95 */
+	0x21, /* 96 */
+	0x6c, /* 97 */
+	0xbb, /* 98 */
+	0xf6, /* 99 */
+	0x58, /* 100 */
+	0x15, /* 101 */
+	0xc2, /* 102 */
+	0x8f, /* 103 */
+	0xd3, /* 104 */
+	0x9e, /* 105 */
+	0x49, /* 106 */
+	0x04, /* 107 */
+	0xaa, /* 108 */
+	0xe7, /* 109 */
+	0x30, /* 110 */
+	0x7d, /* 111 */
+	0x88, /* 112 */
+	0xc5, /* 113 */
+	0x12, /* 114 */
+	0x5f, /* 115 */
+	0xf1, /* 116 */
+	0xbc, /* 117 */
+	0x6b, /* 118 */
+	0x26, /* 119 */
+	0x7a, /* 120 */
+	0x37, /* 121 */
+	0xe0, /* 122 */
+	0xad, /* 123 */
+	0x03, /* 124 */
+	0x4e, /* 125 */
+	0x99, /* 126 */
+	0xd4, /* 127 */
+	0x7c, /* 128 */
+	0x31, /* 129 */
+	0xe6, /* 130 */
+	0xab, /* 131 */
+	0x05, /* 132 */
+	0x48, /* 133 */
+	0x9f, /* 134 */
+	0xd2, /* 135 */
+	0x8e, /* 136 */
+	0xc3, /* 137 */
+	0x14, /* 138 */
+	0x59, /* 139 */
+	0xf7, /* 140 */
+	0xba, /* 141 */
+	0x6d, /* 142 */
+	0x20, /* 143 */
+	0xd5, /* 144 */
+	0x98, /* 145 */
+	0x4f, /* 146 */
+	0x02, /* 147 */
+	0xac, /* 148 */
+	0xe1, /* 149 */
+	0x36, /* 150 */
+	0x7b, /* 151 */
+	0x27, /* 152 */
+	0x6a, /* 153 */
+	0xbd, /* 154 */
+	0xf0, /* 155 */
+	0x5e, /* 156 */
+	0x13, /* 157 */
+	0xc4, /* 158 */
+	0x89, /* 159 */
+	0x63, /* 160 */
+	0x2e, /* 161 */
+	0xf9, /* 162 */
+	0xb4, /* 163 */
+	0x1a, /* 164 */
+	0x57, /* 165 */
+	0x80, /* 166 */
+	0xcd, /* 167 */
+	0x91, /* 168 */
+	0xdc, /* 169 */
+	0x0b, /* 170 */
+	0x46, /* 171 */
+	0xe8, /* 172 */
+	0xa5, /* 173 */
+	0x72, /* 174 */
+	0x3f, /* 175 */
+	0xca, /* 176 */
+	0x87, /* 177 */
+	0x50, /* 178 */
+	0x1d, /* 179 */
+	0xb3, /* 180 */
+	0xfe, /* 181 */
+	0x29, /* 182 */
+	0x64, /* 183 */
+	0x38, /* 184 */
+	0x75, /* 185 */
+	0xa2, /* 186 */
+	0xef, /* 187 */
+	0x41, /* 188 */
+	0x0c, /* 189 */
+	0xdb, /* 190 */
+	0x96, /* 191 */
+	0x42, /* 192 */
+	0x0f, /* 193 */
+	0xd8, /* 194 */
+	0x95, /* 195 */
+	0x3b, /* 196 */
+	0x76, /* 197 */
+	0xa1, /* 198 */
+	0xec, /* 199 */
+	0xb0, /* 200 */
+	0xfd, /* 201 */
+	0x2a, /* 202 */
+	0x67, /* 203 */
+	0xc9, /* 204 */
+	0x84, /* 205 */
+	0x53, /* 206 */
+	0x1e, /* 207 */
+	0xeb, /* 208 */
+	0xa6, /* 209 */
+	0x71, /* 210 */
+	0x3c, /* 211 */
+	0x92, /* 212 */
+	0xdf, /* 213 */
+	0x08, /* 214 */
+	0x45, /* 215 */
+	0x19, /* 216 */
+	0x54, /* 217 */
+	0x83, /* 218 */
+	0xce, /* 219 */
+	0x60, /* 220 */
+	0x2d, /* 221 */
+	0xfa, /* 222 */
+	0xb7, /* 223 */
+	0x5d, /* 224 */
+	0x10, /* 225 */
+	0xc7, /* 226 */
+	0x8a, /* 227 */
+	0x24, /* 228 */
+	0x69, /* 229 */
+	0xbe, /* 230 */
+	0xf3, /* 231 */
+	0xaf, /* 232 */
+	0xe2, /* 233 */
+	0x35, /* 234 */
+	0x78, /* 235 */
+	0xd6, /* 236 */
+	0x9b, /* 237 */
+	0x4c, /* 238 */
+	0x01, /* 239 */
+	0xf4, /* 240 */
+	0xb9, /* 241 */
+	0x6e, /* 242 */
+	0x23, /* 243 */
+	0x8d, /* 244 */
+	0xc0, /* 245 */
+	0x17, /* 246 */
+	0x5a, /* 247 */
+	0x06, /* 248 */
+	0x4b, /* 249 */
+	0x9c, /* 250 */
+	0xd1, /* 251 */
+	0x7f, /* 252 */
+	0x32, /* 253 */
+	0xe5, /* 254 */
+	0xa8  /* 255 */
+};
+EXPORT_SYMBOL(sdw_crc8_lookup_msb);
diff --git a/drivers/soundwire/crc8.h b/drivers/soundwire/crc8.h
new file mode 100644
index 000000000000..9a88d3866016
--- /dev/null
+++ b/drivers/soundwire/crc8.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2024 Intel Corporation. */
+
+#ifndef __SDW_CRC8_H
+#define __SDW_CRC8_H
+
+#define SDW_CRC8_SEED 0xFF
+#define SDW_CRC8_POLY 0x4D
+extern const u8 sdw_crc8_lookup_msb[CRC8_TABLE_SIZE];
+
+#endif /* __SDW_CRC8_H */
-- 
2.39.2

