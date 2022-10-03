Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682905F27D8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 05:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029E92859;
	Mon,  3 Oct 2022 05:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029E92859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664767599;
	bh=Xu05ypTLyqba2pxH4BKSldxLeFVk6t+2OBxiernWDrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t94f0vT3uTk9aX/oJ5RFZIFn7yyBKa9+hrIwEW5CvdhrXAIOA8/20U1kSRLrNhVxR
	 U22Ahpt8vS7q45u+3ZSg6GXnc6BCYKmBy+tkmmGZqT3nOO97GugsRZ0LS+L/tfGDXH
	 TUjddTQLhe8WXamBQ8F1u39d7721rJynjHn2UUPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B02F80553;
	Mon,  3 Oct 2022 05:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC3B9F80548; Mon,  3 Oct 2022 05:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA1EF804AC
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 05:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA1EF804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="iYhueGqg"
Received: by mail-pf1-x436.google.com with SMTP id d10so9103083pfh.6
 for <alsa-devel@alsa-project.org>; Sun, 02 Oct 2022 20:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8qat8MFOGsaBlJAMN6joW2Dl31wIftDix6DXZPpwSoI=;
 b=iYhueGqgEXQD0h9Rq56Zi0JzdYBV7XlZK6ggyp5xASvbpRwGq7M2xfNyg475iuzswZ
 bTAnMFYZWw7Elv+1pQJ03gZa0qFVRLzvN9SYhNOOyvVtmprxeAiPMJnZfBtGen+VbAlT
 OtLSL3bGIEcczmQiLJhAMh9Vm6Wh8VdNIlcgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8qat8MFOGsaBlJAMN6joW2Dl31wIftDix6DXZPpwSoI=;
 b=VsOROsWeMXZuf36hL0FhuJGS2dG+r6mNeGzyzCiErrxnmceLot/FPDIJx7obtA+CMd
 VXXfF5J4AIUgMqhuKBK4gtBx2vQ0CLUE2ZJ7JwTBHR78YdLGmIqsXg5+j1dVrQd8u+E4
 ZsBcsyOO8+zvQNU8P4BldsnP1/LGCJyXkCH7XfRd/eVZ7QH5tgdn1pXf09zpfbAi6x+U
 vmMBquJse0vcsw367FbIO+qiivmwGm9cebLKAaJWFjp38+14IruVPGr8gtjSk2PUIvBw
 5eydnuV/Kud2Laz55zHOinhIQG6vxJHr401dzfJsKYXkkl92Enpdp18/PeC3t7tdGKZM
 0juQ==
X-Gm-Message-State: ACrzQf30HCLpr8xXWpv4DMhu/C5lsNxswuKVjC8i3VvpFcr2T43bQ1Eb
 4PTM3HPDH9bSNEpf867zPY3MuQ==
X-Google-Smtp-Source: AMsMyM4m7ANca3Mqy/X9569Ol4YrR6liqnH4eA0Ko5EhrQvIgrYeHWiLvSBNUN/MAMi5eCUFAzolEA==
X-Received: by 2002:a62:e20f:0:b0:556:4265:5de2 with SMTP id
 a15-20020a62e20f000000b0055642655de2mr20655788pfi.57.1664767481421; 
 Sun, 02 Oct 2022 20:24:41 -0700 (PDT)
Received: from doug-ryzen-5700G.. ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 y25-20020aa78f39000000b0053e7d3b8d6dsm6157977pfr.1.2022.10.02.20.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 20:24:41 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/3] ASoC: wm8961: add support for devicetree
Date: Sun,  2 Oct 2022 20:24:13 -0700
Message-Id: <20221003032414.248326-3-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003032414.248326-1-doug@schmorgal.com>
References: <20221003032414.248326-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Doug Brown <doug@schmorgal.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

Add support for devicetree to the WM8961 driver so it can be used with
modern DT-based kernels.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 sound/soc/codecs/wm8961.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index 7dc6aaf65576..a4857024711d 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -971,9 +971,16 @@ static const struct i2c_device_id wm8961_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wm8961_i2c_id);
 
+static const struct of_device_id wm8961_of_match[] __maybe_unused = {
+	{ .compatible = "wlf,wm8961", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wm8961_of_match);
+
 static struct i2c_driver wm8961_i2c_driver = {
 	.driver = {
 		.name = "wm8961",
+		.of_match_table = of_match_ptr(wm8961_of_match),
 	},
 	.probe_new = wm8961_i2c_probe,
 	.id_table = wm8961_i2c_id,
-- 
2.34.1

