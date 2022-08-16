Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C939595259
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 08:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3FD1621;
	Tue, 16 Aug 2022 08:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3FD1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660629977;
	bh=NtZrxGx8u3F5Nu9icrtIv0EYfyzaI8zfOVOGFMO6WmM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CkcMDv/Vvfm46yHyjvcg819cfNdaglh+Fe6LUagqvvPyPnYIv5rwsWdKVglyhfBRx
	 8T1Aqk9+KC//jq01KwFg/oD6ZPQ01fgHGCiiE+ZfMW6ksrG3RdWep5d5Rk7O0mXSW9
	 FpDFdQgqGuEgAFE35/H3HhIAUfvxD4EThdkBOiwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD0FAF804BB;
	Tue, 16 Aug 2022 08:04:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF03F804AB; Tue, 16 Aug 2022 08:04:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72C74F80082
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 08:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72C74F80082
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=quanta-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@quanta-corp-partner-google-com.20210112.gappssmtp.com
 header.b="LBtmGVtA"
Received: by mail-pg1-x52a.google.com with SMTP id l64so8437317pge.0
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 23:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Q+2OJPxyAh41VkQNVhVIveQFr71J1YrrJRjA24sZS6s=;
 b=LBtmGVtAw3vAkbdCYeYLO7DRihAkgZRYcRd+blZGRm7YNgcVdGNaxzsz3tOGMGs32z
 BC12FPIjoEAGufi88HkburDDZtqbZNXGrDrOwsE/OpEi2PnDk0ugeNCLN+hlAr8sr+TZ
 nzHA8XUAl7nVN1GWflmzYtK05v0KsbuVtENxYSxGtQrJ0O2JToqqTZ9RRoVNBwIYjtGm
 VW1sTXpJZgJX84bCStEfQ62b1UyvK2gi91lKgHqc3BuhkBu7gYKZ2rViKSanruavuQa/
 EHq0kWM2U1B7bLN+ozHDJhKY01MKaO+88bBomsHgX80iXcoH1bz3sO3JYhjM02oCADTS
 r5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Q+2OJPxyAh41VkQNVhVIveQFr71J1YrrJRjA24sZS6s=;
 b=Ljt953sYtGRjzPLf4My52qkN41PhUQkwIPuYORZfLUINdKYWyBc8rfqV1D4vMM9Ipn
 AL2BFsGG05Z0stG1UH3fAdWnPJzQZC5HIUZ6fT4vtnL/6dJGu7WwNk1t4IuSer0VqNCy
 yQziR4NVCpJCohadr49+V8O/Wc1oOoLbFyz63rMT1AsqT1zOEfFhAhZXSzxPuQnN+pvw
 DEBMSqtK0JkN35v00IxzqM/dbg1JsBEWYnYwzsV//oB9VvitufmTA+MV5vog6/f1NkCp
 Lwx7c68slH/+nMHcCkiocVyDIKrwW5xh4PmrvXxTyttMMKs7aj/2Op1+p+4/LJ0riqIS
 zlPQ==
X-Gm-Message-State: ACgBeo1hUvHyM/bDm/FbXjrxwDib4K2ZBMv3C8cD2Exn9yr3IxzGJPMf
 JmUg1AAbXg0BYxmJyQ249BeQzg==
X-Google-Smtp-Source: AA6agR5dfOx1zMXF/vjwOZNL/T/IdfH4UimFNyngVvdR9B5C+3FuWTaFVAoB9PRN48Uyqdcm8ZDYLA==
X-Received: by 2002:a63:8b44:0:b0:41c:df4c:7275 with SMTP id
 j65-20020a638b44000000b0041cdf4c7275mr17003557pge.434.1660629886100; 
 Mon, 15 Aug 2022 23:04:46 -0700 (PDT)
Received: from sean-biuld-server.itotolink.net
 (1-34-200-211.hinet-ip.hinet.net. [1.34.200.211])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a170902be1700b001714e7608fdsm7994549pls.256.2022.08.15.23.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:04:45 -0700 (PDT)
From: Sean Hong <sean.hong@quanta.corp-partner.google.com>
To: pierre-louis.bossart@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 brent.lu@intel.com
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add support for jsl_rt5682_rt1019
Date: Tue, 16 Aug 2022 14:04:37 +0800
Message-Id: <20220816060437.1115039-1-sean.hong@quanta.corp-partner.google.com>
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

