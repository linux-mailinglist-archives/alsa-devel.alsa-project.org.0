Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A689E653017
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 12:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33FCD16DA;
	Wed, 21 Dec 2022 12:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33FCD16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671621531;
	bh=Y8nl3bPZho6VnWkSTaobln2om5vlm3qNMUCK0O0EdW4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pdDO1DahEFOAPyzMsW5NiReFWNMGGrJ+uimv0974MM9C/nzxO73I0TzdOna9J8OX3
	 wy2gjqWnTlz7R/ujcHcR9BBalygjDK5ePVyn8dmcSM68fI/ReBh7bvH5mbP1tt0YCg
	 gMEf79zo1aAff/Mpdptv2rZwbuj4VdS9RU65za8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C466AF8024D;
	Wed, 21 Dec 2022 12:17:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5A1F8047B; Wed, 21 Dec 2022 12:17:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 030D2F801C1
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 12:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030D2F801C1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OV5oblMm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671621471; x=1703157471;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y8nl3bPZho6VnWkSTaobln2om5vlm3qNMUCK0O0EdW4=;
 b=OV5oblMmKj3JtYnD4d6bgdlOxfqJVn3LIaAGHfI1q4AbtKs2KyGjxV4P
 a8cJZb0MQONeaxyhSpKHEKOT5yNJoOYk5CxqnIpLA7mxlVbtxEO9oH/aM
 3YBjaQDNQXO76lGkOb8rOeO661ksowGQjoncheVfmes1bO+0r5dKWVOsJ
 yPPE7V8Bqp2n8ucNpDvIRfHV6f0L/DAXXsEW33cXJkmWn1xclhO8zXsdJ
 cfObhGhmNXQb1hitthEj4B7OAkvqUaZkSBx99DOna0IUqF7gyznMgbLhK
 dARRrumG3AeoolD3VCjPMj07STqtKNT0Olz2YcoIx52VVMWEkCUBRroIr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="321759275"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="321759275"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:17:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="644801753"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="644801753"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 03:17:42 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: core: Print out the value of sof_debug if it is set
Date: Wed, 21 Dec 2022 13:17:50 +0200
Message-Id: <20221221111750.20283-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The sof_debug value is set by the user, developer intentionally.
To save time on figuring out what value has been passed to the kernel by
the user, developer, print it out if it is not 0.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 625977a29d8a..26a3f7c8c914 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -362,6 +362,9 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	sdev->first_boot = true;
 	dev_set_drvdata(dev, sdev);
 
+	if (sof_core_debug)
+		dev_info(dev, "sof_debug value: %#x\n", sof_core_debug);
+
 	/* check IPC support */
 	if (!(BIT(plat_data->ipc_type) & plat_data->desc->ipc_supported_mask)) {
 		dev_err(dev, "ipc_type %d is not supported on this platform, mask is %#x\n",
-- 
2.39.0

