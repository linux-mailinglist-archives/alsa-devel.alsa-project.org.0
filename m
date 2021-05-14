Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047403804EC
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 10:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853DA1785;
	Fri, 14 May 2021 10:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853DA1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620979977;
	bh=BN/Vbhxq5Tt4Ff3nMxrL0shT/uEybuHxAT/QUq1/+s0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OIVOdibfC0DmnhQLxEfZiNTWWJ7aoana/5W4ZbLSHLhcs+a9jhoS+1uLhoW/4xdlc
	 xcL5Dt9s+7AN5VWRJl8W7ZorDjkIExsgBdAJbhHn8yf8551AEqUzRd+72aOxMZeGpI
	 Pc8q8XhFiytrUFUVwDAz9LaVBM0UISZOH8R6scbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F77EF800BF;
	Fri, 14 May 2021 10:11:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD12F80240; Fri, 14 May 2021 10:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB125F800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB125F800BF
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FhLjy6nhKzQnLT;
 Fri, 14 May 2021 16:07:50 +0800 (CST)
Received: from localhost (10.174.179.215) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Fri, 14 May 2021
 16:11:05 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH -next] ASoC: soc-core: use DEVICE_ATTR_RO macro
Date: Fri, 14 May 2021 16:11:00 +0800
Message-ID: <20210514081100.16196-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
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

Use DEVICE_ATTR_RO helper instead of plain DEVICE_ATTR,
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1c0904acb935..2d969e31f37d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -75,9 +75,9 @@ static ssize_t pmdown_time_show(struct device *dev,
 	return sprintf(buf, "%ld\n", rtd->pmdown_time);
 }
 
-static ssize_t pmdown_time_set(struct device *dev,
-			       struct device_attribute *attr,
-			       const char *buf, size_t count)
+static ssize_t pmdown_time_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
 {
 	struct snd_soc_pcm_runtime *rtd = dev_get_drvdata(dev);
 	int ret;
@@ -89,7 +89,7 @@ static ssize_t pmdown_time_set(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(pmdown_time, 0644, pmdown_time_show, pmdown_time_set);
+static DEVICE_ATTR_RW(pmdown_time);
 
 static struct attribute *soc_dev_attrs[] = {
 	&dev_attr_pmdown_time.attr,
-- 
2.17.1

