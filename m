Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9092D84719F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 15:07:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F98850;
	Fri,  2 Feb 2024 15:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F98850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706882872;
	bh=W5b62LBeS6dp8nBRjHKDhK31OtQSA4Ni7+K5BXOBGk8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PZ6zQfmv88v1Yl1nZeKeCh6YjFepLmsSLq2Qu0dBmKN5O3YhXUxseGMqwD5lc4rgG
	 yrPpp4L3sI8w+nguT12gr8/WLn2vfglv2FCUd1gLYH9/bmQU1nm/qqi53PvCnRCyGu
	 y3gTQhvVMA7jB3CPoZEHGsY1eC/2TGwSdiru+6So=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BB9F805EC; Fri,  2 Feb 2024 15:06:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14842F805E5;
	Fri,  2 Feb 2024 15:06:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6953BF8055B; Fri,  2 Feb 2024 15:06:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B6A0F8055C
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 15:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B6A0F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lLbNJiwu
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412D1imv023527;
	Fri, 2 Feb 2024 08:06:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=1Fa3BBmlAMFYHyVzM+CIenECxuM4F2GKfdbvgrjNKUM=; b=
	lLbNJiwu8QW8ty8bOAypiymzaFztkxmFG8FY5CJmpR0fyl/WDcfxnBYk1RXt5zGN
	uXPKYSRBBHGO+zNMAMW3zFs4lgvsgfhVbMUe7w+z7yOv8tJIQ1PfqusuMNMj/9aZ
	cQI5HhLVUEl0tIc4Tdg7YYHDyuRPka3WJxavgxW0oLWOsoREMyQUF8BvSiw3+tRo
	H9LPbZKT3Mji1jo//WV6WFgAS5Jj1bg49wFYB8BxXPk9EORpJkCKWEWmR6E+NUyw
	g+ctui2JTIxiALT7+UG2iV/KiDxF2PYrjX5ME5Tdu01Dt427KXL/tAjl0ya41KVd
	pwW+sHo+k5G9CI4cQ/tTDw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgjvy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 08:06:23 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 14:06:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 14:06:19 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9F414820248;
	Fri,  2 Feb 2024 14:06:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: cs42l43: Sync the hp ilimit works when removing the
 component
Date: Fri, 2 Feb 2024 14:06:18 +0000
Message-ID: <20240202140619.1068560-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
References: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: k-nrnSHwJQ7w3l5vCzelP5fDuYAm5xyg
X-Proofpoint-GUID: k-nrnSHwJQ7w3l5vCzelP5fDuYAm5xyg
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XBJPUJFURRIZXHAQQNL2NGCHGM4XBGPM
X-Message-ID-Hash: XBJPUJFURRIZXHAQQNL2NGCHGM4XBGPM
X-MailFrom: prvs=9762917273=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBJPUJFURRIZXHAQQNL2NGCHGM4XBGPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Synchronise the headphone ilimit work functions when removing the
component. These can only trigger whilst the headphone is enabled which
shouldn't be possible once the component is removed but the works rely
on the stashed component pointer so they should be shut down before the
code moves on from component remove.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 9e1deb3242cb..c84d5952cdb5 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2115,6 +2115,9 @@ static void cs42l43_component_remove(struct snd_soc_component *component)
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
+	cancel_work_sync(&priv->hp_ilimit_work);
+	cancel_delayed_work_sync(&priv->hp_ilimit_clear_work);
+
 	priv->component = NULL;
 }
 
-- 
2.30.2

