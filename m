Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF235F757E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Oct 2022 10:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F7E1676;
	Fri,  7 Oct 2022 10:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F7E1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665132564;
	bh=cCAxJh5utgC3f6GKILVhs1i67VpuTmxoev5dljQysSE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TtafzcFWZth55zrVyfohIRPAQOP1+hvhYkp7tXm464EQyKbjHE8XCrn+XPUh57dq7
	 7wRYFucz4xGRC3GHHDxyT1mtR3pFQLFJzVIQaF7mJFG9SOzJWnovNkkyj/WaJB9ogM
	 TVUzo0UmV754YCQSSRobaizwQHuQRDuEn5lNqH8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72813F80496;
	Fri,  7 Oct 2022 10:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52F7BF8025E; Fri,  7 Oct 2022 10:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 524EAF8012A
 for <alsa-devel@alsa-project.org>; Fri,  7 Oct 2022 10:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 524EAF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CBf3KBM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665132501; x=1696668501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cCAxJh5utgC3f6GKILVhs1i67VpuTmxoev5dljQysSE=;
 b=CBf3KBM71J2qRuSqD46AouxH4TocdnHLpRisgNl/jfWL5HpspJPvOAsh
 ZSDyiWtk36aAk5OTqZiodywf6fk9+fqqpPhNBzWzzmz3VTWcTYrNPWVoD
 fz4RE3H2AR3/YGEhJnhCvlJJQo5nbUAM5teVWg30KfuM32J3v8Tju6Ut4
 AM2yVhk7ExKyXj+k82oTO6WkE8xfhsdAA5rsCeJv0H8a1CSuMB5/b65A/
 xBuK3kBYnSOWDtLk9tEOL+D4gGN9Qfl6E+UjctQS6SNFpfN9KUwY8E3d2
 RrTIt48ugZlxPx2n2kHW3uUqW6XbgIHXrLNwEgi6MbiAsDAZJf79PeyNJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="367814954"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="367814954"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 01:48:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="658266375"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="658266375"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga001.jf.intel.com with ESMTP; 07 Oct 2022 01:48:10 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda: Update register polling macros
Date: Fri,  7 Oct 2022 10:48:56 +0200
Message-Id: <20221007084856.1638302-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Jon Hunter <jonathanh@nvidia.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
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

Recent commit d91857059def ("ALSA: hda: Rework snd_hdac_stream_reset() to use macros")
missed that on some devices register access needs to be done with
unaligned access helper. Change polling macros to use
read_poll_timeout_atomic() in order to specify register read function.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Link: https://lore.kernel.org/alsa-devel/20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com/T/#m1270737db52b5ef163eff73cb5f862d16a07a428
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hdaudio.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index ddff03e546e9..35778f953a3f 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -592,11 +592,11 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
 #define snd_hdac_stream_readb(dev, reg) \
 	snd_hdac_reg_readb((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readb_poll(dev, reg, val, cond, delay_us, timeout_us) \
-	readb_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
-			   delay_us, timeout_us)
+	read_poll_timeout_atomic(snd_hdac_reg_readb, val, cond, delay_us, timeout_us, \
+				 false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readl_poll(dev, reg, val, cond, delay_us, timeout_us) \
-	readl_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
-			   delay_us, timeout_us)
+	read_poll_timeout_atomic(snd_hdac_reg_readl, val, cond, delay_us, timeout_us, \
+				 false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 
 /* update a register, pass without AZX_REG_ prefix */
 #define snd_hdac_stream_updatel(dev, reg, mask, val) \
-- 
2.25.1

