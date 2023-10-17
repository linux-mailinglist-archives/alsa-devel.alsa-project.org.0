Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2866E7CC87A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 18:13:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51CD82B;
	Tue, 17 Oct 2023 18:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51CD82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697559202;
	bh=5TkiqnrgGUR9l/9JjizuOwqg19NNV0hU60DdfXEYDDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oWiUwsIKCO6F3porAOJhQnctS1co+JlbunvYh5SDuzwrUHFhxzXXKxodSqh8bcZXT
	 tykPGWXS1pKBnw9IKw7hiUjkgjWD3ScdxQdVz1X1bAzdw9CTpowwF2xLJaIjeMHAaC
	 o95hy8lECoNmpMWjUpj0KGYbjdOSxS5NtW11bakI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F413BF80571; Tue, 17 Oct 2023 18:11:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 970A1F80570;
	Tue, 17 Oct 2023 18:11:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2324F80536; Tue, 17 Oct 2023 18:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D62DF8024E
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 18:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D62DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E45Yr0oB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697559088; x=1729095088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5TkiqnrgGUR9l/9JjizuOwqg19NNV0hU60DdfXEYDDc=;
  b=E45Yr0oB5roK4Dly1usYr1BtO+uyO2zFHkw+WBC881bO/AC0uNUwNKmC
   FPXuuI0Djedp+PXageKGXz3msR2Q2MO+GcRAcUlZAUySYuk8y0ahQLHfm
   BogB9VPqYt+aNPo0TQQYmGMqnqmLcQfEJMDJHqRubCUZjXl7NM0PWrbzE
   uRY+Bal3mo5uVfq9QqxLyas4UecVFtKbC0qPMH35qZeLmRd/2PWp6DHzZ
   PVJYRWEVYjnU5UGq1Y7SEC5tNL2HJCP27cvR2la2y8KMWGDU/fdK2/Ub1
   DlOMiTiCS1RXpCkRpsekoCJYfsmpjWf+oAnoPq3N3DiFI15dvmic2a+78
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="365167521"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200";
   d="scan'208";a="365167521"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 09:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="759865021"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200";
   d="scan'208";a="759865021"
Received: from asprado-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.55.179])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 09:09:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 2/2] soundwire: fix initializing sysfs for same devices on
 different buses
Date: Tue, 17 Oct 2023 11:09:33 -0500
Message-Id: <20231017160933.12624-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
References: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6WIGGUK7MLLP3UJQJPEMOYVOU4USPGEG
X-Message-ID-Hash: 6WIGGUK7MLLP3UJQJPEMOYVOU4USPGEG
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WIGGUK7MLLP3UJQJPEMOYVOU4USPGEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

If same devices with same device IDs are present on different soundwire
buses, the probe fails due to conflicting device names and sysfs
entries:

  sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'

The link ID is 0 for both devices, so they should be differentiated by
the controller ID. Add the controller ID so, the device names and sysfs entries look
like:

  sdw:1:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6ab0000.soundwire-controller/sdw-master-1-0/sdw:1:0:0217:0204:00:0
  sdw:3:0:0217:0204:00:0 -> ../../../devices/platform/soc@0/6b10000.soundwire-controller/sdw-master-3-0/sdw:3:0:0217:0204:00:0

[PLB changes: use bus->controller_id instead of bus->id]

Fixes: 7c3cd189b86d ("soundwire: Add Master registration")
Cc: <stable@vger.kernel.org>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/slave.c        | 12 ++++++------
 sound/soc/intel/boards/sof_sdw.c |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index c1c1a2ac293a..060c2982e26b 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -39,14 +39,14 @@ int sdw_slave_add(struct sdw_bus *bus,
 	slave->dev.fwnode = fwnode;
 
 	if (id->unique_id == SDW_IGNORED_UNIQUE_ID) {
-		/* name shall be sdw:link:mfg:part:class */
-		dev_set_name(&slave->dev, "sdw:%01x:%04x:%04x:%02x",
-			     bus->link_id, id->mfg_id, id->part_id,
+		/* name shall be sdw:ctrl:link:mfg:part:class */
+		dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x",
+			     bus->controller_id, bus->link_id, id->mfg_id, id->part_id,
 			     id->class_id);
 	} else {
-		/* name shall be sdw:link:mfg:part:class:unique */
-		dev_set_name(&slave->dev, "sdw:%01x:%04x:%04x:%02x:%01x",
-			     bus->link_id, id->mfg_id, id->part_id,
+		/* name shall be sdw:ctrl:link:mfg:part:class:unique */
+		dev_set_name(&slave->dev, "sdw:%01x:%01x:%04x:%04x:%02x:%01x",
+			     bus->controller_id, bus->link_id, id->mfg_id, id->part_id,
 			     id->class_id, id->unique_id);
 	}
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 869dacb81133..6575549b8407 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1242,11 +1242,11 @@ static int fill_sdw_codec_dlc(struct device *dev,
 	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
 				  class_id, adr_index))
 		codec->name = devm_kasprintf(dev, GFP_KERNEL,
-					     "sdw:%01x:%04x:%04x:%02x", link_id,
+					     "sdw:0:%01x:%04x:%04x:%02x", link_id,
 					     mfg_id, part_id, class_id);
 	else
 		codec->name = devm_kasprintf(dev, GFP_KERNEL,
-					     "sdw:%01x:%04x:%04x:%02x:%01x", link_id,
+					     "sdw:0:%01x:%04x:%04x:%02x:%01x", link_id,
 					     mfg_id, part_id, class_id, unique_id);
 
 	if (!codec->name)
-- 
2.39.2

