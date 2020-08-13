Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E94AA2448B3
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 13:09:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880751663;
	Fri, 14 Aug 2020 13:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880751663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597403377;
	bh=D/APM4+31XQe5VvcN3oH6f6P1SGCvM/NSHUQ61qr1x4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wl6+TdBR39qLKHBu9mLuSlLhI0o2AH1GqnJPCRCAuHFj1W7CPDy1kdyxztrYRB8LF
	 IFpXbp8jdHCGHit5fzh25c7KxhDkQaNh/Zy77StyJ8Cy1mm2WDigu5H8j/pdfrv1O4
	 /1QV2MRkaaKufnEN2pcJxnNsWM12oiVRl2fX+cMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B5BF801DB;
	Fri, 14 Aug 2020 13:07:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EA2FF8022B; Fri, 14 Aug 2020 13:07:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2D01F80146
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 13:07:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D01F80146
IronPort-SDR: Kh4RC5/kMrugtBOks5xL6XVp+837vvV+x3MsvKGMHbRtJNBMaBhFTdQ/wcZfDqr3geNOOo4Vw+
 nYhmNM+KeUvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="152032443"
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; d="scan'208";a="152032443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 04:07:40 -0700
IronPort-SDR: sknYMxwwD9yR/zUZHlAfvix6BJJJe3IwgbAve7p7mTA2iH0+cr5vcux7S02xS7O8hAexJDwggh
 25wj9gUY7xEg==
X-IronPort-AV: E=Sophos;i="5.76,312,1592895600"; d="scan'208";a="440082398"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 04:07:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: SDCA: add helper macro to access controls
Date: Fri, 14 Aug 2020 07:13:45 +0800
Message-Id: <20200813231345.26194-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
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
a hiearchical encoding to interface with Class-defined capabilities,
based on which audio function, entity, control and channel being used.

The specification is not yet accessible to the general public but this
information is released with explicit permission from the MIPI Board
to avoid delays with SDCA support on Linux platforms.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_registers.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index 5d3c271af7d1..3ca09a02b9fc 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -305,4 +305,14 @@
 #define SDW_CASC_PORT_MASK_INTSTAT3		1
 #define SDW_CASC_PORT_REG_OFFSET_INTSTAT3	2
 
+/* v1.2 device - SDCA address mapping */
+#define SDW_SDCA_CTL(fun, ent, ctl, ch) (BIT(30) |	\
+					 (((fun) & 0x7) << 22) |	\
+					 (((ent) & 0x40) << 15) |	\
+					 (((ent) & 0x3f) << 7) |	\
+					 (((ctl) & 0x30) << 15) |	\
+					 (((ctl) & 0x0f) << 3) |	\
+					 (((ch) & 0x38) << 12) |	\
+					 ((ch) & 0x07))
+
 #endif /* __SDW_REGISTERS_H */
-- 
2.17.1

