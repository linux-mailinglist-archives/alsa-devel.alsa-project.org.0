Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59185BCDF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 14:09:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA043E97;
	Tue, 20 Feb 2024 14:09:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA043E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708434577;
	bh=2z1uKWvVIwaQ2DKT6NQYhg3DF/4KBYL0i6xHWjR8mnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=opHdHEbTu7w1n0rRcuWOeBgSjyQn0B4i02u+xw9ruozsJoAJpDCgyXk+vjl8uSGSr
	 T8cuKohwK1Qkim2kz1m1i6MXnUD6mgyYK0oFOJzC+c4zk2kvOlBBOlqK5iQbhmHtND
	 ws1728XMfNnAF3uX4uTKbJF83Zhx06mhWjwkroDo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24A95F8068E; Tue, 20 Feb 2024 14:07:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6010FF806CE;
	Tue, 20 Feb 2024 14:07:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B90C9F8047D; Tue, 20 Feb 2024 14:06:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FBB4F804CC
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 14:03:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FBB4F804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K8WIBtRs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434223; x=1739970223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2z1uKWvVIwaQ2DKT6NQYhg3DF/4KBYL0i6xHWjR8mnk=;
  b=K8WIBtRs3hdAb1s860bQ6lWvArdxx8bzAIH79yc+5SJWwmfiiSLNMqif
   oaRL6ZX3m5Qp2qlikc30yE6f1ontlxv5JK+fNQ5F8YSOg8wK7tEosudOu
   Qphb3tkK545EupB35k3BEE/2WVdfKyhO3ObLnmuTyJIXycKFolZpUra94
   leN9NwJs+1goEEsSdnFLkG3ZT5421y5nARHwTIu4MP1PMyrK2P3Nq0p/9
   K4/BXdFxCiOt76uA81b1osPaGwlvWVJzkuAuY+DGT14iRrFJDXM6ubL7w
   hJqBVlcqz3HicG7LUn4UDtxP4qBaoRXuytyZ7s4vUep1fxxWrIJ5Q003H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988926"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="2988926"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="4750960"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:17 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/10] ASoC: Intel: avs: Fix sound clipping in single capture
 scenario
Date: Tue, 20 Feb 2024 12:50:27 +0100
Message-Id: <20240220115035.770402-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6MOUBWFMOGTOZ3CX5LRMHV64PO2A6UUG
X-Message-ID-Hash: 6MOUBWFMOGTOZ3CX5LRMHV64PO2A6UUG
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MOUBWFMOGTOZ3CX5LRMHV64PO2A6UUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To avoid sound clipping when there just one, single CAPTURE stream
ongoing, disable L1SEN before it is started. Any PLAYBACK stream or
additional CAPTURE allows L1SEN to be re-enabled.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 77 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 4dfc5a1ebb7c..2cafbc392cdb 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -643,6 +643,79 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	return 0;
 }
 
+static void avs_hda_stream_start(struct hdac_bus *bus, struct hdac_ext_stream *host_stream)
+{
+	struct hdac_stream *first_running = NULL;
+	struct hdac_stream *pos;
+	struct avs_dev *adev = hdac_to_avs(bus);
+
+	list_for_each_entry(pos, &bus->stream_list, list) {
+		if (pos->running) {
+			if (first_running)
+				break; /* more than one running */
+			first_running = pos;
+		}
+	}
+
+	/*
+	 * If host_stream is a CAPTURE stream and will be the only one running,
+	 * disable L1SEN to avoid sound clipping.
+	 */
+	if (!first_running) {
+		if (hdac_stream(host_stream)->direction == SNDRV_PCM_STREAM_CAPTURE)
+			avs_hda_l1sen_enable(adev, false);
+		snd_hdac_stream_start(hdac_stream(host_stream));
+		return;
+	}
+
+	snd_hdac_stream_start(hdac_stream(host_stream));
+	/*
+	 * If host_stream is the first stream to break the rule above,
+	 * re-enable L1SEN.
+	 */
+	if (list_entry_is_head(pos, &bus->stream_list, list) &&
+	    first_running->direction == SNDRV_PCM_STREAM_CAPTURE)
+		avs_hda_l1sen_enable(adev, true);
+}
+
+static void avs_hda_stream_stop(struct hdac_bus *bus, struct hdac_ext_stream *host_stream)
+{
+	struct hdac_stream *first_running = NULL;
+	struct hdac_stream *pos;
+	struct avs_dev *adev = hdac_to_avs(bus);
+
+	list_for_each_entry(pos, &bus->stream_list, list) {
+		if (pos == hdac_stream(host_stream))
+			continue; /* ignore stream that is about to be stopped */
+		if (pos->running) {
+			if (first_running)
+				break; /* more than one running */
+			first_running = pos;
+		}
+	}
+
+	/*
+	 * If host_stream is a CAPTURE stream and is the only one running,
+	 * re-enable L1SEN.
+	 */
+	if (!first_running) {
+		snd_hdac_stream_stop(hdac_stream(host_stream));
+		if (hdac_stream(host_stream)->direction == SNDRV_PCM_STREAM_CAPTURE)
+			avs_hda_l1sen_enable(adev, true);
+		return;
+	}
+
+	/*
+	 * If by stopping host_stream there is only a single, CAPTURE stream running
+	 * left, disable L1SEN to avoid sound clipping.
+	 */
+	if (list_entry_is_head(pos, &bus->stream_list, list) &&
+	    first_running->direction == SNDRV_PCM_STREAM_CAPTURE)
+		avs_hda_l1sen_enable(adev, false);
+
+	snd_hdac_stream_stop(hdac_stream(host_stream));
+}
+
 static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -664,7 +737,7 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		spin_lock_irqsave(&bus->reg_lock, flags);
-		snd_hdac_stream_start(hdac_stream(host_stream));
+		avs_hda_stream_start(bus, host_stream);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
 		/* Timeout on DRSM poll shall not stop the resume so ignore the result. */
@@ -694,7 +767,7 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
 
 		spin_lock_irqsave(&bus->reg_lock, flags);
-		snd_hdac_stream_stop(hdac_stream(host_stream));
+		avs_hda_stream_stop(bus, host_stream);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
 		ret = avs_path_reset(data->path);
-- 
2.25.1

