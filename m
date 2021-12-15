Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DA476052
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:10:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8AA41AE6;
	Wed, 15 Dec 2021 19:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8AA41AE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639591831;
	bh=KIFf1KiX7mcT9FgeGScU3+yqjb9/ZW/8YOT/3A3xm8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eKehEisqQHHZHE4QskDl0FNQbdYZzILssgUJ3BDUNSmeI1grsf7kNYyjG5Q/Rtwn6
	 HK94VkxKLIVgxUh7bPyr+8AS1jcIHDgUjROoJigSg/bWi0k7y5zFRfvqFkWUNwuU+l
	 gNmhVJag05+5ldtgs5f+aU4T8xDWpxO/088N+mJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17B5AF80527;
	Wed, 15 Dec 2021 19:07:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 805D0F8051A; Wed, 15 Dec 2021 19:07:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34985F8030F
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34985F8030F
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="302671006"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="302671006"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="662015066"
Received: from manamie-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.37.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 10:04:13 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: SOF: topology: read back control data from DSP
Date: Wed, 15 Dec 2021 10:04:04 -0800
Message-Id: <20211215180404.53254-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
References: <20211215180404.53254-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Read back the control data from the DSP to initialize the control data
size to match that of the data in the DSP. This is particularly useful
for volatile read-only kcontrols in static pipelines.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 735fbc5fe1bd..91e3fa5a7350 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -59,12 +59,26 @@ static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_wi
 	/* set up all controls for the widget */
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
 		if (scontrol->comp_id == swidget->comp_id) {
+			/* set kcontrol data in DSP */
 			ret = sof_kcontrol_setup(sdev, scontrol);
 			if (ret < 0) {
 				dev_err(sdev->dev, "error: fail to set up kcontrols for widget %s\n",
 					swidget->widget->name);
 				return ret;
 			}
+
+			/*
+			 * Read back the data from the DSP for static widgets. This is particularly
+			 * useful for binary kcontrols associated with static pipeline widgets to
+			 * initialize the data size to match that in the DSP.
+			 */
+			if (swidget->dynamic_pipeline_widget)
+				continue;
+
+			ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
+			if (ret < 0)
+				dev_warn(sdev->dev, "Failed kcontrol get for control in widget %s\n",
+					 swidget->widget->name);
 		}
 
 	return 0;
-- 
2.25.1

