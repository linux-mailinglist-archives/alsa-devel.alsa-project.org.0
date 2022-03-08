Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC774D217D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:30:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8961218D0;
	Tue,  8 Mar 2022 20:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8961218D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767814;
	bh=Vn7BTkRmCB+5HTp0H2Ol2MmJoluHbvIF/WxZqYGNVFo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ti95+uC7oiJylHMASybITShHNLf4bg5cG1hYwatq0DAVE3QnsYrsOhLC0Q+/d0bBp
	 95wsz0tEPph0bXjc0QcPx1g3i1IBSX+LlrIoLbCmK4ER7QTP3eHvtr8ZTQnm6XqNP+
	 EyxnRx31T+yGnVwPFxWP6ScxKobPg7agDDIWl6uE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D3EF80549;
	Tue,  8 Mar 2022 20:27:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FE84F80534; Tue,  8 Mar 2022 20:26:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02536F80516
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02536F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V/6D3Nan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767607; x=1678303607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vn7BTkRmCB+5HTp0H2Ol2MmJoluHbvIF/WxZqYGNVFo=;
 b=V/6D3Nanc3V698X5eF571hoyFtqGplziM/+2NS86Yfq2lgsNLmnG15X3
 /Scoa0ZnuYMWwRjmCD4NbM9ruD3FKbhsLEIP/bkq0zEAuD1UrRTy7SgJt
 ybG7APZtnDBBsXUdAEczVfF3l7g1KB7rdEvQWMfsx5qn2x1CJ0jSPFSK+
 G7dDws2m9fOB9Rm1aEAIcu3vGe3A7K92fYDGqa1pGwBLk87wimepJZDBW
 XVstv+1KoY+DoK06sbG8fh95cClvjtyUXHybT1kezW2+7VQ9IVJce/Yaw
 XTlk2t5T6cUvSLEzYcp+snoUkWjCNSsRjafLF6gEgrI/Y90s3VlTqwEMX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363698"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363698"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573953"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/20] ALSA: intel-dsp-config: add more ACPI HIDs for ES83x6
 devices
Date: Tue,  8 Mar 2022 13:25:57 -0600
Message-Id: <20220308192610.392950-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 anthony tonitch <d.tonitch@gmail.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

We only saw ESSX8336 so far, but now with reports of 'ESSX8326' we
need to expand to a full list. Let's reuse the 'snd_soc_acpi_codecs'
structure to store the information.

Reported-by: anthony tonitch <d.tonitch@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
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
2.30.2

