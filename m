Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9162083E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 05:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D7DD3E7;
	Tue,  8 Nov 2022 05:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D7DD3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667881735;
	bh=zA/wqEM6aG6WUAM9qqUps9DalDOcTJ1w+81kjASH4LQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNvM+k5tH+XqD89011SCZ/nE/1bHnPcAklwCgIS9citP8niYx2vDBoYwVJQPwp6Gv
	 YEw52PZpY78xR5GhW6W8ZApZfMmux42GbV/TMcGlTgMMHmB58AkMuQ2U5+ItbRV97n
	 zunzefg+B8hcA7BhXrstv2Hc1fsPkmN19gj2EFk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01FE5F804E6;
	Tue,  8 Nov 2022 05:27:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67ACCF800EC; Tue,  8 Nov 2022 05:27:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 696B8F800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 05:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696B8F800EC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="pfeBoNA5"
Received: by mail-pj1-x1031.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so12321395pjk.1
 for <alsa-devel@alsa-project.org>; Mon, 07 Nov 2022 20:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSW9LI1yKHWyO/rnwkCvTR08ko1xObHpXEf8aeSwd9Q=;
 b=pfeBoNA5Bh6xN/MiR+jED1WBOTlZp2WlZBpGYpCIyfeCfZBbNQAwtOrh4AttchPHml
 RfZE/HxiOiSjCWyy0lxx/nnktJnXPeWQ/KHIYnmwOUDDoQnZalwDx4q/JW9wm0/53kox
 RYJcYvoUbGX0qjTiqxCiXxwbJ40K1vcXAuykzEmKPGiK2mqLRI3wt33jiuEECHOKTYEq
 76EG5M4vnbW/r1WCoz3yHj7+Y/ENw0UJ6ZxZotxkpQxbBdo83UcmHQzDtTwkjQW/2FVw
 wzCdIhF9HmyKa02ohyFii5485LBRAWrdroLMFLCj1mkvcImFoWiD3m3/DxDetJon3KC6
 d3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSW9LI1yKHWyO/rnwkCvTR08ko1xObHpXEf8aeSwd9Q=;
 b=EzMl4AiHy7y7qgkhD6fvZmRMdFn/7waMKmkEaPqjype7ocLi1A87Hd9488ss0MxG3p
 JARhs7J4B1NCq8j95AdCZxzV47R682NfHI5cLcfKsxN4bI2SBQ6L+Od+XvMn/DlXSnGj
 xQOJSvY2hrhbyMsOMFMfKPyoNX26fNCgXn+FgNsZPPBstrdBHKm/1vPRb3slScVDJfbq
 3EiRYwyZF6WisUVWa+n+HwvDlq2kW70MJOanJ0e8/9AdFuRHgXoX0/Lc8bze6EHyhz1Y
 Novv0ldbYog+zsEavcH+RPwBI8rtJwTtAQir2MbuyewRTFDn/pxZK2jE/cG6a9oSHcfa
 TmNA==
X-Gm-Message-State: ACrzQf2OohaUs9gq+RUjpSnCxSEQSVfWK7HRQE+sKndKh7YLewmrCWBT
 kJz88sD9J6d8K6Y6Rj5ZaKvdxA==
X-Google-Smtp-Source: AMsMyM56PM3CirkkXYlb1KJ2cNUYQ4KhOBW2d6yCvBHctuckGdkycrrUSHFuzZha7WaB/bcG/Txxkg==
X-Received: by 2002:a17:902:f651:b0:184:6925:d127 with SMTP id
 m17-20020a170902f65100b001846925d127mr53388547plg.140.1667881648182; 
 Mon, 07 Nov 2022 20:27:28 -0800 (PST)
Received: from localhost.localdomain (118-167-183-234.dynamic-ip.hinet.net.
 [118.167.183.234]) by smtp.gmail.com with ESMTPSA id
 j63-20020a625542000000b005627868e27esm5265945pfb.127.2022.11.07.20.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 20:27:27 -0800 (PST)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: Intel: sof_rt5682: add support for ALC5682I-VD
 with amp rt1019p
Date: Tue,  8 Nov 2022 12:27:15 +0800
Message-Id: <20221108042716.2930255-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
References: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, David Lin <CTLIN0@nuvoton.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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

This patch adds the driver data for two rt1019 speaker amplifiers on
SSP1 and ALC5682I-VD on SSP0 for ADL platform.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 3 +--
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 2358be208c1f..0e803c1c2b06 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1092,10 +1092,9 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "adl_rt1019_rt5682s",
+		.name = "adl_rt1019_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682S_HEADPHONE_CODEC_PRESENT |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1019_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 9990d5502d26..3ca0a96d94de 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -489,8 +489,8 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_tplg_filename = "sof-adl-max98360a-nau8825.tplg",
 	},
 	{
-		.id = "RTL5682",
-		.drv_name = "adl_rt1019_rt5682s",
+		.comp_ids = &adl_rt5682_rt5682s_hp,
+		.drv_name = "adl_rt1019_rt5682",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_rt1019p_amp,
 		.sof_tplg_filename = "sof-adl-rt1019-rt5682.tplg",
-- 
2.25.1

