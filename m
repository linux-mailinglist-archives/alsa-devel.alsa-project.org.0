Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20C47B6B3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 02:10:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B091730;
	Tue, 21 Dec 2021 02:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B091730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640049030;
	bh=6ubr+4TEavfDo2liSNUTHZSq/Z+O+LHkMZgIpOlB/N4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJWlFW4y9Oz5U2crZtkmPu5VOveiIEiedmcb5gf0GSAX1oVW7FoasGmJvaDr4aG3s
	 3s7D8HkCqxmC69ZJjKX5xbS4HDJ0v9hWOahhoapRn1TdJPqlcIzPD9AgJBfBFCWNJp
	 n7/+3tiICDctxkDLVWOHjsxvGirDfNmxPeyZD+XU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABE2AF804D9;
	Tue, 21 Dec 2021 02:08:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D38F1F8012A; Tue, 21 Dec 2021 02:08:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3098BF80149
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 02:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3098BF80149
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237838429"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="237838429"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 17:08:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="684478626"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 17:08:30 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org
Subject: [PATCH 2/2] ALSA: hda: intel-sdw-acpi: go through HDAS ACPI at max
 depth of 2
Date: Tue, 21 Dec 2021 09:08:17 +0800
Message-Id: <20211221010817.23636-3-yung-chuan.liao@linux.intel.com>
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

In the HDAS ACPI scope, the SoundWire may not be the direct child of HDAS.
It needs to go through the ACPI table at max depth of 2 to find the
SoundWire device from HDAS.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
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
2.17.1

