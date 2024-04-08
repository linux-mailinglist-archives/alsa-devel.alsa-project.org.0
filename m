Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA489CC93
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 21:43:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF36D2971;
	Mon,  8 Apr 2024 21:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF36D2971
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712605405;
	bh=lgpGHDSMO/jymB7XcbSgi2uDFuRy34d9y6Oa8ykJU5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=llL6lESgqq5BzHw5pjbl8uOfzZ5fY5l5UfbRZ7n7pPV8c6dAge5FS8sb5QqRJElY/
	 obJ3xk13vqSYTakrRnc05mc6XYmh7VieNXcSRzs7k3dkNoau+C8AEqBy9ox21UWYfK
	 7d3IrlV+aKpfwXy1bggYFm5yyyCmyeWHweUoKSZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90067F805FD; Mon,  8 Apr 2024 21:42:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96641F805F4;
	Mon,  8 Apr 2024 21:42:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E487F80587; Mon,  8 Apr 2024 21:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7EC2F80238
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 21:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7EC2F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LbMBE+5t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712605327; x=1744141327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lgpGHDSMO/jymB7XcbSgi2uDFuRy34d9y6Oa8ykJU5I=;
  b=LbMBE+5tqYBnB5tafsSTYM+Hp1tEmLZyIFhQnPUxnFFv9ce537DW/PrJ
   uJvZ+LUDJVnIb61Cc8h0sTyWi0nAkAzUPP+8m2VtThXFBXuQsocAEXOGh
   qM4wkhyW3E5lAIxX+bJmGa7BDqD3PbxtJjCvMWmVo8y+J9rAAD9e8cdQs
   AE7OQZe+cLxrZilyWgS2Jg0U4+nv7FOfscCxdWpL2ITgeuj8HoO91u1v3
   GPBijeeuGRaBu9a0OjX65LrMlSXImz4mJvXaPTlMOD3TdG3NUIlHM1tmJ
   XcplRfHYHFF2z80brveFHrmlPY6Stw5x3bbBHErzlX/cCXSjKaP7tAuLs
   w==;
X-CSE-ConnectionGUID: egKAuDw9SF2PvE2/uyqL8g==
X-CSE-MsgGUID: cqMGOTqeSXGH6lCkWAbnHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30390459"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="30390459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:41:58 -0700
X-CSE-ConnectionGUID: DhMqwUIdS5aOu8QYFIz38w==
X-CSE-MsgGUID: DfkuWC8BRvaSacd7MNWDCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="24776969"
Received: from aikuseru-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.40.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:41:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/3] ASoC: SOF: pcm: Restrict DSP D0i3 during S0ix to IPC3
Date: Mon,  8 Apr 2024 14:41:46 -0500
Message-Id: <20240408194147.28919-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
References: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4V4PUUA3ZR7ULQKV7GF6ZUCA32R5F3DG
X-Message-ID-Hash: 4V4PUUA3ZR7ULQKV7GF6ZUCA32R5F3DG
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4V4PUUA3ZR7ULQKV7GF6ZUCA32R5F3DG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Introduce a new field in struct sof_ipc_pcm_ops that can be used to
restrict DSP D0i3 during S0ix suspend to IPC3. With IPC4, all streams
must be stopped before S0ix suspend.

Reviewed-by: Uday M Bhat <uday.m.bhat@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-pcm.c  |  1 +
 sound/soc/sof/pcm.c       | 13 ++++++-------
 sound/soc/sof/sof-audio.h |  2 ++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index 35769dd7905e..af0bf354cb20 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -434,4 +434,5 @@ const struct sof_ipc_pcm_ops ipc3_pcm_ops = {
 	.trigger = sof_ipc3_pcm_trigger,
 	.dai_link_fixup = sof_ipc3_pcm_dai_link_fixup,
 	.reset_hw_params_during_stop = true,
+	.d0i3_supported_in_s0ix = true,
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 4e11df6b4823..8fca4b0d63de 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -312,14 +312,13 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 			ipc_first = true;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (sdev->system_suspend_target == SOF_SUSPEND_S0IX &&
+		/*
+		 * If DSP D0I3 is allowed during S0iX, set the suspend_ignored flag for
+		 * D0I3-compatible streams to keep the firmware pipeline running
+		 */
+		if (pcm_ops && pcm_ops->d0i3_supported_in_s0ix &&
+		    sdev->system_suspend_target == SOF_SUSPEND_S0IX &&
 		    spcm->stream[substream->stream].d0i3_compatible) {
-			/*
-			 * trap the event, not sending trigger stop to
-			 * prevent the FW pipelines from being stopped,
-			 * and mark the flag to ignore the upcoming DAPM
-			 * PM events.
-			 */
 			spcm->stream[substream->stream].suspend_ignored = true;
 			return 0;
 		}
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index f4134257789e..2aeb269af752 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -117,6 +117,7 @@ struct snd_sof_dai_config_data {
  *				  triggers. The FW keeps the host DMA running in this case and
  *				  therefore the host must do the same and should stop the DMA during
  *				  hw_free.
+ * @d0i3_supported_in_s0ix: Allow DSP D0I3 during S0iX
  */
 struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
@@ -136,6 +137,7 @@ struct sof_ipc_pcm_ops {
 	bool reset_hw_params_during_stop;
 	bool ipc_first_on_start;
 	bool platform_stop_during_hw_free;
+	bool d0i3_supported_in_s0ix;
 };
 
 /**
-- 
2.40.1

