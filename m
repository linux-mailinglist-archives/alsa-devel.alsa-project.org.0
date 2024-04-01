Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C68939F6
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D23FA21B3;
	Mon,  1 Apr 2024 12:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D23FA21B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711965827;
	bh=s/N/0MGnnbaI2ruainzBFAMTg5WL9GCIxZMR9Vo5V2w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A3mfEcQaNjtAraq0NZvgm8UnKWNfknJlPeajNAAdoVh5whE4LYA5cuKWCl3rQ3B9c
	 G62FmnJvLrHLOGnTyGxtNJqHK2pIOwZn1batiuoVNoXDptgSLr5EonZnLjEX3hMTAJ
	 XAlxm2mZYLPt2CyknMI6EKganV6zqhdwoqzYzPmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F2F1F805FB; Mon,  1 Apr 2024 12:02:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB40F8060F;
	Mon,  1 Apr 2024 12:02:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B92DF8059F; Mon,  1 Apr 2024 12:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD132F80236
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD132F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Wb4xgyCn
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4319jd4e020490;
	Mon, 1 Apr 2024 05:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=QyfgH0d6kp4gRp6HlUFJbwfDEHAE87v+bFNRFgBAiMM=; b=
	Wb4xgyCnUQoxMSFoyqerBRoCGWcUAVRNlkSkUbIBp/nqlfKbfgIUjqHjgHLr3jMo
	1Ry+UUmW2VPGvE4cwmLNzeYj8/XpnpJhz8Yc8KPJUkQbi9y6wHIngwWJiEm8P321
	a63OgI//UR42usNwrsbKR3Nujl2rur9hgEiPLx1JtRygmHGv5xYNmWI7QwfQdjER
	u4pToHG9w/E3hYG6bzMgw8+IrDvPHgzxa014Upm0zqI2Pb6BU/BMpqITHNRSjjE8
	LIzQ+wWyMHJX6upZpJ8uJOncKMHlmSJmtAiEfhRRdhdoKdHwYuDjatq/zJEQREjj
	OGohMwe8BWoz09wUc+uW2g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x6g4xhtw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 05:02:12 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Apr 2024
 11:02:10 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Mon, 1 Apr 2024 11:02:10 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3FD0A820270;
	Mon,  1 Apr 2024 10:02:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 2/3] ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of
 open-coding
Date: Mon, 1 Apr 2024 10:02:09 +0000
Message-ID: <20240401100210.61277-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240401100210.61277-1-rf@opensource.cirrus.com>
References: <20240401100210.61277-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ts69AvBdsGy9ubWHypuuhOhtbMX5BcX-
X-Proofpoint-GUID: Ts69AvBdsGy9ubWHypuuhOhtbMX5BcX-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6Z3V6UCBGTEFPL2PKSW67NF5CCL5XFER
X-Message-ID-Hash: 6Z3V6UCBGTEFPL2PKSW67NF5CCL5XFER
X-MailFrom: prvs=1821bd3749=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Z3V6UCBGTEFPL2PKSW67NF5CCL5XFER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the snd_ctl_find_id_mixer[_locked]() wrapper in
snd_soc_card_get_kcontrol[_locked]() instead of open-coding a custom
list walk of the card controls list.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/soc-card.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 8a2f163da6bc..0a3104d4ad23 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -32,33 +32,20 @@ static inline int _soc_card_ret(struct snd_soc_card *card,
 struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
 						      const char *name)
 {
-	struct snd_card *card = soc_card->snd_card;
-	struct snd_kcontrol *kctl;
-
-	/* must be held read or write */
-	lockdep_assert_held(&card->controls_rwsem);
-
 	if (unlikely(!name))
 		return NULL;
 
-	list_for_each_entry(kctl, &card->controls, list)
-		if (!strncmp(kctl->id.name, name, sizeof(kctl->id.name)))
-			return kctl;
-	return NULL;
+	return snd_ctl_find_id_mixer_locked(soc_card->snd_card, name);
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol_locked);
 
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
-	struct snd_card *card = soc_card->snd_card;
-	struct snd_kcontrol *kctl;
+	if (unlikely(!name))
+		return NULL;
 
-	down_read(&card->controls_rwsem);
-	kctl = snd_soc_card_get_kcontrol_locked(soc_card, name);
-	up_read(&card->controls_rwsem);
-
-	return kctl;
+	return snd_ctl_find_id_mixer(soc_card->snd_card, name);
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol);
 
-- 
2.39.2

