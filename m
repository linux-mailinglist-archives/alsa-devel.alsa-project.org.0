Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DBB1F017A
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 23:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14282166C;
	Fri,  5 Jun 2020 23:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14282166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591392086;
	bh=a8KgyCdUeH5MWdxFf2G9xjVGo66WtQw3Mzoh4VFTFpY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hi641eHMZkedR7/U2D1c1VIhwRvduTHTCqDefS/DfBF4dFdQHKt1wyDv3kkgPOTEa
	 uhLlUYvZxO9ZSNs+bXwvsE+BByiSrkGIt7r/p+JmkrcGebz6n0cAjwXaaiYsxTiwgm
	 PlxBTVQqwBYajB889gbqpmAFQXqgEvqz+xHoOTBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6FDBF801EC;
	Fri,  5 Jun 2020 23:19:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7006F801ED; Fri,  5 Jun 2020 23:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4CDAF80132
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 23:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4CDAF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="D0W/A4TI"
Received: by mail-pl1-x643.google.com with SMTP id g12so4189403pll.10
 for <alsa-devel@alsa-project.org>; Fri, 05 Jun 2020 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/DT8KaqdvTHpY2pdkwC/qpDtPEs0oqYy0DlmoYI6060=;
 b=D0W/A4TIxeMbHVU7mcGxqr9tmsLnd9fwjOIfXwwAiqDbXhQKlm82IeqQVIAKcBM3aj
 8CxseH4wDPHoMGwc86GrKxUEwfF6dr8VVVl0l1GusyAqeJqTF8M+jHpLpdsloiYHIxDo
 EXkgKHYsBGFvSZ3EQw+G1l47XUh7kJgE58QFvsGHY+uQv7EiE/9enrDAuDqIXiAUbOfS
 1J7Y7ryh6pXGHV4AagqtrHQAopBw4F3zmOa6GK3H0+DLuJMUHiMMsn+Z97CmBnEbs/sc
 7JDKhCu/EmG1hQkwct5nYnEFnw2fBNsOSPgXfqG4BaFYmx9BkUuKQqmcQe5AJuHg6aNd
 dGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/DT8KaqdvTHpY2pdkwC/qpDtPEs0oqYy0DlmoYI6060=;
 b=GznKzZN4kFJ4duzmh16kZ9oAICOTyirB8CW1+m1mxKmHnn6OtyWJp/ltCFkjlvAyd7
 jTabKwg7HjdQ+SNx5TbDwaHK903stz9YwOIDGI/0x+N9jO+fjKHPPMoRBc3M+pAJxrKy
 o/ReANvY48nWVnK1WBIp+0wP05wyTJwCqlXAIDJVw0F2O1n6jbvUb/mNpitUbVOnvPZ8
 0OVvr8nylNcDJdOyU+adc3rL6ENvSkwmDIdbPaqpcxUvruyy7hwiyU4ZwdqAUDBQzrqU
 tWToieMJS/r294Jw72cwq+bibTcKWtk31urBg6bpwPr0inIoIYZ1VuAGc6cq5X7WLiYL
 L87w==
X-Gm-Message-State: AOAM533K+jR9ZkExTxhetgJRJZaEbEgP9jibRJ074r82ol0Xt3nkFAB9
 OgO5WNPwY6lQAmpqq4VepK1poQ==
X-Google-Smtp-Source: ABdhPJzJZXzNp787muuA7EB3j0sZ07R24oGZ7ooutcPi22eAqHT6ton+M88dLERu90HuIw9ZOFDMgA==
X-Received: by 2002:a17:90b:19ce:: with SMTP id
 nm14mr4929980pjb.23.1591391971562; 
 Fri, 05 Jun 2020 14:19:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 k126sm472302pfd.129.2020.06.05.14.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 14:19:30 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH] slimbus: core: Set fwnode for a device when setting
 of_node
Date: Fri,  5 Jun 2020 21:19:25 +0000
Message-Id: <20200605211925.87873-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Cc: John Stultz <john.stultz@linaro.org>, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Saravana Kannan <saravanak@google.com>
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

From: Saravana Kannan <saravanak@google.com>

When setting the of_node for a newly created device, also set the
fwnode. This allows fw_devlink to work for slimbus devices.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/slimbus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 526e3215d8fe..44228a5b246d 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -163,8 +163,10 @@ static int slim_add_device(struct slim_controller *ctrl,
 	INIT_LIST_HEAD(&sbdev->stream_list);
 	spin_lock_init(&sbdev->stream_list_lock);
 
-	if (node)
+	if (node) {
 		sbdev->dev.of_node = of_node_get(node);
+		sbdev->dev.fwnode = of_fwnode_handle(node);
+	}
 
 	dev_set_name(&sbdev->dev, "%x:%x:%x:%x",
 				  sbdev->e_addr.manf_id,
-- 
2.17.1

