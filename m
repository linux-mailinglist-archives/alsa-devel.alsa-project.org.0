Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F6C3DEAA2
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 12:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62FC1729;
	Tue,  3 Aug 2021 12:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62FC1729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627985702;
	bh=ScIwq0My0rYQ6JO/bIh9L83anHIBhfazGkzr5GFotAI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=btGRGMykL4i0++P51tesHE1TN50O1JrrazZzkIWOUJa6auAD3BgP38UK6P1bi2AjZ
	 zZocEl5/20tE80cNlhWc622wVoCvprB1GSNFWtmClLci42kwebmKdKq65+11gUz2tg
	 lL3t9WjRo/g6DWBQBWNT9KEm9vCJrQoQ6ZqFPvsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B293F804AC;
	Tue,  3 Aug 2021 12:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2C68F802E8; Tue,  3 Aug 2021 10:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F233F80082
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 10:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F233F80082
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=wistron-corp-partner-google-com.20150623.gappssmtp.com
 header.i=@wistron-corp-partner-google-com.20150623.gappssmtp.com
 header.b="ou+bUOJ1"
Received: by mail-pj1-x1034.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so3739558pjd.0
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wistron-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IXIeFsSEfhQ5FLZhNOuYsB7Hwka5h7OEPdEDsi9EjiU=;
 b=ou+bUOJ1a874U6V6Q/sECs+AAJyfg9fnmQsFZeUi3ag+l+QE1OHkLXftPJ8OT5MWw6
 BeJ0g3Z0wDHYcKHJQLIh9XzRwx5UT1Vz3Y2psnRfrPw0cGSRxUnRBYTNT8LW4+kb2sFw
 KouTYiCNY1qcQab+acnB6ze17EKXS6x2mEjYslulgjJ7tZKgLKRsDEgIiY06/eodRzDx
 /JMDK90HtAq5Gdn+QIe6ftipGMG7vYuUnReiDNaLXBOAVIBe08wpWyPgq303GmolKwps
 KStBBL/uVX3IJx8YXsQ+43oJOp1lwI9n3/OK8FaxTAPRsR4B9F/y3evkmaCTONo/iwxQ
 u6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IXIeFsSEfhQ5FLZhNOuYsB7Hwka5h7OEPdEDsi9EjiU=;
 b=RMo+yWUaqb2lqFCMLFDY62Nh8RVkiBErl9rdtwH5zKFWpF7z+fSGNjwGHv/XwVfToT
 9AuQDI+EdCCylyj1zNfZYj10+nA0JNnWajxb+Zn5TpeNI6cBkRHisoPCAiCg2H9X5kRi
 sFBlz1nEKbzLxQGU9hfBdApcWyTQKO40OXKjHso+BShlR0g4Uw94HOWmNZ6Y0CKGyplp
 TZUOkxfFAT6u+9RJul9RhTgEudjXSkLqeDJRersL5dK6drFuZqNs3rqMLsq8+N/lsZTo
 E4scRBi2F81ymlk45H+b+ZBYGglxp8HRCrhEhK11nr1LY+vhmgCjyBjQk+xILHzwpv0+
 heWw==
X-Gm-Message-State: AOAM531pBcX5MGvYkW10cEIaD3KMovCc2lTnK9xAet+m5lgVX6SxgAuL
 lN5TykWnedlEeB/dPiyUXB19kD39bGjRyg==
X-Google-Smtp-Source: ABdhPJy43I4BdGiXktXCXBUaClgUvRVLCc6+QVrYuP7RCXyg2ygLAWuJrmmTYKGXjWVadXrezTr3YA==
X-Received: by 2002:a17:90a:be16:: with SMTP id
 a22mr21586331pjs.169.1627979443313; 
 Tue, 03 Aug 2021 01:30:43 -0700 (PDT)
Received: from localhost.localdomain ([1.200.254.247])
 by smtp.gmail.com with ESMTPSA id n1sm10828409pgt.63.2021.08.03.01.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:30:42 -0700 (PDT)
From: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add support for max98360a speaker amp
Date: Tue,  3 Aug 2021 16:30:35 +0800
Message-Id: <20210803083035.342889-1-malik_hsu@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Aug 2021 12:13:25 +0200
Cc: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, mac.chiang@intel.com, broonie@kernel.org,
 brent.lu@intel.com, bard.liao@intel.com
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

Signed-off-by: Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 39217223d50c..8d727dd37f12 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1043,6 +1043,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "adl_max98360a_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(2) |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index a0f6a69c7038..6855c9e65236 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -280,6 +280,11 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.codecs = {"MX98357A"}
 };
 
+static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.id = "10EC5682",
@@ -297,6 +302,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "adl_max98360a_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98360a_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.25.1

