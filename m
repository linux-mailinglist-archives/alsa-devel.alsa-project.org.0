Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDF6130B2
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:49:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D761672;
	Mon, 31 Oct 2022 07:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D761672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198944;
	bh=g/ixEMSnORQnWkGRAB1uubyQ1s+GPqojKJiBg1X1pPw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNwckMKC8CZR4INcLy7KDA3iwaGhFR0Bma1jvd6LNhxtF69lVk6otwz1vWDms8c0T
	 A9Q6u1iw6+hhyyvE7aPQ4Ynf4SidHHukHPL631avYNHcURiJRAui+xGnrMdBuZIyfe
	 8ENsPUFrOVmcIG1FRF2nOS+F/3AvsysCgNIWZyRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 578C1F80587;
	Mon, 31 Oct 2022 07:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E566BF8025A; Fri, 28 Oct 2022 19:34:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99076F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 19:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99076F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="Scyhmj02"
Received: by mail-ej1-x62a.google.com with SMTP id t25so14589035ejb.8
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXgFQ2AiirDn7ylvDdK02G7QYybBypCEVhzqiAXGlxg=;
 b=Scyhmj02CKM5yxBdbaYtrAYm1fwrxtc4tLIwSA/sRtHag12CtQy2AjaU2237oxsWZZ
 lop/DZe74+wPugi3WBwjHcSgWRIREq0aoa4BTgpCdh3eHEuFzCY4/zGdiV6W8Z5AbIRM
 QEAqkNt2Xj5VweRGQyCNodWQ2cr69+tVh7giqmXV+LKeahpntt6CD8KkTPWShlb1sbP3
 XpDdj7ZUkpc8KQggPzg9gv0H8NBq3KnP6z6toMt5HXEPZNtVK1fw1qTPWBE2X5srE+Bs
 vmJMbhn5+FgUDKrMLXZASwoAkXQGud+D3HMBxb0SUqHgIPpo2kG8HOUSGpdrOzXVjxxK
 h0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXgFQ2AiirDn7ylvDdK02G7QYybBypCEVhzqiAXGlxg=;
 b=W1nlxFVOamKVTUrzBfCldB8nu6fi6vmcfLIdHOhvFumkOAMTxg+RzU6pAnlVWwvrhN
 d7i0lzLjuUR7iIwLtO4B751CnmcJwHJvzKj67lpNgZmVr2x4r5KaURftjoezH36GV7Hj
 B4hUq1FqzUWiexrJXzSLifEB+bCMM0V2b/GDFhVpQOHGefjnvaaPWFw4VoU0BkRon9vS
 36lnx6TVxxfwotCuLyiwsw3NwFf+EWC8L8REpFPPmEuEiYwOveuKzAXkCx/kZVqCzBP2
 QZiNy1f1FFk7Qt9PXQRDPZTulKqm3u1s12prAVX8Nz4vXpMNwwEfaP5xntDJHSUg37s4
 vhkA==
X-Gm-Message-State: ACrzQf1mGF5WFU/BhyxyUWkHUOwtbd6/6ukT7U4MLnVXERwHzj4VRgtS
 KvJJ2Lj0A8PvablV2rdkCunPlQ==
X-Google-Smtp-Source: AMsMyM43tumq4AVpXyo00mGeFeYdaSFpUgltayHAirnrZ1oFPURcmdLfFC4Anm4hdUD30bsqCUmHfQ==
X-Received: by 2002:a17:907:3da2:b0:78d:3b45:11d9 with SMTP id
 he34-20020a1709073da200b0078d3b4511d9mr407191ejc.87.1666978460491; 
 Fri, 28 Oct 2022 10:34:20 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 v8-20020a170906b00800b0078dce9984afsm2388868ejy.220.2022.10.28.10.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 10:34:20 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Date: Fri, 28 Oct 2022 19:34:04 +0200
Message-Id: <20221028173405.155264-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <Y1v68WuDck1oaVmk@sirena.org.uk>
References: <Y1v68WuDck1oaVmk@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 Maarten Zanders <maarten.zanders@mind.be>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org
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

When CONFIG_PM=N, pm_runtime_put_sync() returns -ENOSYS
which breaks the probe function of these drivers.

Other users of pm_runtime_put_sync() typically don't check
the return value. In order to keep the program flow as
intended, check for -ENOSYS.

This commit is similar to
commit 0434d3f4525a ("mailbox/omap: Handle if CONFIG_PM is disabled")

This commit fixes
commit cab04ab5900f ("ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk")
commit 203773e39347 ("ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk")
commit 2277e7e36b4b ("ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk")

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 sound/soc/fsl/fsl_esai.c | 2 +-
 sound/soc/fsl/fsl_sai.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 936aef5d2767..e16e7b3fa96c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1232,7 +1232,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 5c21fc490fce..17fefd27ec90 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1069,7 +1069,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMB, 0);
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 81f89f6767a2..e60c7b344562 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1446,7 +1446,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
-- 
2.37.3

