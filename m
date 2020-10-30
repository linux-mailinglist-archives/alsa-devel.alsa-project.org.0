Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C62A3DF2
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:46:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A44C01764;
	Tue,  3 Nov 2020 08:46:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A44C01764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389617;
	bh=HNHT6Xx1TpQ9QcnZTV4nnV0YTwlWP7TpOX7tNCwsa3g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WmtC4GHO2vrZnMjoqn4gSveWyxVJD9u9S4Oxg9JBiMH7Kjdk6KhtuVGnEHO27v+b8
	 BgPd6z/ILMYe5YWTSbVQk97eVDngtgIEZZXIA8rQVM9GquRoKT1AhnKRbWc4QwrR2G
	 oSMSKQOoAGuoiwDmIsDxeZfkXpv82MgCWhTuZNnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D78F80083;
	Tue,  3 Nov 2020 08:45:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34B77F801D5; Fri, 30 Oct 2020 16:21:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44C49F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 16:21:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C49F800FF
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CN5cq0yqqzkYvM;
 Fri, 30 Oct 2020 23:21:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 23:21:27 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH] ALSA: ac97: fix reference leak in ac97_bus_remove
Date: Fri, 30 Oct 2020 23:32:10 +0800
Message-ID: <20201030153210.92234-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
Cc: alsa-devel@alsa-project.org
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

pm_runtime_get_sync() will increase pm usage counter even it
failed. We should call pm_runtime_put_noidle to decrease it
to prevent reference leak.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/ac97/bus.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 7985dd8198b6..2c4779d851ad 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -521,8 +521,11 @@ static int ac97_bus_remove(struct device *dev)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable device: %d\n", ret);
+		pm_runtime_put_noidle(dev);
 		return ret;
+	}
 
 	ret = adrv->remove(adev);
 	pm_runtime_put_noidle(dev);
-- 
2.17.1

