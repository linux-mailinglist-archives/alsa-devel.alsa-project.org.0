Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AAC95AF5D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 09:33:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285C4826;
	Thu, 22 Aug 2024 09:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285C4826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724312036;
	bh=tgQPJPpNAfsACxBCqDnQfbT/weDbVlMexLgIB9A0hJU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Y4Q4hPXQDBYY5/UBiJnH9pg0sYBSlnKdxHP9av2b9tAhsp1igaLC9l/ss4Na2ymZn
	 qI7tpAODaYQuwdZrVnNkYZIom5RMWk/b1A0kTGe2WdSq1fuHvyjj4zVYLDZUGWocsE
	 McASr9rhKJEjFN9swOLZNP64LC/gl6cD3cWcyA8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D683F8069A; Thu, 22 Aug 2024 09:31:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE78BF8063E;
	Thu, 22 Aug 2024 09:31:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1810BF80494; Wed, 21 Aug 2024 09:26:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F2BAF800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 09:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F2BAF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=n805qDsq
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47L7Q5K5077423;
	Wed, 21 Aug 2024 02:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724225165;
	bh=lOR+k15BENW2qTRzzlqe296w6aa0s5HlZQhvkuznWH8=;
	h=From:To:CC:Subject:Date;
	b=n805qDsq+h1TqpsmFGBeYk0F+vtYI9oxFSsy4LWEi1s2UGYWypLYLYi8xEUsDl8QO
	 hmD5kszKzsJWXmjI/b8kthjSM4HitPFO/s38XNQTVj/hnYxIyx+GPhHtoDVNWpYTxU
	 IWirymJuAdIFjq5aq923T0+J8mS9iNSjkHpbkkKI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47L7Q52U001130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Aug 2024 02:26:05 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Aug 2024 02:26:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Aug 2024 02:26:04 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.165.138])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47L7Pqbk034829;
	Wed, 21 Aug 2024 02:25:53 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        <Jerry2.Huang@lcfuturecenter.com>, <jim.shil@goertek.com>
Subject: [PATCH v1] ASoC: tas2781: Remove unnecessary line feed for
 tasdevice_codec_remove
Date: Wed, 21 Aug 2024 15:25:27 +0800
Message-ID: <20240821072527.1294-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BOFEP6A3YXUDTEY5YGQBU2UBQWSCEZJB
X-Message-ID-Hash: BOFEP6A3YXUDTEY5YGQBU2UBQWSCEZJB
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:28:40 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOFEP6A3YXUDTEY5YGQBU2UBQWSCEZJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unnecessary line feed for tasdevice_codec_remove.
Add comma at the end the last member of the array.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>

---
v1:
---
 sound/soc/codecs/tas2781-i2c.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9a32e0504857..eb8732b1bb99 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -582,13 +582,13 @@ static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_SPK("SPK", tasdevice_dapm_event),
 	SND_SOC_DAPM_OUTPUT("OUT"),
-	SND_SOC_DAPM_INPUT("DMIC")
+	SND_SOC_DAPM_INPUT("DMIC"),
 };
 
 static const struct snd_soc_dapm_route tasdevice_audio_map[] = {
 	{"SPK", NULL, "ASI"},
 	{"OUT", NULL, "SPK"},
-	{"ASI OUT", NULL, "DMIC"}
+	{"ASI OUT", NULL, "DMIC"},
 };
 
 static int tasdevice_startup(struct snd_pcm_substream *substream,
@@ -730,8 +730,7 @@ static void tasdevice_deinit(void *context)
 	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
 }
 
-static void tasdevice_codec_remove(
-	struct snd_soc_component *codec)
+static void tasdevice_codec_remove(struct snd_soc_component *codec)
 {
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
 
-- 
2.43.0

