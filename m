Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4221E5D08
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 12:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB4CD1791;
	Thu, 28 May 2020 12:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB4CD1791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590661325;
	bh=I9xjtLDSSEu3YHWuIRwxrjixFmFWxjTzm0+X8eMVGkA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vbWbZwGAFgrndlBv06EWTlg3mVE5Ot572KcpqDi5hcSs0LlgfWoJPvHLrJ1ZIakFR
	 B0OPZn3DNQBfci9cZSLGbb8XcehNaJhktNn4TyHKlopr0DeizNkcPepKqY4MzEDGIt
	 FPoNwMKTCY2J+qwoVFjV6K8qOTpjMR7YcKp6gCS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 143F8F8014A;
	Thu, 28 May 2020 12:20:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF04CF80150; Thu, 28 May 2020 12:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6B51F800FF
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 12:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B51F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fine7BNp"
Received: by mail-pg1-x542.google.com with SMTP id t11so13270286pgg.2
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e4iqIqjqfcu2jYuHJ8gHDSAYpn6BV5cK7NWla5/OpCc=;
 b=fine7BNps1tLaqQpOkYNnOzDQ8/3ewTYSNJNWmUlgZB+nOK9oFRr6YO+6eNAYgefpj
 3toBPNdcodrpawwGpPOxJ/z7QtFW2O/syKMeDQ33u37dXb9HNvsJ4JdVhtqhlARAbems
 IP0PMiW9mI132tXfYZwvp2J1KqunBZ+zIewl6NoNpa6ltMsEgdwpBSNEj7U9rWm2ggqX
 +H5YPpSRz7ZT2uI6l8AJlBai98juS7J36UFJIX1NAwkWUTzrhFTv4eit7R0S1zfkhWgb
 QMPW7sCxJLGoelFNNXt4TdFb8eM/oWBAWa8tblL/cnU1h/zqN/meyLpK/M0FT3Xxeunl
 NgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e4iqIqjqfcu2jYuHJ8gHDSAYpn6BV5cK7NWla5/OpCc=;
 b=g3dDuxdmWUmq8wq5rfGSVRh0pC8TN8TOqVFd7wCBC2IZY09CEHKQpX64eUqVkBSOfN
 CKP1gsM38Yvd/xwnXPQ9Uhh/Vm6TaBkgLbJXvEA3r1VujOGx/Ht6wvsrm4D7eAfNXF5i
 Rd4mUWVhE30Zwpbk+bjfin5a+FpUbYRXFB89CymTB7SSxIKTCwRiTOgh0Jy56M5YjqkO
 hIOcCu5tjh/XIiJH6qKZXNSF9cDPlBZTGX03S2RLAulwoSSzTGrXW40DitV3vP7VoOYd
 fO0MRxwig+HPKMC6JBXqC37BGLhwRzBgL9C5d2r/iyEYMPd0vrQ135+wmNNPHuxxji5R
 8T0Q==
X-Gm-Message-State: AOAM530Is7g4rEHvNjYeJ1LUIjvTZXchivT/xS2uOk8EEfNervytANX7
 U2hRND8wxd+8vWqSmFMKVe4=
X-Google-Smtp-Source: ABdhPJwZuzNh6gjiqrMSHdQWV+rwqRu9NqCxiEoWpsPOyQ89Kk024C4ub7WOXC3CrVTFr3XeFqJzFQ==
X-Received: by 2002:a63:d307:: with SMTP id b7mr2317587pgg.219.1590661214793; 
 Thu, 28 May 2020 03:20:14 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id o201sm4643579pfd.115.2020.05.28.03.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 03:20:14 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] ASoC: sta32x: add missed function calls in error paths
Date: Thu, 28 May 2020 18:20:04 +0800
Message-Id: <20200528102004.911653-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

sta32x_probe() forgets to call undo functions when it fails, add
the missed function calls to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/codecs/sta32x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index db4b3ec55311..e9ccebbc31e4 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -893,13 +893,13 @@ static int sta32x_probe(struct snd_soc_component *component)
 				    sta32x->supplies);
 	if (ret != 0) {
 		dev_err(component->dev, "Failed to enable supplies: %d\n", ret);
-		return ret;
+		goto err_clk_disable_unprepare;
 	}
 
 	ret = sta32x_startup_sequence(sta32x);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to startup device\n");
-		return ret;
+		goto err_regulator_bulk_disable;
 	}
 
 	/* CONFA */
@@ -983,6 +983,13 @@ static int sta32x_probe(struct snd_soc_component *component)
 	regulator_bulk_disable(ARRAY_SIZE(sta32x->supplies), sta32x->supplies);
 
 	return 0;
+
+err_regulator_bulk_disable:
+	regulator_bulk_disable(ARRAY_SIZE(sta32x->supplies), sta32x->supplies);
+err_clk_disable_unprepare:
+	if (sta32x->xti_clk)
+		clk_disable_unprepare(sta32x->xti_clk);
+	return ret;
 }
 
 static void sta32x_remove(struct snd_soc_component *component)
-- 
2.26.2

