Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3223837098
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1890320E;
	Mon, 22 Jan 2024 19:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1890320E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705949290;
	bh=yNWjQEhqiBhpcGomz7GYxV+WTENan9gghULSm32sqlE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aszORo8BvzcWCem8GjkYIIgOHUXTdaBZO+mWRfgiLq6JzfxWz8XXveOYtgfvpdkKX
	 LWRJEIH4laaJf6bVxnF98lwNNk+84XVi5UlPtBhkEwdPl4z+sulLJOzqW6K+WIT9jh
	 P1S9hugwBNO8aXwZ6WBEXZYmcpB7BJO5lBesU184=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E110F8057E; Mon, 22 Jan 2024 19:47:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C18F4F8057E;
	Mon, 22 Jan 2024 19:47:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D38BF8025F; Mon, 22 Jan 2024 19:47:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 00DA0F800C1
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:47:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00DA0F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Dj7LG9kF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40MFaTcN005855;
	Mon, 22 Jan 2024 12:47:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=V
	kiWtsyAhD5poWwiOG59Zhs6f5A5ZaAm657wTjx1lyY=; b=Dj7LG9kFrgE9po+vw
	9jiUUGn0N8RqeeGE+G5kEJgz6n1Qb+rntAtHIV8rx4d09VLEKhrZT3VtoDwlTZUD
	4F4tWgU217WiR1KB4Zypy0napLxBrFIGWgYqojMautgj2CuPzuX5VxCx/zcAvPWZ
	phe7LFMGwpHsgqzQrWE9vWe0HmEJWG/xVlVYSinBA2r+iv6I4UDk9ufG7aFy3utO
	81yU9ObqBwpI8W8dexTIlBOFGNIKtvSX0CCC5ci/Y0ZZ6pdrxf4Xr6rITSE6oMRV
	JsgVaiSWR2urae8GeClhB46L+/sVz0r/RgyHHVOi2WGs2N4UT+gCmTORy1FPhpIb
	NZPZg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vrcf32xaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 12:47:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 18:47:19 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 22 Jan 2024 18:47:19 +0000
Received: from lon-bigdaddy.ad.cirrus.com (unknown [198.61.65.241])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6BFA611D3;
	Mon, 22 Jan 2024 18:47:19 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/cs8409: Suppress vmaster control for Dolphin models
Date: Mon, 22 Jan 2024 18:47:10 +0000
Message-ID: <20240122184710.5802-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: i3yZTsMWsKwhp3pCo0bEw_gT9KKii5ID
X-Proofpoint-GUID: i3yZTsMWsKwhp3pCo0bEw_gT9KKii5ID
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IZ6NGJ5XIWMP44A2ASGOJT27ZQGT6QOD
X-Message-ID-Hash: IZ6NGJ5XIWMP44A2ASGOJT27ZQGT6QOD
X-MailFrom: prvs=8751ec8795=vitalyr@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZ6NGJ5XIWMP44A2ASGOJT27ZQGT6QOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Customer has reported an issue with specific desktop platform
where two CS42L42 codecs are connected to CS8409 HDA bridge.
If "Master Volume Control" is created then on Ubuntu OS UCM
left/right balance slider in UI audio settings has no effect.
This patch will fix this issue for a target paltform.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 627899959ffe..e41316e2e983 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -1371,6 +1371,7 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		spec->scodecs[CS8409_CODEC1] = &dolphin_cs42l42_1;
 		spec->scodecs[CS8409_CODEC1]->codec = codec;
 		spec->num_scodecs = 2;
+		spec->gen.suppress_vmaster = 1;
 
 		codec->patch_ops = cs8409_dolphin_patch_ops;
 
-- 
2.40.1

