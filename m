Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF824851D7
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:33:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518281831;
	Wed,  5 Jan 2022 12:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518281831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382389;
	bh=27AFByeNWqsQxTfs3mJ1PgFsmI38FYrTavV9v9mTyGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SfA0/uEyzGXDzcrZWTSxK1aTafqhW1OjK9vqPwymhrfqUgblWvQUSkmqb8Z+RNFR6
	 j+iadiDDD3awzCri+4GigrwDh407uDm5ZcJglyNn3mr/1x+QVGuaQLuLe9XVp5RwRO
	 VwwOc/UvDkl9px5YDOkSMbVIdh3q4xqiG/ROIkps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F32F802D2;
	Wed,  5 Jan 2022 12:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9982F80511; Wed,  5 Jan 2022 12:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CD3F80167
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CD3F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="C5gEpPcw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2058aLP9003317;
 Wed, 5 Jan 2022 05:30:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=xSTYwC7Lhodu03O25o575a4OgvCNNIPvLyM3d3Q7Udk=;
 b=C5gEpPcwxKj+F8gINLdY+kbbbIse1tniZHQlTSTsgzTFgDIzPkZGOtWzoaaTlcW7tG6R
 lMwVWWAcSDga0TGGlINcJRBcOMUDoANT3hsRggpWZFughhWy3agUSK+UIA+jL6oM5FP8
 ffC/2RuHlUveX82uB+vEiy/pJkCohsOgGiqOUVZewuZDM+afOFJnu9oWX9iFeSYhr4NO
 BPPwELQ5Kmp+A/+jZnm3j/6f3pokrJNxNHGbhtV8gB0c2RVP/2FvhlxO4e9dG3bCg6am
 dtwiRIiAxjv6+A/CkwTqFaWAwV/E/f2MB3c04DT8+j+oGVZ+pTE562KEHzyOAJfKmDy0 tw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dd7y3g4bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:28 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:26 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E10F611D7;
 Wed,  5 Jan 2022 11:30:26 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 1/8] ASoC: cs35l41: Add cs35l51/53 IDs
Date: Wed, 5 Jan 2022 11:30:19 +0000
Message-ID: <20220105113026.18955-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 39w9fLcHjSvmZxl4JLJfy9T9cxSSVvy8
X-Proofpoint-ORIG-GUID: 39w9fLcHjSvmZxl4JLJfy9T9cxSSVvy8
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: David Rhodes <david.rhodes@cirrus.com>

Add IDs for the CS35L51/53 variants, the functionality is shared with
CS35L41.

Signed-off-by: David Rhodes <david.rhodes@cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-i2c.c | 2 ++
 sound/soc/codecs/cs35l41-spi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index de5c8612f0307..eb8dfb6d9c950 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -22,6 +22,8 @@
 static const struct i2c_device_id cs35l41_id_i2c[] = {
 	{ "cs35l40", 0 },
 	{ "cs35l41", 0 },
+	{ "cs35l51", 0 },
+	{ "cs35l53", 0 },
 	{}
 };
 
diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index c157153f28d87..86bbe2fba956e 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -20,6 +20,8 @@
 static const struct spi_device_id cs35l41_id_spi[] = {
 	{ "cs35l40", 0 },
 	{ "cs35l41", 0 },
+	{ "cs35l51", 0 },
+	{ "cs35l53", 0 },
 	{}
 };
 
-- 
2.11.0

