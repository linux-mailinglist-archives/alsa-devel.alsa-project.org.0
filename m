Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD48D24A4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 21:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A43A86F;
	Tue, 28 May 2024 21:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A43A86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716924665;
	bh=jhpfqMAGii1QKtIKhhNyRYse2i/DMgLOIM+NJMRllAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dyb8WzApGCTXaJ5Yxvktd/SkjP6ulxUXM4oTYcH+qDjXrG4HlUJjbAVbXfJprQtC8
	 84gjIHLQAl0qmzZZhXVd3dZpMVZ0wIxfFpJZgqjzw8KzJa3Mu8IL7coOqf3lHnTTR2
	 2361D3jnwKZowt9jqFW2Mp2JH5LzluVR4iKec9ic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D8E3F805C2; Tue, 28 May 2024 21:30:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 179D8F805BD;
	Tue, 28 May 2024 21:30:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992D3F8047C; Tue, 28 May 2024 21:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 157BFF800E9
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 21:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 157BFF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nP1WWx3M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716924602; x=1748460602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jhpfqMAGii1QKtIKhhNyRYse2i/DMgLOIM+NJMRllAo=;
  b=nP1WWx3ML/gRHD9qH5SkxlLXUM1k8N+8ezDziv3dm0Nmsngg5Csy4t8E
   /YhBqN5XKSPJnd+rhCr9EYIq5XG0fLOhlcIX97ocbI1t53aZyhz4NLj92
   s/LGc4ytnTLW52de9J0UYzK4NiGveIj9PuXhs51jWY2Tds/dLv5FRNEpi
   Dm76JBEzDPUgLGgEBYpXmvjJUxMKxeOlSz6T1R3p0UsYjUfkNlBn1gAjK
   LBefsi7uRrVZQZkT0pKm9QOKOlEHaSzFHK1VRaHUPh2EIFe2FmtG1syfa
   zD+r+5AE02H2gUPCXRnf/qBSWILiiM3CnzfqYwzhQSraNyagRH3NVXCQK
   w==;
X-CSE-ConnectionGUID: tQBDvYvNSzKxuIWQ/DluQw==
X-CSE-MsgGUID: NpMH9Ln+Sd6VJyOVjgmtCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24711845"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="24711845"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:54 -0700
X-CSE-ConnectionGUID: IMefETndQcyMYWtPaOeU6g==
X-CSE-MsgGUID: Qd0KmJVNRCmMoBqsIxJazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000";
   d="scan'208";a="35246720"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.237])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 12:29:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] soundwire: slave: simplify code with
 acpi_get_local_u64_address()
Date: Tue, 28 May 2024 14:29:34 -0500
Message-ID: <20240528192936.16180-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TUAVU43MHEFMAW5H2DEF6GJUU6XO6XR6
X-Message-ID-Hash: TUAVU43MHEFMAW5H2DEF6GJUU6XO6XR6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUAVU43MHEFMAW5H2DEF6GJUU6XO6XR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we have a helper so there's no need to open-code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/slave.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 9963b92eb505..f1a4df6cfebd 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -97,18 +97,13 @@ static bool find_slave(struct sdw_bus *bus,
 		       struct acpi_device *adev,
 		       struct sdw_slave_id *id)
 {
-	u64 addr;
 	unsigned int link_id;
-	acpi_status status;
+	u64 addr;
+	int ret;
 
-	status = acpi_evaluate_integer(adev->handle,
-				       METHOD_NAME__ADR, NULL, &addr);
-
-	if (ACPI_FAILURE(status)) {
-		dev_err(bus->dev, "_ADR resolution failed: %x\n",
-			status);
+	ret = acpi_get_local_u64_address(adev->handle, &addr);
+	if (ret < 0)
 		return false;
-	}
 
 	if (bus->ops->override_adr)
 		addr = bus->ops->override_adr(bus, addr);
-- 
2.43.0

