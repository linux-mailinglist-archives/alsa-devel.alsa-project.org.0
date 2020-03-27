Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B135E195DC1
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 19:39:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA22C166B;
	Fri, 27 Mar 2020 19:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA22C166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585334380;
	bh=TvkeNa2gj3ncDoVQQYK2ITjZgcknjF+dhhJi0/PFzGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nW2N3gjjgZ6uCtFCbl6JqP2ZGZayp1RorP7/Tyf0G6oZn3n8bRd0Ez94ZnOg4fW/L
	 1AI3ZtSPV9GebUQk1Ze2rSkYgRCH/zPuwFkBn1ukTO/kgnfIIA0TpLAtdS6gvN/AOp
	 RjkAXTT9pdC7PT1VxhA96x2bsAj3jGlHHhS4JKes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3E47F8015A;
	Fri, 27 Mar 2020 19:37:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D56F0F8011E; Fri, 27 Mar 2020 19:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03BA4F8011E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 19:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03BA4F8011E
IronPort-SDR: kJrJ9sFiQoLgU3kTBiMoSDZ5OEZtIylHLi0eRkrYI+UxW+CKcBpVW74u7DJa0VsJ0gJijqwxXI
 g5jpfhVWMhQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 11:37:50 -0700
IronPort-SDR: d3aEEAD4lMHdCduoiwLO84NU1rWeKR1q2QXPCZabaFvDLLAiEEq49hwq/TPkVm8+8XqLp9kUuY
 RsDU0M/5WEvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="421192563"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga005.jf.intel.com with ESMTP; 27 Mar 2020 11:37:48 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/6] ASoC: topology: Add missing memory checks
Date: Fri, 27 Mar 2020 16:47:24 -0400
Message-Id: <20200327204729.397-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

kstrdup is an allocation function and it can fail, so its return value
should be checked and handled appropriately.

In order to check all cases, we need to modify set_stream_info to return
a value, so check that everything went correctly when doing kstrdup().
Later add proper checks and error handlers.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

 v2:
  Remove unneeded freeing, which is performed in another place by dobj
  handlers.

 sound/soc/soc-topology.c | 62 +++++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 1f81cd2d29cf..434e152ac8ee 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1766,10 +1766,13 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 	return 0;
 }
 
-static void set_stream_info(struct snd_soc_pcm_stream *stream,
+static int set_stream_info(struct snd_soc_pcm_stream *stream,
 	struct snd_soc_tplg_stream_caps *caps)
 {
 	stream->stream_name = kstrdup(caps->name, GFP_KERNEL);
+	if (!stream->stream_name)
+		return -ENOMEM;
+
 	stream->channels_min = le32_to_cpu(caps->channels_min);
 	stream->channels_max = le32_to_cpu(caps->channels_max);
 	stream->rates = le32_to_cpu(caps->rates);
@@ -1777,6 +1780,8 @@ static void set_stream_info(struct snd_soc_pcm_stream *stream,
 	stream->rate_max = le32_to_cpu(caps->rate_max);
 	stream->formats = le64_to_cpu(caps->formats);
 	stream->sig_bits = le32_to_cpu(caps->sig_bits);
+
+	return 0;
 }
 
 static void set_dai_flags(struct snd_soc_dai_driver *dai_drv,
@@ -1812,20 +1817,29 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	if (dai_drv == NULL)
 		return -ENOMEM;
 
-	if (strlen(pcm->dai_name))
+	if (strlen(pcm->dai_name)) {
 		dai_drv->name = kstrdup(pcm->dai_name, GFP_KERNEL);
+		if (!dai_drv->name) {
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
 	dai_drv->id = le32_to_cpu(pcm->dai_id);
 
 	if (pcm->playback) {
 		stream = &dai_drv->playback;
 		caps = &pcm->caps[SND_SOC_TPLG_STREAM_PLAYBACK];
-		set_stream_info(stream, caps);
+		ret = set_stream_info(stream, caps);
+		if (ret < 0)
+			goto err;
 	}
 
 	if (pcm->capture) {
 		stream = &dai_drv->capture;
 		caps = &pcm->caps[SND_SOC_TPLG_STREAM_CAPTURE];
-		set_stream_info(stream, caps);
+		ret = set_stream_info(stream, caps);
+		if (ret < 0)
+			goto err;
 	}
 
 	if (pcm->compress)
@@ -1835,11 +1849,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	ret = soc_tplg_dai_load(tplg, dai_drv, pcm, NULL);
 	if (ret < 0) {
 		dev_err(tplg->comp->dev, "ASoC: DAI loading failed\n");
-		kfree(dai_drv->playback.stream_name);
-		kfree(dai_drv->capture.stream_name);
-		kfree(dai_drv->name);
-		kfree(dai_drv);
-		return ret;
+		goto err;
 	}
 
 	dai_drv->dobj.index = tplg->index;
@@ -1860,6 +1870,14 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 		return ret;
 	}
 
+	return 0;
+
+err:
+	kfree(dai_drv->playback.stream_name);
+	kfree(dai_drv->capture.stream_name);
+	kfree(dai_drv->name);
+	kfree(dai_drv);
+
 	return ret;
 }
 
@@ -1916,11 +1934,20 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	if (strlen(pcm->pcm_name)) {
 		link->name = kstrdup(pcm->pcm_name, GFP_KERNEL);
 		link->stream_name = kstrdup(pcm->pcm_name, GFP_KERNEL);
+		if (!link->name || !link->stream_name) {
+			ret = -ENOMEM;
+			goto err;
+		}
 	}
 	link->id = le32_to_cpu(pcm->pcm_id);
 
-	if (strlen(pcm->dai_name))
+	if (strlen(pcm->dai_name)) {
 		link->cpus->dai_name = kstrdup(pcm->dai_name, GFP_KERNEL);
+		if (!link->cpus->dai_name) {
+			ret = -ENOMEM;
+			goto err;
+		}
+	}
 
 	link->codecs->name = "snd-soc-dummy";
 	link->codecs->dai_name = "snd-soc-dummy-dai";
@@ -2436,13 +2463,17 @@ static int soc_tplg_dai_config(struct soc_tplg *tplg,
 	if (d->playback) {
 		stream = &dai_drv->playback;
 		caps = &d->caps[SND_SOC_TPLG_STREAM_PLAYBACK];
-		set_stream_info(stream, caps);
+		ret = set_stream_info(stream, caps);
+		if (ret < 0)
+			goto err;
 	}
 
 	if (d->capture) {
 		stream = &dai_drv->capture;
 		caps = &d->caps[SND_SOC_TPLG_STREAM_CAPTURE];
-		set_stream_info(stream, caps);
+		ret = set_stream_info(stream, caps);
+		if (ret < 0)
+			goto err;
 	}
 
 	if (d->flag_mask)
@@ -2454,10 +2485,15 @@ static int soc_tplg_dai_config(struct soc_tplg *tplg,
 	ret = soc_tplg_dai_load(tplg, dai_drv, NULL, dai);
 	if (ret < 0) {
 		dev_err(tplg->comp->dev, "ASoC: DAI loading failed\n");
-		return ret;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	kfree(dai_drv->playback.stream_name);
+	kfree(dai_drv->capture.stream_name);
+	return ret;
 }
 
 /* load physical DAI elements */
-- 
2.17.1

