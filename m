Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7C7BE5CC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 18:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87106FF3;
	Mon,  9 Oct 2023 18:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87106FF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867378;
	bh=Xi+/2YxW7PyfWkrcpb8QmQVoESEIOFH8yPJV6+6Gx/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJHgQ8GlXojc+dgN9388liMazamrgNua0l6xYWM2ri84jHZusWnQ4VxgKGnFJAUXX
	 o7rekKNqQGveVPq4VZLe6XOHlbfK0/OcpfrEXZqWr6Za8LiXGW5ZH7gtQ3iSMWkRP0
	 DYkaes2m7ujTzuiqc2o8C2294Otcv2dljdwWtoJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32CD1F80637; Mon,  9 Oct 2023 17:58:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81B8EF80624;
	Mon,  9 Oct 2023 17:58:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D587F802BE; Mon,  9 Oct 2023 13:56:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B98E4F80130;
	Mon,  9 Oct 2023 13:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B98E4F80130
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
	sound-open-firmware@alsa-project.org
Subject: [PATCH v7 04/13] ASoC: SOF: Intel: Fix error handling in hda_init()
Date: Mon,  9 Oct 2023 13:54:28 +0200
Message-Id: <20231009115437.99976-5-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
References: <20231009115437.99976-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3EYGOSUJ6KL3X2MOCLALUSZZEC3GWKEZ
X-Message-ID-Hash: 3EYGOSUJ6KL3X2MOCLALUSZZEC3GWKEZ
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3EYGOSUJ6KL3X2MOCLALUSZZEC3GWKEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The hda_codec_i915_init() errors are ignored in
hda_init() so it can never return -EPROBE_DEFER.

Fix this before we move the call to hda_init() from the
deferred probe to early probe.

While at it, also fix error handling when hda_dsp_ctrl_get_caps
fails.

Suggested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 86a2571488bcc..2f189473323f3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -848,13 +848,21 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 	/* init i915 and HDMI codecs */
 	ret = hda_codec_i915_init(sdev);
-	if (ret < 0)
-		dev_warn(sdev->dev, "init of i915 and HDMI codec failed\n");
+	if (ret < 0 && ret != -ENODEV) {
+		dev_err_probe(sdev->dev, ret, "init of i915 and HDMI codec failed\n");
+		goto out;
+	}
 
 	/* get controller capabilities */
 	ret = hda_dsp_ctrl_get_caps(sdev);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: get caps error\n");
+		hda_codec_i915_exit(sdev);
+	}
+
+out:
+	if (ret < 0)
+		iounmap(sof_to_bus(sdev)->remap_addr);
 
 	return ret;
 }
-- 
2.39.2

