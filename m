Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5C537DE7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:44:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348D41F04;
	Mon, 30 May 2022 15:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348D41F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918274;
	bh=N1l8lCNJGWmwdoM3egaNG/XblC4sYN2MH6gwREaDxqI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j4BtEPGVr6dVqsJLIbyAEI73Y27GgJhiSmig++Ztt/kc/FDzCfhyDDUvtB/mAsH9t
	 GMLT1tujb7Ox9MiMsJh1UUP+g3BOnkY1qIHvSsfEv2sX2BAPvGfHqm2rqqrjM/rdSM
	 pV/Vqf8Y9+fyl3lwk4CBN56SM3pVnSRPpjglQ7L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 333BCF8051D;
	Mon, 30 May 2022 15:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B99CAF8051D; Mon, 30 May 2022 15:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB2EBF804EC
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB2EBF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V4wE3ipT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E60CB80D83;
 Mon, 30 May 2022 13:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F49C385B8;
 Mon, 30 May 2022 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918205;
 bh=N1l8lCNJGWmwdoM3egaNG/XblC4sYN2MH6gwREaDxqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V4wE3ipTctb95vlObHZTm1BPR73Ft577uhIG89wwyU9IWJYID2fURDjlgDJARtnJL
 eCIdp7uzwf7iTnHC2aIDs3oxZ6Rf5ApQ8fjbEfi0DsWozvXJEk/ped0m16bYkreRdc
 nf72YDGPvnT5V35F9+DTryU+rDfjbimcHIrKbxFZH3T7Y+BOAnrlMCis88fZ6pOKcB
 xVNXdtx3w9UenlweKmXGb4didTBrCTD1wbn8aZkcdS3GI9kOjMUWSz43OwypNqfMqP
 63KgrQ9dbt1vwZvTgCiahsdT4N+7zolDt5QzXiOha/4hbKM0k1zVyQIlR9+UFctgqQ
 JJYs5W1wIGy3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 093/109] ASoC: max98357a: remove dependency on
 GPIOLIB
Date: Mon, 30 May 2022 09:38:09 -0400
Message-Id: <20220530133825.1933431-93-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 kernel test robot <yujie.liu@intel.com>, tanureal@opensource.cirrus.com,
 hdegoede@redhat.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, cy_huang@richtek.com, Mark Brown <broonie@kernel.org>,
 srinivas.kandagatla@linaro.org, pbrobinson@gmail.com,
 ckeepax@opensource.cirrus.com, james.schulman@cirrus.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 21ca3274333f5c1cbbf9d91e5b33f4f2463859b2 ]

commit dcc2c012c7691 ("ASoC: Fix gpiolib dependencies") removed a
series of unnecessary dependencies on GPIOLIB when the gpio was
optional.

A similar simplification seems valid for max98357a, so remove the
dependency as well. This will avoid the following warning

   WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_INTEL_SOF_CS42L42_MACH [=y] && SOUND [=y] && !UML &&
       SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
       (SND_SOC_SOF_HDA_LINK [=y] || SND_SOC_SOF_BAYTRAIL [=n]) && I2C
       [=y] && ACPI [=y] && SND_HDA_CODEC_HDMI [=y] &&
       SND_SOC_SOF_HDA_AUDIO_CODEC [=y] && (MFD_INTEL_LPSS [=y] ||
       COMPILE_TEST [=n])

Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220517172647.468244-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 47e675e8bd00..2cbf4fc0f675 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -900,7 +900,6 @@ config SND_SOC_MAX98095
 
 config SND_SOC_MAX98357A
 	tristate "Maxim MAX98357A CODEC"
-	depends on GPIOLIB
 
 config SND_SOC_MAX98371
 	tristate
-- 
2.35.1

