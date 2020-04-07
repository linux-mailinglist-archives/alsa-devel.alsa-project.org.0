Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C81A099C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 10:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E2DB1687;
	Tue,  7 Apr 2020 10:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E2DB1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586249756;
	bh=IBuZNHn84qLTSsqhjrA8rmLMUXzHfCSRElhXswVWtHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cNgxxuGRZxNqxrnEcA1cKBz+1hfY6hNsy41AR6OwVYdGs3PqjRj5TdVAszqExfU3V
	 HWxhHUdTz3gD9o4LRsYKKgSRngKyJ4RCnlmTyF3sVGdP7IdEEgkPUhmr4wZflOi6Po
	 p4p4580/tpC31p4+EJ6603L3Hcqs/DqvxfDmI9s4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B9FF802A1;
	Tue,  7 Apr 2020 10:51:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92336F801D8; Tue,  7 Apr 2020 10:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 227F5F8011B
 for <alsa-devel@alsa-project.org>; Tue,  7 Apr 2020 10:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 227F5F8011B
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CCCB54623A193D4511BD;
 Tue,  7 Apr 2020 16:31:10 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 7 Apr 2020
 16:31:00 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH 4/4] ASoC: wm8900: remove some defined but not used symbols
Date: Tue, 7 Apr 2020 16:29:32 +0800
Message-ID: <20200407082932.41511-5-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200407082932.41511-1-yanaijie@huawei.com>
References: <20200407082932.41511-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 07 Apr 2020 10:51:32 +0200
Cc: Jason Yan <yanaijie@huawei.com>
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

Fix the following gcc warning:

sound/soc/codecs/wm8900.c:449:38: warning:
‘wm8900_dapm_routput2_control’ defined but not used
[-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm8900_dapm_routput2_control =
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/codecs/wm8900.c:446:38: warning:
‘wm8900_dapm_loutput2_control’ defined but not used
[-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm8900_dapm_loutput2_control =
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/soc/codecs/wm8900.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index 271235a69c01..3e239fa9bc8d 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -443,12 +443,6 @@ SOC_SINGLE("LINEOUT2 LP -12dB", WM8900_REG_LOUTMIXCTL1,
 
 };
 
-static const struct snd_kcontrol_new wm8900_dapm_loutput2_control =
-SOC_DAPM_SINGLE("LINEOUT2L Switch", WM8900_REG_POWER3, 6, 1, 0);
-
-static const struct snd_kcontrol_new wm8900_dapm_routput2_control =
-SOC_DAPM_SINGLE("LINEOUT2R Switch", WM8900_REG_POWER3, 5, 1, 0);
-
 static const struct snd_kcontrol_new wm8900_loutmix_controls[] = {
 SOC_DAPM_SINGLE("LINPUT3 Bypass Switch", WM8900_REG_LOUTMIXCTL1, 7, 1, 0),
 SOC_DAPM_SINGLE("AUX Bypass Switch", WM8900_REG_AUXOUT_CTL, 7, 1, 0),
-- 
2.17.2

