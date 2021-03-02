Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B432956E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 01:34:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC43168C;
	Tue,  2 Mar 2021 01:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC43168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614645248;
	bh=a2+x/DXL/D0/+0DEH5Uf8wH5c1OD6QcKHmOWqdDcRyc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lLelONDi3ZyG5IbycE5A8/bqMHNTThIoP8Mcw9DT/duNv5cMiyHf4LJADNZYPX5HP
	 r+3z9XsaNPhRh0AG1uPuLkeK/Mu+RDSfZN0f8wD8BOKlSBs5KJQyW/wSBGTTysqOrF
	 immmNAc+SW9ywH4PODggp3A01NA6nS3jNxI/UN/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D48B9F8032C;
	Tue,  2 Mar 2021 01:31:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1FABF802E2; Tue,  2 Mar 2021 01:31:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8306BF80257
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 01:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8306BF80257
IronPort-SDR: Knt5BN8QBm9ZP27PaHO9yLEYnPZeSghoLIlwAzDBb0K0PMHc6f8MP/NoiYDZv+Y8d0QBJ1ZQGM
 wnIh8GfasYEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248048767"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248048767"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:38 -0800
IronPort-SDR: NumtgIHSqpRMRXQ2WEif7Tnf8wUIfW20lAg3C5JoNrN95tlw4fLs/7Qx3X4arHus9kq4UrSuK0
 tkVj1AHkPB4Q==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="444512521"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: soc-acpi: allow for partial match in parent name
Date: Mon,  1 Mar 2021 18:31:19 -0600
Message-Id: <20210302003125.1178419-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arnd@arndb.de, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard Liao <bard.liao@intel.com>
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

To change the module dependencies and simplify Kconfigs, we need to
introduce new driver names (sof-audio-acpi-intel-byt and
sof-audio-acpi-intel-bdw), and move from an exact string match to a
partial one.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 include/sound/soc-acpi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 9a43c44dcbbb..c45075024c30 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -174,7 +174,7 @@ struct snd_soc_acpi_codecs {
 static inline bool snd_soc_acpi_sof_parent(struct device *dev)
 {
 	return dev->parent && dev->parent->driver && dev->parent->driver->name &&
-		!strcmp(dev->parent->driver->name, "sof-audio-acpi");
+		!strncmp(dev->parent->driver->name, "sof-audio-acpi", strlen("sof-audio-acpi"));
 }
 
 #endif
-- 
2.25.1

