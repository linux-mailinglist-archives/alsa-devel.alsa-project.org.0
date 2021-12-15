Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30208475DB3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 17:42:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A44A018A9;
	Wed, 15 Dec 2021 17:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A44A018A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639586542;
	bh=cu16IWAqWa4Ju00r6HG2T2pgKJbIaob190+85Ir8Mn0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dY9Glub7fw2iNLWEoRSzWyZr9ftaBvgiRD6wIcTYIJ/seFd3GiMOBdGc9iBUeWQrl
	 hplB1w1YU29E3wVwwwkG9G9FscSBEudl1zN9wmze0pobmX8v1qI5vNv2iwBMVGf8cy
	 V77ALycvjW+AIirpAvjUuHgRpBHU0Sa0ugB0LFYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B59F80237;
	Wed, 15 Dec 2021 17:41:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02036F80236; Wed, 15 Dec 2021 17:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E870F800EE
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 17:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E870F800EE
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239490067"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239490067"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:35:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="505873281"
Received: from lperezja-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.39.123])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 08:35:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: AMD: fix depend/select mistake on SND_AMD_ACP_CONFIG
Date: Wed, 15 Dec 2021 10:35:11 -0600
Message-Id: <20211215163511.151286-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ranjani Sridharan <ranjani.sridharan@intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, tiwai@suse.de,
 Randy Dunlap <rdunlap@infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>
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

on i386 or x86_64:

when # CONFIG_ACPI is not set,
so SND_SOC_ACPI is not set:

WARNING: unmet direct dependencies detected for SND_AMD_ACP_CONFIG
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
  SND_SOC_ACPI [=n]
  Selected by [y]:
  - SND_SOC_AMD_ACP_COMMON [=y] && SOUND [=y] && !UML && SND [=y] &&
  SND_SOC [=y] && X86 [=y] && PCI [=y]

This problem is due to the unconditional selection of
SND_AMD_ACP_CONFIG in other options. Using 'depends on' solved an
initial problem but exposed another, let's use select instead.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: d9b994cd7641 ('ASoC: AMD: acp-config: fix missing dependency on SND_SOC_ACPI')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Reviewed-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index bcfeb3fc2592..7a9e45094f37 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -98,7 +98,7 @@ config SND_SOC_AMD_YC_MACH
 
 config SND_AMD_ACP_CONFIG
 	tristate "AMD ACP configuration selection"
-	depends on SND_SOC_ACPI
+	select SND_SOC_ACPI if ACPI
 	help
 	 This option adds an auto detection to determine which ACP
 	 driver modules to use
-- 
2.25.1

