Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8C83A7DE
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 12:31:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5C3C3E7;
	Wed, 24 Jan 2024 12:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5C3C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706095875;
	bh=ACl9OKKd1hYaYZUvRjBxjN1AVItWVDBQD0aFVxnQE4c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dLVsc8tm2GqF+nDwmsbnaJS97KxFqZkQlLXaJkDUP805V76pTSjoB0yLPU4DAi9Z3
	 qK/kuR54cqNHMQggkIqASqOzDtyVnm4Xek7GpU9mojMUksLNvrt/K1vRdELHZkfWw6
	 S7HsZq4+c/7eE7+4d8em9yHCcxeHatjEuwkedEfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B05F804E7; Wed, 24 Jan 2024 12:30:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1975FF8057D;
	Wed, 24 Jan 2024 12:30:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C0EF8028D; Wed, 24 Jan 2024 12:26:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C303F80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 12:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C303F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hd6Zaf9Q
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O4banO023994;
	Wed, 24 Jan 2024 05:26:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=NfaVHqV3QAdzaoZI36J4vl2G+SdDrbS5YrJZHom/gWc=; b=
	hd6Zaf9QMrjctYsmnS5RyviUHipbJk3jjMHsPQgDlPRjVoWMj147Uv6dHLyFrdmb
	rGHFaLrvY2Uurp4pO8vVVDximWqWUIaFzcJlWraHaIv4B3fIJ0Ob1RFGH/LM8mOu
	aKvVDeIRuxLRq0ryXPanFik9q3H8NWl30zeSf4KBIehjGV4s18CRU5oLtfBxuar5
	rio5ZF3H6d+Z8kANrW0FtAL16m/n4fyvQPuJ1MWbmLoLRCygtjXMUpKD/yTmIwMU
	wz/O2IsxrZSak4415c3aaPDPG+8vMDS01PPHFYd016cY5z555hk5IKzZAoJ4OBX5
	2Szd54ABF4i7nvroaTGqkg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9rq8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 05:26:09 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 11:26:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 11:26:07 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.251.117])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8FE75820247;
	Wed, 24 Jan 2024 11:26:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <soyer@irl.hu>, <shenghao-ding@ti.com>
CC: <perex@perex.cz>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 1/2] ALSA: hda: realtek: Re-work CS35L41 fixups to re-use for
 other amps
Date: Wed, 24 Jan 2024 11:26:06 +0000
Message-ID: <20240124112607.77614-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124112607.77614-1-rf@opensource.cirrus.com>
References: <20240124112607.77614-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E17i4__LtRZQrKC626O6dj176eIYz-5j
X-Proofpoint-ORIG-GUID: E17i4__LtRZQrKC626O6dj176eIYz-5j
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CRZDJ3C7OMVSAVOKXHD2JEUQHKYMUWKY
X-Message-ID-Hash: CRZDJ3C7OMVSAVOKXHD2JEUQHKYMUWKY
X-MailFrom: prvs=875330d341=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRZDJ3C7OMVSAVOKXHD2JEUQHKYMUWKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Slightly re-work the code around cs35l41_generic_fixup() and the component
binding search so that it can be re-used for other amps that use the
component binding mechanism.

The match string is stored in struct scodec_dev_name instead of hardcoding
it in the match function.

The tas2781 does not use the amp index as part of the driver name match.
But its match format string does not include a field for the index, so
snprintf() would safely ignore the p->index argument. Because of this there
is no need for a special match function for this case, the CS35L41 code
can be re-used.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Can someone test that this doesn't break the two TAS2781 fixups?
---
 sound/pci/hda/patch_realtek.c | 83 +++++++----------------------------
 1 file changed, 15 insertions(+), 68 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 19f2eb26659d..2e2906d2dd1c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6841,11 +6841,12 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
 struct scodec_dev_name {
 	const char *bus;
 	const char *hid;
+	const char *match_str;
 	int index;
 };
 
 /* match the device name in a slightly relaxed manner */
-static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
+static int comp_match_dev_name(struct device *dev, void *data)
 {
 	struct scodec_dev_name *p = data;
 	const char *d = dev_name(dev);
@@ -6859,32 +6860,12 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
 	if (isdigit(d[n]))
 		n++;
 	/* the rest must be exact matching */
-	snprintf(tmp, sizeof(tmp), "-%s:00-cs35l41-hda.%d", p->hid, p->index);
+	snprintf(tmp, sizeof(tmp), p->match_str, p->hid, p->index);
 	return !strcmp(d + n, tmp);
 }
 
-static int comp_match_tas2781_dev_name(struct device *dev,
-	void *data)
-{
-	struct scodec_dev_name *p = data;
-	const char *d = dev_name(dev);
-	int n = strlen(p->bus);
-	char tmp[32];
-
-	/* check the bus name */
-	if (strncmp(d, p->bus, n))
-		return 0;
-	/* skip the bus number */
-	if (isdigit(d[n]))
-		n++;
-	/* the rest must be exact matching */
-	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
-
-	return !strcmp(d + n, tmp);
-}
-
-static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
-				  const char *hid, int count)
+static void comp_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
+			       const char *hid, const char *match_str, int count)
 {
 	struct device *dev = hda_codec_dev(cdc);
 	struct alc_spec *spec = cdc->spec;
@@ -6899,10 +6880,11 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 				return;
 			rec->bus = bus;
 			rec->hid = hid;
+			rec->match_str = match_str;
 			rec->index = i;
 			spec->comps[i].codec = cdc;
 			component_match_add(dev, &spec->match,
-					    comp_match_cs35l41_dev_name, rec);
+					    comp_match_dev_name, rec);
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
@@ -6916,83 +6898,48 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 	}
 }
 
-static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
-	const char *bus, const char *hid)
-{
-	struct device *dev = hda_codec_dev(cdc);
-	struct alc_spec *spec = cdc->spec;
-	struct scodec_dev_name *rec;
-	int ret;
-
-	switch (action) {
-	case HDA_FIXUP_ACT_PRE_PROBE:
-		rec = devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
-		if (!rec)
-			return;
-		rec->bus = bus;
-		rec->hid = hid;
-		rec->index = 0;
-		spec->comps[0].codec = cdc;
-		component_match_add(dev, &spec->match,
-			comp_match_tas2781_dev_name, rec);
-		ret = component_master_add_with_match(dev, &comp_master_ops,
-			spec->match);
-		if (ret)
-			codec_err(cdc,
-				"Fail to register component aggregator %d\n",
-				ret);
-		else
-			spec->gen.pcm_playback_hook =
-				comp_generic_playback_hook;
-		break;
-	case HDA_FIXUP_ACT_FREE:
-		component_master_del(dev, &comp_master_ops);
-		break;
-	}
-}
-
 static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
-	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 2);
+	comp_generic_fixup(cdc, action, "i2c", "CSC3551", "-%s:00-cs35l41-hda.%d", 2);
 }
 
 static void cs35l41_fixup_i2c_four(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
-	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 4);
+	comp_generic_fixup(cdc, action, "i2c", "CSC3551", "-%s:00-cs35l41-hda.%d", 4);
 }
 
 static void cs35l41_fixup_spi_two(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
-	cs35l41_generic_fixup(codec, action, "spi", "CSC3551", 2);
+	comp_generic_fixup(codec, action, "spi", "CSC3551", "-%s:00-cs35l41-hda.%d", 2);
 }
 
 static void cs35l41_fixup_spi_four(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
-	cs35l41_generic_fixup(codec, action, "spi", "CSC3551", 4);
+	comp_generic_fixup(codec, action, "spi", "CSC3551", "-%s:00-cs35l41-hda.%d", 4);
 }
 
 static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const struct hda_fixup *fix,
 						 int action)
 {
-	cs35l41_generic_fixup(cdc, action, "i2c", "CLSA0100", 2);
+	comp_generic_fixup(cdc, action, "i2c", "CLSA0100", "-%s:00-cs35l41-hda.%d", 2);
 }
 
 static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const struct hda_fixup *fix,
 						 int action)
 {
-	cs35l41_generic_fixup(cdc, action, "i2c", "CLSA0101", 2);
+	comp_generic_fixup(cdc, action, "i2c", "CLSA0101", "-%s:00-cs35l41-hda.%d", 2);
 }
 
 static void tas2781_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
-	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
+	comp_generic_fixup(cdc, action, "i2c", "TIAS2781", "-%s:00", 1);
 }
 
 static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
-	 tas2781_generic_fixup(cdc, action, "i2c", "INT8866");
+	comp_generic_fixup(cdc, action, "i2c", "INT8866", "-%s:00", 1);
 }
 
 /* for alc295_fixup_hp_top_speakers */
-- 
2.30.2

