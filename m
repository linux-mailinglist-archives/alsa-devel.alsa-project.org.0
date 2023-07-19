Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B175C0E4
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2176208;
	Fri, 21 Jul 2023 10:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2176208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689927012;
	bh=DQg9rf5Xt6GjXzWr7kJn6sdN5sPIYloCidYiDN3W38c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bUq/dyzh61zQ4/oaUwlo8i/+Outkfh7Axcens8Z9PKMONMTyLyNCAzkFoZwskYei2
	 gM389fRID5a9gy3Ja0HRDh/arSV+xEpuuCVrElvGu3/Vc7LULv54Cd8x1JWl/Jrknd
	 AU1Yrt4f9aRCgcu9tWYas30LP8H05o2HtjF7dv8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C2CBF8055A; Fri, 21 Jul 2023 10:08:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B0BF80535;
	Fri, 21 Jul 2023 10:08:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9293EF8047D; Wed, 19 Jul 2023 18:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DED59F80520;
	Wed, 19 Jul 2023 18:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED59F80520
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 5/9] ASoC: Intel: avs: Move snd_hdac_i915_init to before
 probe_work.
Date: Wed, 19 Jul 2023 18:41:37 +0200
Message-Id: <20230719164141.228073-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VAS5AIRPJ7XGYMBDMVQ4TWXGKMVTUHXM
X-Message-ID-Hash: VAS5AIRPJ7XGYMBDMVQ4TWXGKMVTUHXM
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:08:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAS5AIRPJ7XGYMBDMVQ4TWXGKMVTUHXM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that we can use -EPROBE_DEFER, it's no longer required to spin off
the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
can be destroyed, but I don't have the means to test this.

Removing the workqueue would simplify init even further, but is left
as exercise for the reviewer.

Changes since v1:
- Rename error label.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/avs/core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 3311a6f142001..64e7a4e650a86 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -191,10 +191,6 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	pm_runtime_set_active(bus->dev); /* clear runtime_error flag */
 
-	ret = snd_hdac_i915_init(bus, true);
-	if (ret < 0)
-		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
-
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 	avs_hdac_bus_init_chip(bus, true);
 	avs_hdac_bus_probe_codecs(bus);
@@ -465,10 +461,19 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	pci_set_drvdata(pci, bus);
 	device_disable_async_suspend(dev);
 
+	ret = snd_hdac_i915_init(bus, false);
+	if (ret == -EPROBE_DEFER)
+		goto err_i915_init;
+	else if (ret < 0)
+		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
+
 	schedule_work(&adev->probe_work);
 
 	return 0;
 
+err_i915_init:
+	pci_clear_master(pci);
+	pci_set_drvdata(pci, NULL);
 err_acquire_irq:
 	snd_hdac_bus_free_stream_pages(bus);
 	snd_hdac_ext_stream_free_all(bus);
-- 
2.39.2

