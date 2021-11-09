Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8917144B701
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:28:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CB3E1696;
	Tue,  9 Nov 2021 23:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CB3E1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496920;
	bh=EQDITavXQyMrsWXUtLCWsvNIKbQFktmfNv7ub8fx2/U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBV8MdLVvBgJ81PqHb1+4BN9uZZpqQcv7uogiJPOKm8L0lQ/hWxZ8KPpFnoIGtXfU
	 ciiGPVVyIPCxtU0Cta2TB2dVmcr+Ju4SsV69gbOb7nch+tTJ5CNBrh/nRrQW1IkapY
	 +Jl6wwgHNz31u74vR+8W59If3nnPtcpOxBahAstY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F8EEF8059F;
	Tue,  9 Nov 2021 23:22:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2801AF8059F; Tue,  9 Nov 2021 23:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9459BF8057D
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9459BF8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G/P1Zaik"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0ED73619A6;
 Tue,  9 Nov 2021 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496512;
 bh=EQDITavXQyMrsWXUtLCWsvNIKbQFktmfNv7ub8fx2/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/P1Zaik4Wh6HTAjGQ5PPkhllF5JeOSWQdeFC4fcD4RtDrezXZhe+Gx7eMfp7nYbC
 gvkCdlhzuIV78KFdcmE1wb7ukuM3BZsUKg+q3a4PehZbkeGqswMRWoFSsSHYImK7Mg
 vPVE7EnXVdpDk6za1vARvfecQnAiL8duoZkHs+ElAEtTvrJg7mFhtd6wu28LwpJ7/H
 QEu/DtMQw8X2Zze/0TPeLhVdt5u7U8WKC4Phn6KIn+NIjxfYGUxvOTqjKb2mhE9l1h
 OjnUrd3n7j43CVidecKPJKSsLpjVUkcS29zTl+byY57OKdlgdyUXLriPk/FjainBUU
 LQGeGinHS1BpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 29/50] ALSA: intel-dsp-config: add quirk for
 APL/GLK/TGL devices based on ES8336 codec
Date: Tue,  9 Nov 2021 17:20:42 -0500
Message-Id: <20211109222103.1234885-29-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109222103.1234885-1-sashal@kernel.org>
References: <20211109222103.1234885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Huajun Li <huajun.li@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 9d36ceab94151f07cf3fcb067213ac87937adf12 ]

These devices are based on an I2C/I2S device, we need to force the use
of the SOF driver otherwise the legacy HDaudio driver will be loaded -
only HDMI will be supported.

Co-developed-by: Huajun Li <huajun.li@intel.com>
Signed-off-by: Huajun Li <huajun.li@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20211004213512.220836-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 61e1de6d7be0a..6cdb3db7507b1 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -30,6 +30,7 @@ struct config_entry {
 	u32 flags;
 	u16 device;
 	const struct dmi_system_id *dmi_table;
+	u8 codec_hid[ACPI_ID_LEN];
 };
 
 /*
@@ -55,7 +56,7 @@ static const struct config_entry config_table[] = {
 /*
  * Apollolake (Broxton-P)
  * the legacy HDAudio driver is used except on Up Squared (SOF) and
- * Chromebooks (SST)
+ * Chromebooks (SST), as well as devices based on the ES8336 codec
  */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
@@ -72,6 +73,11 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = 0x5a98,
+		.codec_hid = "ESSX8336",
+	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
 	{
@@ -136,7 +142,7 @@ static const struct config_entry config_table[] = {
 
 /*
  * Geminilake uses legacy HDAudio driver except for Google
- * Chromebooks
+ * Chromebooks and devices based on the ES8336 codec
  */
 /* Geminilake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
@@ -153,6 +159,11 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = 0x3198,
+		.codec_hid = "ESSX8336",
+	},
 #endif
 
 /*
@@ -310,6 +321,11 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x43c8,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = 0xa0c8,
+		.codec_hid = "ESSX8336",
+	},
 #endif
 
 /* Elkhart Lake */
@@ -337,6 +353,8 @@ static const struct config_entry *snd_intel_dsp_find_config
 			continue;
 		if (table->dmi_table && !dmi_check_system(table->dmi_table))
 			continue;
+		if (table->codec_hid[0] && !acpi_dev_present(table->codec_hid, NULL, -1))
+			continue;
 		return table;
 	}
 	return NULL;
-- 
2.33.0

