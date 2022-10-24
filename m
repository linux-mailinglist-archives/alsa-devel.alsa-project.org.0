Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D25D60B323
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320294F31;
	Mon, 24 Oct 2022 18:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320294F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630611;
	bh=mTOxBoOQP/DjI6wUgswr2b57PuIjIw/3v4kRCKjqZlc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCT9DxGnCLPIkHHO54+3oNcamFsERv2oGRm9RjsJYmPUH522vHZdTngZ6jtspOXKS
	 WsAemWTrz/WMmTE2s+QQhbkk1Q8HH5x0MCmoIiw7qJ6WqfZAK60TPO1MKTZMoBr32O
	 kLX/2NcgTLafH83NzokByq1h8EhH8PvKHNiyDqvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6205F805A8;
	Mon, 24 Oct 2022 18:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D042F80431; Mon, 24 Oct 2022 18:53:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B0FAF80549
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B0FAF80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cQMIejTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630410; x=1698166410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mTOxBoOQP/DjI6wUgswr2b57PuIjIw/3v4kRCKjqZlc=;
 b=cQMIejTdFuCOzyDdj3EPz4hpbZu63lIIGCewDNWRJ+K94E1cT1vczvqs
 NGJpeQfb4/ca5TzcvJ3A2iQ/91Y9rIaFqDVL3tsZP5SFo5BQgy3n6CrLx
 /Q0mU+nascpi8ZMKFG/2mjy0AfV2TIBY7cCIWRmIgwHwXLAn1FbLrXmh/
 Spx3oNHGH1dYkf+mE4y/yX6u7hNhmugHqjSbcgLnLTQqLQrAfUwpKyy2y
 VF2C1SVeJFzyq7Beq//bA6dDMpB3kAzhUUXFhjbJmTizGWdxtlAeqjOq1
 8MkZZWPvdTrELrqQZ1qt1hUskjBhGIj870bYr+VGtK9yX4fIDfh6O8Br/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287868632"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="287868632"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263057"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263057"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/16] ASoC: SOF: Intel: hda-dsp: use SOF helpers for
 consistency
Date: Mon, 24 Oct 2022 11:52:59 -0500
Message-Id: <20221024165310.246183-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 799c50fe24dab..74067df96fdc4 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -347,10 +347,9 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 
 static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev)
 {
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	int retry = HDA_DSP_REG_POLL_RETRY_COUNT;
 
-	while (snd_hdac_chip_readb(bus, VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
+	while (snd_sof_dsp_readb(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C) & SOF_HDA_VS_D0I3C_CIP) {
 		if (!retry--)
 			return -ETIMEDOUT;
 		usleep_range(10, 15);
@@ -380,6 +379,7 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
+	u8 reg;
 
 	/* Write to D0I3C after Command-In-Progress bit is cleared */
 	ret = hda_dsp_wait_d0i3c_done(sdev);
@@ -389,7 +389,8 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 	}
 
 	/* Update D0I3C register */
-	snd_hdac_chip_updateb(bus, VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
+	snd_sof_dsp_updateb(sdev, HDA_DSP_HDA_BAR,
+			    SOF_HDA_VS_D0I3C, SOF_HDA_VS_D0I3C_I3, value);
 
 	/* Wait for cmd in progress to be cleared before exiting the function */
 	ret = hda_dsp_wait_d0i3c_done(sdev);
@@ -398,7 +399,8 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 		return ret;
 	}
 
-	trace_sof_intel_D0I3C_updated(sdev, snd_hdac_chip_readb(bus, VS_D0I3C));
+	reg = snd_sof_dsp_readb(sdev, HDA_DSP_HDA_BAR, SOF_HDA_VS_D0I3C);
+	trace_sof_intel_D0I3C_updated(sdev, reg);
 
 	return 0;
 }
-- 
2.34.1

