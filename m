Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D89076FCB4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 10:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B95583A;
	Fri,  4 Aug 2023 10:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B95583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691139524;
	bh=WIPZ4lzTOj0lP7CtCRlOAJoFZiPiIJE62daoicfGJok=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Jzc9/RbjVY8FmuSqNWjMbFLat5tVP2PVim53uVUV317BmIEgM+ijTTZgIna5g/6p9
	 WtdOhjqicayvdcRdqegLkVGk9v6Z+JeQZbiXrcEP0fYQfL4U1ifOiBpvYuZMWsAAzp
	 b25DWR0lCKybdI8nweLsyLQ3lYY5tvqJJY1fB0p8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68DB6F80563; Fri,  4 Aug 2023 10:57:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11137F80551;
	Fri,  4 Aug 2023 10:57:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C84CF80552; Fri,  4 Aug 2023 10:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E309F80548
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 10:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E309F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=compal-corp-partner-google-com.20221208.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20221208.gappssmtp.com
 header.a=rsa-sha256 header.s=20221208 header.b=Lv8SK3Cr
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686ba97e4feso1694071b3a.0
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1691139422; x=1691744222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfMv4ulrmIsxurHo0m88dU36TfHYzKB8AsV7Hfju21Y=;
        b=Lv8SK3CrxJVAIRBf+a7XWNplyd3SEgDAJYv81JEA6n1sKQ47TdIAz2kAwrNXYClyRV
         iGEAAOvJXoHeg0chEjRffE2pNSltAG2eA1uQfhWe7PRKassPJlGXF5p3rnJl661LIyIp
         /G8s+ZzT8karCjzeC05LjOeN6RbQjHDum9PYMg80XyeCordsxud/c9F6nwbJ/qfdFbgu
         RYLNirhK51hqd/9jdozQVAaYnce8uRX7cc1NA5pCtar7PbgkrvLph7vTE4bCmIIh15x3
         fYfEqk7xlcWn98IsCYthleMZsxwwyNOFKBa/V+zZytuiVs/PY9GffitpmXPaf+wcTQ43
         fjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691139422; x=1691744222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfMv4ulrmIsxurHo0m88dU36TfHYzKB8AsV7Hfju21Y=;
        b=Caadlv/Byn3t0ml0vIsbG2Yh12wX0FSoJk5v1m3u/dVtZ4dwbFzLnoW+5WVk7iE4Wr
         a3eBLFqfvWmYt6ZBbQmENH1hjHb73+H3MVvKJ1HhxJ9uksUeYT4Q93jVwC3BQIw7nZx8
         8VSxPsK9e6rREoPQrY0DZ7o6/zqj7xy1lcVoxUyY+E0LE9qEVwhumA3BtqVnGJN01RTm
         /zMEFd+YgC3/pkd3qLlr6+NnpQ33mAKsdID644sN4iD0nC5qH57xisSot0tMSARc13xv
         K5Ho3PdcOuHNA5drUqLhxruY5aaSOiOtndF5vCFtPLrfueHIIBwvYzp7ZzqwFRrQtn1E
         5X/w==
X-Gm-Message-State: AOJu0YwvGJhZhqHrh35Fui2x6ynUZx10XdoajmBvIvF1Dk0i0oMtMdmv
	BiLtaTvxaXPUgGrA14diIm/57g==
X-Google-Smtp-Source: 
 AGHT+IFD2SL6z8bSyoN9DysfSz2pF4RUeiWz0Gr3RMYX9hNCXCWgkqUniCqXfM/vNDWgZiffnImgUw==
X-Received: by 2002:a05:6a00:1ac7:b0:687:22ce:365f with SMTP id
 f7-20020a056a001ac700b0068722ce365fmr1410111pfv.29.1691139421487;
        Fri, 04 Aug 2023 01:57:01 -0700 (PDT)
Received: from localhost.localdomain (36-226-4-196.dynamic-ip.hinet.net.
 [36.226.4.196])
        by smtp.gmail.com with ESMTPSA id
 d8-20020aa78688000000b00686bbf5c573sm1126235pfo.119.2023.08.04.01.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:57:01 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Yong Zhi <yong.zhi@intel.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	"balamurugan . c" <balamurugan.c@intel.com>,
	Libin Yang <libin.yang@intel.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	David Lin <CTLIN0@nuvoton.com>,
	Brent Lu <brent.lu@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Terry Cheong <htcheong@chromium.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Gongjun Song <gongjun.song@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	apoorv <apoorv@intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v1] ASoC: Intel: Add rpl_nau8318_8825 driver
Date: Fri,  4 Aug 2023 16:56:48 +0800
Message-Id: 
 <20230804085648.3721416-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XXGDKPUKD3HJZA2YA5AEEQOV3WOHODCH
X-Message-ID-Hash: XXGDKPUKD3HJZA2YA5AEEQOV3WOHODCH
X-MailFrom: ajye_huang@compal.corp-partner.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXGDKPUKD3HJZA2YA5AEEQOV3WOHODCH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Boards were using this in older kernels before adl and rpl ids were
split. Add this back to maintain support.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_nau8825.c              | 10 ++++++++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 4fc6e1c6aef3..46b7ecf6f9f1 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -684,6 +684,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "rpl_nau8318_8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_NAU8318_SPEAKER_AMP_PRESENT |
+					SOF_NAU8825_SSP_AMP(1) |
+					SOF_NAU8825_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 4eefdb2dd45c..1dd699181765 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -351,6 +351,11 @@ static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
 	.codecs = {"RTL1019"}
 };
 
+static const struct snd_soc_acpi_codecs rpl_nau8318_amp = {
+	.num_codecs = 1,
+	.codecs = {"NVTN2012"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	{
 		.comp_ids = &rpl_rt5682_hp,
@@ -373,6 +378,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98373_amp,
 		.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
 	},
+	{
+		.id = "10508825",
+		.drv_name = "rpl_nau8318_8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rpl_nau8318_amp,
+		.sof_tplg_filename = "sof-rpl-nau8318-nau8825.tplg",
+	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
 		.drv_name = "rpl_rt1019_rt5682",
-- 
2.25.1

