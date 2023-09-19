Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03287A5DC3
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:26:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2CEFDF4;
	Tue, 19 Sep 2023 11:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2CEFDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115563;
	bh=h+bMpKvbGeoAUo9/NLlJVE/QcA0hF0wRy18h3sJC5Bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q3IoNvxjPiaLF2YUle/p6c6iiFOD67cmq487L1E4oHTi/0Gd3GlMBscNJ6jIVBFi2
	 FSC/giYcwwz7igls+2YBiBBUBVsWu6niK90+bg+ZG1qase2GEwZvhO5pQGxyA043wf
	 gLalQjglZbe1wK6Vo/TgE00oDMSvGuCPpcejyd8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 872BAF80563; Tue, 19 Sep 2023 11:24:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56820F8057C;
	Tue, 19 Sep 2023 11:24:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAD5CF80567; Tue, 19 Sep 2023 11:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ACA1F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ACA1F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gxih9OTK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115456; x=1726651456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h+bMpKvbGeoAUo9/NLlJVE/QcA0hF0wRy18h3sJC5Bo=;
  b=gxih9OTKlnMDNetdwyj4Qww7KwIQG0HvPzTKEKlVuoELdjj7Pcj4sCwr
   ekUZ/jYPYcaq3Y6GInM+brK8LbD3izzoiYrOwSpwtW6jAVw8w/SLUxlSb
   xs1Y1ogsqQqsbqtDl71MSIrEXYPLk+6fqrpYGSVp3/iYGvnNb0bgOC9ZI
   smMnxvUnHhYE67VBWcducrQ3sT198K+RmElSbJLEKN/QaBYkrkiznYpli
   0D0pUEEBUi/WCGymCJAbsshhjLkPG4y6kMaGJ4O6qsQJHLZGF4QCOu4OT
   cVmzpMP4KvL9jUgQKyRM08dmE/Drx5VDSPVJyMKzwEMSzPbEV7W3nmBTp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205150"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205150"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460193"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460193"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:11 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 1/9] ASoC: SOF: Xtensa: dump ar registers to restore call
 stack
Date: Tue, 19 Sep 2023 12:24:08 +0300
Message-ID: <20230919092416.4137-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TDYFNSEX2EW36R3UUESVJSXW2ZYGZD35
X-Message-ID-Hash: TDYFNSEX2EW36R3UUESVJSXW2ZYGZD35
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDYFNSEX2EW36R3UUESVJSXW2ZYGZD35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

On Xtensa platform ar0 is for caller address and ar1 is for stack
address. The ar register dump can be used to rebuild call stack with
FW elf file by debug tools.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/xtensa/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index bebbe3a2865c..7c91a919eadc 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -132,6 +132,17 @@ static void xtensa_stack(struct snd_sof_dev *sdev, const char *level, void *oops
 				   buf, sizeof(buf), false);
 		dev_printk(level, sdev->dev, "0x%08x: %s\n", stack_ptr + i * 4, buf);
 	}
+
+	if (!xoops->plat_hdr.numaregs)
+		return;
+
+	dev_printk(level, sdev->dev, "AR registers:\n");
+	/* the number of ar registers is a multiple of 4 */
+	for (i = 0; i < xoops->plat_hdr.numaregs; i += 4) {
+		hex_dump_to_buffer(xoops->ar + i, 16, 16, 4,
+				   buf, sizeof(buf), false);
+		dev_printk(level, sdev->dev, "%#x: %s\n", i * 4, buf);
+	}
 }
 
 const struct dsp_arch_ops sof_xtensa_arch_ops = {
-- 
2.42.0

