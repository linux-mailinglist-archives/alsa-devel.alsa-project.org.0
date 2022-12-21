Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4F6531B3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 14:27:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D7C916D3;
	Wed, 21 Dec 2022 14:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D7C916D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671629225;
	bh=SKxvyRAxZLLz49mMYkOzp5cmQy/yWm1CAHasLATF86s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=q/cdifExQzXAHQGejhnXl7yOqAG0AInfa4L2YNqmHWO22HOsOlQN8Ynlh8gQ+XjQH
	 wMojtj1/2MLZhpmTSZGEcfxnfrdjkgK0I5/VH/4L9M4+gcoGlcVk0JA3KOWiOAa+1z
	 vQdFPKGNRsJ9jJPn3FHrioTF7PrDJOP0WcC4RNPY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8112F804CB;
	Wed, 21 Dec 2022 14:26:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656E5F804B0; Wed, 21 Dec 2022 14:26:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7CA9F8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 14:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CA9F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dykSHoOz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 07342CE17E1;
 Wed, 21 Dec 2022 13:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2A5C433D2;
 Wed, 21 Dec 2022 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671629166;
 bh=SKxvyRAxZLLz49mMYkOzp5cmQy/yWm1CAHasLATF86s=;
 h=From:To:Cc:Subject:Date:From;
 b=dykSHoOzpzO8lQ4eqWbXZTVflHL7PH7rouMuSqZUmKW95f7m/oW01xDvF0USomzgq
 0qjGnZRsotT8rTCs89IDBHYNdNVF+j3cbfihx946dF4p1z0IxxErK7WPbb7VKxIZH6
 zpKaeUxUI83BtAMyWsZKxm2ht1Z+FuUsiTRFYxdNBFkP64F09M6CmM0WMnvRpIU7vM
 aXuWAw/XlDsgzddOc52njLdtyB7Dv2bGemj8Z1s03YbZC8LGEOUG6jSA2pf0wZFM1W
 CU0YvG3wwCVhR8ClwvzNvdIQbScKudAjCdD+ZbpWVsj4PPjD4eIrjU9PpRCG7a8N5u
 Es97Sdz1gh2bA==
From: Arnd Bergmann <arnd@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH] ASoC: Intel: fix sof-nau8825 link failure
Date: Wed, 21 Dec 2022 14:25:48 +0100
Message-Id: <20221221132559.2402341-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "balamurugan.c" <balamurugan.c@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 Gongjun Song <gongjun.song@intel.com>, Brent Lu <brent.lu@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The snd-soc-sof_nau8825.ko module fails to link unless the
sof_realtek_common support is also enabled:

ERROR: modpost: "sof_rt1015p_codec_conf" [sound/soc/intel/boards/snd-soc-sof_nau8825.ko] undefined!
ERROR: modpost: "sof_rt1015p_dai_link" [sound/soc/intel/boards/snd-soc-sof_nau8825.ko] undefined!

Fixes: 8d0872f6239f ("ASoC: Intel: add sof-nau8825 machine driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index a472de1909f4..9aee729c2406 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -558,6 +558,7 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	select SND_SOC_INTEL_SOF_REALTEK_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with nau8825 codec.
-- 
2.35.1

