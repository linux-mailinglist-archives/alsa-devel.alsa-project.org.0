Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B847B6B4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 02:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 621EC1731;
	Tue, 21 Dec 2021 02:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 621EC1731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640049034;
	bh=QOfGkvatMtmgfEU6g7U9vG7M4N4lOi3MP6UJCE0YkXc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cRV+0ibu1Kot8o3EnL3DYw9JkUvHKioD7F8Ay2mV42f3sUzUm7k7/c8Ee4m3OxGfT
	 w08SUtr/HbiPDc95YpNIpZUBKZuqkDIYu6H9QwmFOZbfhsyg3+72y135rV25lVh0BN
	 gkfKCIuvfGXeZ8zxugpY1PB0nkBXWx9R2ygvhRg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BC1F804E6;
	Tue, 21 Dec 2021 02:08:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 812C5F801D5; Tue, 21 Dec 2021 02:08:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9012EF800B5
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 02:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9012EF800B5
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237838427"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="237838427"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 17:08:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="684478617"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 17:08:28 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org
Subject: [PATCH 1/2] ALSA: hda: intel-sdw-acpi: harden detection of controller
Date: Tue, 21 Dec 2021 09:08:16 +0800
Message-Id: <20211221010817.23636-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221010817.23636-1-yung-chuan.liao@linux.intel.com>
References: <20211221010817.23636-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: libin.yang@intel.com, vkoul@kernel.org,
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
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
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
2.17.1

