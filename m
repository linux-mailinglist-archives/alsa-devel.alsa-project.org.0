Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C19E78C720
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:16:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48544DF3;
	Tue, 29 Aug 2023 16:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48544DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318590;
	bh=wP/4aDIGlTZFXm1GvlTZYtz1Ue3yd2lDjEyGkbyzrQM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FFXkbQBh6d0UiuaEfYcKrWWa69DdbJrsvYI5OpOajWFxW0FFR2URDPupaELNdT6lA
	 SPjK9FfkHXDNPi2gO1coBouWNGR3EsOJwK2gHO4UUZ2n1BCVaVPyBtVMeDtBQ0tpaJ
	 kze9Ev9mUd5A8kWJKdf9pqqm6oBiZ793Lwa+zcdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E4CEF805B1; Tue, 29 Aug 2023 16:14:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D912FF805B2;
	Tue, 29 Aug 2023 16:14:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BC82F80249; Mon, 28 Aug 2023 19:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94227F80236
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94227F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AWdihRtS
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37SF2s70001339;
	Mon, 28 Aug 2023 12:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=p0uDxHTVZhy1LKhRC/uxf/uY5G2QFgt5d7SS4phu6gM=; b=
	AWdihRtSOJx8P6AhdZJNhpTWKE/U82hXnQy+uTqIcOmeKRvfcyCKnxXJIG8npV5X
	mX1V9Pbdg4BZMXDaXStjWm71IhXLdTztywAQg3aWZe8llwXBNbYmkzQHfEPqFYIS
	ZhCrkxSxMiV8AOy2TnXaKKBLqsXA37WWouUvAmrDoqycowy9SpTvnTZkEmt2E7WB
	KyCk4ueRfQSx6Wh2MV9wQCed///EczRkp1m3StfEMJ+QYsZtyNuhtPwqy1XGSf5x
	KpoWTm+0pqMBIoKZ04j+fPersA97LHzBr4R8dbizooLWCthicD1nKdVJ595iK3+n
	wuCBlilA3U+M2TPPIXN4RA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyae6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 12:05:45 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 18:05:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 28 Aug 2023 18:05:43 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4A17011D4;
	Mon, 28 Aug 2023 17:05:41 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <RicardoRivera-Matosricardo.rivera-matos@cirrus.com>,
        Vlad Karpovich
	<vkarpovi@opensource.cirrus.com>
Subject: [PATCH 2/7] ASoC: cs35l45: Fix "Dead assigment" warning
Date: Mon, 28 Aug 2023 12:05:20 -0500
Message-ID: <20230828170525.335671-2-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mYSFR0Zpbqd4aySKef392mOgtTgWBlTh
X-Proofpoint-GUID: mYSFR0Zpbqd4aySKef392mOgtTgWBlTh
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4604b61042=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FE6HMIPVRQVFZZSILOME7WQUEZM6RRZY
X-Message-ID-Hash: FE6HMIPVRQVFZZSILOME7WQUEZM6RRZY
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FE6HMIPVRQVFZZSILOME7WQUEZM6RRZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Value stored to 'ret' is never read. Remove it.

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 7f116ae97acd..40fb64904260 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -969,7 +969,7 @@ static irqreturn_t cs35l45_dsp_virt2_mbox_cb(int irq, void *data)
 
 	ret = regmap_read(cs35l45->regmap, CS35L45_DSP_VIRT2_MBOX_3, &mbox_val);
 	if (!ret && mbox_val)
-		ret = cs35l45_dsp_virt2_mbox3_irq_handle(cs35l45, mbox_val & CS35L45_MBOX3_CMD_MASK,
+		cs35l45_dsp_virt2_mbox3_irq_handle(cs35l45, mbox_val & CS35L45_MBOX3_CMD_MASK,
 				(mbox_val & CS35L45_MBOX3_DATA_MASK) >> CS35L45_MBOX3_DATA_SHIFT);
 
 	/* Handle DSP trace log IRQ */
-- 
2.25.1

