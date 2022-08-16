Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC059542C
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 09:55:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01E4310E;
	Tue, 16 Aug 2022 09:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01E4310E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660636541;
	bh=NtZrxGx8u3F5Nu9icrtIv0EYfyzaI8zfOVOGFMO6WmM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vPrxsSVSSOknlBJS5miMF9uYDP3DhziWeqqmCTvkuu4oum4V7WpgLpGVQLYS5Kj0D
	 RlnMIFDOlHDLZY07X5koTNMKt+iw0UOBrvrHBQtL8qBOpbvj0BIB7FryFdswohjZoe
	 kVnKP8YdMiopj2a1NBjOdLScRsqxwUP0TTuzypd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 650EEF80424;
	Tue, 16 Aug 2022 09:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D90B5F8032D; Tue, 16 Aug 2022 09:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D78CF80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 09:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D78CF80082
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=quanta-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@quanta-corp-partner-google-com.20210112.gappssmtp.com
 header.b="Gr5cK8eo"
Received: by mail-pf1-x42a.google.com with SMTP id k14so8716694pfh.0
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Q+2OJPxyAh41VkQNVhVIveQFr71J1YrrJRjA24sZS6s=;
 b=Gr5cK8eokw/wW8HUesUmQvbAMvIqb3T6PNglwlE8uUDGw1OFSrNVzSOuPTB7JPBYPl
 ZrDxIW4BfGbb4vWF7FjuEqhnEt+KLy2hdGz2dbt90MVeo9hrivk3iivUgHcbSUVlFBtv
 agnXviWLUHnTQKZetBQkBjBzM2d9UtvXJd83uM0iXGjlhMX9mKIREF4PfLosmPZxNtTr
 XPnpkEg9f8R98swVFTKVwt+OvX5RKLTKvxHYqhMauzA4+lmiJSG83fdwlI0x4lbda4mj
 tWewh+ubCectSST3toS7g9bKvCIXng0L0OTcaEveLhWt8295/RUXe8k8gqF/fufbBUNV
 cHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Q+2OJPxyAh41VkQNVhVIveQFr71J1YrrJRjA24sZS6s=;
 b=GRbHlSREiXLfCtXJhhhexUpIdMcUE/AWj5jWDC2EF6flIKGKBLwzHVO62cfrDTfSg2
 V0U01pmt8p9Yz3FpCGjIk8XlXHirT4aJDeWBfxeM9QVHPQdGgBxEOrZITtuvAPO2kYeA
 IS64BsM4PT20IL894RUbbqRTMEAvy9TUkD1hezZT7cnOIfo/f8+U45+8LWpiNWbWuIWQ
 EqhVxyFMgSlw8iEdl4SEaTnaOfAWJ8FwclTBrCbbCRCa3KHX/a/uTb0ktAtPwFx9NxlS
 sh4ILqlM4rsuuh2G00oxa02CgUzSi05CrlNxXweV1wGlydsoAdJlzcbplnpw8YEwiacT
 AVWw==
X-Gm-Message-State: ACgBeo34jfsbUbq+kzs5GM0eis7QrTLLcmD5X1EmZX5vGZKu0bRElURD
 6UYcxx4KBD3YyM8PttBRVeZaFA==
X-Google-Smtp-Source: AA6agR6D9B+2I/h+hZSwACo5e4NCzdYEYH/wXIDeXMr84ap6jJDKP8sEYnl6/SNzQqLQnYXdwx+L3A==
X-Received: by 2002:a05:6a00:1a44:b0:528:6af7:ff4a with SMTP id
 h4-20020a056a001a4400b005286af7ff4amr20222768pfv.78.1660636473521; 
 Tue, 16 Aug 2022 00:54:33 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 d65-20020a621d44000000b0052c7ff2ac74sm8035010pfd.17.2022.08.16.00.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 00:54:33 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: pierre-louis.bossart@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 brent.lu@intel.com
Subject: [PATCH v2] ASoC: Intel: sof_rt5682: Add support for jsl_rt5682_rt1019
Date: Tue, 16 Aug 2022 15:54:24 +0800
Message-Id: <20220816075424.1245593-1-sean.hong@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com
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

This patch adds the driver data for rt5682 support jsl_rt5682_rt1019.

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 045965312..3a840f3a9 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1100,6 +1100,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "jsl_rt5682_rt1019",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1019_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index b95c4b2cd..e374bf163 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -29,6 +29,11 @@ static const struct snd_soc_acpi_codecs rt1015p_spk = {
 	.codecs = {"RTL1015"}
 };
 
+static struct snd_soc_acpi_codecs rt1019p_spk = {
+	.num_codecs = 1,
+	.codecs = {"RTL1019"}
+};
+
 static const struct snd_soc_acpi_codecs mx98360a_spk = {
 	.num_codecs = 1,
 	.codecs = {"MX98360A"}
@@ -78,6 +83,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
 	},
+	{
+		.comp_ids = &rt5682_rt5682s_hp,
+		.drv_name = "jsl_rt5682_rt1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rt1019p_spk,
+		.sof_tplg_filename = "sof-jsl-rt5682-rt1019.tplg",
+	},
 	{
 		.id = "10134242",
 		.drv_name = "jsl_cs4242_mx98360a",
-- 
2.25.1

