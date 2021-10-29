Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB943F44E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 03:13:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C8616E0;
	Fri, 29 Oct 2021 03:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C8616E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635469982;
	bh=sk7T6uN9CRS+L1UO4w6EZUqP3TZqER0Ex662CoUI2EE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bZxhk66li7ZWk7UmaWy25duIUa5RHODD9hwttGX1RI7X+WiEOQpw1iFlDxDf47uyI
	 kXxr8aDc8wNpXwFnnzKNq8dqkKSKYv0SxcHHq9m/QjwpAPQJwX6Pp8TDs9QzC2THtd
	 7xe+gmMZF5wRAYVcrtUTlDXICbkWhM/Z/zBXpRms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DDC5F80269;
	Fri, 29 Oct 2021 03:11:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB2EF802C8; Fri, 29 Oct 2021 03:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 807E2F8014E
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 03:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 807E2F8014E
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="254141735"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="254141735"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 18:11:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="447931022"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 18:11:27 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: es8316: add support for ESSX8336 ACPI _HID
Date: Fri, 29 Oct 2021 09:11:09 +0800
Message-Id: <20211029011109.23633-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

The same codec seems to have different personalities. ESSX8316 was
used for Baytrail/CherryTrail, ESSX8336 seems to be used for AppoloLake,
GeminiLake, JasperLake and TigerLake devices.

BugLink: https://github.com/thesofproject/linux/issues/2955
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>-e
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/es8316.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 5fb02635c140..8f30a3ea8bfe 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -840,6 +840,7 @@ MODULE_DEVICE_TABLE(of, es8316_of_match);
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id es8316_acpi_match[] = {
 	{"ESSX8316", 0},
+	{"ESSX8336", 0},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, es8316_acpi_match);
-- 
2.17.1

