Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4619B7739B5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:41:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AF7EDEC;
	Tue,  8 Aug 2023 12:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AF7EDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491291;
	bh=se9A39seoW9nQEOy8GkwtGzLOJPtlU5XzaWqky2OWhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cTEABeWKdDMVZU3Z98+2Sie6VubEZR8lK1ABcsl79r30VFc85fhlCwEg1WufZat9l
	 KjejGY+Cx9Lh3+bUiP38EAPF0iFpxB4jRB2WGl21EbiETF3XYDoZ9Fg8vxxl5hwoT9
	 g2Umpb5Sx9sZ2EUQ/6QRCCEB++/t8YHpQ6WFh7Q8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D79AF80640; Tue,  8 Aug 2023 12:36:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5FF1F80640;
	Tue,  8 Aug 2023 12:36:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E958F80535; Mon,  7 Aug 2023 11:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F3C3F8016D;
	Mon,  7 Aug 2023 11:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F3C3F8016D
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 6/9] ASoC: Intel: Skylake: Move snd_hdac_i915_init to
 before probe_work.
Date: Mon,  7 Aug 2023 11:00:42 +0200
Message-Id: <20230807090045.198993-7-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DD4FEJF5LQDJOADD55MASKR45RFBU7IJ
X-Message-ID-Hash: DD4FEJF5LQDJOADD55MASKR45RFBU7IJ
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:43 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DD4FEJF5LQDJOADD55MASKR45RFBU7IJ/>
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/skylake/skl.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 4d93b8690467..ff80d83a9fb7 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -783,23 +783,6 @@ static void skl_codec_create(struct hdac_bus *bus)
 	}
 }
 
-static int skl_i915_init(struct hdac_bus *bus)
-{
-	int err;
-
-	/*
-	 * The HDMI codec is in GPU so we need to ensure that it is powered
-	 * up and ready for probe
-	 */
-	err = snd_hdac_i915_init(bus, true);
-	if (err < 0)
-		return err;
-
-	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
-
-	return 0;
-}
-
 static void skl_probe_work(struct work_struct *work)
 {
 	struct skl_dev *skl = container_of(work, struct skl_dev, probe_work);
@@ -807,11 +790,8 @@ static void skl_probe_work(struct work_struct *work)
 	struct hdac_ext_link *hlink;
 	int err;
 
-	if (IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)) {
-		err = skl_i915_init(bus);
-		if (err < 0)
-			return;
-	}
+	if (IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI))
+		snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 
 	skl_init_pci(skl);
 	skl_dum_set(bus);
@@ -1075,10 +1055,17 @@ static int skl_probe(struct pci_dev *pci,
 		goto out_dsp_free;
 	}
 
+	if (IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)) {
+		err = snd_hdac_i915_init(bus, false);
+		if (err < 0)
+			goto out_dmic_unregister;
+	}
 	schedule_work(&skl->probe_work);
 
 	return 0;
 
+out_dmic_unregister:
+	skl_dmic_device_unregister(skl);
 out_dsp_free:
 	skl_free_dsp(skl);
 out_clk_free:
-- 
2.39.2

