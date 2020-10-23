Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FFD296D3A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 12:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860B01800;
	Fri, 23 Oct 2020 12:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860B01800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603450772;
	bh=+Pi9fChmAcmEqwy/tv0fX5VuQtl3b7KrD+7lwKR150Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z1I2akP8FpSq3XsiRRPk5qkYM0Y7qyY/u6aco5exJz5OrYWnr/Ge8WT4kBc0osJFW
	 SHFPeOBlC3fsxNn+jTI2/chSMf+eprBdD8qiwjrNezbTwqC/m8oZa9eDTFMdcLL8I8
	 QfyjxQRDsFK71+SZ+vtTOpG9fABcblOo6PxnZRhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B9FCF80264;
	Fri, 23 Oct 2020 12:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC72F8025A; Fri, 23 Oct 2020 12:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD88F80245;
 Fri, 23 Oct 2020 12:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD88F80245
IronPort-SDR: AYb3M8KV/3vEqSyPJHpRysPBmm2OVHBJC7tYBZH6ZidrbUpe9tfhWVtuEwogExMqkuugxmy4vw
 mnZWNWDLYtXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="167779969"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="167779969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 03:57:44 -0700
IronPort-SDR: fjiX/IZI0pDaYJqgqxDePo74oO5QM7bADcADjSFJmUhpn1+XrCXE37bigX0C7IMu0mMN5du/68
 DJTupSfEddHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="523466596"
Received: from glewandosky.igk.intel.com ([10.237.149.85])
 by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2020 03:57:42 -0700
From: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Enable coredump in kconfig
Date: Fri, 23 Oct 2020 12:57:27 +0200
Message-Id: <20201023105727.21008-1-gustaw.lewandowski@linux.intel.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>, broonie@kernel.org,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>
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

From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>

WANT_DEV_COREDUMP flag is needed here if this driver is only one
using dev_coredump feature.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
---
 sound/soc/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index a5b446d5af19..c215156e2e18 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -4,6 +4,7 @@ config SND_SOC_INTEL_SST_TOPLEVEL
 	default y
 	depends on X86 || COMPILE_TEST
 	select SND_SOC_INTEL_MACH
+	select WANT_DEV_COREDUMP
 	help
 	  Intel ASoC SST Platform Drivers. If you have a Intel machine that
 	  has an audio controller with a DSP and I2S or DMIC port, then
-- 
2.29.0

