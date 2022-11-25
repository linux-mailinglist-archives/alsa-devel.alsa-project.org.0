Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08762638FBA
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98030175D;
	Fri, 25 Nov 2022 19:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98030175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400779;
	bh=AFnZU6XNgitudKbcIfkGVHKOYfkA6R+0bcF8Lpzk/NE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNchs7f2JdbeNAJoyzhqNSUBpf82w8Y1lN2JW0uhr7ulYEMTXdD3DyBWbCICIkvfW
	 05VQlzJoZ1bNJJj37IhC9mPBSld7i/Wd4J8Qe0MewFh4LwBLtOmXRB/iOXo8d3v2vI
	 3rIvYfiIylKMKFeHQ+gHV/HHl7C/eGibpfEi5rNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3B51F80588;
	Fri, 25 Nov 2022 19:23:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D16BCF80567; Fri, 25 Nov 2022 19:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9C77F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9C77F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Kiou8ZUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400622; x=1700936622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AFnZU6XNgitudKbcIfkGVHKOYfkA6R+0bcF8Lpzk/NE=;
 b=Kiou8ZUs3qN7MhYpZoNcZqEnCq2k00aUK3yNpH8HR3qNp/so+Hy1CQlw
 V1pmY9t64Lf2m3kks3Pw2emqeLaf2c0I3djGoyCkON8Zolv1gqXmTq/mu
 jvyu6kEaNxFhM1y+CKf4AVFNO+1/+KW/YrCDHTYI753ejjKVt4OZWSW2U
 3IK4G0ZckcMhk/uigCJSzWv3e6i145pYNoDgUnaGW3Kji904M+3SW3DbH
 8DVgRZOWHXOJS755//omFLKHEOfChR69rjCktLNib4WUrwmB3gHfy5ZQN
 Fy1n5Hq+8OL6C1mFy7AzXpkfpnlQe0fHFvvBO2EDek/ahp7z4ynGlT23E w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909224"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005539"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005539"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:38 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/11] ASoC: Intel: avs: rt286: Add define for codec DAI name
Date: Fri, 25 Nov 2022 19:40:27 +0100
Message-Id: <20221125184032.2565979-7-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/boards/rt286.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index e51d4e181274..7868a2d10cac 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -14,6 +14,8 @@
 #include <sound/soc-acpi.h>
 #include "../../../codecs/rt286.h"
 
+#define RT286_CODEC_DAI		"rt286-aif1"
+
 static const struct snd_kcontrol_new card_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -130,7 +132,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-INT343A:00");
-	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "rt286-aif1");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT286_CODEC_DAI);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
-- 
2.25.1

