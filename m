Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5F596F48
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB6B41672;
	Wed, 17 Aug 2022 15:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB6B41672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660742014;
	bh=qNvx66hWZqGva6cBOQUF79aywA0lLqhY5wC4GeSrizQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QLMLCZDH09UqhYvUPU4Lx1gOs/ypt5htUMkrhXtKZrE/EkT8MoxyHsEvlLcYu3u4Y
	 yrLnCHkbCjz+UQtJOZMs7iFoO+LEM0BnAfpW61NmmXzlmVH2OMMaWNMypZCIRTS0cT
	 1TT6ZSes6xPR4tUiHIt3gazPbM6Xd3kS9zoK7pt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC492F80559;
	Wed, 17 Aug 2022 15:11:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60675F8025C; Wed, 17 Aug 2022 15:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9CDBF8025C
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 15:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9CDBF8025C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hVtOM0LI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660741877; x=1692277877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qNvx66hWZqGva6cBOQUF79aywA0lLqhY5wC4GeSrizQ=;
 b=hVtOM0LIAEVdawwtT0y37jnrDol0Kf8I6Iipe/oIrOor12THGsTDIGxj
 N2LyBX+f9R+hnrrWSvIpsZDy4L4mqe/+zZEkbJU9eBCLwczVfGg2eOZRn
 BsyW3OQUbB4Y0u/xMRiMgSAZJJBrVUbf5RojzpwFZf8X4pj5KOWI2x+z8
 p6M+uXaU7GcxjxRnPLaxb29BhYnyRD61IuLmW51ZhxJOI8xZgqZDLRid4
 j3IhPhai0k7Sy+zRiHd6Lq0OVX+uv4RBwbfoXoAHnzT5M0CosfDEQAZqk
 1NwCQnQL97UHeBbTACtBO/tIXsAMDkp+6a0HXPPvHAM90zUCr8CZ/H3z7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="318496083"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="318496083"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 06:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="667609971"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2022 06:11:12 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: hda: Remove unused MAX_PIN_CONFIGS constant
Date: Wed, 17 Aug 2022 15:11:36 +0200
Message-Id: <20220817131137.3978523-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
References: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Since it was introduced around v2.6.30 it was never used. Also HDA
specification does not mention any limitation on number of PIN
configurations.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/pci/hda/hda_sysfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/hda_sysfs.c b/sound/pci/hda/hda_sysfs.c
index bf951c10ae61..69ebc37a4d6f 100644
--- a/sound/pci/hda/hda_sysfs.c
+++ b/sound/pci/hda/hda_sysfs.c
@@ -375,8 +375,6 @@ static ssize_t user_pin_configs_show(struct device *dev,
 	return pin_configs_show(codec, &codec->user_pins, buf);
 }
 
-#define MAX_PIN_CONFIGS		32
-
 static int parse_user_pin_configs(struct hda_codec *codec, const char *buf)
 {
 	int nid, cfg, err;
-- 
2.25.1

