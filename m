Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA8812B0
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 09:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEBCB167E;
	Mon,  5 Aug 2019 09:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEBCB167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564988554;
	bh=gZcAnKrQsR6HSJoESZGdHx+pZ4k9Um4DgkM7gUKfo0Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HCRekZ7HMABizlUIAxaHbY0r7E+4ODCryLvFy4CtkiYPEVGnTesyGx6Mj4WvZ5L74
	 3BqDDx6JqU3elww6/F3QljeXyLZpYzqEYvWL8Jkp9ZrcdEdc06b900I/EIusrSmMoW
	 enOfl02kJBB0RGdNyv5vL/MgAHqAbvO8aoQdgseM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0FEF80533;
	Mon,  5 Aug 2019 09:00:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FAE2F804CB; Sun,  4 Aug 2019 18:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B488F800F4
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 18:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B488F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g4+Wq6fJ"
Received: by mail-pg1-x544.google.com with SMTP id d1so5606402pgp.4
 for <alsa-devel@alsa-project.org>; Sun, 04 Aug 2019 09:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=arPSyYtCIEpHJx7VmrbGRXbOahwhzCvFL/DbWnjIMcY=;
 b=g4+Wq6fJW5FxjqATugBqVVOtB7OFxovBMMIvl/G8oQ0KCoryoaaI6vRw39t+ZrxJG2
 8uDnWeUwiwSP0UDtprlH6C2I4m0vVumKqOHnJesmczsYn/QxQg0Tt5yNyX8ethqbBRG2
 PiTiA1aDzFjb/XZ0WsOCrxM15xoP1Y8rfKf5wwjV7gdIGsKqTdz9gdZE5si+tbCfztf7
 7TvYybqA3bzVY5wfwu+R9NFz+ZLOAYwKELoLqLBIgALKxf56hQPfAFLda1oM2E4yVwEl
 XvcMXkNDW6EWKa3tHwaSygcxdtS8ITQ1bsCfV0McUtHVuIWK2MKpYE8NDLrJMbbeA5eD
 hKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=arPSyYtCIEpHJx7VmrbGRXbOahwhzCvFL/DbWnjIMcY=;
 b=gCNilOoeBzGWi7tYWAQf7gQH3IIOgSItqMFEBIJmTP8eYAtQiO2CPDxixryjxVVR7K
 XtQK3vQvrSmzThgHWpWkjBPYvzfXmeLFZej3WxdMbqOIwqhtpNjXbWXwmInzXCvG2dfz
 eztOhS9O3VxVJV90fl5Q32darGkpLsXa4zSc3y/dd26iCboWsAyJB3fNiWDs72YtaWpu
 RwFvUR3lIm9Fsw9GzZntqDu3wWlO+r2hFu+JssThKfhpZZ5bwanRRma4r1NbSvAj07B9
 IvYpItNcRFGH/XHP3Mlnj1SFsaK2xFxRloRNWSm0z7EfMD/1xfz+MUCo4BJ0lldiJ0LZ
 jfKA==
X-Gm-Message-State: APjAAAWYk7mlw/HlRIoDuQDiYgf6z5w+DCV9265PXJfY20tkuXaVmaYG
 FNf4scWGAEhFn7TfN6T6Z94=
X-Google-Smtp-Source: APXvYqxzvBqU8xnQh5WRKKhv/bzA0aEYwwWJ/cxXiV4V9lHG+RJeNCKonswn6UeqLwi/Up+h+fncJA==
X-Received: by 2002:a17:90a:3086:: with SMTP id
 h6mr14541507pjb.14.1564935732996; 
 Sun, 04 Aug 2019 09:22:12 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
 by smtp.gmail.com with ESMTPSA id b3sm97978763pfp.65.2019.08.04.09.22.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 09:22:12 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: agross@kernel.org, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Date: Sun,  4 Aug 2019 21:52:01 +0530
Message-Id: <20190804162201.5838-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Aug 2019 09:00:48 +0200
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [alsa-devel] [PATCH] slimbus: qcom-ngd-ctrl: Add of_node_put()
	before return
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index f3585777324c..29fbab55c3b3 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1338,12 +1338,15 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			continue;
 
 		ngd = kzalloc(sizeof(*ngd), GFP_KERNEL);
-		if (!ngd)
+		if (!ngd) {
+			of_node_put(node);
 			return -ENOMEM;
+		}
 
 		ngd->pdev = platform_device_alloc(QCOM_SLIM_NGD_DRV_NAME, id);
 		if (!ngd->pdev) {
 			kfree(ngd);
+			of_node_put(node);
 			return -ENOMEM;
 		}
 		ngd->id = id;
-- 
2.19.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
