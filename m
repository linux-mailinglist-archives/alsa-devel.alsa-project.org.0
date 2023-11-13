Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7A7E9FB7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 16:15:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C820DF;
	Mon, 13 Nov 2023 16:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C820DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699888552;
	bh=deLOTaBW/iaEMoVKLnR9wO4xInhmC0yGZE65Y2AzjGc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JpDC7lEtxnCxYsVDZudlXWLDumamoUMeUdJ//0Xq44zq8XD6BR7O9cqm4Du8d82cZ
	 GPDWjK8LUs2zgvBey5gNgl13AIgng2YUFWgLff4pqMXupIYoTprbZlPzyAAHc/23nW
	 ZkyC0dzhMuV8HopZdC45ShRACbOKe7us+hjUwXOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9E1AF80551; Mon, 13 Nov 2023 16:15:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76523F80152;
	Mon, 13 Nov 2023 16:15:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5E6F801D5; Mon, 13 Nov 2023 16:14:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E362BF80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 16:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E362BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PEi3vfzH
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3ADAT6Eh011217;
	Mon, 13 Nov 2023 09:14:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=p
	38ySnFRvL6llTjVYyh96cM1irV/9ZZTyvEh7ACPMt8=; b=PEi3vfzH7ZZND/GhH
	OyeYTy+FzxSYj3DPhYjCQqCU8ORXcmmCy+1BnBjzQUxJ8oWzSUSt72gzaOyOg8MS
	DsMZrugwZq95kHTCzgkNNwYnAxHJDuyj9Fau97qqvRcbzRnJHXoHeK3jVOF3Ueby
	jE3/uXiyJ9R0wYb0ULOY/rgxJJFkKI6fLNlyetJCT1rALYw3U9T+hAeFGRRdTX5j
	tSDHSxjcXZYVzhjZ+m+tXbNbmu/+RQWYJaOI66ZZoYvb4l34BqzGbTJffJ6Fgsiu
	LfMpcNA9h91iuPDt9INzi186uGocSwoLaqOHbqqwAEbW4jyUc+qawYsuWccFrZkY
	lcdRA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ua7w2j1f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 09:14:44 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 15:14:29 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 13 Nov 2023 15:14:29 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 455E811CC;
	Mon, 13 Nov 2023 15:14:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Add missing static from runtime PM ops
Date: Mon, 13 Nov 2023 15:14:29 +0000
Message-ID: <20231113151429.1554139-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _rjETcmdbroXoQ8SRb31qtpjyo2BOu1L
X-Proofpoint-GUID: _rjETcmdbroXoQ8SRb31qtpjyo2BOu1L
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OUXWJ55SBZII45JIY75AADJW4TG2F5CV
X-Message-ID-Hash: OUXWJ55SBZII45JIY75AADJW4TG2F5CV
X-MailFrom: prvs=6681151699=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUXWJ55SBZII45JIY75AADJW4TG2F5CV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes: 2b59332ead54 ("ASoC: cs42l43: Use new-style PM runtime macros")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311091824.5z6PROGZ-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d62c9f26c6325..5c98343ebf71b 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2251,8 +2251,8 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
 	return 0;
 }
 
-DEFINE_RUNTIME_DEV_PM_OPS(cs42l43_codec_pm_ops, NULL,
-			  cs42l43_codec_runtime_resume, NULL);
+static DEFINE_RUNTIME_DEV_PM_OPS(cs42l43_codec_pm_ops, NULL,
+				 cs42l43_codec_runtime_resume, NULL);
 
 static const struct platform_device_id cs42l43_codec_id_table[] = {
 	{ "cs42l43-codec", },
-- 
2.39.2

