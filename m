Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64E67A668F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 16:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F3CBE72;
	Tue, 19 Sep 2023 16:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F3CBE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695133470;
	bh=nyfm0L9J1fsqjvtCWjXbNdNJSUQDtcw8ykzrjrNHJRI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0aKsm/3q2XLixF9SRn31JEJl1im5Ma4H20IHjwJQRu3u+arpYUPz4hWAMwztFExf
	 iR8nkQ6ZlEBHitSc338BPq9LNI2DWA+frQbOEdHgPdOWp6F1ZJqtPsR9TVZpVhAiKr
	 aaS0g5Yo/La/AfjJV/gzAV9f3EzBao6EPftJR7j0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 472B1F8057D; Tue, 19 Sep 2023 16:23:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF16F80578;
	Tue, 19 Sep 2023 16:23:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67373F80567; Tue, 19 Sep 2023 16:23:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B2BBF8025A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 16:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B2BBF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y/W5lFN6
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38JASjjG009787;
	Tue, 19 Sep 2023 09:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=PzgE18K4PqO8dXD62uIrqgRS5xHATb17ID0/Z6vMJHE=; b=
	Y/W5lFN6Ww362RIki5eyz9Pz5k2bLV7R0V9gTqDyFJlF0PFTKIMdw9YkxUoDXh0d
	FivnqVAWxHD4B0m+U0NgGNd3bgk3ny/QycoITMiY2cGRCrLYa92Wmb+eltr3G6uV
	m4jXX4EtTWv5NgX2dron0a6j+mODol793c4IKmtnn0vakpD6/Yvjm8JG51GjTFvV
	7qsp16q2ak7t5j3TsVNd22cM/5WQqNEfKQUpzOoG9t2jHCoCaq8gk7mkBWs5Kr5m
	9hryQaAaUgUJYef2tr/W5XlBiLs2kl9WZKaA8tsOzZVV2pqF0HqzqSLNXrSjgoVA
	fUsj2DtEv4H0tN+l8DXpJQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shu592-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 09:22:52 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 19 Sep
 2023 15:22:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 19 Sep 2023 15:22:50 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3017411AB;
	Tue, 19 Sep 2023 14:22:50 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v3 2/2] ALSA: hda: cs35l41: Add read-only ALSA control for
 forced mute
Date: Tue, 19 Sep 2023 15:22:40 +0100
Message-ID: <20230919142240.467682-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919142240.467682-1-sbinding@opensource.cirrus.com>
References: <20230919142240.467682-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HeOibzYEYfZoCoLcPl0rqONd95R7EBXo
X-Proofpoint-ORIG-GUID: HeOibzYEYfZoCoLcPl0rqONd95R7EBXo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: J5XDP7NHTNPXTPDGCCGVMXSM2NANK3TH
X-Message-ID-Hash: J5XDP7NHTNPXTPDGCCGVMXSM2NANK3TH
X-MailFrom: prvs=4626bb6a22=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5XDP7NHTNPXTPDGCCGVMXSM2NANK3TH/>
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
index 7b56bceea9e8..dd10b4cd3d1a 100644
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

