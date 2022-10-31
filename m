Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3F1613E9B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 20:56:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1DF1DA;
	Mon, 31 Oct 2022 20:55:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1DF1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667246185;
	bh=YZ1JxgQq+7yAWO4EZujkrPfts1qcMyl6SA0I/HYOy3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mmUoexeYHGk8Z4/dTcJ9s1nb7HIjvxxFOVKAdswi/76mOS3zWMaTHSK78nKf0Q+v/
	 j4BaV9ZlyhnYzSrfVtVv4+Fm+BC7Tahrsv9QAT4BfsBid8SwKpv4oLy9/a9VgDsMKm
	 bodP/cwqYnPeUMbqroMyDNFL+JD1/qLbjuMmTc2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 272F1F80256;
	Mon, 31 Oct 2022 20:55:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A735F800CC; Mon, 31 Oct 2022 20:55:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E7F4F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 20:55:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E7F4F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fSiudFPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667246123; x=1698782123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YZ1JxgQq+7yAWO4EZujkrPfts1qcMyl6SA0I/HYOy3o=;
 b=fSiudFPDMqQGmwtgf/zagHzk6wF/Jtc5olcRGxFgIpAVUcQDUOyMxFMQ
 F31MZNV1zgI0r79GBzG5yOAOyWZwuNsHFT3nnLa+dDK2iZUOVArI9MNTF
 YEvkDEbZuaeC5BJo4Ms7xLPx2/OgMcbK6r4L2/IconRYE7wuMZlv8rygV
 ezUWWME0FN4uSoM4PA3Cpx+s79RxabBiinowwjM4GoBP275ruur22nq3V
 hn+zg5kSdLgHjpAPa+GRWUnA+9GDRNyiNlCXjlGxcBHB8Eak6m/UM5HsF
 A/5gxUfWsuu/rhHK6VW8apvYl3y8tAoynlSUSvhIdHhmqE1N8sdChkCjd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="335649225"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="335649225"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:55:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="611608395"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="611608395"
Received: from kumarhit-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.6.36])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 12:55:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: clarify comments on SCF changes
Date: Mon, 31 Oct 2022 15:55:05 -0400
Message-Id: <20221031195505.249929-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

The commit 1f9d3d98694b1 ("ALSA: hda - set intel audio clock to a
proper value") added a number of misleading comments.

There is no ability to detect if an SCF value was set or not, what the
code does is prevent the use of the 6MHz audio clock represented by
the value 0 in LCTL.SCF. Changing the SCF settings does require the
link to be power-cycled, but in all other cases the link is powered
automatically when exiting reset. In other words, the power-cycle is
an exception to the rule that the HDaudio legacy driver does not need
to program SPA/CPA bits.

In addition, the SCF related changes are only relevant for the first
link.

No functionality change, only comment clarifications.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/pci/hda/hda_intel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 6ff19dd0d10c..92f66bbc5c91 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -485,8 +485,8 @@ static int intel_ml_lctl_set_power(struct azx *chip, int state)
 	int timeout;
 
 	/*
-	 * the codecs are sharing the first link setting by default
-	 * If other links are enabled for stream, they need similar fix
+	 * Changes to LCTL.SCF are only needed for the first multi-link dealing
+	 * with external codecs
 	 */
 	val = readl(bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL);
 	val &= ~AZX_ML_LCTL_SPA;
@@ -513,7 +513,7 @@ static void intel_init_lctl(struct azx *chip)
 
 	/* 0. check lctl register value is correct or not */
 	val = readl(bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL);
-	/* if SCF is already set, let's use it */
+	/* only perform additional configurations if the SCF is initially based on 6MHz */
 	if ((val & AZX_ML_LCTL_SCF) != 0)
 		return;
 
@@ -531,7 +531,7 @@ static void intel_init_lctl(struct azx *chip)
 	if (ret)
 		goto set_spa;
 
-	/* 2. update SCF to select a properly audio clock*/
+	/* 2. update SCF to select an audio clock different from 6MHz */
 	val &= ~AZX_ML_LCTL_SCF;
 	val |= intel_get_lctl_scf(chip);
 	writel(val, bus->mlcap + AZX_ML_BASE + AZX_REG_ML_LCTL);
-- 
2.34.1

