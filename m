Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F087A95B3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:30:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 457A4A4E;
	Thu, 21 Sep 2023 18:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 457A4A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313809;
	bh=3uOxBRr1RvY5owLaGEq/jb6XVeFgpAo/dpt/BLEPdcY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SdsJqgro1a40azifF8VMl92nHoUEYHE4R65/ejWzBLkGF1xMrYM2OkeFsxtxPADBC
	 h0d/3YDk/Tr7JB/liGk+VcVL/CN4HNjkFZNlw8OGMiWocT6190+dq5oOBbB4KpiJZq
	 /hW4dsYMfmibOWM7fHUzAEarBvP/DCoWidk0vGak=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92FBBF80558; Thu, 21 Sep 2023 18:29:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7AD7F80494;
	Thu, 21 Sep 2023 18:29:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4291FF80551; Thu, 21 Sep 2023 18:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04B92F8025A
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04B92F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=jIQsgshe
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38LFWYi7009262;
	Thu, 21 Sep 2023 11:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=MaHpdygZ/aP2aJTDzDqitZm8Hr1umO0xthwnGH/UKh4=; b=
	jIQsgshesJgCUN1YdVO9UDEmyAgX6B0saJnL2OWOc5xcJE2W39kdzaOlfCWKpjjB
	g+FuAYB1UmLS61WTskl4QI1qLWobVqNVK4dVrYtH4GHOgTC1qNUVh1j8Qh7Tn99u
	W1amWyokDGPWCRJmJBk3xtkPFhJefw6bgerFCBwKCggOCY6/EjUlcMSci7kFAXaz
	CTRB1uQkK8kcFwKNdYbq9hQXKqOvkN5wc1ldjwxZlZAhoHnHxyfzNwyVD0nmQCtb
	rTvSRmIlFOTIE0wqalGNsha4C+XvvJNNJTwNooFmrexDfPWzwWqbkzm4yuEBCzKG
	8kiXjALUE15RB837TcA9+g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shx0ab-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 11:29:00 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 21 Sep
 2023 17:28:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 21 Sep 2023 17:28:57 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AEE8615B9;
	Thu, 21 Sep 2023 16:28:57 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v5 4/4] ALSA: hda: cs35l41: Add read-only ALSA control for
 forced mute
Date: Thu, 21 Sep 2023 17:28:49 +0100
Message-ID: <20230921162849.1988124-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921162849.1988124-1-sbinding@opensource.cirrus.com>
References: <20230921162849.1988124-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: apFXas9Py_YWxUMrItTTFvVR4_hQlcD8
X-Proofpoint-ORIG-GUID: apFXas9Py_YWxUMrItTTFvVR4_hQlcD8
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: L6WS4TMDMDEOG4SS7YVKXFCSWSPY6DT7
X-Message-ID-Hash: L6WS4TMDMDEOG4SS7YVKXFCSWSPY6DT7
X-MailFrom: prvs=462875a41c=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6WS4TMDMDEOG4SS7YVKXFCSWSPY6DT7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When the CS35L41 amp is requested to mute using the ACPI
notification mechanism, userspace is not notified that the amp
is muted. To allow userspace to know about the mute, add an
ALSA control which tracks the forced mute override.
This control does not track the overall mute state of the amp,
since the amp is only unmuted during playback anyway, instead
it tracks the mute override request from the ACPI notification.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 18ca00c0a8cd..92b815ce193b 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -972,6 +972,15 @@ static int cs35l41_fw_load_ctl_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int cs35l41_mute_override_ctl_get(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
+
+	ucontrol->value.integer.value[0] = cs35l41->mute_override;
+	return 0;
+}
+
 static void cs35l41_fw_load_work(struct work_struct *work)
 {
 	struct cs35l41_hda *cs35l41 = container_of(work, struct cs35l41_hda, fw_load_work);
@@ -1055,6 +1064,7 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 {
 	char fw_type_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	char fw_load_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	char mute_override_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	struct snd_kcontrol_new fw_type_ctl = {
 		.name = fw_type_ctl_name,
 		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
@@ -1069,12 +1079,21 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 		.get = cs35l41_fw_load_ctl_get,
 		.put = cs35l41_fw_load_ctl_put,
 	};
+	struct snd_kcontrol_new mute_override_ctl = {
+		.name = mute_override_ctl_name,
+		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
+		.info = snd_ctl_boolean_mono_info,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.get = cs35l41_mute_override_ctl_get,
+	};
 	int ret;
 
 	scnprintf(fw_type_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s DSP1 Firmware Type",
 		  cs35l41->amp_name);
 	scnprintf(fw_load_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s DSP1 Firmware Load",
 		  cs35l41->amp_name);
+	scnprintf(mute_override_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s Forced Mute Status",
+		  cs35l41->amp_name);
 
 	ret = snd_ctl_add(cs35l41->codec->card, snd_ctl_new1(&fw_type_ctl, cs35l41));
 	if (ret) {
@@ -1092,6 +1111,15 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 
 	dev_dbg(cs35l41->dev, "Added Control %s\n", fw_load_ctl.name);
 
+	ret = snd_ctl_add(cs35l41->codec->card, snd_ctl_new1(&mute_override_ctl, cs35l41));
+	if (ret) {
+		dev_err(cs35l41->dev, "Failed to add KControl %s = %d\n", mute_override_ctl.name,
+			ret);
+		return ret;
+	}
+
+	dev_dbg(cs35l41->dev, "Added Control %s\n", mute_override_ctl.name);
+
 	return 0;
 }
 
-- 
2.34.1

