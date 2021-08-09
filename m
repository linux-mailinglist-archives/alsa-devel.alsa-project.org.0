Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D65F3E4EA1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 23:37:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4FF86E;
	Mon,  9 Aug 2021 23:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4FF86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628545055;
	bh=6FXbyE1mUXl6Q/8N8u9ybwysYv+D9nsX8UIYT0IRm24=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=khDZmLCAWti3fhdSlb8Zw62PJOfDf4dYDKKHi128qkBXZxGEUQTN2N6JIpJxScfbu
	 Zgeuk7cqiCnUZsYAiKwEOI0cwU/Sqn4u19HEqu7snuHl016LwOSucDJsX4tgd5IjEt
	 pTbOULo7De/GB4do9YvJWHn+FqTDjr1B70IaLHgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A91BF8032D;
	Mon,  9 Aug 2021 23:36:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4FF7F802D2; Mon,  9 Aug 2021 23:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81DAEF800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 23:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81DAEF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ObeuE3Ci"
Received: by mail-pj1-x102e.google.com with SMTP id nt11so6862502pjb.2
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 14:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWLVdl34FQW+ztQ/VfWRCFJmcpEXpa77QdgMQfAG2k4=;
 b=ObeuE3CiGeNMFoStbZfVQCKN9TAf2UGt6jwBSlGCsFJbeHkYGrJOqrIVhjgIrsfFA4
 uKfaZRLD45tBd9PqHGuBDOUxnIIZxZZDgFAHye7ipe1UW9LpLCdl785cHaYa0lJmOaLs
 teoS3xMDF0yAZSQxBIHdYaOFH445dRvjc/wYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UWLVdl34FQW+ztQ/VfWRCFJmcpEXpa77QdgMQfAG2k4=;
 b=HMJoYkZs8BtNPL5cvlDC9cbF0IKHHHIqhZsRy33qnI1Qxvvfh0Sn7+67OYL6fuQkG5
 5Ze29U0MAyeiIQambBYRge6NWRwrUVIOHwHs1t89ASQaJFm03LRsafLKZB26me4y4pwu
 nXz5P7iukBdUfzIMtB60OBpnh9FTD/pZtsFCS+G7J7e/zQFeCoJHKpy0s1cskdhOFfWl
 WQLJbUzKpzBXlSpHl7kew83sZ14IcMLUj/L6r4BbG8rHckM6w1DOqj32m8QtfY2PROig
 RPlvELp875oEprwwee73/oGoH1iHETMqO+i8d5lhNiwMWT7X6nU1Fj/S9yLt7itIMdy9
 BurQ==
X-Gm-Message-State: AOAM533v0r70jkObo/GPxaUEjYFBiciww+cfSf5QOn9p4hp35eZVwRqo
 9w87D62tNiX1tDrWKVjeVQm/4X6iP1Qa
X-Google-Smtp-Source: ABdhPJwnlLGSxshWpfXQC2UpVxfmaMey5AGy76U8uFZsjIwYISENA29gLabjAiW6lfgCkLf0Yx5bTQ==
X-Received: by 2002:aa7:96ac:0:b029:3c7:ca98:400a with SMTP id
 g12-20020aa796ac0000b02903c7ca98400amr19255065pfk.18.1628544951292; 
 Mon, 09 Aug 2021 14:35:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:e554:9d7b:a40d:3e6])
 by smtp.gmail.com with UTF8SMTPSA id n185sm7173893pfn.171.2021.08.09.14.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 14:35:51 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: Fix platform ID matching
Date: Mon,  9 Aug 2021 14:35:39 -0700
Message-Id: <20210809213544.1682444-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Matt Davis <mattedavis@google.com>, Brent Lu <brent.lu@intel.com>
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

Sparse warnings triggered truncating the IDs of some platform device
tables. Unfortunately some of the IDs in the match tables were missed
which breaks audio. The KBL change has been verified to fix audio, the
CML change was not tested as it was found through grepping the broken
changes and found to match the same situation in anticipation that it
should also be fixed.

Fixes: 94efd726b947 ("ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters")
Fixes: 24e46fb811e9 ("ASoC: Intel: bxt_da7219_max98357a: shrink platform_id below 20 characters")
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Tested-by: Matt Davis <mattedavis@google.com>
---
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 42ef51c3fb4f..b591c6fd13fd 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -75,7 +75,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "cml_da7219_max98357a",
+		.drv_name = "cml_da7219_mx98357a",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98390_spk_codecs,
 		.sof_fw_filename = "sof-cml.ri",
diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index ba5ff468c265..741bf2f9e081 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -87,7 +87,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "kbl_da7219_max98357a",
+		.drv_name = "kbl_da7219_mx98357a",
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98357_codecs,
-- 
2.32.0.605.g8dce9f2422-goog

