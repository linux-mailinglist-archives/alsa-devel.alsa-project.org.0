Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E18D6960E0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 11:36:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F938868;
	Tue, 14 Feb 2023 11:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F938868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676370984;
	bh=wIu3wPgBRSgY9K5G+IWQTk6DTGmTl6qy6al+3EgL0Cw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IpRsH0ksqaqcE7+cFSaLBrsu9CJoS68Rr7cMPdVVOiRjoK9c2o6fNcIXflpDQJcP4
	 0uNrvvE1VlqByEs/140bEgYQri45ZagiavMz1RMVTs9gxQ6RRjy2lAGppxKM/uzfTp
	 r5QzqcmYxmCVn1WBR+S+m1BUFUgzetgBA1Fvvowg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E08FF80552;
	Tue, 14 Feb 2023 11:34:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E908F8053B; Tue, 14 Feb 2023 11:33:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61E0AF8047C
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 11:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E0AF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cssxkaVl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676370827; x=1707906827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wIu3wPgBRSgY9K5G+IWQTk6DTGmTl6qy6al+3EgL0Cw=;
  b=cssxkaVlyopOYxRX0hw/ivLFgLSAXOpnEjOkncnkii+u1qJ+7qLorC+C
   UkteqixjgLKTyKiHoUN3UPqk2CSoQXFjxpj0cPz22kM3gKtyTgaW68AFK
   uM17Typ4xKPpOWRcaDubJbiNM++32vgOXp31fSC6wFA5b+anDtfoztKyg
   vi551+qaVp42kekU6WaweWIP08rvXRCCH5p9xXRYwW4HoKyr5W1nD6zS/
   B8ZhTTLcHNhOVJK3R9zsua9YvZ+KIOijJ3Ik8O6sCuFYkIRFK9MCxmGe0
   wDmp4Brk+p6N1XH8fkthGLroxfGwitEIvQ6RxonGdnwAaKpin4JX81KpV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395745445"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="395745445"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811971920"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000";
   d="scan'208";a="811971920"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.252.18.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 02:33:43 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 5/5] ASoC: SOF: Intel: hda-dsp: Set streaming flag for d0i3
Date: Tue, 14 Feb 2023 12:33:45 +0200
Message-Id: <20230214103345.30669-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
References: <20230214103345.30669-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EBSHJKKIC3EGNKDZJNHLISJ5M3R7XIKT
X-Message-ID-Hash: EBSHJKKIC3EGNKDZJNHLISJ5M3R7XIKT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBSHJKKIC3EGNKDZJNHLISJ5M3R7XIKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Enable d0i3 streaming if all the active streams can
work in d0i3 state and playback is enabled.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e34fe0c9bcde..68eb06f13a1f 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -405,6 +405,34 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 	return 0;
 }
 
+/*
+ * d0i3 streaming is enabled if all the active streams can
+ * work in d0i3 state and playback is enabled
+ */
+static bool hda_dsp_d0i3_streaming_applicable(struct snd_sof_dev *sdev)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_sof_pcm *spcm;
+	bool playback_active = false;
+	int dir;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for_each_pcm_streams(dir) {
+			substream = spcm->stream[dir].substream;
+			if (!substream || !substream->runtime)
+				continue;
+
+			if (!spcm->stream[dir].d0i3_compatible)
+				return false;
+
+			if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+				playback_active = true;
+		}
+	}
+
+	return playback_active;
+}
+
 static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
 				const struct sof_dsp_power_state *target_state)
 {
@@ -446,6 +474,9 @@ static int hda_dsp_set_D0_state(struct snd_sof_dev *sdev,
 		    !hda_enable_trace_D0I3_S0 ||
 		    sdev->system_suspend_target != SOF_SUSPEND_NONE)
 			flags = HDA_PM_NO_DMA_TRACE;
+
+		if (hda_dsp_d0i3_streaming_applicable(sdev))
+			flags |= HDA_PM_PG_STREAMING;
 	} else {
 		/* prevent power gating in D0I0 */
 		flags = HDA_PM_PPG;
-- 
2.39.1

