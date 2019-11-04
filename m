Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF30EE487
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 17:18:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABF9F1716;
	Mon,  4 Nov 2019 17:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABF9F1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572884324;
	bh=59PdqNDq9uNp5AEO3eT6neHKrUeB8y5DyWUGHc8gres=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uOXwjTIlKtMBZTD99PnjtGc3LJ2poXZG+S6HfQTITOFqZ3MjrK0Hcmrdo9dVMqB/w
	 obcKVNn2pjkDrJupRT4N7wC5cInyL0J0jCTSlzz8jmzXKW6TDiTdqkepbPXvZiYEQf
	 miYkyLokNbF4kdc2L5yEUa8M9CRGqAvyqKfN35TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01747F80321;
	Mon,  4 Nov 2019 17:17:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBCD5F803F4; Mon,  4 Nov 2019 17:16:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63395F800F3
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 17:16:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63395F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Tnb/Lo2r"
Received: by mail-wr1-x441.google.com with SMTP id n1so17782980wra.10
 for <alsa-devel@alsa-project.org>; Mon, 04 Nov 2019 08:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3uo0BMKlK0y8MI6JAlvvPKjW+q8BZt61AS+QsUjT+0=;
 b=Tnb/Lo2rthzMTsJJH+VXKXylmJSmWJd9ZdltDZOhEHkcTYtjujuaWVHzY81dFUM3JR
 N/1CCvPQA3hUOEBn8zR+5Wlb+vrp4wTZI/D+ixZyE0XfsZab4OTFocXtc2wWPjKAxXxL
 ppnWzttt/aOtsZVrPuA65eRxAW/bThXyLybgOh6/JHV4Q25v4q9ttBttw90hZmCMEj7q
 BtJ3kB+xsNuohdYEaRwoF6FUKwvrR1FtkQFNye4DPVAm6xW8EQHvmiwwTTPLrvQ+2j0M
 yDC58XoxcpHR14OQK0lZ/urATEZxpIdWfCFoiJrZpCCi4ToJSSlc9N/G5ZGf67mqcSNm
 CV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3uo0BMKlK0y8MI6JAlvvPKjW+q8BZt61AS+QsUjT+0=;
 b=mKpq816du8EFzMRvM+j7WlYx7PVN5v/ZuHtoU9cxhHaetYg1EGTtuMikCFMWa0qWND
 Q46tgRvsfcjt0sIsvZ8lwLsW8fKE0Qnuxd6fjEOYfRYqzCi/VMX0Wf1tdDiXWwK6gHys
 bNGAsuLHGIlbguNslwnHkV/RU4qqyLCzig9JpIZGQ9Byx4fUGbW0hidFeAAjtA4Rmnth
 0dpBf19M1V1WQdcOJBKtn7CpRTA9i9c/yVHT9zGcc6ZKdrDIuw4clyhkv274zN3WZuQI
 OBHlKhahDJwVk/R82HZW+gGzoHRKnqYzdKwZE3ez+ZcU0WE3A/mRURc7Dl0ZLNLQDaBC
 I2Jg==
X-Gm-Message-State: APjAAAVM655jS6Yo1nj/BNzZ1L8ftozPYBsuh0Z/2IBojHysZ9BXxNac
 dLE7HvOqk3hCYZ6TVsPWL20=
X-Google-Smtp-Source: APXvYqzH2/1W/bp/+tW/I54PiPKy05mHniUEGDtYNElwkgXj0oL+pntAV6+W5ERlrQLcUUPhqfcI6A==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr24904912wrs.239.1572884215437; 
 Mon, 04 Nov 2019 08:16:55 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id k4sm19652778wmk.26.2019.11.04.08.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 08:16:54 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Tue,  5 Nov 2019 00:16:44 +0800
Message-Id: <20191104161644.11814-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH] slimbus: qcom: add missed
	clk_disable_unprepare in remove
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

The remove misses to disable and unprepare rclk and hclk.
Add calls to clk_disable_unprepare to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/slimbus/qcom-ctrl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index a444badd8df5..4aad2566f52d 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -641,6 +641,8 @@ static int qcom_slim_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	slim_unregister_controller(&ctrl->ctrl);
+	clk_disable_unprepare(ctrl->rclk);
+	clk_disable_unprepare(ctrl->hclk);
 	destroy_workqueue(ctrl->rxwq);
 	return 0;
 }
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
