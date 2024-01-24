Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F5E83AD68
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:32:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D23857;
	Wed, 24 Jan 2024 16:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D23857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706110352;
	bh=dwNSFLpQJ15WSNLHQJc0HWdI5vgJK4PLbibeEt3onbM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b5rZcv6F/75P1Xet8AV3IksboUiam4N5tXns/tKYhqUrIUpcvuzKGQcUMC0v/v8LF
	 +MRlFJmoAVVhRfSQPxRKbl1B3pEfIQjcn370bmjYkHIyDzPn/i2i6Y+o7YlBSo1fwY
	 e662HZfUDXqA16ZGAMtAyex6F+xITdqy0XyXqg8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B226F80677; Wed, 24 Jan 2024 16:30:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD8DF80679;
	Wed, 24 Jan 2024 16:30:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE801F805EB; Wed, 24 Jan 2024 16:30:38 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B8944F8028D
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8944F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=m3cpJ6vr
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O8MvMn030107;
	Wed, 24 Jan 2024 09:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=3wVnz+qTDhd7ewymUmUS+IuKvNXLSEtQi0GPLXhpiT0=; b=
	m3cpJ6vr/YsEf11Pw5ubyLoyQUN5DQGyV0NH7Y41V7Z+oRk9aHEoKwSwzexEUK+T
	EpjpRsej/rMkxErRj58nk8ZN5ZrtmA2W6x+fL87NIAwmC7iaasUxbks6xhkxHFfm
	G/m2gSluhoAvxmwQUyg4r6M3F4jVt/HBAjETHak8vCn5n0jVVVdtBO5ofltWUoCV
	4Pi3EDoA5xIUQOgPAgmBZ9NonPEJ/mDsvQx6ZK4ET/nknOQEGMM5wPA2YuhPoeN5
	o2fQAudasr+J+A6vFf0AbT73RC+O+95f//oy6Wx8mibsVwT/SU0ELKKaNcKMf//b
	dqt51C/Rc6q4cqV+G0OG1w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmf9ryqc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:30:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:30:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:30:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CAFCB82024B;
	Wed, 24 Jan 2024 15:30:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v2 6/6] mfd: cs42l43: Handle error from devm_pm_runtime_enable
Date: Wed, 24 Jan 2024 15:30:16 +0000
Message-ID: <20240124153016.1541616-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: c8Z7e5c67-GQC_sft4G-zoF0go-TruDf
X-Proofpoint-ORIG-GUID: c8Z7e5c67-GQC_sft4G-zoF0go-TruDf
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UMZIY3PSARNEO3RU3WLMCPZ6IOO46E4R
X-Message-ID-Hash: UMZIY3PSARNEO3RU3WLMCPZ6IOO46E4R
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMZIY3PSARNEO3RU3WLMCPZ6IOO46E4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As it devm_pm_runtime_enable can fail due to memory allocations, it is
best to handle the error.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 drivers/mfd/cs42l43.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index aea0f8f485785..56bd9dbbe10b0 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -1065,7 +1065,9 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 	 * the boot work runs.
 	 */
 	pm_runtime_get_noresume(cs42l43->dev);
-	devm_pm_runtime_enable(cs42l43->dev);
+	ret = devm_pm_runtime_enable(cs42l43->dev);
+	if (ret)
+		return ret;
 
 	queue_work(system_long_wq, &cs42l43->boot_work);
 
-- 
2.30.2

