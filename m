Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D280747F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 17:04:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F4024DED;
	Wed,  6 Dec 2023 17:04:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F4024DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701878679;
	bh=2XWukHCkV+U+w06AzXyV2DMLGv1kx3kqGbtNecu1mLk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B8vej4PLO6xft9qZP6iL2Sjq++WS4XgnyIQ1oj6u1hpvsYTu4/M+ALsa8qpIOt+6V
	 AbmFk35EapPDtgYoTPu4v5DHgGTOZZlPJydFpNV2J7wzdnvVuPW0T1dO+PGXfQZ3Jb
	 z16AuQO3mO4I8eNcBbxzewI5EQ0ULuZ6RXfk6dCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EC43F805EF; Wed,  6 Dec 2023 17:03:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8550F805BA;
	Wed,  6 Dec 2023 17:03:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2790AF8025A; Wed,  6 Dec 2023 17:03:45 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 11D3DF800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 17:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11D3DF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ik98qTrs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B6AvD2j025625;
	Wed, 6 Dec 2023 10:03:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=0fxSxG4+teDLsjntgKgN17KmimgUY2wX58MvQrY/vYo=; b=
	Ik98qTrsUihTasSXfYMET94Gk9cJqUSlwX2h1QIqWQg8kOTixbCOaymTUAh+h6vQ
	zPMc2tKfD4ZbFoVsMuikq00fMI8rXZ0RAie4z6hmj0bwCOzc4ZBNTq+DKLtjiSaq
	l9GdfpsnAj4uEkqSJYg3h7oiwDKk2OCs5c3cVlbvbR4riSx/7E0fzgnzuo/hxgNS
	iFJUP7Of5q8TB6YpJ4A7uuoMuGcgL84qUVkyaon8g1PZykYGsBTzMIgnUIS/1zyt
	ouokjDteX6/dYpGqEfdKLVz1/4DHzkN85KwlfwEcyC7rPraFWMjOi2Ld1/U6XIEz
	x+ITm72gJ1Iaxb7M6kluwA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47rww7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 10:03:26 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 16:03:24 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Wed, 6 Dec 2023 16:03:24 +0000
Received: from ricardo-lws.crystal.cirrus.com (ricardo-lws.ad.cirrus.com
 [141.131.145.40])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 009B611AB;
	Wed,  6 Dec 2023 16:03:22 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: cs35l45: Prevent IRQ handling when
 suspending/resuming
Date: Wed, 6 Dec 2023 10:03:17 -0600
Message-ID: <20231206160318.1255034-3-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206160318.1255034-1-rriveram@opensource.cirrus.com>
References: <20231206160318.1255034-1-rriveram@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NbkZp4JFc9ISGo9U6WJCQgj5DOK-Ke2B
X-Proofpoint-ORIG-GUID: NbkZp4JFc9ISGo9U6WJCQgj5DOK-Ke2B
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6MM4FIY5DQFD24XDT2RQYINOWBVKJR4Q
X-Message-ID-Hash: 6MM4FIY5DQFD24XDT2RQYINOWBVKJR4Q
X-MailFrom: prvs=77048296a8=rriveram@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MM4FIY5DQFD24XDT2RQYINOWBVKJR4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the SYSTEM_SLEEP_PM_OPS handlers to prevent handling an IRQ
when the system is in the middle of suspending or resuming.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45.c | 43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 4f4df166f5f0..28f76fccf277 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1026,6 +1026,46 @@ static int cs35l45_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int cs35l45_sys_suspend(struct device *dev)
+{
+	struct cs35l45_private *cs35l45 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l45->dev, "System suspend, disabling IRQ\n");
+	disable_irq(cs35l45->irq);
+
+	return 0;
+}
+
+static int cs35l45_sys_suspend_noirq(struct device *dev)
+{
+	struct cs35l45_private *cs35l45 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l45->dev, "Late system suspend, reenabling IRQ\n");
+	enable_irq(cs35l45->irq);
+
+	return 0;
+}
+
+static int cs35l45_sys_resume_noirq(struct device *dev)
+{
+	struct cs35l45_private *cs35l45 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l45->dev, "Early system resume, disabling IRQ\n");
+	disable_irq(cs35l45->irq);
+
+	return 0;
+}
+
+static int cs35l45_sys_resume(struct device *dev)
+{
+	struct cs35l45_private *cs35l45 = dev_get_drvdata(dev);
+
+	dev_dbg(cs35l45->dev, "System resume, reenabling IRQ\n");
+	enable_irq(cs35l45->irq);
+
+	return 0;
+}
+
 static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 {
 	struct device_node *node = cs35l45->dev->of_node;
@@ -1468,6 +1508,9 @@ EXPORT_SYMBOL_NS_GPL(cs35l45_remove, SND_SOC_CS35L45);
 
 EXPORT_GPL_DEV_PM_OPS(cs35l45_pm_ops) = {
 	RUNTIME_PM_OPS(cs35l45_runtime_suspend, cs35l45_runtime_resume, NULL)
+
+	SYSTEM_SLEEP_PM_OPS(cs35l45_sys_suspend, cs35l45_sys_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l45_sys_suspend_noirq, cs35l45_sys_resume_noirq)
 };
 
 MODULE_DESCRIPTION("ASoC CS35L45 driver");
-- 
2.34.1

