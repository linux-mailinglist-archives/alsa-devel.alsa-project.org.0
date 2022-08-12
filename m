Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DF75918FF
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Aug 2022 08:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E037820;
	Sat, 13 Aug 2022 08:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E037820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660370958;
	bh=8kFxKPy+FhfMBJxlE6LS8IQW/Usfq3pUflxzu5SJqcU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JxFLCV8nIKai4S8pA+0X43iRCMOFlxBmJT9YfvEw1eEKVrdsg057Nl5cP+L1IpcEu
	 4w5DBnUMGkU++VLqCvQVppdNzhoIlsAaoz8wqf308FSs7v7zZmutvRxKuWq/QEpSS3
	 Hpox3mRFNLqLW2fADZvsYwErdmC/qZGfMsr3aNdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B3BF800CB;
	Sat, 13 Aug 2022 08:08:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEF09F8026A; Fri, 12 Aug 2022 13:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41338F800AA
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 13:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41338F800AA
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=quanta-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@quanta-corp-partner-google-com.20210112.gappssmtp.com
 header.b="z7o6YDD1"
Received: by mail-pj1-x102e.google.com with SMTP id
 q9-20020a17090a2dc900b001f58bcaca95so8107157pjm.3
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 04:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=1WPdo9M+Sx6XTbFXOZ/AtUfevOxtbqvZ35Od/wJosKk=;
 b=z7o6YDD1kXTK8o/DG7hkIWs3Z8hy7Yo6SjbLpSvIWfUN4EG+Ch1bZ3ZBpz6v7RBpud
 y36XNext6pDcS1uCMdAZqOzQxBc9V1FfdE7xmc6CIonPd1wxpgRn2GSZMY/IUbblmFZ4
 6E+y+Z5m71GgwfbcNAB42ohiR5R5VoFRgJ8Nn1EPz1NOMpww7sJi8q182alt/1Ql2Ik1
 VGOme+UfJy4285EOw2UvJkVBeOvhcGF4EOQucHIjQlQPxUtotN6BctQaVa6WdfLShiHD
 qmzgFgOGBzNT4F2yPczyhmDuye8ZkLRgeKYTLLiPYFyY3Y1EyRmPmuB2F9bj7C1UiBoK
 2fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=1WPdo9M+Sx6XTbFXOZ/AtUfevOxtbqvZ35Od/wJosKk=;
 b=PMX2RGrQZ0vLSL8CHjpJlFx5sHJ9a1jESK9gVzYQJ5rYvapbrlzhMrvlp7y3WLhwuW
 FxSBvGW2aqCp2fiJwd8iHaSb58OA+5xV+x7zNAG20evx+e4wepxSgHHJlkfPUpvCIOuj
 zpBX6s1MLh6T6b94ULsA+Sv2GoPjU/FA44CHOif/nQxh3sxQHqFN/z43H/reOx7Bpqbm
 q6joxQjWb109Eam129poWiaj8IXDCrKpC/yPuoNbZffeVLgkadRUYZ3KKUxrcdVewnYI
 6hjCHzYwm1OXfApa1XQdhTlL/0ht7I8y6mZB4BQ8HIp8L1y5++xAMKCjQLq1cKg5bVdu
 QfHg==
X-Gm-Message-State: ACgBeo1ceYcmAo3kOYcGl+8Wmn8Z9DHnYxj6Fd0cCLbsFDzp6mAOpatW
 AD/ppeTUtreBQ3bHoNF00B8wIA==
X-Google-Smtp-Source: AA6agR7d1ezsS3nvkyhQ1bVhlUpxExz65NeFOzJabTp4+B2vJE68BRef/AbGYGLCukUi5Cc1rnwPrA==
X-Received: by 2002:a17:90b:394:b0:1f5:90a1:acf0 with SMTP id
 ga20-20020a17090b039400b001f590a1acf0mr13458944pjb.40.1660304892505; 
 Fri, 12 Aug 2022 04:48:12 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1709027e8600b0016d7afee272sm1499378pla.153.2022.08.12.04.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:48:12 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add support for jsl_rt5682_rt1019
Date: Fri, 12 Aug 2022 19:48:04 +0800
Message-Id: <20220812114804.550809-1-sean.hong@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Aug 2022 08:08:17 +0200
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Sean Hong <sean.hong@quanta.corp-partner.google.com>,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, brent.lu@intel.com,
 linux-kernel@vger.kernel.org, yong.zhi@intel.com
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

This patch adds the driver data for rt5682s on SSP0 for ADL platform

Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 045965312245b..3a840f3a9f5d2 100644
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
index b95c4b2cda947..139d2468f5f70 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -29,6 +29,11 @@ static const struct snd_soc_acpi_codecs rt1015p_spk = {
 	.codecs = {"RTL1015"}
 };
 
+static struct snd_soc_acpi_codecs rt1019p_spk = {
+	.num_codecs = 1,
+	.codecs = {"RTL1019"}
+}
+
 static const struct snd_soc_acpi_codecs mx98360a_spk = {
 	.num_codecs = 1,
 	.codecs = {"MX98360A"}
@@ -78,6 +83,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
 	},
+	{
+		.comp_ids = &rt5682_rt5682s_hp,
+		.drv_name = "jsl_rt5682_rt1019",
+		.sof_fw_filename = "sof-jsl.ri",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rt1019p_spk,
+		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
+	},
 	{
 		.id = "10134242",
 		.drv_name = "jsl_cs4242_mx98360a",
-- 
2.25.1

