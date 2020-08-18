Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4F2492C6
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 04:10:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4B917E0;
	Wed, 19 Aug 2020 04:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4B917E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597803011;
	bh=e4tcnVMq3BWtr8UCeMaxY4y6RFpmeW9KxDITNOt1xTU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KOK+RMo1tUMK2tpaNks0fZeb7qVVbWNf2a7EH22khZmpc/+TotPrWs+XgLW7FydSW
	 saLHRr6P/D/STiQ9hMUsegziSf0YvJWKJrcxFXjeKFSmr5yrPFaJ8Iny68+MH7+5wA
	 jKcxbu+1eaQJ9KrFDlp9ei2Y9rNPyNzGjwOtKQDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 859CDF8011C;
	Wed, 19 Aug 2020 04:08:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D229F80218; Wed, 19 Aug 2020 04:08:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA838F8011C
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 04:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA838F8011C
IronPort-SDR: cRi/uzYMvU+bFZw1MNe2sYAGnCRdBN52ekT8ANN5YK+tN5mwL2KSJbS1cNrEBt/VvChYyaOlMf
 OQQ2D15sTftg==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="216559049"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="216559049"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:08:19 -0700
IronPort-SDR: 2pP3APDASrd4FiqdEvJhzSyavUWY5ojbt0in5jtliTFEi5TJ3EBV2Irv88OLhLAVsD8q/ogpsA
 umjcc206x//Q==
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="279566448"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:08:17 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: codecs: rt*-sdw: use SDW_SLAVE_ENTRY_EXT
Date: Tue, 18 Aug 2020 22:14:35 +0800
Message-Id: <20200818141435.29205-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

Add version and class information explicitly to prepare for support
for new devices.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 2 +-
 sound/soc/codecs/rt5682-sdw.c | 2 +-
 sound/soc/codecs/rt700-sdw.c  | 2 +-
 sound/soc/codecs/rt711-sdw.c  | 2 +-
 sound/soc/codecs/rt715-sdw.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 81e3e2caeb2f..ecb03ad8102e 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -696,7 +696,7 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
 }
 
 static const struct sdw_device_id rt1308_id[] = {
-	SDW_SLAVE_ENTRY(0x025d, 0x1308, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1308, 0x2, 0, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt1308_id);
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 148d4cff267b..4d5bc8ac38df 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -722,7 +722,7 @@ static int rt5682_sdw_remove(struct sdw_slave *slave)
 }
 
 static const struct sdw_device_id rt5682_id[] = {
-	SDW_SLAVE_ENTRY(0x025d, 0x5682, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x5682, 0x2, 0, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt5682_id);
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 2d475405b20d..b08ccc3da1dd 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -483,7 +483,7 @@ static int rt700_sdw_remove(struct sdw_slave *slave)
 }
 
 static const struct sdw_device_id rt700_id[] = {
-	SDW_SLAVE_ENTRY(0x025d, 0x700, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x700, 0x1, 0, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt700_id);
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 7a1ae7442e75..c72cd4fb64fd 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -484,7 +484,7 @@ static int rt711_sdw_remove(struct sdw_slave *slave)
 }
 
 static const struct sdw_device_id rt711_id[] = {
-	SDW_SLAVE_ENTRY(0x025d, 0x711, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x711, 0x2, 0, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt711_id);
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 761d4663e813..c87a3fc0678b 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -546,7 +546,7 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 }
 
 static const struct sdw_device_id rt715_id[] = {
-	SDW_SLAVE_ENTRY(0x025d, 0x715, 0),
+	SDW_SLAVE_ENTRY_EXT(0x025d, 0x715, 0x2, 0, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, rt715_id);
-- 
2.17.1

