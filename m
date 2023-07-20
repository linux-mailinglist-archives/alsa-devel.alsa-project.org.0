Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB075B02D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99398843;
	Thu, 20 Jul 2023 15:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99398843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689860182;
	bh=jWkuXWMLw+RaQjql2zwrsdDhUhNod9b/x/Ew/6Km3ro=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mEIuOlhb0frjJmyoPL6/34HzcoJSJprO3OaPqJs15SXtNE5J1ih+EYPqvBFt9Tp+E
	 zz4Ok2YCnqOKSZIeFKIGgiwW2MOVJRKGiaNtPZnZTVj+gYXx273+vsgjj6hgBepn0L
	 1LN8uicqbhdeEx4fdT/eS0DdwD/sqU/p+r62WMvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23290F80578; Thu, 20 Jul 2023 15:33:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9325F8055B;
	Thu, 20 Jul 2023 15:33:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ADD1F8047D; Thu, 20 Jul 2023 15:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0316F804DA
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0316F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=L5RPClh3
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36K6Acqc016432;
	Thu, 20 Jul 2023 08:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=m5DeZEEz3jTkGzJxONdedtCu4Ycd4osYT9FUHogrdRw=; b=
	L5RPClh3va/cVVEpEQHB8xeYk5qjogPNW2zTbnasC039m+oZ1Va7iayS27CjvpSe
	FubZ7OJWwA+UY0dA9V0SoNihIlTHGLTnNGAEw6xIwpY2z5qpO2pPBd98wH/+cBjd
	xBCrYQg7yvQwp1hlnPfvc4PbGjEcc5Db8w/ASQIwHEOycs4mvOMlwlMILLkwNagy
	z2KUga6yAv7DO+lh0FccAXisXm1IaW3hNfT40Qj9BGu4vkUvtr8PYoimVfiWRDV9
	WFHhO2FrZP/QI8RU5ekT3nFQrVugskCt8QLXFPJ7bwiZuraeX0WgsUDIcI26qsHF
	ZGE9c0pgtckBUTOktkN6jQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gx5mr-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:32:12 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 14:32:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 20 Jul 2023 14:32:11 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6F2F5475;
	Thu, 20 Jul 2023 13:32:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 09/11] ALSA: hda/realtek: Support pre-/post- playback hooks
 for cs35l41
Date: Thu, 20 Jul 2023 14:31:45 +0100
Message-ID: <20230720133147.1294337-10-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZDUwygU2_yM0CQX7uNIKvHJnlAUeJ-EG
X-Proofpoint-GUID: ZDUwygU2_yM0CQX7uNIKvHJnlAUeJ-EG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WQAMJ73OKJETLUOZICNN5I4O7MD6T6FD
X-Message-ID-Hash: WQAMJ73OKJETLUOZICNN5I4O7MD6T6FD
X-MailFrom: prvs=25651755c6=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQAMJ73OKJETLUOZICNN5I4O7MD6T6FD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

hda_component now supports pre and post playback hooks.
These should be called for each amp in a loop before moving on
to the next hook.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ac29965951833..4aa49d37ed9e6 100644
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

