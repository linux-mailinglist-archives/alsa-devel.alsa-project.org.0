Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5038B3BAD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D56021A1;
	Fri, 26 Apr 2024 17:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D56021A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145697;
	bh=E8SBpjlUE0ziTNnq8DnhOzI49IUmjroDksM8NxVFNMM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eQyY6BY7YQHsN3JPkmoVy8mfsPdt0+iylZodo0pLnsxdILjKAtEaR22EHSOjuensx
	 zaztAEvoMDWxkJv9xIAKK9ZO13qezuKJvkd5LOyF6HtQdQpEOHlbBjLL7U3gglS8hW
	 9FYKKgOakC75MjH7Lr0CMHDRJMa2BP3wuqpziX5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1E1EF8070D; Fri, 26 Apr 2024 17:30:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A5EF80710;
	Fri, 26 Apr 2024 17:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2476BF8069A; Fri, 26 Apr 2024 17:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84669F805B2
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84669F805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tans0OQI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145411; x=1745681411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E8SBpjlUE0ziTNnq8DnhOzI49IUmjroDksM8NxVFNMM=;
  b=Tans0OQI435PwsQTrRziEjiELzcYMpHW25H1SakhflfnxhrJxPLqgr57
   mOUmxPERfGf4UIAuJEESCazhlPeweYu/xTAo9kFI5ioSBERmTOoYLgKPt
   OsW/Q11BZGghLL7wJKQar5lUrfzTd2tmkvKoPnFPO5MvgxIytfWaDCyon
   UF98KBSP5HfArU3EPq5r1FX+4FlKvMCUfjlDTet0DGeM8sZ6jLSLo+cPl
   Sp85n7nv8iQqKs90fFEdG0akGOItTr6NmUHuRXJgl/XVDEutVAJ0gc72S
   ac1CtM37R+pQiC1ZLtgh0PSXPVKbFcHKjg8IY5PNMr/mL29+TWPRr+QnR
   A==;
X-CSE-ConnectionGUID: R6AF5G92Rca0VL+nuJnaiw==
X-CSE-MsgGUID: Pp1qjBX7SiaiBzUSx9O0hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27339938"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="27339938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:29:57 -0700
X-CSE-ConnectionGUID: /8m65k2+SQG1LP+9NRX2wQ==
X-CSE-MsgGUID: /rhV1HVyTmmPASL0YTTFvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25332806"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:29:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: cs35l56: fix usages of device_get_named_child_node()
Date: Fri, 26 Apr 2024 10:29:39 -0500
Message-Id: <20240426152939.38471-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POJNCGIZ3YW4MUGDMMC5TJ2DU43W3SPB
X-Message-ID-Hash: POJNCGIZ3YW4MUGDMMC5TJ2DU43W3SPB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POJNCGIZ3YW4MUGDMMC5TJ2DU43W3SPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The documentation for device_get_named_child_node() mentions this
important point:

"
The caller is responsible for calling fwnode_handle_put() on the
returned fwnode pointer.
"

Add fwnode_handle_put() to avoid leaked references.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/cs35l56.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index dfd703d9e12f..758dfdf9d3ea 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1361,6 +1361,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 				    "spk-id-gpios", ACPI_TYPE_PACKAGE, &obj);
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "Could not get spk-id-gpios package: %d\n", ret);
+		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}
 
@@ -1368,6 +1369,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	if (obj->package.count != 4) {
 		dev_warn(cs35l56->base.dev, "Unexpected spk-id element count %d\n",
 			 obj->package.count);
+		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}
 
@@ -1382,6 +1384,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 		 */
 		ret = acpi_dev_add_driver_gpios(adev, cs35l56_af01_spkid_gpios_mapping);
 		if (ret) {
+			fwnode_handle_put(af01_fwnode);
 			return dev_err_probe(cs35l56->base.dev, ret,
 					     "Failed to add gpio mapping to AF01\n");
 		}
@@ -1389,14 +1392,17 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 		ret = devm_add_action_or_reset(cs35l56->base.dev,
 					       cs35l56_acpi_dev_release_driver_gpios,
 					       adev);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(af01_fwnode);
 			return ret;
+		}
 
 		dev_dbg(cs35l56->base.dev, "Added spk-id-gpios mapping to AF01\n");
 	}
 
 	desc = fwnode_gpiod_get_index(af01_fwnode, "spk-id", 0, GPIOD_IN, NULL);
 	if (IS_ERR(desc)) {
+		fwnode_handle_put(af01_fwnode);
 		ret = PTR_ERR(desc);
 		return dev_err_probe(cs35l56->base.dev, ret, "Get GPIO from AF01 failed\n");
 	}
@@ -1405,9 +1411,12 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	gpiod_put(desc);
 
 	if (ret < 0) {
+		fwnode_handle_put(af01_fwnode);
 		dev_err_probe(cs35l56->base.dev, ret, "Error reading spk-id GPIO\n");
 		return ret;
-		}
+	}
+
+	fwnode_handle_put(af01_fwnode);
 
 	dev_info(cs35l56->base.dev, "Got spk-id from AF01\n");
 
-- 
2.40.1

