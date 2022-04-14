Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97443501865
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 18:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B331640;
	Thu, 14 Apr 2022 18:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B331640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649952742;
	bh=JHRqMz4gAhqXCZ0oOD51j0XWL2JY+ezYae/a6d6QvJE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IuDYfkdzCvEbLa7Zobj0mVmHTRwkd37XY3tYklvMQvXAq9T+kycP4oQY/8mg2h+cn
	 fHwSY89FzId3RJnlItdtDvaRGScdKWsOACroSveT0a8j1euACbWcah8wGxjyGMh5qX
	 yzxUgd0N4/xs2b2KUFIr7a1ZqPxudBKBXKowpvLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C43F801F7;
	Thu, 14 Apr 2022 18:11:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37C1FF80162; Thu, 14 Apr 2022 18:11:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4142EF80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 18:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4142EF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XMiTHxFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649952675; x=1681488675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JHRqMz4gAhqXCZ0oOD51j0XWL2JY+ezYae/a6d6QvJE=;
 b=XMiTHxFO8/XSx7nEglvxm79xkfDEFwUw+GGhKVhJ2cwXPotu6b7XN+7B
 xY+VEY54v94NQKNljU196BR+J6Akvm2FunEHuyjOp39tncFsyg3lpucnR
 8dU3nhreVvOs1ft2mrR1olJW3ssqdbaBXwlWZGMzWHoqR7j4GKxK6NIMo
 9KWLnUaqw/54Vm+gxpZ5WLKtPw3Ls1S+jjtUXXYpVaNs+zREZc69TqJbY
 lCwgZlvxieMlzw/fbi2QJk0av7JNymLc6UwOiaeSSVoB/1kzU3nNTvV0B
 DT1QlCp2wrZSK2wwaa0oj2aTaMw01/EzrX/mQUqwWnRK+C6/GDWNrtR3L w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="242899740"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="242899740"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 09:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="700730868"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2022 09:11:09 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/hdmi: add HDMI codec VID for Raptorlake-P
Date: Thu, 14 Apr 2022 19:01:29 +0300
Message-Id: <20220414160129.3641411-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

Add HDMI codec VID for Intel Raptorlake-P platform.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 3e086eebf88d..9f9784e93db2 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4551,6 +4551,7 @@ HDA_CODEC_ENTRY(0x80862819, "DG2 HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x8086281f, "Raptorlake-P HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
 HDA_CODEC_ENTRY(0x80862882, "Valleyview2 HDMI",	patch_i915_byt_hdmi),
 HDA_CODEC_ENTRY(0x80862883, "Braswell HDMI",	patch_i915_byt_hdmi),

base-commit: 4516d04608b40d9ad150df6c2faef4a12d038ff6
-- 
2.35.1

