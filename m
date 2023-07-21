Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AB75CB7F
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289E483E;
	Fri, 21 Jul 2023 17:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289E483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952893;
	bh=qh0IObys/2VJujx6hZ0xOprDL7SzDk6V8zLd95E866k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FoQAAOQM0siR9kUZRWpmcL6fcflz8HdGGA76ICQUqtvCXBWOgdU2cla+KEBiJIuEl
	 wKvL8HOfRvq1DJye+phfNZxdlSFevG1kb2WC9X+1fv6F+RpJEdCEiHlQiIcVl5Th6K
	 RTuUmOvgorJes1AdtdxCVJ6/Cn6I8mk5eGbznSR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2DD6F805BE; Fri, 21 Jul 2023 17:19:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E0B8F805BE;
	Fri, 21 Jul 2023 17:19:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A27AF80579; Fri, 21 Jul 2023 17:18:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38157F80535
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38157F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bagMmyJj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwo011284;
	Fri, 21 Jul 2023 10:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=j37nKlnAnDmdNfGe63dPvdzAmcVymWBIePqBc5RtyJg=; b=
	bagMmyJje8RFK8jdOHL5xxSxlBSUqS3nYhNhZXKD0F7zaus68XfLkNfZcvIBCr+M
	u0xnAR5Aaz51OTeHftodNy1aAbdtWodYvrUZW6xU9Eg5X9nQkGYsp86FaOqWW5RZ
	8L2CrWdpP+FWgfU6Iox1YUOVHmQpVaLlkNVBPB34TclWYub7FLfnqKRSw2xRO4HE
	vUjW4LePI6N3tUo2BaJ23l1Q8axCT9e4GR4FZngZPvn+GBvJW6KJE+zfcn39Krbp
	6J6jDsk3nhXwGzfRur1l/2NKLce3bbqNnIX9E5wg57avy3t7l8Babp9IxfjSUI5D
	058Tm/Z9zxrGiJIDbdqjnQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:34 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:27 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3BA843572;
	Fri, 21 Jul 2023 15:18:27 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 07/11] ALSA: hda: hda_component: Add pre and post playback
 hooks to hda_component
Date: Fri, 21 Jul 2023 16:18:12 +0100
Message-ID: <20230721151816.2080453-8-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oPQdapLMK4Vngyeds10t5We7SIv8YL7k
X-Proofpoint-ORIG-GUID: oPQdapLMK4Vngyeds10t5We7SIv8YL7k
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: U4VH26B7NCL3PRSNA3LB2KU2E3Z7TMFY
X-Message-ID-Hash: U4VH26B7NCL3PRSNA3LB2KU2E3Z7TMFY
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4VH26B7NCL3PRSNA3LB2KU2E3Z7TMFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These hooks can be used to add callbacks that would be run before and after
the main playback hooks. These hooks would be called for all amps, before
moving on to the next hook, i.e. pre_playback_hook would be called for
all amps, before the playback_hook is called for all amps, then finally
the post_playback_hook is called for all amps.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.h |  2 ++
 sound/pci/hda/patch_realtek.c | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index 534e845b9cd1d..f170aec967c18 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -15,5 +15,7 @@ struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
 	struct hda_codec *codec;
+	void (*pre_playback_hook)(struct device *dev, int action);
 	void (*playback_hook)(struct device *dev, int action);
+	void (*post_playback_hook)(struct device *dev, int action);
 };
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 52ea7d757d6ad..a6585afb77071 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6716,9 +6716,17 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
 	int i;
 
 	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
-		if (spec->comps[i].dev)
+		if (spec->comps[i].dev && spec->comps[i].pre_playback_hook)
+			spec->comps[i].pre_playback_hook(spec->comps[i].dev, action);
+	}
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
+		if (spec->comps[i].dev && spec->comps[i].playback_hook)
 			spec->comps[i].playback_hook(spec->comps[i].dev, action);
 	}
+	for (i = 0; i < HDA_MAX_COMPONENTS; i++) {
+		if (spec->comps[i].dev && spec->comps[i].post_playback_hook)
+			spec->comps[i].post_playback_hook(spec->comps[i].dev, action);
+	}
 }
 
 struct cs35l41_dev_name {
-- 
2.34.1

