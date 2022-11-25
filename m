Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DEE638FC3
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD1F176C;
	Fri, 25 Nov 2022 19:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD1F176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400844;
	bh=0zPRXWRwu7JchuRpBJMq6fTr5PW1H/S8d4GUlZY6Jo8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vQGd2lI42HCptsUXLfxvHWi/Z75BI33rgduk+4inWM7gcHknsognAAZROY6nTnQB/
	 MAKxqjv3ezzp0XAmVa1AlXr7mmCO9EjNSUQgNZcpj8IJLwG3N7K4Tvj4XBYq9J0txU
	 PDzzFMFCfDcvltgVxVW06Qrmk7YMJKq8ym6B3qe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF257F805B2;
	Fri, 25 Nov 2022 19:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4F4CF80589; Fri, 25 Nov 2022 19:23:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFEF2F80563
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFEF2F80563
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mxv/p92F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400626; x=1700936626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0zPRXWRwu7JchuRpBJMq6fTr5PW1H/S8d4GUlZY6Jo8=;
 b=mxv/p92FGgp8KzIZbMa4Knm3IF5Hp8bGPQQ+65rHADx130z2gfRqCGoD
 owHicVT33nT2ahF6bPV1I8b3Jh7BsG1sVBz9M0s6RZOPgOYKaCCZjhG7J
 Uv1TRMiVoCVFpZCL7a/DXEbkHLXJHkSnyxvyu9DZ5NsRYzTu1d1mycyZa
 I8avWhOZLYpi/jyIezyvSjYh4V1TJ8g9t2Ih4qrZIbKRCY+XllZWyv2me
 rfl3Xnc+fGl571ONInK6oSjT+eFyKF1VugV6D+sKXWX035AolylTziX/D
 h+4Av/1FRHNvHSO/T+0YZzWEIU6oFMZiux44PptjRcUI+SirNjSB+hieb g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909226"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909226"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005563"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005563"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:42 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 08/11] ASoC: Intel: avs: rt298: Add define for codec DAI name
Date: Fri, 25 Nov 2022 19:40:29 +0100
Message-Id: <20221125184032.2565979-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125184032.2565979-1-cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Following commits will make use of it to find codec DAI, define it
first.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt298.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 58c9d9edecf0..5570949bad8a 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -15,6 +15,8 @@
 #include <sound/soc-acpi.h>
 #include "../../../codecs/rt298.h"
 
+#define RT298_CODEC_DAI		"rt298-aif1"
+
 static const struct dmi_system_id kblr_dmi_table[] = {
 	{
 		.matches = {
@@ -147,7 +149,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-INT343A:00");
-	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "rt298-aif1");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT298_CODEC_DAI);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
-- 
2.25.1

