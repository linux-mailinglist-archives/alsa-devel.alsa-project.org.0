Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33A1F76FB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 12:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 538451680;
	Fri, 12 Jun 2020 12:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 538451680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591959481;
	bh=eRoJVQdb0HCivHezpWvAl+OVUBUUkio5x3njFnQWq/U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XW7DfIOvNOJ5GFAjhEDMBBzTqSAUodORXVi3nzpoo7elqSlWvlsT3aCrZmLeJgl+n
	 KYXe3b9BOkoi2D8jWvAabdYpxVqznjbYDpLu4JtL0xc9o+BeCeYCXvP89gUBENB/lB
	 fuen75NoWzbP78laMDDRKaqrMDpsR0d8EeY+h2T8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0F4F800CC;
	Fri, 12 Jun 2020 12:56:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45E41F8021C; Fri, 12 Jun 2020 12:56:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9E81F800C7;
 Fri, 12 Jun 2020 12:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E81F800C7
IronPort-SDR: +2nBgWcTwo2xbfTK/9nczfBpBW5eJphrin6t3tCSszj/OVwc+JQZJm4qfE4GwJ5oI1CdPCibhX
 yqPFbQthDQYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 03:56:03 -0700
IronPort-SDR: ZcGLl+RkwYt02Z8/gxScjrfLCyrd+lsf9nChOIzUYX1xpa7CjJqsblc7ofsxXz5d63WK5YLMdh
 xCLDm9xZbaWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; d="scan'208";a="259857472"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2020 03:56:00 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ASoC: SOF: Intel: hda: Clear RIRB status before reading WP
Date: Fri, 12 Jun 2020 18:50:48 +0800
Message-Id: <1591959048-15813-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 sound-open-firmware@alsa-project.org
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

Port commit 6d011d5057ff ("ALSA: hda: Clear RIRB status before reading
WP") from legacy HDA driver to fix the get response timeout issue.
Current SOF driver does not suffer from this issue because sync write
is enabled in hda_init. The issue will come back if the sync write is
disabled for some reason.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 7f65dcc..1bda14c 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -653,11 +653,16 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 		if (status & AZX_INT_CTRL_EN) {
 			rirb_status = snd_hdac_chip_readb(bus, RIRBSTS);
 			if (rirb_status & RIRB_INT_MASK) {
+				/*
+				 * Clearing the interrupt status here ensures
+				 * that no interrupt gets masked after the RIRB
+				 * wp is read in snd_hdac_bus_update_rirb.
+				 */
+				snd_hdac_chip_writeb(bus, RIRBSTS,
+						     RIRB_INT_MASK);
 				active = true;
 				if (rirb_status & RIRB_INT_RESPONSE)
 					snd_hdac_bus_update_rirb(bus);
-				snd_hdac_chip_writeb(bus, RIRBSTS,
-						     RIRB_INT_MASK);
 			}
 		}
 #endif
-- 
2.7.4

