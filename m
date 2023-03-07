Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 654766ADB1C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:54:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E941407;
	Tue,  7 Mar 2023 10:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E941407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182893;
	bh=fwEhtMgcHPWBQmpgj/3wtZfyTUGbJNL+VjRnEjX7GW4=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UsJiZPMCumHQdBQmv7mbJQ7KejmQXvAZv6Q1toIyAWW0LHKLbw4nkrKI6FD4FJTe4
	 BT0A8lYucc1btbzEerYpYVkiY3y3QrqUHeD4QxQOKfyVxvgEoGOfEUEEzRMCOSzYBi
	 jLOwO+7RUd7/1gvCjF9hkmiIxB//NuYEGvOLgLLY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A16F80482;
	Tue,  7 Mar 2023 10:54:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31FA5F804B1; Tue,  7 Mar 2023 10:53:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF93EF80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF93EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TwR3ExCe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678182837; x=1709718837;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fwEhtMgcHPWBQmpgj/3wtZfyTUGbJNL+VjRnEjX7GW4=;
  b=TwR3ExCeOiCZy+FxQDjKxhofS1SX2KxHU6DsGc2vIbNRiwWkMpJlbQxL
   LkQoCKlLhSLZWRXmyvqyNmzgCt594l3yZx+b+1E6pbGQZpXYm/hB6s+AT
   HJUp+XvHKrMqSO/+0gc7iVdnIKJ4D35/7KLzLc9Hn8UHgpiBHSWx60/Vp
   fMOtkAljK+ncuOU0fEsqoA3B8mRiw8xTjuM3xfo5ET35fYLpTxideGjQp
   FOicIMw805fgVxKTaneP7Bst48C/U2O4fiNqaA49RmRbKV3N7K+7D8lJI
   0hrxDatM+YO3WA0dtJ/QwoVLG7YKjArp+QJCVoeAsi1XJDPcxkKxzHpNQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398391088"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="398391088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786644204"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="786644204"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:53:50 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Intel: hda-ctrl: re-add sleep after entering and
 exiting reset
Date: Tue,  7 Mar 2023 11:54:12 +0200
Message-Id: <20230307095412.3416-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KXK6MY2BBQDKWIKQFVAVDOFAFG5ZMW6J
X-Message-ID-Hash: KXK6MY2BBQDKWIKQFVAVDOFAFG5ZMW6J
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXK6MY2BBQDKWIKQFVAVDOFAFG5ZMW6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

This reverts commit a09d82ce0a867 ("ASoC: SOF: Intel: hda-ctrl: remove
useless sleep")

It was a mistake to remove those delays, in light of comments in the
HDaudio spec captured in snd_hdac_bus_reset_link() that the codec
needs time for its initialization and PLL lock.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index a1037512da1f..e1dba6b79065 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -198,12 +198,15 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 		goto err;
 	}
 
+	usleep_range(500, 1000);
+
 	/* exit HDA controller reset */
 	ret = hda_dsp_ctrl_link_reset(sdev, false);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to exit HDA controller reset\n");
 		goto err;
 	}
+	usleep_range(1000, 1200);
 
 	hda_codec_detect_mask(sdev);
 
-- 
2.39.2

