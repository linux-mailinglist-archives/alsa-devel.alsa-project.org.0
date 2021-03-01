Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A3C32861A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9F1D1672;
	Mon,  1 Mar 2021 18:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9F1D1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614618250;
	bh=HAkcICHpt5UHHuYo5F3y7ghEtQlhagPM/3YUR/af6Ik=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nb9+SVQYshXkJ3uVJvZZkaDHED0nyJY6aD/78tJ0kuEudWk9ed7CLOdGTjWHByln9
	 KoAY/zfoNIxn7l95mwTaHFD8PdbndXqDuQQhElkrshUL9OF9uOizmGEqPvF4VqDEW7
	 nAOmLyoKniKQUDVmw4w3k+AKVaGK4gLrePis1XRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39137F800E0;
	Mon,  1 Mar 2021 18:02:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC8EEF8025E; Mon,  1 Mar 2021 18:02:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A947FF8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A947FF8010B
IronPort-SDR: mT6kMpQed1x6780JtQeE78PkbtVFSuaR2IfO2JZs00QyBf4T8i5m5UXgNWBN1Udzct38xC0oP7
 tPUsh9M9cG/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184088948"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="184088948"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 09:02:02 -0800
IronPort-SDR: Q6xAVDSXppW25dhqzb596smNB/V4hyvxdnbmbIMtja7kXals9m+RqalXjjUMcQhPZZ52CDvhZ+
 /UiBkoezQlgg==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="373182061"
Received: from abchen1-mobl.amr.corp.intel.com (HELO rsridh-mobl1.localdomain)
 ([10.212.100.45])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 09:02:02 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: enable async suspend
Date: Mon,  1 Mar 2021 09:01:57 -0800
Message-Id: <20210301170157.36584-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

The skylake driver disabled async suspend to prevent disabling
the DSP before the card was suspended during system suspend.
This code was carried over to the SOF driver. But, there is no
risk of the DSP getting disabled before the card is suspended
with the SOF driver. Therefore, it is safe to enable async suspend
and thereby optimize the system resume time.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 0dc3a8c0f5e3..25b799f0accc 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -614,8 +614,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	u32 link_mask;
 	int ret = 0;
 
-	device_disable_async_suspend(bus->dev);
-
 	/* check if dsp is there */
 	if (bus->ppcap)
 		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
-- 
2.25.1

