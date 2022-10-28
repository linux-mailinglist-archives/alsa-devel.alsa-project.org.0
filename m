Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C3D6130AF
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:48:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0197163E;
	Mon, 31 Oct 2022 07:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0197163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198926;
	bh=eDfnVQbGCSxNEvV83PSX2uPG9JaJdFyA/NO1U0dAUnc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIFBK/yJ4VaOpaJ+PNq+4Hum2rGuwN681DJWLLtXUV4+PmNi3Rmxbho/ik9LGI+SJ
	 ZuM1MU1JgFPYlseJ8SjTOu1xp9xg+OH8/+WXhwFfsOfDVLHVY8PFim4LZMoikhHHjB
	 NciBSaNHGN8CNbN6m77R7hoMe39tcPVuk8rBjsRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E86F80580;
	Mon, 31 Oct 2022 07:45:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81541F8024C; Fri, 28 Oct 2022 17:46:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 575AFF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 17:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 575AFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="b7KpZsfq"
Received: by mail-ed1-x52a.google.com with SMTP id f7so2774799edc.6
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9dtDrkTtJDWiY55QD7A/AEXd7H01h6LFKl1oWBL6fQ=;
 b=b7KpZsfqzkutWlZGik4MAB1Tx6dfC3eHgxL5t+NdtcgaRf3bRJlJmpysb/wWaxN3uV
 O4fiJWluRqxiZGZkVAeZN95K960I3FdolJKeE6hrTrREE/C1FWpCylkLwjAnL5eUy+Rm
 cu51JQj0wsZSQz5IhNg22FlJln2wsMmaUqJKXyZgyiT7jIAh3EIEaNMUYx/fm5yK+XhH
 qD/NUodEX9yxxkKKY+s/cVr6feGYrVfzuhvT0g/lDAEJHkiXqqcIgeoa64GshzeL6c+O
 V4FxWupBqrgnm9yejdqyzW6K9Cv139uVN5D5WJNQUFm+9eWR162wnk8PPJ7a6LMlE8B6
 gDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9dtDrkTtJDWiY55QD7A/AEXd7H01h6LFKl1oWBL6fQ=;
 b=ssfS5Z1VfthVWuzkjkqJbnkX+umlUUrT6q1Ciw0JQmdABeJZf1zNwFG5xRE995reil
 zWRptYOnvIiM7IX7zIjK0O6L7LmoQO50F8lSVF39RrhgXCVzXc7eFkANz8xYnUX59hvw
 81jn3MxlIvpf7aLFjYvuz5NghNizAEi86IUuMt7Y0uzvqG1PPGBq9roJFn3906/G0iJy
 Gt9CQLiChj5blClyUJ7NedqrcNan/9IrvAJy1W3cZDazm3WbZkR77WPgTC/Vv2Cuwd0h
 +/s5hDX966TqXJgCR/FH1GwGQw9/lVb7XMADPsXyVIffMTF+bF1Vr1aBpYVOW3wg/2Po
 ia0w==
X-Gm-Message-State: ACrzQf2OJwLozE1f12XZcQlgtTlVegMkCbhmbAs2JVZ+7QLxmSjArTgP
 mwOGMxM14P8DkDqx4msllxj2Yd0WUJkQRScgznQ=
X-Google-Smtp-Source: AMsMyM5dyCd1eEohQv62c02F5R5xcIrjosFu9rz+3oYRdB87GVstKjFzAVec4TcpCWzH0Wqqpc7mRg==
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr26705edp.311.1666971964506; 
 Fri, 28 Oct 2022 08:46:04 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906309200b007a23fe14442sm2329092ejv.195.2022.10.28.08.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 08:46:04 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Date: Fri, 28 Oct 2022 17:45:34 +0200
Message-Id: <20221028154534.112175-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
References: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

