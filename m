Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F59B5804E0
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FC02161F;
	Mon, 25 Jul 2022 21:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FC02161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778819;
	bh=GhlOaURCfGI6U/9yGMFrHz1TalQ74Jwwzaii3EIrF/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCONKJ29XJ9VCZGeD8LjeYuYSbTa6kbc9hTiNCI46oL/FxV8hzpo6M0ibusfPvBTp
	 8zDLAiuvwMuhYefV69QwkmUrGxPSpxToruW5FwZoBpjE4CK3539apaeHuRpzMlSPm1
	 jUdhJt9VyUveVXAelqjxWSEyl02ea26+iutkKSt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF9AF805B2;
	Mon, 25 Jul 2022 21:49:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F87BF80579; Mon, 25 Jul 2022 21:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 666ACF80543
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666ACF80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nuel/rP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778577; x=1690314577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GhlOaURCfGI6U/9yGMFrHz1TalQ74Jwwzaii3EIrF/M=;
 b=nuel/rP9BhOue43ftViN5BaaZht4coBCIi7dj74hgmom2MHRCOTkR6Ur
 R5x3uXQ+i3+5TL/8VFk0utLaOhO/xXjgYLmQteufYBoetbW9yf/XpWSzq
 rpwcU8dnfDZAo63kNWMrkTmGhXtC8zS1gcKlLX7GbW6L3MM8ceIBQ0B/D
 YQknIPYvolQNEpNiOZQOqlkT8FsTjB4SoNeeYeiCB9Trn4UA34obubitE
 Isjklt7VIzeeFYwuhJwOjEYcuQh4IrysEVuNaURNQsrPVIEyRvcYX/ObH
 aIj/JRvC0nuiG480fNzDiqvImxb47AHfbzii81GoP+34uxns9C+dxXfLM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267553929"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267553929"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="632479480"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ASoC: Intel: sof_nau8825: Move quirk check to the front
 in late probe
Date: Mon, 25 Jul 2022 14:49:09 -0500
Message-Id: <20220725194909.145418-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

The sof_rt5682_quirk check was placed in the middle of
hdmi handling code, move it to the front to be consistent
with sof_rt5682.c/sof_card_late_probe().

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index f49700eb721b..8d7e5ba9e516 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -190,11 +190,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	struct sof_hdmi_pcm *pcm;
 	int err;
 
-	if (list_empty(&ctx->hdmi_pcm_list))
-		return -EINVAL;
-
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
-
 	if (sof_nau8825_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
 		/* Disable Left and Right Spk pin after boot */
 		snd_soc_dapm_disable_pin(dapm, "Left Spk");
@@ -204,6 +199,11 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 			return err;
 	}
 
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
+
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
+
 	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
 }
 
-- 
2.34.1

