Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5E7956CC5
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2024 16:11:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B79F162C;
	Mon, 19 Aug 2024 16:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B79F162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724076684;
	bh=lyv4GJuG2t1ly2K5VcSu4yxovZ6sxbl76hdNTZHz/3s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BsE2oxKHBNmDbUdsHYz1gQuryhNt3CsfYQ8GUTOSeJrI2/uI3v37++Jwz1OH8LeN0
	 HvAzU6Ek7OWKbnAeNLZ7e0R1fOymWT49Xz82iJ8YjhcK/ONEGBu16MbXJqguV7H5FX
	 CBsRaAQ2nqXjRMNb/WI1yLjTXHO7EavxDFtdOj2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BB8F805AD; Mon, 19 Aug 2024 16:11:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F90F80588;
	Mon, 19 Aug 2024 16:11:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A82F80494; Mon, 19 Aug 2024 16:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AD96F80107
	for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2024 16:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD96F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Q1zqVvHu
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47JEAY2m122372;
	Mon, 19 Aug 2024 09:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724076634;
	bh=ePTpd+NjcZsoBbQdRIDwuel90RcIWxdyFRAdIHxfb60=;
	h=From:To:CC:Subject:Date;
	b=Q1zqVvHu1tE8dUKAptcroW1HGtITQUFub7bVnDqFf7NgxtULy7wLdVA4YCBkTMRe1
	 RFo9tsVY5I5qOl6C2XH1kqrc5DnvmtOYoJjubUYXigAAE9cimrPOfnDf2Nf+AbdfEP
	 AZ40dQnjlOEli8QMvQOC5jyTSnqNtmFEJ0TKMh5Y=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47JEAYVe095291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2024 09:10:34 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Aug 2024 09:10:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Aug 2024 09:10:33 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.152])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47JEANvI122858;
	Mon, 19 Aug 2024 09:10:24 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <j-chadha@ti.com>, <judyhsiao@google.com>,
        <navada@ti.com>, <cujomalainey@google.com>, <aanya@ti.com>,
        <nayeem.mahmud@ti.com>, <savyasanchi.shukla@netradyne.com>,
        <flaviopr@microsoft.com>, <jesse-ji@ti.com>, <darren.ye@mediatek.com>,
        <antheas.dk@gmail.com>, <Jerry2.Huang@lcfuturecenter.com>,
        <jim.shil@goertek.com>, Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: tas2781: fixed the issue that the chip do not
 shutdown immediatly after aplay stopped
Date: Mon, 19 Aug 2024 22:10:12 +0800
Message-ID: <20240819141017.502-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: GPR42U3KNB4NYWINW5OM6MJJ4P7ZCVBC
X-Message-ID-Hash: GPR42U3KNB4NYWINW5OM6MJJ4P7ZCVBC
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPR42U3KNB4NYWINW5OM6MJJ4P7ZCVBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Issue reported from customer that the chip do not shutdown after aplay
stopped until 6 mins later. Drop tasdevice_dapm_event and implement
.stream_mute in the tasdevice_dai_ops.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Drop tasdevice_dapm_event and implement .stream_mute in the tasdevice_dai_ops
 - Remove unnecessary line feed for tasdevice_codec_remove
---
 sound/soc/codecs/tas2781-i2c.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9a32e0504857..145c45349399 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -557,30 +557,22 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		release_firmware(fmw);
 }
 
-static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *kcontrol, int event)
+static int tasdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
-	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	struct snd_soc_component *codec = dai->component;
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
-	int state = 0;
 
-	/* Codec Lock Hold */
-	mutex_lock(&tas_priv->codec_lock);
-	if (event == SND_SOC_DAPM_PRE_PMD)
-		state = 1;
-	tasdevice_tuning_switch(tas_priv, state);
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
+	/* Codec Lock/UnLock */
+	guard(mutex)(&tas_priv->codec_lock);
+	tasdevice_tuning_switch(tas_priv, mute);
 
 	return 0;
 }
 
 static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_AIF_OUT_E("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
-		0, 0, tasdevice_dapm_event,
-		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
-	SND_SOC_DAPM_SPK("SPK", tasdevice_dapm_event),
+	SND_SOC_DAPM_AIF_OUT("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SPK("SPK", NULL),
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_INPUT("DMIC")
 };
@@ -667,6 +659,7 @@ static const struct snd_soc_dai_ops tasdevice_dai_ops = {
 	.startup = tasdevice_startup,
 	.hw_params = tasdevice_hw_params,
 	.set_sysclk = tasdevice_set_dai_sysclk,
+	.mute_stream = tasdevice_mute,
 };
 
 static struct snd_soc_dai_driver tasdevice_dai_driver[] = {
-- 
2.34.1

