Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C7184BD9
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 16:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6A56181F;
	Fri, 13 Mar 2020 16:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6A56181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584115079;
	bh=Mwr5dozpbfthVrHw0goDWngpbxR0cEEQ2JLD3vy+P7U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TQ/x4Qu5j+Lxu0WKNywdjC1kSx+owQFYFxMh3ZP1Fq8/wortbxZsqa1GBR0vO4D5T
	 aPo0c6e5lbJl60WZhHiV/ruzippYYbOIvIq1Z2S03Sa9ORmC7ah6W3uzwf/M7WSsZ7
	 B8cVzYjTkibWrmaO+JsZeivH8r2MyfrQqvJoTrRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B71A8F801F7;
	Fri, 13 Mar 2020 16:56:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B9AF801EB; Fri, 13 Mar 2020 16:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6808BF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 16:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6808BF80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 08:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="442462247"
Received: from msbaldwi-mobl.amr.corp.intel.com (HELO
 yzhi-desktop.amr.corp.intel.com) ([10.251.4.79])
 by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2020 08:56:06 -0700
From: Yong Zhi <yong.zhi@intel.com>
To: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: max98357a: Add ACPI HID MAX98360A
Date: Fri, 13 Mar 2020 10:55:26 -0500
Message-Id: <1584114926-29287-1-git-send-email-yong.zhi@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: tiwai@suse.de, liam.r.girdwood@linux.intel.com,
 Rajesh.Swaminathan@maximintegrated.com, broonie@kernel.org,
 sathyanarayana.nujella@intel.com, uday.m.bhat@intel.com,
 Yong Zhi <yong.zhi@intel.com>
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

Maxim MAX98360A audio amplifier is functionally identical to MAX98357A,
add ACPI ID "MAX98360A" for driver reuse.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
---
 sound/soc/codecs/max98357a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 74f20114297c..a8bd793a7867 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -133,6 +133,7 @@ MODULE_DEVICE_TABLE(of, max98357a_device_id);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id max98357a_acpi_match[] = {
 	{ "MX98357A", 0 },
+	{ "MX98360A", 0 },
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, max98357a_acpi_match);
-- 
2.7.4

