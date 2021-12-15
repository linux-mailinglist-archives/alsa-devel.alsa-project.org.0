Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C5475E06
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 17:58:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1309E1903;
	Wed, 15 Dec 2021 17:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1309E1903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639587514;
	bh=kiBMkJpMzPt4Pe8ygzeB8mJ+QOjhojfH8K1dIC9SYwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMdYwF1O5aH/ouC1ae5PyKuu81cDpji9xQ2bkpzdVy/wqWl3hPX8CJhIgrt2RBuDu
	 s2bYw5jVyHVu3XIW/MhcZ3I7zYYPbFbRGJq7sL8RO5yu3BY1DfszYreYqk9YxXIJGx
	 m/CJA1PBjKSGvs2kVRNuEZj4ypLtgeN1YYCvjMIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4752EF80311;
	Wed, 15 Dec 2021 17:56:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2E8DF8027C; Wed, 15 Dec 2021 17:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03398F800EE
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 17:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03398F800EE
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226556249"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="226556249"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:56:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="755469357"
Received: from lperezja-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.39.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:56:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: hda: intel-sdw-acpi: harden detection of controller
Date: Wed, 15 Dec 2021 10:56:31 -0600
Message-Id: <20211215165632.152976-2-pierre-louis.bossart@linux.intel.com>
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

The existing code currently sets a pointer to an ACPI handle before
checking that it's actually a SoundWire controller. This can lead to
issues where the graph walk continues and eventually fails, but the
pointer was set already.

This patch changes the logic so that the information provided to
the caller is set when a controller is found.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/intel-sdw-acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index c0123bc31c0d..ba8a872a2901 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -132,8 +132,6 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 		return AE_NOT_FOUND;
 	}
 
-	info->handle = handle;
-
 	/*
 	 * On some Intel platforms, multiple children of the HDAS
 	 * device can be found, but only one of them is the SoundWire
@@ -144,6 +142,9 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 	if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
 		return AE_OK; /* keep going */
 
+	/* found the correct SoundWire controller */
+	info->handle = handle;
+
 	/* device found, stop namespace walk */
 	return AE_CTRL_TERMINATE;
 }
-- 
2.25.1

