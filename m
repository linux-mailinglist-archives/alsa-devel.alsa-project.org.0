Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F93F1523
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 10:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFD73167E;
	Thu, 19 Aug 2021 10:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFD73167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629361554;
	bh=rrgGBZsCsT0Th52o99lDjoMhuADzm6Du5pd8kMcMnZ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kE3+KqF5gYrXskcZYuu2j3WM446jw70qZVe2lZvFJBTflm7YBWc06yq/VnDTRGlNd
	 kB4i7AhImDJB5OkOhkULP0KHB3Z7GtHOoU9C57050+kYrdQX31M+mDZ1+CvnDEDtUv
	 Sdeo3L7e3Zg/EZz2tSva5cvpHPUFu8W2zQfP01Pk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2891CF800CC;
	Thu, 19 Aug 2021 10:24:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20832F800CC; Thu, 19 Aug 2021 10:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90BE4F800CC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 10:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90BE4F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="RcAvziP+"
Received: by mail-lj1-x22b.google.com with SMTP id q21so10118600ljj.6
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/XAahqRt3aqb5MLsAR4aGo2YrpQJcocQPKcdesYZ7FU=;
 b=RcAvziP+WN1UOMn0gnMYQuuLjCzZ64hq+bqIFy7PKLgj0j7FlnklStb/5VP+8K392u
 5vxjtPevFVn2jjF0xsRBGpiYWWEJGdFfrSWwn3rtCX6mOtVk6Z8m0hMCZIA0C7LJ1XoL
 QF4OmiGaRV9vagjPHFEHYD0D1FAdF0rDjQvQA6dmGuk8ikxPvCtbABlFpZ/pPOOeMNyb
 ImvwxAK+0OZBp9mjcuF6SOIjgU1Wi0C2n9/EstWi4HFnm81Is0cjDHp4r6sFdqyjPLX3
 g20uMsfhz9USgQRl7RiDY11PnjllXnpuUD2irc4QjgWq1BUnywDk8PKQ8K1iVbQiI0AH
 2+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/XAahqRt3aqb5MLsAR4aGo2YrpQJcocQPKcdesYZ7FU=;
 b=goqfnoUI+VF7wBEzsECfepEue3WKIU7qWrg4DP2FIeEkkam9jzdHn6xqBLI3kgBu3U
 9NJALiWX0VHGW0FHdn1tiZRnqKjj8icZO7HWMrzdvSHmMNuUolRTEsbnR0U/U26tEa13
 HFxUq/VHHdC84X0vJ9cxjZjPnX7HWnhBjtcNPy2JffUE5NuG/Fs2hq20tuta9tnMAus1
 anDjEYVzkDlmvNNfUliBAQElP63vttQeRi+2f6l70z7Q1DCs25ioDL0i+EfXFJ/1Ih5M
 9oFT4IZr1z2ZBTxBnQdYrr1amn77MN/ZzMCs62RLwBAF5N5G1ih0TCTdkmBtBZ4F+s23
 JaDQ==
X-Gm-Message-State: AOAM532SHvczI7dahhs4Jnr667Z+x6UVe5d9lcvYb+tCKeApsVO4jUEu
 v6XfSFHuzG6XxdqZJv478fR4sA==
X-Google-Smtp-Source: ABdhPJyRbn332NGgU8QZSuxAjb3e9exmd8DFOkcZswqNNaTkzwNrFUsgkx4du82jsWbVD/9EFxxnqw==
X-Received: by 2002:a2e:a44f:: with SMTP id v15mr11142228ljn.301.1629361466060; 
 Thu, 19 Aug 2021 01:24:26 -0700 (PDT)
Received: from lmajczak1-l.semihalf.net ([83.142.187.84])
 by smtp.gmail.com with ESMTPSA id f16sm198210ljq.58.2021.08.19.01.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:24:25 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2] ASoC: Intel: Fix platform ID matching for
 kbl_da7219_max98373
Date: Thu, 19 Aug 2021 10:24:14 +0200
Message-Id: <20210819082414.39497-1-lma@semihalf.com>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>, Lukasz Majczak <lma@semihalf.com>
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
tables. Unfortunately kbl_da7219_max98373 was also truncated.
This patch is reverting the original ID.
Tested on Atlas chromebook.

Fixes: 94efd726b947 ("ASoC: Intel: kbl_da7219_max98357a: shrink platform_id below 20 characters")
Cc: <stable@vger.kernel.org> # 5.4+
Tested-by: Lukasz Majczak <lma@semihalf.com>
Signed-off-by: Lukasz Majczak <lma@semihalf.com>
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index 741bf2f9e081..8cab91a00b1a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -113,7 +113,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "kbl_da7219_mx98373",
+		.drv_name = "kbl_da7219_max98373",
 		.fw_filename = "intel/dsp_fw_kbl.bin",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &kbl_7219_98373_codecs,
-- 
2.33.0.rc2.250.ged5fa647cd-goog

