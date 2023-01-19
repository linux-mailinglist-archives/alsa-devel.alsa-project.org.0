Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D0D673EFC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 17:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B5D169A;
	Thu, 19 Jan 2023 17:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B5D169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674146277;
	bh=HxV5zQCyIwGcc1YmaKK2RK+6HCKKnTbtX67my7ax6HE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZH8YQri+UvrKCTv/NkE26T+2rZNsOrX4hAcaap9yWfXxgGJmmQsMxGtIsUmSMvULa
	 NNHxl5Jm3nQIdTASKNsMj1h/ui3zAahVd45gHAR4oveowY2BhCb6eLZRNLhGg+c/i9
	 JHjFCAc69aNfw+QyLGavJVnuAp3d0ssAhThKunNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C725AF80553;
	Thu, 19 Jan 2023 17:36:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3A44F804E6; Thu, 19 Jan 2023 17:36:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A50F80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 17:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A50F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Mp+60Z0z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674146170; x=1705682170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxV5zQCyIwGcc1YmaKK2RK+6HCKKnTbtX67my7ax6HE=;
 b=Mp+60Z0z5b5Jvi9PP0CpXfwq4bQBHMyvcXqemry4l4lGxywary3OSWtf
 upH5o0DklKSNv5DWXApdiRoXNboVk7f+ZsFa9EfmaR8Wz3XKXikRmtKQD
 /7lryvVBcqIabHA0l2J2F0Xesa+niIowyS4jdIYIvrGT+zq/OZ8ivUZzH
 0d2iuShi2YGEvs+3qcbTXblMi0Xgejc+/QoV5g327wMWGRuNJ6Eb5FXYg
 xOCHSE7PAVcy/741ACr8moaIoJKFwgywvgYCbz44KjnF6x9DAR9zVqxIE
 Yok0Zva/TJjdYZXcO/6iEwRrMFouCs1Np/uZr3nw7FxhpPhfNWZChBn09 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323029634"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="323029634"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662163098"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="662163098"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 08:36:06 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/4] ASoC: Intel: sof_ssp_amp: always set dpcm_capture for
 amplifiers
Date: Thu, 19 Jan 2023 18:34:59 +0200
Message-Id: <20230119163459.2235843-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119163459.2235843-1-kai.vehmanen@linux.intel.com>
References: <20230119163459.2235843-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The amplifier may provide hardware support for I/V feedback, or
alternatively the firmware may generate an echo reference attached to
the SSP and dailink used for the amplifier.

To avoid any issues with invalid/NULL substreams in the latter case,
always unconditionally set dpcm_capture.

Link: https://github.com/thesofproject/linux/issues/4083
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index f75800d9d6de..ffd9c583dab1 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -254,13 +254,12 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		sof_rt1308_dai_link(&links[id]);
 	} else if (sof_ssp_amp_quirk & SOF_CS35L41_SPEAKER_AMP_PRESENT) {
 		cs35l41_set_dai_link(&links[id]);
-
-		/* feedback from amplifier */
-		links[id].dpcm_capture = 1;
 	}
 	links[id].platforms = platform_component;
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].dpcm_playback = 1;
+	/* feedback from amplifier or firmware-generated echo reference */
+	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
-- 
2.39.0

