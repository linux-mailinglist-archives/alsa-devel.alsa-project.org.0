Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D109D571AA5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA2A41698;
	Tue, 12 Jul 2022 14:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA2A41698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657630721;
	bh=1fgngL/Bewv0f1PgTUZYAkjA2Brm1Lr02VHRIGiQpwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmFtYYElK+mm0K8j6JhnwMBcazTelzOogH8UneoPrWjPgDzCkh05foV8Cp/UTmPoh
	 QiW37KzU69PchaU+Ncq59pcr05IOFqqRKUV37MHQAiQASTO797qRYmYwwVuG0xUae9
	 yo8mGdM0YbnnVfjfIysnFkA7H8e7uZ4TX2KAPkcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40659F80544;
	Tue, 12 Jul 2022 14:57:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 013B0F8012B; Tue, 12 Jul 2022 14:57:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 636D9F8023B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 636D9F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M+jSGUTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657630617; x=1689166617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1fgngL/Bewv0f1PgTUZYAkjA2Brm1Lr02VHRIGiQpwU=;
 b=M+jSGUTGZKHsmucTg/eIAIYaC2tVEVzY17wAh9OhYz47gNQ6LxcsCHDQ
 bceWHpUCy4Vd+ryKoiTVjT9+9LW47LqkRkdfkbbyZFl3kIjAPCm4ecJu4
 wb+fkLMcjcqxBKh58wSZ340wX2w/MLMVRo4NWYRc1XUr61QDLFE9hy2Xa
 UyCPQc34e/leXUovFmv5kICUj5KYPL5/wYQffXvU4Dq/BqBO4UrzbOzqA
 paGj9ILQB8/bqx3rKSWcm2oyjEMvYFeTshgfv3cfIJc7CWvphhjw+JnLS
 9cylTSeHlkxR1C1ZpN9wASgYh0SaFu3Junhb//f2R4PV7gEDiffJ4nrOf Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346607582"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="346607582"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:56:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="662942914"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:56:52 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: Intel: hda-loader: Use the FSR state
 definitions during bootup
Date: Tue, 12 Jul 2022 15:57:33 +0300
Message-Id: <20220712125734.30512-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
References: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

Switch to use the newly added FSR (Firmware State Register) definitions
for DSP state handling and targeting.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 819b3b08c655..304fa3923f1a 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -177,14 +177,13 @@ int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	 * - IMR boot: wait for ROM firmware entered (firmware booted up from IMR)
 	 */
 	if (imr_boot)
-		target_status = HDA_DSP_ROM_FW_ENTERED;
+		target_status = FSR_STATE_FW_ENTERED;
 	else
-		target_status = HDA_DSP_ROM_INIT;
+		target_status = FSR_STATE_INIT_DONE;
 
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 					chip->rom_status_reg, status,
-					((status & HDA_DSP_ROM_STS_MASK)
-						== target_status),
+					(FSR_TO_STATE_CODE(status) == target_status),
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					chip->rom_init_timeout *
 					USEC_PER_MSEC);
@@ -292,8 +291,7 @@ int hda_cl_copy_fw(struct snd_sof_dev *sdev, struct hdac_ext_stream *hext_stream
 
 	status = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR,
 					chip->rom_status_reg, reg,
-					((reg & HDA_DSP_ROM_STS_MASK)
-						== HDA_DSP_ROM_FW_ENTERED),
+					(FSR_TO_STATE_CODE(reg) == FSR_STATE_FW_ENTERED),
 					HDA_DSP_REG_POLL_INTERVAL_US,
 					HDA_DSP_BASEFW_TIMEOUT_US);
 
-- 
2.37.0

