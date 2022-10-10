Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757245F9E52
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2A0A2979;
	Mon, 10 Oct 2022 14:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2A0A2979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403551;
	bh=oy7fyKyoRPLZLsmhmobDVfYUc2SCjHIvJ0wTkN7LYcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WU7VUn7B1qLxUJSswK8GetdqpIqO+oDxcFffuM0A3g++TnaknvpFX+trj8xQtr2ns
	 qNMf5sL3gyC2oYC/xAfG98X0aIYoNAsNM2kQf1nrZFUV6SXNXga34u0/baSA4a+kCi
	 ECJXBUj7joiOFSXigDHWIviwSOWM/8sdF5btid+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 553ABF80558;
	Mon, 10 Oct 2022 14:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95938F80549; Mon, 10 Oct 2022 14:04:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90F3FF800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F3FF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="djn//NCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403439; x=1696939439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oy7fyKyoRPLZLsmhmobDVfYUc2SCjHIvJ0wTkN7LYcY=;
 b=djn//NCfxckNolDzwjPtBJtigD26RKhqU6pWduIwYSahF7WGrurSWKAa
 wUF00n2E4EyJBSiPiaUu5NGcyHddIpZZ0vWpGPlfPWZ+oOGMD6F5D3sEa
 FHSWcAniYiZB82wknO+Rj1rgaNb5GaXScQW8SQSpcWYSy82tNyuNDyogG
 +/AJA0zi++y28aZPFnRKV3Xqtdam7DGHXccbmohYdFFLwPP7fh074089c
 99E1tiBOOI1EgOvX8rrnDGi76f1yiIa6Ijht41Mie25HPh5J//Sb+s/0A
 57tifhIuXjmbJQhlHTJ3hOHsdF/8GZmK2wRayogyub7Ihlg8K5xBO96iw g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346082"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346082"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078904"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078904"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:03:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 05/15] ASoC: Intel: avs: Support AML with rt286
 configuration
Date: Mon, 10 Oct 2022 14:19:45 +0200
Message-Id: <20221010121955.718168-6-cezary.rojewski@intel.com>
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

ACPI ID of INT343A signals rt286 device for SKL, KBL and AML platforms.
Add the missing AML entry.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 87f9c18be238..95afbac0f358 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -29,6 +29,12 @@ static const struct dmi_system_id kbl_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "Skylake Y LPDDR3 RVP3"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "AmberLake Y"),
+		},
+	},
 	{}
 };
 
-- 
2.25.1

