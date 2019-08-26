Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E524A9D58A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79AC016BF;
	Mon, 26 Aug 2019 20:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79AC016BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566843067;
	bh=YNESQM51czk2CIi08wzCgfrRtTBBNIeSGaSVCH4wlwE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SowAWRTE4T4q7C1u+87IWLXIUmnFPKPmNp+cXHMPK34yczGhusAK7URn5mhyda2FR
	 FiU1x5PbUcEbEr87FqYIMa2GrqiDg0zhnAX8PRDpAHr03HiBgBUnhSseZHk8vv7CkV
	 Kh2GgSNkJY1mLqGhpz2tUvg01vDUSUd1zs2jqUV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A8EAF805E2;
	Mon, 26 Aug 2019 20:07:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49109F80390; Mon, 26 Aug 2019 20:07:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C073BF8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C073BF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GwyfHcpH"
Received: by mail-lf1-x144.google.com with SMTP id n19so12970735lfe.13
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/7Ac+4X6tEO+jpy2vLz06LyblKHxTeQKnAx8UL/5B8=;
 b=GwyfHcpHh6oCnOObXxprhf+5ZJySN4hhx4pk0Sfe4JaSQbx2PWs9c+R43Ast0qnzoE
 LcwntTn4M3aJIAuL3KYpk9Od3Dg+XmFowEempsIwPBGnd9R/8B30Vox8n2jrJZgNqdjg
 IeR3b/03SRv4FV10zzkl6pBWJbPoGrM/a5yPavLCDNoQKVXQbtep+q0HCzmTc7/G/M+f
 qwC0oLckmd8bIeU/IDJb0jjeN3i9HBL11iHIynCLwl+3mm0L0kpUsXZ6jugjiZAUgniU
 XC/HioTr/phLLSjNCYaqeaJjc+mdMfvR6IOZ/SM7Rqa4jIb5qpIbYLf4JRd972wjeeFZ
 BRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/7Ac+4X6tEO+jpy2vLz06LyblKHxTeQKnAx8UL/5B8=;
 b=Qp6NE+NoWMey4dd/PzpMTKqpZcYXZjiML3McCQL/jiH7MlxnFTwPxPaBQFWXcYPFnT
 zwokBrbTZkpU1RRZVZniB2jiBWJ8rZJCsv8O2rs8teo53gKmuV07VTmvbMuMJKkdyskG
 MLQJDLbK65gKg7aRbaqzbtHCPjaPEkzqVnL8g5tbeF9OxqHwK2/HLygaVOc8BF6EyKE9
 SFqvlH8ZFrZEXrmC6TgbEhhd2nLiP5f+MAICkLImV4PdBmOX8hAlJY8S60mbNuM3X01T
 XiPZdpvXcSxoyVDntLPSbLv13yFoBgpIkdz6dW/M5HC/h4TH74j1eX2asleEEAuGtEb1
 Dpww==
X-Gm-Message-State: APjAAAWmW+kO1BA/Hi3j4uEIcCCo3ODA6ToPM/Bem6ko70Z/XjRHgK4P
 IeMPuqvuhYBEII3vpEk9G7c=
X-Google-Smtp-Source: APXvYqzMGtg6mqhU7IhdflXEfGSyI6kfm6cUUGMijAWKYBGqX9ttFftleyS3u/IvkUS1sQRh3Ba4Qw==
X-Received: by 2002:ac2:44af:: with SMTP id c15mr12669898lfm.32.1566842860391; 
 Mon, 26 Aug 2019 11:07:40 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id u3sm2215564lfm.16.2019.08.26.11.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 11:07:39 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Mon, 26 Aug 2019 20:07:34 +0200
Message-Id: <20190826180734.15801-4-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826180734.15801-1-codekipper@gmail.com>
References: <20190826180734.15801-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 3/3] ASoC: sun4i-i2s: Adjust LRCLK width
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

From: Marcus Cooper <codekipper@gmail.com>

Some codecs such as i2s based HDMI audio and the Pine64 DAC require
a different amount of bit clocks per frame than what is calculated
by the sample width. Use the values obtained by the tdm slot bindings
to adjust the LRCLK width accordingly.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 056a299c03fb..0965a97c96e5 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -455,7 +455,10 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
-		lrck_period = params_physical_width(params);
+		if (i2s->slot_width)
+			lrck_period = i2s->slot_width;
+		else
+			lrck_period = params_physical_width(params);
 		break;
 
 	default:
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
