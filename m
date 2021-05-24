Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC438E5EC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 13:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B5216A5;
	Mon, 24 May 2021 13:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B5216A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621857411;
	bh=kfDUtwMeuMVMxIYYwvVZM2iMXCkoxQwCCrLjYI1VP5g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FHiSBA2JG0mgBoOGjOoFsyPD85zCgrQ2rS38I4oJW7lUSGf45L5oH07k7Jio2AUNL
	 ZGyfuQLj74erZHqehhxOoMNN/Jq1sLqSRxJgfy1vo9MFv29qXnO4QgYgRoAuUuKRCp
	 wakgV81NiPwxGddsNM0s+z1HHw1WO6WCxAtC+XCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 791BAF8021D;
	Mon, 24 May 2021 13:55:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D4CEF8022B; Mon, 24 May 2021 13:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0D9FF800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 13:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0D9FF800B8
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FpbF13prHzmb0s;
 Mon, 24 May 2021 19:52:53 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 19:55:12 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 19:55:12 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <liam.r.girdwood@linux.intel.com>, <yang.jie@linux.intel.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <yuehaibing@huawei.com>
Subject: [PATCH -next] ASoC: Intel: Skylake: use DEVICE_ATTR_RO macro
Date: Mon, 24 May 2021 19:55:06 +0800
Message-ID: <20210524115506.35724-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/intel/skylake/skl-nhlt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 87c891c46291..64226072f0ee 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -149,8 +149,8 @@ int skl_nhlt_update_topology_bin(struct skl_dev *skl)
 	return 0;
 }
 
-static ssize_t skl_nhlt_platform_id_show(struct device *dev,
-			struct device_attribute *attr, char *buf)
+static ssize_t platform_id_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct pci_dev *pci = to_pci_dev(dev);
 	struct hdac_bus *bus = pci_get_drvdata(pci);
@@ -166,7 +166,7 @@ static ssize_t skl_nhlt_platform_id_show(struct device *dev,
 	return sprintf(buf, "%s\n", platform_id);
 }
 
-static DEVICE_ATTR(platform_id, 0444, skl_nhlt_platform_id_show, NULL);
+static DEVICE_ATTR_RO(platform_id);
 
 int skl_nhlt_create_sysfs(struct skl_dev *skl)
 {
-- 
2.17.1

