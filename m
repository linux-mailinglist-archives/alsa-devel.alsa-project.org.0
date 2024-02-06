Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7284B3A7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 12:39:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9DD1201;
	Tue,  6 Feb 2024 12:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9DD1201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707219588;
	bh=ZNJPTIPAK8/V1RPK0l1VKA3oYC1jOJG0SNejQn09bpk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qEpzNcDr3C5mUSbjWDqk++O/xGqZnYua8PCPLLngCHigW+X7MB72T08gYUd6lcKcJ
	 ebvIEMVJMid8XVjrE78CBgTkiw8WzemsE73io3ZO38tlhXm0K6Ihck8EN2XgYFznGG
	 SVqV8OGCUzXrqCq8uFl/jkA9L1BZ84p0BjAYap8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E935F805B3; Tue,  6 Feb 2024 12:39:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35F94F801D5;
	Tue,  6 Feb 2024 12:39:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C07AFF804E7; Tue,  6 Feb 2024 12:39:09 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D70C8F80153
	for <alsa-devel@alsa-project.org>; Tue,  6 Feb 2024 12:39:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D70C8F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=a7DcBj9a
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4169iwBg025133;
	Tue, 6 Feb 2024 05:38:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=269NzVQgDVeR3rcbff3E/lSbplkfYeX91pPkIS0tryE=; b=
	a7DcBj9aKE/QVCo4IRLUoyZXzK26nJjifSrkgAM8RbWA5bc4WJP+SVTrwS9oZf6r
	EFCaF1hg4UM+AAD2B6k2wqkU2Y9EFoEpTvEW5WZNnq6m5w0FOzALgzB8CVM0DtqB
	/k41LC2dMlAVSPBZkX0g9S0IX2P/NylMmJtmjjuiG/MDa2nSxaDq7CEzu/YY/Zy/
	TjdkAFQN5s2VxK4lKonX24QVot11frbaFtqrApB2gB3W5tLVqQJp+jgpXuLtCsh3
	IuzO/bMEMhBSu2tJgp0LYsYHYLw8EmXT7uiq60XtvfwQRPxH3jht3ZVVMV1b3+8z
	5Ae4SfFdrQbHa5RVi2LPEA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w1jsnk8w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 05:38:57 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 6 Feb
 2024 11:38:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 6 Feb 2024 11:38:50 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3BDF9820247;
	Tue,  6 Feb 2024 11:38:50 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: cs42l43: Add system suspend ops to disable IRQ
Date: Tue, 6 Feb 2024 11:38:50 +0000
Message-ID: <20240206113850.719888-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
References: <20240206113850.719888-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rAeNZ1QXncETRBkhkBbFjd6sP5pX4lx5
X-Proofpoint-ORIG-GUID: rAeNZ1QXncETRBkhkBbFjd6sP5pX4lx5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MTZJM74M5J6IVL567DKOW5CC4OQU4MFN
X-Message-ID-Hash: MTZJM74M5J6IVL567DKOW5CC4OQU4MFN
X-MailFrom: prvs=9766772a2b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTZJM74M5J6IVL567DKOW5CC4OQU4MFN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The IRQ should be disabled whilst entering and exiting system suspend to
avoid the IRQ handler being called whilst the PM runtime is disabled.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Apologies for the churn on this.

It seems there is no new style macro that provides all the required
callbacks, and I am a little nervous to add one. It looks like
there are quite a few drivers in a similar situation, so for now
I have just swapped things back to the old style PM macros, and if a
conversion is planned this can be caught in that.

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 45 +++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f1e119277622..e734b21849a0 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2362,8 +2362,47 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_RUNTIME_DEV_PM_OPS(cs42l43_codec_pm_ops, NULL,
-				 cs42l43_codec_runtime_resume, NULL);
+static int cs42l43_codec_suspend(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	disable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static int cs42l43_codec_suspend_noirq(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	enable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static int cs42l43_codec_resume(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	enable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static int cs42l43_codec_resume_noirq(struct device *dev)
+{
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
+	disable_irq(cs42l43->irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops cs42l43_codec_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend, cs42l43_codec_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend_noirq, cs42l43_codec_resume_noirq)
+	RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
+};
 
 static const struct platform_device_id cs42l43_codec_id_table[] = {
 	{ "cs42l43-codec", },
@@ -2374,7 +2413,7 @@ MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
 static struct platform_driver cs42l43_codec_driver = {
 	.driver = {
 		.name	= "cs42l43-codec",
-		.pm	= pm_ptr(&cs42l43_codec_pm_ops),
+		.pm	= &cs42l43_codec_pm_ops,
 	},
 
 	.probe		= cs42l43_codec_probe,
-- 
2.30.2

