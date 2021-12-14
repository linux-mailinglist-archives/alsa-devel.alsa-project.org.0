Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D692473AAA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:15:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7FB1EED;
	Tue, 14 Dec 2021 03:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7FB1EED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448121;
	bh=WlBZA3hOwkSnvjYnMyM/xT2LOEuYLWEibGpivmPSmf4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e9ZPFBDIHgpoShHQK3PqEqyzPY5jE9bTMQshzjmm7hGJHu4PLapSbDJgv2gn3C1jy
	 OE+v+WsmDAVw2f9JRbK3p/zp5p3Vd6bQmrRG9TxWRqzmAAviKyA6LYw5/p3Qlc42L+
	 qP4zGMocM0yFihtDqftcJ520xmVd03rs9KRwzQY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB69F805A1;
	Tue, 14 Dec 2021 03:10:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C82F6F80566; Tue, 14 Dec 2021 03:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AF92F80271
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF92F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bS9lECcq"
Received: by mail-pf1-x436.google.com with SMTP id k26so16559113pfp.10
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gWLNyRd+QR94H4OPXuxp57vguJN59LfbMWiwC+2REnc=;
 b=bS9lECcqcWrBGRfgBF4EDrgXb1QfA9MlFtMPLNQz2e/dC0L6MN0koSnfdYrq5+SdBU
 kMZTvBb+skhgq+5oxfcRPcqbbXNnXm7+DbBaFZfMk8Td41DSkGG72gvbcP2IPuOECfph
 h6++UrdLxWR1gwSM6kkzRClFxs1ph6QZG5Z1IyfEuzJpvyiX64LIlxocFH/H0tz4XSzj
 FHs7FFWUwBv2GEYnekVajwT5whLnrQrITcRi2V6qaWEyVvK/u39gukFyFCV+iiqWBVP5
 B/4EB1Ux3rbPVJ+MQT8yG9iALK4tT5B+TwYWBit0eLLR2NUTu//rp9/OXLy85qb2PBmD
 kNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gWLNyRd+QR94H4OPXuxp57vguJN59LfbMWiwC+2REnc=;
 b=MJQkX07zfutHqr4FPMldrnL9LRtfSX6SlJ/i4VtVKgfIhE1geRaPNAs9pBnLRPVCCg
 q/MbslhVoyzOrnJbeWAT8mP8etU11398ueqMvbWrFSq69Y01X3HhS00IJkq7hos3K/uq
 X1euCM3Oo8zOPN9ZjYZlaknAhsyuxIYzvPJdLOIaDNmD0jbeZW9P3Rp6CvcEpkTq42l9
 ffEZS0ENURt8GXhmN33BePteJXAC+gl+Y/lZTSpei/mK0oKc3UbKcEmhNgtwpkuEgvFt
 Zsm61AXBKfWY9UHLWVE1ez04lN7T1wCmmVgpsMUKf5elwRHbCNNKHwPr3H9b7YohIC15
 N8wQ==
X-Gm-Message-State: AOAM532zEY90PYLwHEE8TXRzDzByq5xBFtbXT7TRIi3s06SyIRX9eAU+
 7NK5gNpmHShqpDa5lAxetvoWjviz7ok=
X-Google-Smtp-Source: ABdhPJxxzFTdcCFg0UBHRKdA/ZelC1gl4XSw2BsDR7I4vGigRpiNxdmy0oFJgFTqESPe3HQ3kVkfsA==
X-Received: by 2002:a63:d608:: with SMTP id q8mr1697569pgg.84.1639447786840;
 Mon, 13 Dec 2021 18:09:46 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:46 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 17/22] ASoC: mxs: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:38 +0900
Message-Id: <20211214020843.2225831-18-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index a6407f4388de..2412dc7e65d4 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -160,12 +160,8 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
-				ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 
 	return 0;
 }
-- 
2.25.1

