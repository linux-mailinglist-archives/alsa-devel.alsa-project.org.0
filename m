Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E557673EFF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 17:38:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302461856;
	Thu, 19 Jan 2023 17:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302461856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674146291;
	bh=ufxQjaFhgiYGTLSZQhUcX03AnHxvDxPeFKEPNzK9tzA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Jwr49Bg7n8wBAL3EpHknTGSKQ7TEWG0dwgmBgq1lOSCZugO5KYH8lDjSrOQbE8neK
	 icFhNsV5GHSJFMBJz4URyxDquKxrD4uq5rV8zT9hfimYP/ty1etHCHcf2m70hljlHA
	 jhKpaHLbkQNZ+h5FJV5GJuyN/FQm81aEWvTppUAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8525CF8055B;
	Thu, 19 Jan 2023 17:36:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 047D1F804FE; Thu, 19 Jan 2023 17:36:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D328AF8047B
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 17:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D328AF8047B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H/9cgAtm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674146168; x=1705682168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ufxQjaFhgiYGTLSZQhUcX03AnHxvDxPeFKEPNzK9tzA=;
 b=H/9cgAtmiKUC5VcBsA03Nth3lvuL/2aa4VUPqxNF3nMHFlFtxMH+3A2d
 rJKnVpXyf0wm2+bhtCoiirhLYhnCPIB+wrgK1brPNUN0sKTmJTBSAhdxN
 P/MHCEEKdkVtgAnY+3KLU0env4s1NQpU6ygACq9q7wnqEICE0oq7oWRcL
 RrT/OfnvS+9YYIFGJjmjJ324jLQrn66g5s+UXLx5QOAHuy7hjuiYg5Y7R
 fIrhPK13tfjoXkQbrUMVHhDF5kkXHcT4skh2r7vgtorWFI14LPN70kwID
 9Rqrpz8DN36tKx8qWL7VLigG9JWnUbmG9xORiG/+7EnJXBAUaraqBFA3m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323029619"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="323029619"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662163056"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="662163056"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 08:36:03 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/4] ASoC: Intel: sof_nau8825: always set dpcm_capture for
 amplifiers
Date: Thu, 19 Jan 2023 18:34:58 +0200
Message-Id: <20230119163459.2235843-4-kai.vehmanen@linux.intel.com>
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
 sound/soc/intel/boards/sof_nau8825.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index a800854c2831..6794a0249a9a 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -487,8 +487,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
 			links[id].init = max_98373_spk_codec_init;
 			links[id].ops = &max_98373_ops;
-			/* feedback stream */
-			links[id].dpcm_capture = 1;
 		} else if (sof_nau8825_quirk &
 				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
 			max_98360a_dai_link(&links[id]);
@@ -506,6 +504,9 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
+		/* feedback stream or firmware-generated echo reference */
+		links[id].dpcm_capture = 1;
+
 		links[id].no_pcm = 1;
 		links[id].cpus = &cpus[id];
 		links[id].num_cpus = 1;
-- 
2.39.0

