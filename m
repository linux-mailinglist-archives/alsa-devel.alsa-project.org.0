Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D2537E02
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0195A1F36;
	Mon, 30 May 2022 15:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0195A1F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918468;
	bh=7XsYRlWM8qmHI/XkqixZ5LiDMS9nt6vg5uZEvzT5rvc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bEHMfG8QPm6jha+Q6gILdwh8Fa3ydKsLLU4eZLmm0OYkjNUj5Q+f0DM41unj6LFrr
	 6Fnn0F+KOkPXgaDOEkyAEISbSyxN/YaDETNvjApjiA+0h6Ibcc8hYUN74e+wN5VRLn
	 3dfCifED/lTm6GQtrof/HxcZ35Q7NPT7EWBd4q2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC3DDF801F5;
	Mon, 30 May 2022 15:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80DECF80524; Mon, 30 May 2022 15:46:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56794F8051D
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56794F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m++qONB0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 404FF60F47;
 Mon, 30 May 2022 13:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D85C385B8;
 Mon, 30 May 2022 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918396;
 bh=7XsYRlWM8qmHI/XkqixZ5LiDMS9nt6vg5uZEvzT5rvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m++qONB0A/AEQB+Kf9jv0crPtZJHsXbwmvfEK3ViaSzrubNP1mDzECqNc0VbLVcuQ
 +e63QmtOkW56Mcdtnb1u/TU0dUkLivk5IkDH4I2Q+OvW/fP3Z51HP1jU6q1UMjR62E
 jbn6JllqdfiftYFiy2IIo9bX7ivBzouiax3N4auSNZRAdpntSnS90gkAxQ2Z0B5n5N
 DAZ1WO7ilz1Xv8mO0V5WkLD0eGsOfDMABN87nk7cT6PzLAV5DBhDtxSP19hR7jx5gs
 N9BlK310nAQtsjn1zpoQEAyhJECe9W1R+ua4dIr3uxQ3mUpjmqzloJdW5rs26k36GK
 yGWqTbNIOWVEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 66/76] ASoC: rt1015p: remove dependency on GPIOLIB
Date: Mon, 30 May 2022 09:43:56 -0400
Message-Id: <20220530134406.1934928-66-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134406.1934928-1-sashal@kernel.org>
References: <20220530134406.1934928-1-sashal@kernel.org>
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

[ Upstream commit b390c25c6757b9d56cecdfbf6d55f15fc89a6386 ]

commit dcc2c012c7691 ("ASoC: Fix gpiolib dependencies") removed a
series of unnecessary dependencies on GPIOLIB when the gpio was
optional.

A similar simplification seems valid for rt1015p, so remove the
dependency as well. This will avoid the following warning

  WARNING: unmet direct dependencies detected for SND_SOC_RT1015P

     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] &&
     GPIOLIB [=n]

     Selected by [y]:

     - SND_SOC_INTEL_SOF_RT5682_MACH [=y] && SOUND [=y] && !UML && SND
       [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
       (SND_SOC_SOF_HDA_LINK [=y] || SND_SOC_SOF_BAYTRAIL [=n]) && I2C
       [=y] && ACPI [=y] && (SND_HDA_CODEC_HDMI [=y] &&
       SND_SOC_SOF_HDA_AUDIO_CODEC [=y] && (MFD_INTEL_LPSS [=y] ||
       COMPILE_TEST [=y]) || SND_SOC_SOF_BAYTRAIL [=n] &&
       (X86_INTEL_LPSS [=n] || COMPILE_TEST [=y]))

Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220517172647.468244-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 612fd7516666..25f331551f68 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1098,7 +1098,6 @@ config SND_SOC_RT1015
 
 config SND_SOC_RT1015P
 	tristate
-	depends on GPIOLIB
 
 config SND_SOC_RT1305
 	tristate
-- 
2.35.1

