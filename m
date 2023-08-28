Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E578C718
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A59827;
	Tue, 29 Aug 2023 16:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A59827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318538;
	bh=9VAF3+1261gN9MM0SOp8Lnoh/Y71IVn9ZdHX5US5P20=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YrLbHOffLcJaYLH63Dj01BngQBtN/+pYrK4arIofvgBX1m4bSnw/WuXFhMci+8era
	 /lAFMYlRmfFlWOWDd9EfvScxomrRZRjSIngA4Jjt3E2HOVkRQOZW6InmLXaEzTWFPb
	 MHIzQAsY9EXpJ7JkWeWxvN5Cq9IC3GH7DztLkNcE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43DF0F80549; Tue, 29 Aug 2023 16:13:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F900F800F5;
	Tue, 29 Aug 2023 16:13:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B244F80249; Mon, 28 Aug 2023 19:05:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBE51F80155
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 19:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE51F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o7lFohVX
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37SF3RKM001527;
	Mon, 28 Aug 2023 12:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=1K7XdmDHh0xz7TpE3lzKGlocX1TExBJDy839St96yLs=; b=
	o7lFohVXlz0GE1Ki4Gv+yoxFTtnm884TBuIvGrOxnUmfWtMbD4+Fv3nd2MrJNCUP
	RsWzejBaK8VyGT77JlcIBwUkBxLDV+3VWkhYZOU1Dsz28/7xyVSvS9TpeawfJube
	nJTcEc28DqfSH5HC2Jt45Sy5Mz8/JOtsxTveeyb1NrjGtCeW5ou15vD6xzQJq6aV
	68Z89Ems/hJ0wfuzdUGjOq1+VhcN71wSQP3tzpMuiFaqiNpfkfOyaVoHlD9mkKeY
	kq6FF4mbJTPOBhjWnXAy3aw3dGuaHKDJ3TmZpB0NZ+1pXapfnvZWoM8OBKyic1QQ
	muK4QD3k4Db+9iODWbcRgw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyae6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 12:05:47 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 18:05:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 28 Aug 2023 18:05:45 +0100
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9803711D4;
	Mon, 28 Aug 2023 17:05:43 +0000 (UTC)
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
	<vkarpovi@opensource.cirrus.com>,
        Ricardo Rivera-Matos
	<rriveram@opensource.cirrus.com>
Subject: [PATCH 3/7] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Date: Mon, 28 Aug 2023 12:05:21 -0500
Message-ID: <20230828170525.335671-3-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wsLEp0sPU1UosyUbVW3CauHt1Ldlwl7o
X-Proofpoint-GUID: wsLEp0sPU1UosyUbVW3CauHt1Ldlwl7o
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4604b61042=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZQ6N23KKLSX4GPALG6WNL3WI43EP6DGJ
X-Message-ID-Hash: ZQ6N23KKLSX4GPALG6WNL3WI43EP6DGJ
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:13:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQ6N23KKLSX4GPALG6WNL3WI43EP6DGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Checks the index computed by the virq offset before printing the
error condition in cs35l45_spk_safe_err() handler.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 40fb64904260..2c9b41171a05 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1023,7 +1023,10 @@ static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
 
 	i = irq - regmap_irq_get_virq(cs35l45->irq_data, 0);
 
-	dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
+	if (i < 0 || i > 6)
+		dev_err(cs35l45->dev, "Unspecified global error condition (%d) detected!\n", irq);
+	else
+		dev_err(cs35l45->dev, "%s condition detected!\n", cs35l45_irqs[i].name);
 
 	return IRQ_HANDLED;
 }
-- 
2.25.1

