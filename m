Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC7D6CD89B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 13:39:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFAA61F0;
	Wed, 29 Mar 2023 13:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFAA61F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680089947;
	bh=E+ffUpHrVx1RXmyEoo1Pw68WP8xips1tEnQiz6jLQMI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qw3OYQ5XUwKPM4EBqQ9Bz6DDwax+K8NHEpg1unkvP+/ryO3fUe6y6StGVgEXVkIt3
	 NmoP94KaLxymdE/2PaNw4z2EsXKQeFalse5XtT4P4zWmkJiq/MZtdDRBLey3A4ja/n
	 clwZN8tJzoDeA906fetwkaNU5sjz3G4PtI2bDtMw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09805F8024E;
	Wed, 29 Mar 2023 13:38:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E7EEF80272; Wed, 29 Mar 2023 13:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B730F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 13:38:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B730F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PFuyy5Ye
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680089883; x=1711625883;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E+ffUpHrVx1RXmyEoo1Pw68WP8xips1tEnQiz6jLQMI=;
  b=PFuyy5YevHJx000LZM/3y2LzQmjUTcVgeAfAidFRswen6+yvgXAVWSFE
   K+q3CBVb7nIG/ZgduHIKakEFqmKqEmAVeeYNk4MzN9LTZs64nCSCEft1g
   lj6DglZ2EZ1Wowbxgl9ullt0hiK65ASB5YFbiqsKY/yS4Tn1Pg4F18ERH
   CgTSfExQAyI/HtR35KySq4A7iSFinXWkRIfirvQOmOhrqm+G+ubNfP1Ae
   iXQNnbIREE2aYvvgy59fErUAdNioWf9avF6lD0aW7sRhsWQFzTjogSNrO
   B7fH5my/b/9QkOnBMCq6hsWNWVImCD7w6vFozJsdQaLLuWFNZOvzjY0Jf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403476135"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400";
   d="scan'208";a="403476135"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 04:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="795205168"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400";
   d="scan'208";a="795205168"
Received: from dfchaves-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.108])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 04:37:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH for v6.3-rc] ASoC: SOF: avoid a NULL dereference with
 unsupported widgets
Date: Wed, 29 Mar 2023 14:38:28 +0300
Message-Id: <20230329113828.28562-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FEZA7GOHASM44O6DRE5OQNIT43WCVSFO
X-Message-ID-Hash: FEZA7GOHASM44O6DRE5OQNIT43WCVSFO
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEZA7GOHASM44O6DRE5OQNIT43WCVSFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

If an IPC4 topology contains an unsupported widget, its .module_info
field won't be set, then sof_ipc4_route_setup() will cause a kernel
Oops trying to dereference it. Add a check for such cases.

Cc: stable@vger.kernel.org # 6.2
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Mark,

This patch is generated on top of 6.3-rc4, it will have conflict with asoc-next
because we have ChainDMA scheduled for 6.4 in there.
I should have taken this patch a faster track, but missed it when arranging the
patches, features.
We noticed this when trying to use our development IPC4 topologies with mainline
which does not yet able to handle the process module types (slated fro 6.4).
IPC4 is still evolving so it is not rare that fw/tplg/kernel needs to be
lock-stepped, but NULL pointer dereference should not happen.

This is how the merge conflict resolution should end up between 6.3 and 6.4:

int ret;

/* no route set up if chain DMA is used */
if (src_pipeline->use_chain_dma || sink_pipeline->use_chain_dma) {
	if (!src_pipeline->use_chain_dma || !sink_pipeline->use_chain_dma) {
		dev_err(sdev->dev,
			"use_chain_dma must be set for both src %s and sink %s pipelines\n",
			src_widget->widget->name, sink_widget->widget->name);
		return -EINVAL;
	}
	return 0;
}

if (!src_fw_module || !sink_fw_module) {
	/* The NULL module will print as "(efault)" */
	dev_err(sdev->dev, "source %s or sink %s widget weren't set up properly\n",
		src_fw_module->man4_module_entry.name,
		sink_fw_module->man4_module_entry.name);
	return -ENODEV;
}

sroute->src_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
					     SOF_PIN_TYPE_SOURCE);


Can you send this patch for 6.3 cycle?

Thank you,
Peter

 sound/soc/sof/ipc4-topology.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a623707c8ffc..669b99a4f76e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1805,6 +1805,14 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 	u32 header, extension;
 	int ret;
 
+	if (!src_fw_module || !sink_fw_module) {
+		/* The NULL module will print as "(efault)" */
+		dev_err(sdev->dev, "source %s or sink %s widget weren't set up properly\n",
+			src_fw_module->man4_module_entry.name,
+			sink_fw_module->man4_module_entry.name);
+		return -ENODEV;
+	}
+
 	sroute->src_queue_id = sof_ipc4_get_queue_id(src_widget, sink_widget,
 						     SOF_PIN_TYPE_SOURCE);
 	if (sroute->src_queue_id < 0) {
-- 
2.40.0

