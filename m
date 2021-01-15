Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5682F80C4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 17:28:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F1C180B;
	Fri, 15 Jan 2021 17:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F1C180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610728100;
	bh=qpQII3oazvKQmr/X1kOlXgtvD4rpHQMZeDoWEJKH+Hs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jva5LuBmRwm2S+AM954YsL3/5k18vpJLakGO63aq3ntkXSaqWYNKtYpp3drRR0wAR
	 tgJRZHHF18/LZht8yzSVA8UN7bv1G9Se9yHphlZwc7ArOI+u19Zjyuz898LqFGYXKn
	 8GQB+G0nG9Ihu0C9pAaUm0MRHpZFV3qpzY2RBa1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA0F9F80113;
	Fri, 15 Jan 2021 17:26:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC138F801ED; Fri, 15 Jan 2021 17:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 788D4F80113
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 17:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 788D4F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GTtpLXxL"
Received: by mail-wr1-x42b.google.com with SMTP id a9so6415414wrt.5
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 08:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHREG6C5P/XayT82CqAsPtVld3xr9E3ouKBjbBy5N5U=;
 b=GTtpLXxLg7ZP+rWkWH1nnfl757C7Cm4v0/Jt6aV6jvw9XwfZi52A/yeBra3MBCMGuk
 cyMt+90LMpCKvHAfyGiSOZ+QwExsvVzhZwlBdmQalqI/70EHGMuVezc25RIl2scofx5B
 aBmGzJYlQ+d9ER1aRvM8vxhiCXAqN/ghqA6kwl+9eajHuheIM/P9SeNTgWkg8GcYchgN
 98FsGb2NzY2t8CQtEXXBtk70lCy+7TmG8wXOZp/iUkcGLnN1Lymhb3TOSoiokCbopUTX
 LMBAkcQnw6snXQOYX/RD0hCU8RsVl5YkAAHOV9Ekzz1LgyBT0Se+L/QVpt8BHzvzmz5V
 RfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UHREG6C5P/XayT82CqAsPtVld3xr9E3ouKBjbBy5N5U=;
 b=NE5lThuiLaNWLBjh8bq8pRqS2RzzqHZdXbMmsRLoKPDwuCynQgaTI67dyGs/WFC2wO
 Nd/JnMHRF/m2S6wOrAecsKE4TGj1pfzqkMWB4UfkSPiUjSlWVqNaSkhCGK7DexDBj6sD
 E8hLiMEeNOi9G1vAa+4u975EXzEjyqp7QDRzg+mwsbkcJ+vdptaWK7bU39XTqhX+jaCa
 8itBkRPIW49OK9bncHs9BBymGCjzF6XAWrngu6bURyYGkJqEe4wppIvP88xsXCuH1jzZ
 GERx9EAJilrKh0DI/WwVxdb76+Q56xucRWYDft1lEAprhLu0jGrWxOStVt8dmRuwngP8
 1L8A==
X-Gm-Message-State: AOAM5302I3jdNoifndEOmEddb4CXAvVkqf088o/dzrsxkmOHEnkCj9qP
 EmNUTKBJodnur9fCC7gxHY/0vQ==
X-Google-Smtp-Source: ABdhPJwwmUh8LEZ25b7vcsLVQpggunQJl2xR+DgnmFwAyT195XuhOmnHA6CxELYlWhGFS8FQj2kinA==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr14198635wro.292.1610727996473; 
 Fri, 15 Jan 2021 08:26:36 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v4sm16079764wrw.42.2021.01.15.08.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:26:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] soundwire: debugfs: use controller id instead of link_id
Date: Fri, 15 Jan 2021 16:25:59 +0000
Message-Id: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com
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

link_id can be zero and if we have multiple controller instances
in a system like Qualcomm debugfs will end-up with duplicate namespace
resulting in incorrect debugfs entries.

Using id should give a unique debugfs directory entry and should fix below
warning too.
"debugfs: Directory 'master-0' with parent 'soundwire' already present!"

Fixes: bf03473d5bcc ("soundwire: add debugfs support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index b6cad0d59b7b..5f9efa42bb25 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -19,7 +19,7 @@ void sdw_bus_debugfs_init(struct sdw_bus *bus)
 		return;
 
 	/* create the debugfs master-N */
-	snprintf(name, sizeof(name), "master-%d", bus->link_id);
+	snprintf(name, sizeof(name), "master-%d", bus->id);
 	bus->debugfs = debugfs_create_dir(name, sdw_debugfs_root);
 }
 
-- 
2.21.0

