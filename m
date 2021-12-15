Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 117DE475E04
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 17:58:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B66318ED;
	Wed, 15 Dec 2021 17:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B66318ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639587512;
	bh=pt8mJjKwslGtRCRdh61OPBcevNprjkOcqoBpFAUsPYE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bwyNLX419FNOcUuxYxYIXwgb8dpCUokeN5uUVR9GwSGnEDJI2sYl5c6ZfbmUIW86b
	 rSEyqOWB01flz70K2N2/HWI5x1pkgg5+Zpmg/IpySaQOzBVAAswTv/yu1JtOWEQ3yT
	 37/huCHect07cEBdUv2wLXOXv4SVQlC6V0n1+2TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B63CFF800EE;
	Wed, 15 Dec 2021 17:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BF12F8025D; Wed, 15 Dec 2021 17:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DC35F8019D
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 17:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC35F8019D
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226556253"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226556253"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:56:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="755469362"
Received: from lperezja-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.39.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:56:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: hda: intel-sdw-acpi: go through HDAS ACPI at max
 depth of 2
Date: Wed, 15 Dec 2021 10:56:32 -0600
Message-Id: <20211215165632.152976-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215165632.152976-1-pierre-louis.bossart@linux.intel.com>
References: <20211215165632.152976-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Libin Yang <libin.yang@intel.com>

In the HDAS ACPI scope, the SoundWire may not be the direct child of HDAS.
It needs to go through the ACPI table at max depth of 2 to find the
SoundWire device from HDAS.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index ba8a872a2901..b7758dbe2371 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -165,8 +165,14 @@ int sdw_intel_acpi_scan(acpi_handle *parent_handle,
 	acpi_status status;
 
 	info->handle = NULL;
+	/*
+	 * In the HDAS ACPI scope, 'SNDW' may be either the child of
+	 * 'HDAS' or the grandchild of 'HDAS'. So let's go through
+	 * the ACPI from 'HDAS' at max depth of 2 to find the 'SNDW'
+	 * device.
+	 */
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
-				     parent_handle, 1,
+				     parent_handle, 2,
 				     sdw_intel_acpi_cb,
 				     NULL, info, NULL);
 	if (ACPI_FAILURE(status) || info->handle == NULL)
-- 
2.25.1

