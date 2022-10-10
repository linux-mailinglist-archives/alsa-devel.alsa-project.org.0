Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E05F9E5D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:08:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AE6C29A6;
	Mon, 10 Oct 2022 14:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AE6C29A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403711;
	bh=1B2hUD1j7bRc11+vDf5SX1yy256UWJMaQb7ipbR3I5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZmdnDFdg5GP6+ZpqCy3y7nHNPzNvV42BvPpJkxg9HADpVQ42ulQK6be5lO5f4JbC
	 du45L7KjlBI/01aKFKd0DBswjmDLdqY5OMl/aqyTokomIXhLbIcro13WeutMhYMdPr
	 G0r8pElX34ai4D8ztme1LWEDrIF1abuchtYJwUn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11007F805BB;
	Mon, 10 Oct 2022 14:04:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F723F805AF; Mon, 10 Oct 2022 14:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4D1CF805A0
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4D1CF805A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QVRFh22w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403455; x=1696939455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1B2hUD1j7bRc11+vDf5SX1yy256UWJMaQb7ipbR3I5g=;
 b=QVRFh22wuTr2ZkqYjhgAsiCkBcfUUR06ddro9JGk4wDWJdrWzuQUgjqb
 RqQTH+9rpl40vg3larj/9/R9wlq5MiyRFeAuCv/aOC8QqxynkWQiuHqyE
 PjXTjj7sjMitLaBsmlC8Gl5Gru1ZyAXW4Ty1Zn1uULLL4lsgAxHuOdG0l
 CTdlw/L0aNnKzga/kJPRf9dSpe8854+w0D8PWSerY1cbyzz9798yXCYK1
 RnKMOrLuVdtlOjh4Q4l66CX4yGE00GQyllM+6t6Fw3P6d+tXZfwbQtdM8
 zwNeW54s9D5xVwvFD0/qYfb6sQo85+IkuPQ+bj7Gqe/MjFsgi5Lh/2ndx w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346124"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346124"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078956"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078956"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 13/15] ASoC: Intel: avs: Simplify ignore_fw_version
 description
Date: Mon, 10 Oct 2022 14:19:53 +0200
Message-Id: <20221010121955.718168-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Reword the parameter description to drop any confusion regarding its
purpose.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 9e3f8ff33a87..2d80a271eb50 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -43,7 +43,7 @@
 /* Occasionally, engineering (release candidate) firmware is provided for testing. */
 static bool debug_ignore_fw_version;
 module_param_named(ignore_fw_version, debug_ignore_fw_version, bool, 0444);
-MODULE_PARM_DESC(ignore_fw_version, "Verify FW version 0=yes (default), 1=no");
+MODULE_PARM_DESC(ignore_fw_version, "Ignore firmware version check 0=no (default), 1=yes");
 
 #define AVS_LIB_NAME_SIZE	8
 
-- 
2.25.1

