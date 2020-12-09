Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6922D4580
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 16:35:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970C916E7;
	Wed,  9 Dec 2020 16:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970C916E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607528138;
	bh=GWHSJ6Lsy6h0SmeehrLlQ3w8D+oN1kjTUYwP7aXrHH0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGghOnoWHRGsxqW62HyoVtdpHhTGr0flodWUCm6o7VtaKy0VqDyxtC80fMhEaUs8+
	 t6vyTw5efnwnz0iIzuHo3c0z1ghwO9orPeTeXbTN8UCupvwWo3gzy80VnGYnGgWSUD
	 Atmr/tU4EReIBh2o4AIEzMl5FSdFHOomxpIvuh1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB9D9F800E1;
	Wed,  9 Dec 2020 16:34:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42CBFF80227; Wed,  9 Dec 2020 16:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0556F800EF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 16:33:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0556F800EF
IronPort-SDR: hlfN6jnYqENraFEugpcdpjcyE55pAMAlHAJyqqQKaGci4W/+k9PWt37QYiqOCjZuXFUE7U1YJ4
 9Sz7/bZjDVtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="171521107"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="171521107"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 07:33:46 -0800
IronPort-SDR: +DE2UZulBVsz/d8pW3KHX+fi1IK9cqz3rPVKcGMgsqmW19EVcE0NYJUJWvcrdiNYY/FlH2gQ7H
 /S3kFBWKtXTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="552668758"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2020 07:33:44 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: add SoundWire support for ADL-S
Date: Wed,  9 Dec 2020 17:31:02 +0200
Message-Id: <20201209153102.3028310-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209153102.3028310-1-kai.vehmanen@linux.intel.com>
References: <20201209153102.3028310-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Expand SOF support for Alder Lake by adding ACPI machine tables
for ADL-S systems with SoundWire codecs. Modify kernel config
to choose SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE for these
platforms.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 1 +
 sound/soc/sof/sof-pci-dev.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index e6302bb03c55..d306c370e5d1 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -282,6 +282,7 @@ config SND_SOC_SOF_ALDERLAKE_SUPPORT
 config SND_SOC_SOF_ALDERLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 153d66d5c948..63b989e3ec40 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -286,7 +286,8 @@ static const struct sof_dev_desc jsl_desc = {
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
 static const struct sof_dev_desc adls_desc = {
-	.machines		= snd_soc_acpi_intel_hda_machines,
+	.machines               = snd_soc_acpi_intel_adl_machines,
+	.alt_machines           = snd_soc_acpi_intel_adl_sdw_machines,
 	.resindex_lpe_base      = 0,
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
-- 
2.28.0

