Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCA391740
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 14:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7FE1744;
	Wed, 26 May 2021 14:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7FE1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622031621;
	bh=t7kWHyXEAwrkhUxEmcwhbU/fbHfSnbvgivwwW+anl4w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C9um3HUXG1Eodpz2QK68RZHBbGE9bjVVb8cip4UuriDjRXt3afq0MchCOInwDonqj
	 7EE8fE3mK91EQtTRjRrYqpICQEdtwRgzeLzFEKa7GaBgsQ50ufHJSrevDxPjlsfrON
	 f5GknO4IDdLaoAJzNPjoYGMvPBhDD8WJaYeri02c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DB1CF8024D;
	Wed, 26 May 2021 14:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89B19F8025C; Wed, 26 May 2021 14:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84F9AF80212
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 14:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F9AF80212
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fqqg418LZzmZJv;
 Wed, 26 May 2021 20:16:16 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 20:18:37 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 20:18:36 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH -next] ALSA: core: use DEVICE_ATTR_*() macro
Date: Wed, 26 May 2021 20:18:28 +0800
Message-ID: <20210526121828.8460-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema769-chm.china.huawei.com (10.1.198.211)
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

Use DEVICE_ATTR_*() helper instead of plain DEVICE_ATTR,
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/core/init.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 70114fd26956..228faf9369dc 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -665,17 +665,15 @@ void snd_card_set_id(struct snd_card *card, const char *nid)
 }
 EXPORT_SYMBOL(snd_card_set_id);
 
-static ssize_t
-card_id_show_attr(struct device *dev,
-		  struct device_attribute *attr, char *buf)
+static ssize_t id_show(struct device *dev,
+		       struct device_attribute *attr, char *buf)
 {
 	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
 	return scnprintf(buf, PAGE_SIZE, "%s\n", card->id);
 }
 
-static ssize_t
-card_id_store_attr(struct device *dev, struct device_attribute *attr,
-		   const char *buf, size_t count)
+static ssize_t id_store(struct device *dev, struct device_attribute *attr,
+			const char *buf, size_t count)
 {
 	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
 	char buf1[sizeof(card->id)];
@@ -703,17 +701,16 @@ card_id_store_attr(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static DEVICE_ATTR(id, 0644, card_id_show_attr, card_id_store_attr);
+static DEVICE_ATTR_RW(id);
 
-static ssize_t
-card_number_show_attr(struct device *dev,
-		     struct device_attribute *attr, char *buf)
+static ssize_t number_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
 {
 	struct snd_card *card = container_of(dev, struct snd_card, card_dev);
 	return scnprintf(buf, PAGE_SIZE, "%i\n", card->number);
 }
 
-static DEVICE_ATTR(number, 0444, card_number_show_attr, NULL);
+static DEVICE_ATTR_RO(number);
 
 static struct attribute *card_dev_attrs[] = {
 	&dev_attr_id.attr,
-- 
2.17.1

