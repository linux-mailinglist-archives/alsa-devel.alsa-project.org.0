Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE4946746
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Aug 2024 05:51:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60C9F4792;
	Sat,  3 Aug 2024 05:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60C9F4792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722657070;
	bh=Jp4s2u0rPcRvnjZtDW6tpNcOkZxG/4WF21pFw18kwPk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vu9jWIjq1LrBsj9M1a6n4rP2x9GueQLs3Dz0HzEbmQSqbDQt30cIDcZXZvzv7ViAu
	 sjXysTGGwFO/vyM4ix4uifYO4ltoAaY6fPNJDAV+aDqHg8Q/9qegENvgQnV762X1Jo
	 ikkwRGJhEIsxdY9LoIONc2wyzqYlGAt0vF9AzUVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9149EF805B0; Sat,  3 Aug 2024 05:50:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3CD8F805AD;
	Sat,  3 Aug 2024 05:50:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 885D1F80269; Sat,  3 Aug 2024 05:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7096CF8007E
	for <alsa-devel@alsa-project.org>; Sat,  3 Aug 2024 05:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7096CF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=HF+cLjwF
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4733RYv2063336;
	Fri, 2 Aug 2024 22:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722655655;
	bh=w8ZgzIw3ffEKLb+e21Wl0tugPEMWOMJhKlOMPqkQpb8=;
	h=From:To:CC:Subject:Date;
	b=HF+cLjwFIb6RgvSLRRZoorR7tPUPJNBrp0bcNq6diMAe4dpJyYDiFI6HymnC3OUFs
	 gGIqE8UNSlvGUuBxBREt6E/S7xav/xUc7GB1TMjzeLZzQPyL4KJg6bAUKp0s7MNUIv
	 xrkI56Vu5ghA9SMeAGdqEvK3ZNFSrZW9GCm8VKFM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4733RYeB025914
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 22:27:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 22:27:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 22:27:34 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.49])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4733RMx9057588;
	Fri, 2 Aug 2024 22:27:23 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
 <soyer@irl.hu>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        <Jerry2.Huang@lcfuturecenter.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: tas2781: Rename dai_driver name to unify the name
 between TAS2563 and TAS2781
Date: Sat, 3 Aug 2024 11:27:14 +0800
Message-ID: <20240803032717.175-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: NG5KKIXUG7CPAHEVPAQ63RQUIR6XVZFC
X-Message-ID-Hash: NG5KKIXUG7CPAHEVPAQ63RQUIR6XVZFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NG5KKIXUG7CPAHEVPAQ63RQUIR6XVZFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename dai_driver name to unify the name between TAS2563 and
TAS2781, remove unnecessary line feed, strscpy replace scnprintf.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Use strscpy to replace scnprintf.
 - rename dai_driver name from "tas2781_codec" to "tasdev_codec",
   in case of misunderstanding whether tas2781 or tas2563.
 - Remove unnecessary line feed for tasdevice_dsp_create_ctrls
---
 sound/soc/codecs/tas2781-i2c.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 8a57c045afdd..6631254d4985 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -353,7 +353,7 @@ static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 		ret = -ENOMEM;
 		goto out;
 	}
-	scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "Speaker Profile Id");
+	strscpy(name, "Speaker Profile Id", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
 	prof_ctrls[mix_index].name = name;
 	prof_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	prof_ctrls[mix_index].info = tasdevice_info_profile;
@@ -424,8 +424,7 @@ static int tasdevice_configuration_put(
 	return ret;
 }
 
-static int tasdevice_dsp_create_ctrls(
-	struct tasdevice_priv *tas_priv)
+static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *dsp_ctrls;
 	char *prog_name, *conf_name;
@@ -453,8 +452,8 @@ static int tasdevice_dsp_create_ctrls(
 		goto out;
 	}
 
-	scnprintf(prog_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-		"Speaker Program Id");
+	strscpy(prog_name, "Speaker Program Id",
+		SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
 	dsp_ctrls[mix_index].name = prog_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_programs;
@@ -462,8 +461,7 @@ static int tasdevice_dsp_create_ctrls(
 	dsp_ctrls[mix_index].put = tasdevice_program_put;
 	mix_index++;
 
-	scnprintf(conf_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-		"Speaker Config Id");
+	strscpy(conf_name, "Speaker Config Id", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
 	dsp_ctrls[mix_index].name = conf_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_configurations;
@@ -673,7 +671,7 @@ static const struct snd_soc_dai_ops tasdevice_dai_ops = {
 
 static struct snd_soc_dai_driver tasdevice_dai_driver[] = {
 	{
-		.name = "tas2781_codec",
+		.name = "tasdev_codec",
 		.id = 0,
 		.playback = {
 			.stream_name = "Playback",
-- 
2.34.1

