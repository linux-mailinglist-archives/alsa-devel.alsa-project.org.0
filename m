Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA47103B9A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 14:34:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A65816EF;
	Wed, 20 Nov 2019 14:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A65816EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574256899;
	bh=ysMiA/1mJxBAfPYbHKva70G+CJFEQTYepg10FnXVUE8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nU5IbkOxypBv4hLYLDrDUq/xb5kMXyYAMujdPmXkkMij6Lkh5rju0hR5jc9fSMTYL
	 /2LQPvk6mDW5CbE8vGpd/varSW2/CS4jjmodmSDCYF3TeCosoDVD8O6JuATFcGsO5h
	 e/79AG7J6qmmAO6jb03SaebXfKKDn5QSvzrhmxGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C43E2F8013F;
	Wed, 20 Nov 2019 14:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13EB1F800FF; Wed, 20 Nov 2019 14:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBF68F800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 14:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF68F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YI7eNcNb"
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DCF2224DF;
 Wed, 20 Nov 2019 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574256786;
 bh=H4SPYi/qnMyM0TSI7oix10uwgtqFdYpU3wzOTxKrDdg=;
 h=From:To:Cc:Subject:Date:From;
 b=YI7eNcNbmuAVTG9ALhT1vj8CqcdPHKS2ySybd90+5YYClkayN0WLU+siMilqB91qA
 bfIf6dVkj1fhxNwHW+T8eb0aD3DBedz7Emlh0vOiXSjjo5uZupRV84N4gnFuFdNd+a
 5+Z3KD7e8iPmv678msMuLLRr5xNwoQqDbEWIOhyk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 20 Nov 2019 21:32:52 +0800
Message-Id: <20191120133252.6365-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: Fix Kconfig indentation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/intel/boards/Kconfig | 24 ++++++++++++------------
 sound/soc/sof/intel/Kconfig    | 10 +++++-----
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 2702aefee775..ef20316e83d1 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -441,18 +441,18 @@ config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	   If unsure select "N".
 
 config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
-        tristate "CML with RT1011 and RT5682 in I2S Mode"
-        depends on I2C && ACPI
-        depends on MFD_INTEL_LPSS || COMPILE_TEST
-        select SND_SOC_RT1011
-        select SND_SOC_RT5682
-        select SND_SOC_DMIC
-        select SND_SOC_HDAC_HDMI
-        help
-          This adds support for ASoC machine driver for SOF platform with
-          RT1011 + RT5682 I2S codec.
-          Say Y if you have such a device.
-          If unsure select "N".
+	tristate "CML with RT1011 and RT5682 in I2S Mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_RT1011
+	select SND_SOC_RT5682
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+	help
+	  This adds support for ASoC machine driver for SOF platform with
+	  RT1011 + RT5682 I2S codec.
+	  Say Y if you have such a device.
+	  If unsure select "N".
 
 endif ## SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
 
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index b27fd3fdf335..cc09bb606f7d 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -264,16 +264,16 @@ config SND_SOC_SOF_ELKHARTLAKE
 config SND_SOC_SOF_JASPERLAKE_SUPPORT
 	bool "SOF support for JasperLake"
 	help
-          This adds support for Sound Open Firmware for Intel(R) platforms
-          using the JasperLake processors.
-          Say Y if you have such a device.
-          If unsure select "N".
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the JasperLake processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
 
 config SND_SOC_SOF_JASPERLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	help
-          This option is not user-selectable but automagically handled by
+	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
 config SND_SOC_SOF_HDA_COMMON
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
