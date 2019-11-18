Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F4FFFB1
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 08:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71341168E;
	Mon, 18 Nov 2019 08:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71341168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574062768;
	bh=ttYum6y/d2ca9cJ3zZmoJXABGxnM9WeQK4f5AJc08mQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QrJWsQl/0EndethrCO4EbQrQmV8oLCuUe6D8ZE1ldibZfZy05KstxGhIFYXPcrYWr
	 KTNOzcrb9JOINkV3OnM1rL8DLmMvy43GarV2wHTiQ5jaZ2iFATzAhtEbSxezibHZoj
	 7IzhpuWWzrA4XRTq38oBhnh1PKfomxFmGAszQ0Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA22EF80146;
	Mon, 18 Nov 2019 08:37:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6843F8013F; Mon, 18 Nov 2019 08:37:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8014F8013D
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 08:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8014F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uEywBp9R"
Received: by mail-pl1-x644.google.com with SMTP id d29so9289272plj.8
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 23:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xe+Hh36CXezhILfUXHbWAftsPx9okk6we2CTbfEFf9s=;
 b=uEywBp9R7GGZbAzKwdAp8tFWJqgwu/JH5HVj9tW+e7xMxu2mtryi1sS83Qn0KWgBC+
 lQDxYX+Cnfc+47KD5MeyLaWjQgPPcxnck+6F46FzQ66bkSe5D5F0x/ho0I8lGxhGPKHP
 pyr9nhutvn48T1wCAqqwcGzEfpfaS+AF30BYjLvzn3CVSOfYk4UKpBRtA668JhpHltoM
 F7vIpSDC/GN6dWG/X3pLxhZ5HjV9hxCHb7xyssC8cGsKmApjJrtLs4eFWbQlGnc1GtTb
 NTq1LuL7BUNhRrsGbnja7MPBHr9MDRp8WzrX/eLwT1p/3sh1IFSMEK2rMUE2MkoY+csp
 kN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xe+Hh36CXezhILfUXHbWAftsPx9okk6we2CTbfEFf9s=;
 b=b3PjIl4E5QSWQyOO194fmg1L1RfqDRdWtGgv+utkhj5bMekKgoYAIH2MIir+nK6qUL
 4n9g8H/p85g3L5XBZNBiQH8k3QnU2DLGqhTEnSt+gnjROc8hH+QQ/xFZ/QgP4113hIBT
 yz0QwmvIPHWPmFYoAOe/5M0HVQb82HryZkC0zE7BeI1klu4vEtzCUCv57jtfNqbvdvd/
 C+ga6Qr+CU9cNl1MB3fvaumHSr0UOY5Lce212u0B4X+PmY9zKlJCh39GmFDerDBr+UTz
 7ST+a9jgjQRoDmgd1TSP5T9nIg7qgMM2ZNOfdySiVA/J1mt+XJt9i7XcZokaxV79TAzU
 yRcA==
X-Gm-Message-State: APjAAAWXyiA+g/S45GKycd87uWwBJ0VwHGtcXMpgvN7KCMRNR2PwE7nt
 /JfqzONWECPXJY6T4SzkP7LB6ONETjY=
X-Google-Smtp-Source: APXvYqxThCkDRP6EGlQmF9R4DC4kVnMAodv4rvCLvKrIbCeIrNU4+BLtKDrzVZu6CedepBM3wRJUKA==
X-Received: by 2002:a17:90a:ca04:: with SMTP id
 x4mr38341944pjt.103.1574062639600; 
 Sun, 17 Nov 2019 23:37:19 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id ay16sm23001911pjb.2.2019.11.17.23.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 23:37:18 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Mon, 18 Nov 2019 15:37:07 +0800
Message-Id: <20191118073707.28298-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: wm5100: add missed pm_runtime_disable
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

The driver forgets to call pm_runtime_disable in remove and
probe failure.
Add the calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/codecs/wm5100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 4af0e519e623..91cc63c5a51f 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2617,6 +2617,7 @@ static int wm5100_i2c_probe(struct i2c_client *i2c,
 	return ret;
 
 err_reset:
+	pm_runtime_disable(&i2c->dev);
 	if (i2c->irq)
 		free_irq(i2c->irq, wm5100);
 	wm5100_free_gpio(i2c);
@@ -2640,6 +2641,7 @@ static int wm5100_i2c_remove(struct i2c_client *i2c)
 {
 	struct wm5100_priv *wm5100 = i2c_get_clientdata(i2c);
 
+	pm_runtime_disable(&i2c->dev);
 	if (i2c->irq)
 		free_irq(i2c->irq, wm5100);
 	wm5100_free_gpio(i2c);
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
