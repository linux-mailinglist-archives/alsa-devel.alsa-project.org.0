Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A645B2D23
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 05:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCD81697;
	Fri,  9 Sep 2022 05:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCD81697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662695783;
	bh=jeKqed8Sbl5gU1ueV0lRdL61dt7ziAceBw2vnUPr2JA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MoW2w3c5XoDITDPu/iOJzPJgU4JCuE9q6S6EHa4GVDAXzIpaksUHjYrfA9yHvA2aU
	 oiji3cB8pWvi1xqvvhE0Gmb8noKK+wC/gVEwXaDyFEfKXaaqxhJQtZ0gjHbx/E9UJg
	 0wtn7aXbRAk2t6zim99fY8uYeGtuyjOsyHyQFK0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFFBEF804AE;
	Fri,  9 Sep 2022 05:54:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B29EF80105; Fri,  9 Sep 2022 05:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B939CF80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 05:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B939CF80105
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MP27n6WQpzZcnt;
 Fri,  9 Sep 2022 11:50:13 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 11:54:44 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <johan@kernel.org>,
 <stefanha@gmail.com>, <dhowells@redhat.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH 1/2] ALSA: line6: remove line6_set_raw declaration
Date: Fri, 9 Sep 2022 11:54:42 +0800
Message-ID: <20220909035443.1065737-2-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909035443.1065737-1-cuigaosheng1@huawei.com>
References: <20220909035443.1065737-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
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

line6_set_raw has been removed since
commit 9f673d7a6022 ("staging: line6: drop CONFIG_LINE6_USB_RAW"),
so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/usb/line6/driver.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index ecf3a2b39c7e..dbb1d90d3647 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -193,8 +193,6 @@ extern int line6_send_raw_message_async(struct usb_line6 *line6,
 					const char *buffer, int size);
 extern int line6_send_sysex_message(struct usb_line6 *line6,
 				    const char *buffer, int size);
-extern ssize_t line6_set_raw(struct device *dev, struct device_attribute *attr,
-			     const char *buf, size_t count);
 extern int line6_version_request_async(struct usb_line6 *line6);
 extern int line6_write_data(struct usb_line6 *line6, unsigned address,
 			    void *data, unsigned datalen);
-- 
2.25.1

