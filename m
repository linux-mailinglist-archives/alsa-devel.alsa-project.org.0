Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369F8B3B9B
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E1281923;
	Fri, 26 Apr 2024 17:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E1281923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145581;
	bh=3F6/tVa/XcMgdmfcS/i1sZkh26FGdmmuq1waL6fYv60=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iimK6K70xbz5JiHD3grzvKdJRhXXAtc+W1OPbOgFmn6ieIEdT0gpDfT+TThykrT4m
	 IhZq1XOA+iCBpZP2vD/XTO+drwjRbN678x1Ln7CDeJyVIP4pxJDpSzdgoRXLYraY/z
	 mY2e7amxcJjztT8U2hm5PIYbcXpN5Q7/zUolvcCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD2EF80638; Fri, 26 Apr 2024 17:27:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4265F805AD;
	Fri, 26 Apr 2024 17:27:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A29D4F80579; Fri, 26 Apr 2024 17:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63D18F800B5
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D18F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JgofB0gV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145265; x=1745681265;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3F6/tVa/XcMgdmfcS/i1sZkh26FGdmmuq1waL6fYv60=;
  b=JgofB0gVT7IqASM9yfzhYb4xZMamjiF+ZvVivOz4AMc8NzbJ382spoWp
   2dUt7Hkg5+FBMWZVy+Y7oNezdpokz3YCJ20zo4yJ1dffSQkworx1+7p7P
   MONGdZolC5i8vH5x7KKxW73LlUgNqcXGVKYXinWdwVP0O4rIFCWXDi5s3
   Ej2O43sqhEIzWcJcAxLGdQhg8+dhHXGnEyYE4H//fmbdK8tVPA7xfbGYm
   aua2JuTK/TEohjaM+KpFYT8rmSr/WxP77ulVlWIcBrpKOwNSZOv26XyvF
   A0jVU4A5/XAZz4NYr+bvx+hFw8tLfpEKi0eHmdgtAAr0P0sP713ExWYqT
   w==;
X-CSE-ConnectionGUID: TKvQidYBR1SCXd42+W7kZg==
X-CSE-MsgGUID: ZDTLahmOTIm36d8AavVU5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27400384"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="27400384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:27:42 -0700
X-CSE-ConnectionGUID: 3XZWoFiAR0CZBTfs5WdqfQ==
X-CSE-MsgGUID: EUPyBMB4RmC0/UpJm+svGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25420913"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:27:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ALSA: hda: intel-sdw-acpi: fix usage of
 device_get_named_child_node()
Date: Fri, 26 Apr 2024 10:27:31 -0500
Message-Id: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UJM57UUX7EAK3F5CIFWEXHK2BQCGMCGH
X-Message-ID-Hash: UJM57UUX7EAK3F5CIFWEXHK2BQCGMCGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJM57UUX7EAK3F5CIFWEXHK2BQCGMCGH/>
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

Add fwnode_handle_put() to avoid a leaked reference.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 5f60658c6051..d7417a40392b 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -45,6 +45,8 @@ static bool is_link_enabled(struct fwnode_handle *fw_node, u8 idx)
 				 "intel-quirk-mask",
 				 &quirk_mask);
 
+	fwnode_handle_put(link);
+
 	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
 		return false;
 
-- 
2.40.1

