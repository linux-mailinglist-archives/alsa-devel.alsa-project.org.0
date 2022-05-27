Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5D95364AA
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 17:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA1C81759;
	Fri, 27 May 2022 17:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA1C81759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653665404;
	bh=OucQmcM08JFJHtVAO4br/VmtVLvvXUjVQhC4XcxceTw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WyzS4XPvwV9V2dXhSGTqeCbjYz4+24dNayD27ggVFj7aEe4kZHHCzYGK2juViL8Q9
	 pBgK0DjBrLyy3GLFHOpi1vRIA8oqiIKlrohGMHK+Wf2f3cERf6KgOAjdq1IAqXV6lk
	 uObMtN2nGT6H57W0EfFmEZLDQF3akcBNEexp3/Y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 337B4F80100;
	Fri, 27 May 2022 17:28:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A9D4F802DB; Fri, 27 May 2022 09:09:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68537F80100
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 09:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68537F80100
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L8bVK3lFXz1JCTR;
 Fri, 27 May 2022 15:07:53 +0800 (CST)
Received: from dggpemm500018.china.huawei.com (7.185.36.111) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 15:09:25 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm500018.china.huawei.com (7.185.36.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 15:09:25 +0800
From: keliu <liuke94@huawei.com>
To: <srinivas.kandagatla@linaro.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drivers: slimbus: Directly use ida_alloc()/free()
Date: Fri, 27 May 2022 07:30:53 +0000
Message-ID: <20220527073053.2402630-1-liuke94@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500018.china.huawei.com (7.185.36.111)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 27 May 2022 17:28:30 +0200
Cc: keliu <liuke94@huawei.com>
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

Use ida_alloc()/ida_free() instead of deprecated
ida_simple_get()/ida_simple_remove() .

Signed-off-by: keliu <liuke94@huawei.com>
---
 drivers/slimbus/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 78480e332ab8..219483b79c09 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -250,7 +250,7 @@ int slim_register_controller(struct slim_controller *ctrl)
 {
 	int id;
 
-	id = ida_simple_get(&ctrl_ida, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&ctrl_ida, GFP_KERNEL);
 	if (id < 0)
 		return id;
 
@@ -299,7 +299,7 @@ int slim_unregister_controller(struct slim_controller *ctrl)
 {
 	/* Remove all clients */
 	device_for_each_child(ctrl->dev, NULL, slim_ctrl_remove_device);
-	ida_simple_remove(&ctrl_ida, ctrl->id);
+	ida_free(&ctrl_ida, ctrl->id);
 
 	return 0;
 }
@@ -323,7 +323,7 @@ void slim_report_absent(struct slim_device *sbdev)
 	sbdev->is_laddr_valid = false;
 	mutex_unlock(&ctrl->lock);
 	if (!ctrl->get_laddr)
-		ida_simple_remove(&ctrl->laddr_ida, sbdev->laddr);
+		ida_free(&ctrl->laddr_ida, sbdev->laddr);
 	slim_device_update_status(sbdev, SLIM_DEVICE_STATUS_DOWN);
 }
 EXPORT_SYMBOL_GPL(slim_report_absent);
-- 
2.25.1

