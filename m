Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E922B44B68A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:25:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA611657;
	Tue,  9 Nov 2021 23:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA611657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496729;
	bh=Rja146KzOm0/s8CDy5JgYf7S3NFAd/+ima/ub2lNy4o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GKwvCNMGesFgojrLdzhyBw5Z8Scd0X8WJLCbQkpkN+gA/zzKfQWkPco7fnI9IjyGD
	 U/f23+pAM0xtt3NQVBx9Nd9+inz/agHouhSYZjdEhLFsWmUTAujCZVZ3a66GSUJXZ1
	 x4uIBuepgXMrkOHro/cAOMIJEkqQ/sU6Klzjt05A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42DF9F80559;
	Tue,  9 Nov 2021 23:20:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8999F8055A; Tue,  9 Nov 2021 23:20:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78FBFF80553
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78FBFF80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lxBdKcsj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 472AD61A70;
 Tue,  9 Nov 2021 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496417;
 bh=Rja146KzOm0/s8CDy5JgYf7S3NFAd/+ima/ub2lNy4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lxBdKcsj3vHeopepzUmRhCoYc1sMwLb0ER1D3xAGUfTaICZxcUB8wsMiX1Go2VXNT
 d/7IyI4KYeZm/9n81XqmYnA4K/gnoV/AK8MYhDs2eGW4UXC348LkYt7eD7TRH6r9/J
 ba12U0jSIwoYii5C20pu9WNTIvMY3P+d0HZtDzRzZy6nHKz47R6KQg94baI+6//me0
 4OIHLWABIUyB/3QQXoWhEIlokgmEfKIoqbmzQy71gZoHw2F6FkBS7VrbWs+l8GX9VI
 XSPC+IGn4UXSyRwq6Y5m98OCB+sDHzb8NSx4BYqHiF9yrMBkrrNeN1W6vBqbLQGmz6
 qOGlvLoVrwxqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 43/75] ALSA: intel-dsp-config: add quirk for
 APL/GLK/TGL devices based on ES8336 codec
Date: Tue,  9 Nov 2021 17:18:33 -0500
Message-Id: <20211109221905.1234094-43-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221905.1234094-1-sashal@kernel.org>
References: <20211109221905.1234094-1-sashal@kernel.org>
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
index c9d0ba353463b..b9ac9e9e45a48 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -31,6 +31,7 @@ struct config_entry {
 	u16 device;
 	u8 acpi_hid[ACPI_ID_LEN];
 	const struct dmi_system_id *dmi_table;
+	u8 codec_hid[ACPI_ID_LEN];
 };
 
 /*
@@ -56,7 +57,7 @@ static const struct config_entry config_table[] = {
 /*
  * Apollolake (Broxton-P)
  * the legacy HDAudio driver is used except on Up Squared (SOF) and
- * Chromebooks (SST)
+ * Chromebooks (SST), as well as devices based on the ES8336 codec
  */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
@@ -73,6 +74,11 @@ static const struct config_entry config_table[] = {
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
@@ -137,7 +143,7 @@ static const struct config_entry config_table[] = {
 
 /*
  * Geminilake uses legacy HDAudio driver except for Google
- * Chromebooks
+ * Chromebooks and devices based on the ES8336 codec
  */
 /* Geminilake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
@@ -154,6 +160,11 @@ static const struct config_entry config_table[] = {
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
@@ -311,6 +322,11 @@ static const struct config_entry config_table[] = {
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
@@ -354,6 +370,8 @@ static const struct config_entry *snd_intel_dsp_find_config
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

