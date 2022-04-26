Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D1510984
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 22:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB0517DE;
	Tue, 26 Apr 2022 22:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB0517DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651003608;
	bh=OJQ+xzciXDmtWuKjXovfvB1V82bHISNwHbZvbUeNtr0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WbtJLU9hKs8rLGJIR2GLJUrzzv+4GhhkyijEUEuPU9TeQH12r8EDU6z1FVB9Ht62w
	 W6XqVIsoTC2Rgh+cdh67OWTjmJlfoDMjHnLtZgrbN4MttJLYi10a8phauZs7H/+1TC
	 ue+Am7cOU6H6je0xAlyQskD9qHL5wb0TaNicpYno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8930F80105;
	Tue, 26 Apr 2022 22:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F43CF80171; Tue, 26 Apr 2022 22:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF921F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 22:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF921F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b5QoKQ43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651003540; x=1682539540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OJQ+xzciXDmtWuKjXovfvB1V82bHISNwHbZvbUeNtr0=;
 b=b5QoKQ43gomgNLpeBPJMMg8lK4hlAi8Mqddfv83xBtIwRO46h680RUY1
 g1hYyNxrZMZxgPNI4RkS2qm+iZYvGqkhuvk21a+zIRwq5qwc5ULxLAtT9
 AEJqjVoBIsj/bNm1CnXCg7veusREayLVegJEJqABqgu80QUAyVdpDGnj/
 iotJD1Crj4h9cXcqlFnNz0A1GtagyLdCwyrZNl7oIERlU/ghqpugAGQVh
 MDusKapn+D+QKofC1ZKtBCA/LVFlOJUXe/oyU2rpMHWtl1mLKZQchI0gW
 iK3BMRAGd+DMKfMa1sjcFGHDyG6bcuc9NcE54jCkz7mTHzUkPiDQKTLEk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265230415"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265230415"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 13:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="679173592"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga004.jf.intel.com with ESMTP; 26 Apr 2022 13:05:33 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 1/2] ALSA: hda: intel-nhlt: Move structs out of #define
 block
Date: Tue, 26 Apr 2022 22:05:38 +0200
Message-Id: <20220426200539.894010-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, kernel test robot <lkp@intel.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

As functions prototypes regerdless of CONFIG options as well as some
code depend on structures defined in sound/intel-nhlt.h header, move
them out of #define block. This allows to compile code depending on
mentioned header with "depends on ACPI || COMPILE_TEST" in Kconfig.

Fixes: 47a1886a610a ("ASoC: Intel: avs: Enable AVS driver only on x86 platforms")
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/intel-nhlt.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
index 6fb2d5e378fd..3d5cf201cd80 100644
--- a/include/sound/intel-nhlt.h
+++ b/include/sound/intel-nhlt.h
@@ -25,8 +25,6 @@ enum nhlt_device_type {
 	NHLT_DEVICE_INVALID
 };
 
-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
-
 struct wav_fmt {
 	u16 fmt_tag;
 	u16 channels;
@@ -126,6 +124,8 @@ enum {
 	NHLT_MIC_ARRAY_VENDOR_DEFINED = 0xf,
 };
 
+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
+
 struct nhlt_acpi_table *intel_nhlt_init(struct device *dev);
 
 void intel_nhlt_free(struct nhlt_acpi_table *addr);
@@ -143,8 +143,6 @@ intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
 
 #else
 
-struct nhlt_acpi_table;
-
 static inline struct nhlt_acpi_table *intel_nhlt_init(struct device *dev)
 {
 	return NULL;
-- 
2.25.1

