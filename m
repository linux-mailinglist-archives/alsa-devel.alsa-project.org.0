Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F124EC0C5
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A0AE1849;
	Wed, 30 Mar 2022 13:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A0AE1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641141;
	bh=n1yKYr6ib+uBTiB1zGsnOcKC0HJM7ZyAz+w+jiqCJxM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pmc3GZfu5Hyj2RiLC5GCNQZdU25/hS5wnGx7iE01vtzm+o6NcJ8f9a/Mj4mxlinFd
	 inwy+An4diWrCPw+q7xbjaJVUsioczdhWiodECe6aquIp6dtFfvQT8pWJArgeAzUTJ
	 WmiLf7tCXA1v1P+ing47vXbGL7hjJaEmST61w+xI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97F6EF80571;
	Wed, 30 Mar 2022 13:48:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFB40F80578; Wed, 30 Mar 2022 13:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 573EEF8055C
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 573EEF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kBpQPLT0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1698B81C28;
 Wed, 30 Mar 2022 11:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16163C340F2;
 Wed, 30 Mar 2022 11:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640892;
 bh=n1yKYr6ib+uBTiB1zGsnOcKC0HJM7ZyAz+w+jiqCJxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kBpQPLT0aBW0QFdr9HHKiThT8aPMSAnC+p+cLIvT8ysk/F9pV0iLeOTlDkE9VoOjp
 N9u31NfL5e34VratvW3hQxfciEjEKeZm9LVoSQiA4fFJwt6w+Wwac+9MOiFeZwpu1O
 lymf4pvwwMjD8939XKf0LToLsAK/ysb+gqD8j1dX4y+CEXpwWtP+XOM2YCv844eEd+
 9qxlOqV6wrQ4qd7UMqCAvxbFzDPAgpjqjzyQU3chilaSNljKiGN2agvz9cGnxnJNs9
 g8kKbJZZleWUKQsfM2rVpg40xAaZl/1Di/PIXkdQIPQ2nEId94p/CUZs4whVoOUz9H
 xLuBLrZFiAbGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 55/66] ALSA: intel-dsp-config: add more ACPI HIDs
 for ES83x6 devices
Date: Wed, 30 Mar 2022 07:46:34 -0400
Message-Id: <20220330114646.1669334-55-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 anthony tonitch <d.tonitch@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

[ Upstream commit de24d97fb845ffd2229811ee256438e42b5a8d12 ]

We only saw ESSX8336 so far, but now with reports of 'ESSX8326' we
need to expand to a full list. Let's reuse the 'snd_soc_acpi_codecs'
structure to store the information.

Reported-by: anthony tonitch <d.tonitch@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Acked-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20220308192610.392950-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 4fb90ceb4053..b9b7bf5a5553 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -11,6 +11,7 @@
 #include <sound/core.h>
 #include <sound/intel-dsp-config.h>
 #include <sound/intel-nhlt.h>
+#include <sound/soc-acpi.h>
 
 static int dsp_driver;
 
@@ -31,7 +32,12 @@ struct config_entry {
 	u16 device;
 	u8 acpi_hid[ACPI_ID_LEN];
 	const struct dmi_system_id *dmi_table;
-	u8 codec_hid[ACPI_ID_LEN];
+	const struct snd_soc_acpi_codecs *codec_hid;
+};
+
+static const struct snd_soc_acpi_codecs __maybe_unused essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
 };
 
 /*
@@ -77,7 +83,7 @@ static const struct config_entry config_table[] = {
 	{
 		.flags = FLAG_SOF,
 		.device = 0x5a98,
-		.codec_hid = "ESSX8336",
+		.codec_hid =  &essx_83x6,
 	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
@@ -163,7 +169,7 @@ static const struct config_entry config_table[] = {
 	{
 		.flags = FLAG_SOF,
 		.device = 0x3198,
-		.codec_hid = "ESSX8336",
+		.codec_hid =  &essx_83x6,
 	},
 #endif
 
@@ -251,7 +257,7 @@ static const struct config_entry config_table[] = {
 	{
 		.flags = FLAG_SOF,
 		.device = 0x02c8,
-		.codec_hid = "ESSX8336",
+		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
@@ -280,7 +286,7 @@ static const struct config_entry config_table[] = {
 	{
 		.flags = FLAG_SOF,
 		.device = 0x06c8,
-		.codec_hid = "ESSX8336",
+		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
@@ -327,7 +333,7 @@ static const struct config_entry config_table[] = {
 	{
 		.flags = FLAG_SOF,
 		.device = 0x4dc8,
-		.codec_hid = "ESSX8336",
+		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC,
@@ -353,7 +359,7 @@ static const struct config_entry config_table[] = {
 	{
 		.flags = FLAG_SOF,
 		.device = 0xa0c8,
-		.codec_hid = "ESSX8336",
+		.codec_hid =  &essx_83x6,
 	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
@@ -414,8 +420,15 @@ static const struct config_entry *snd_intel_dsp_find_config
 			continue;
 		if (table->dmi_table && !dmi_check_system(table->dmi_table))
 			continue;
-		if (table->codec_hid[0] && !acpi_dev_present(table->codec_hid, NULL, -1))
-			continue;
+		if (table->codec_hid) {
+			int i;
+
+			for (i = 0; i < table->codec_hid->num_codecs; i++)
+				if (acpi_dev_present(table->codec_hid->codecs[i], NULL, -1))
+					break;
+			if (i == table->codec_hid->num_codecs)
+				continue;
+		}
 		return table;
 	}
 	return NULL;
-- 
2.34.1

