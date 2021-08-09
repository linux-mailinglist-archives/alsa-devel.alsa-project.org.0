Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EB73E4E81
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 23:35:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC46886E;
	Mon,  9 Aug 2021 23:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC46886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628544917;
	bh=mGD5Wg5KszZGZuY8C1zQZTBfg08Qtf3rri4wo85FHOo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E9r5FWYkkW6rFlE/0S0gOEzUIoRZOo+2f5jBqzY0t+rJtA+f6lg1MhyAULEbGShbL
	 J4U0jkunoaUwqBtF/btBEdzeUvd7rEr6IgWuGTCFEXvLlvbnvpRqkdJiIr4r15hJ0X
	 zB93AYPf8+SfBvhmqKBtEpeJuXhBo2haTRYKAl0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21114F8032D;
	Mon,  9 Aug 2021 23:33:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BAB0F802D2; Mon,  9 Aug 2021 23:33:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69CB4F800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 23:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69CB4F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="A8+7lVSh"
Received: by mail-pl1-x62e.google.com with SMTP id a5so2384925plh.5
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfxW8sERjeoO4VmUrLfMOYfhvu164iU9CMNXTq85PGw=;
 b=A8+7lVShkPFt70FuYnQVxtQn7ePphKnBob0WknKY8bBkviu1W6Kxj1p2vCx85sUFSu
 mBk92XVlAbY8nHWiI1he0PsuK85kz6J/BnIA+WVE3ytBRvafnO248UHQvoy6vyTQ/yCZ
 iMnLxzQ1q2SnceAP11eSBvbjK5gRJUj53gnkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VfxW8sERjeoO4VmUrLfMOYfhvu164iU9CMNXTq85PGw=;
 b=gNIZ/J1VhP1RleLumjxS5RMovMr9fpeWMXs0fHvBXTnFnaJa0IMbJfpLwRat5naTmi
 dpM+jY9e3Ve6wbU1y7N6DNQ5nZhx/F0ahJMbdxKkusL2rQ3hGNeSxa0AB0vbx+bcbgu1
 wfep+ZbHUvSCXT8mtUCeObmyMUW2XAVZfDbfFq6zPKMQGQl5nm8B5YTibDGNp8mli7W/
 q1S8zx2v/MhXjiqLHXA4nuD9E73MYeXxtWTaudcs9RakCC06ijZcl4EDP9j9/76vY6C+
 7Vx6/7tBEQigypCIX2B1NkBVNtMdXyBbfzky3ENknbIvQS56aNn+cwKh/BlCpllw4w8J
 N8Tw==
X-Gm-Message-State: AOAM532a7wWvmnuwIk+PWbqHOH/uzpR11kWUhT5mBgpJn0HzC3jlr01l
 xMc8aCkJgwAmMxBjoLDHL0zIF4Efppmx
X-Google-Smtp-Source: ABdhPJyE4jIOeXFCOUR3xmivnZ5yOd60Kcil6FjKzsiSBYRpdDE5Xgrp5xoe0cNNfkcYnHW+sGcD/Q==
X-Received: by 2002:a17:90a:474e:: with SMTP id
 y14mr27873047pjg.33.1628544814713; 
 Mon, 09 Aug 2021 14:33:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:e554:9d7b:a40d:3e6])
 by smtp.gmail.com with UTF8SMTPSA id g19sm450527pjl.25.2021.08.09.14.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 14:33:34 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Fix platform ID matching
Date: Mon,  9 Aug 2021 14:32:42 -0700
Message-Id: <20210809213248.1674049-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Matt Davis <mattedavis@chromium.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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
Tested-by: Matt Davis <mattedavis@chromium.org>
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

