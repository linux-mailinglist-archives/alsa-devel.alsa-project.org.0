Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD0D7B9BA9
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFEE0ECE;
	Thu,  5 Oct 2023 09:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFEE0ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492762;
	bh=bzVgDtQ10tsDlJqxiQiksPmYfnHOvWmVfX6YPJqqN94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MWzjJ59MsFufwrv+54WZhk7nt1PukwJc7n+kB7TJGXny8AeldNPKFKt38DW+kPZAL
	 Y7fDFvFmIPalfO4DK1DjCw4phJuN5KdO6FxiR2GrVx8fWImYABLLoCPG5QMEruVDKP
	 mnxBJ1hfX7LIfsLu2ldAzJAiZ0kHkvOxIwDpACbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A97E1F80310; Thu,  5 Oct 2023 09:53:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C5A2F8064C;
	Thu,  5 Oct 2023 09:53:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BFB1F80553; Wed,  4 Oct 2023 16:56:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 458A1F80130;
	Wed,  4 Oct 2023 16:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 458A1F80130
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v6 10/12] ASoC: Intel: Skylake: Move snd_hdac_i915_init to
 before probe_work.
Date: Wed,  4 Oct 2023 16:55:38 +0200
Message-Id: <20231004145540.32321-11-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5CUCD55LOLZHDPYYVFKTRPTVN5Q4LF3C
X-Message-ID-Hash: 5CUCD55LOLZHDPYYVFKTRPTVN5Q4LF3C
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:53:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CUCD55LOLZHDPYYVFKTRPTVN5Q4LF3C/>
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
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/skylake/skl.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 4f7acb4f6680..24bdbe2a53be 100644
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
2.40.1

