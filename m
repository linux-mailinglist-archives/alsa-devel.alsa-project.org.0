Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B48690B9B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 15:23:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B7BDEE;
	Thu,  9 Feb 2023 15:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B7BDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675952592;
	bh=xY5bB9VMvo0sbMhXE+hkTWRzhmPxZAyBWscQKsbheu8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eCCCXDpTyZ9nqWTb9S2BVLUUsfTeNd/NUR+hnyMDM6XAyDp+hHzHH3ntxF8mR9ADl
	 fGQeu8OKW/oKhoCoalgkua1wvselqjS4FXEabIAZFvVL+wkBu/OKQricIpOJGrlv5J
	 DCP6SqTG41w6m07axe59cDtWX+dmvseC2981gp0Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A3D4F804F2;
	Thu,  9 Feb 2023 15:21:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C53FF8018A; Thu,  9 Feb 2023 15:21:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4400DF80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 15:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4400DF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O0NNcviK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675952483; x=1707488483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xY5bB9VMvo0sbMhXE+hkTWRzhmPxZAyBWscQKsbheu8=;
  b=O0NNcviKWoRZc+HP2y3pwgm0qH0/qqoGZ6ZadizKSJsAo50jWLmnOxEh
   zSKMxzYTgdtC2fB5WJu1EvJRK5YAHSV3XW6HdxT08RCjlPhr4WvUughaM
   jAgRTKSc2gvcozxObA+Sxc5s/XFshK+KoXloDn4A/qpI1tUS34GTCxzqh
   nk+5ZDgKTn1/5NtR0b3rB6iJRkZ58jsqkvFfrRZYOiiEhsQCdXq/813sv
   EVbkPxlba/NHix9tzsV9ETSd7LBAMxfUH+f/RWbWzJb2s7lNw4fHWgiWB
   potWoVZbpUt2LYLHTGhUFhTuDj1OgmDghdo5zlEmuFMnYXbk16zKG1gYa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309763785"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000";
   d="scan'208";a="309763785"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 06:21:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756412215"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000";
   d="scan'208";a="756412215"
Received: from borisgol-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.16.232])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 06:21:15 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: ipc4-topology: Print queue IDs in error
Date: Thu,  9 Feb 2023 16:21:22 +0200
Message-Id: <20230209142123.17193-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209142123.17193-1-peter.ujfalusi@linux.intel.com>
References: <20230209142123.17193-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CRJ5SOBF4CHKR5RI5U6DHCYDX2HENNX7
X-Message-ID-Hash: CRJ5SOBF4CHKR5RI5U6DHCYDX2HENNX7
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRJ5SOBF4CHKR5RI5U6DHCYDX2HENNX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Print the queue ID's during bind/unbind errors as well to make it easier
to see what failed exactly.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 43340c8917b7..02ddc48a1107 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1790,8 +1790,9 @@ static int sof_ipc4_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *
 
 	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
 	if (ret < 0) {
-		dev_err(sdev->dev, "%s: failed to bind modules %s -> %s\n",
-			__func__, src_widget->widget->name, sink_widget->widget->name);
+		dev_err(sdev->dev, "failed to bind modules %s:%d -> %s:%d\n",
+			src_widget->widget->name, sroute->src_queue_id,
+			sink_widget->widget->name, sroute->dst_queue_id);
 
 		sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id,
 				      SOF_PIN_TYPE_SOURCE);
@@ -1839,8 +1840,9 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 
 	ret = sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
 	if (ret < 0)
-		dev_err(sdev->dev, "failed to unbind modules %s -> %s\n",
-			src_widget->widget->name, sink_widget->widget->name);
+		dev_err(sdev->dev, "failed to unbind modules %s:%d -> %s:%d\n",
+			src_widget->widget->name, sroute->src_queue_id,
+			sink_widget->widget->name, sroute->dst_queue_id);
 out:
 	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_SINK);
 	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_SOURCE);
-- 
2.39.1

