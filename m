Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30B69B2B7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 19:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D045FB5;
	Fri, 17 Feb 2023 19:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D045FB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676660140;
	bh=Z5j4RvX6MPZ21lsIKptv4vjuccT1mz4R8SJ8IYnAW3c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tz6RfvqjXVJMB7E+hUVdw/bsNk9Yg6Ystk5g6QjO4483WRBQiijrkdkk54UhcKKiK
	 7TVTS2kd+aYgBLuzkMx0Y62md2SGLMcZ1QeuMsP7tbb377/NDbAW7COMSdqrAyGrMR
	 FiV55qESAr2+TPk1zMagCIxusTzl8ReC993OPAX0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4833EF801C0;
	Fri, 17 Feb 2023 19:54:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F88BF804B0; Fri, 17 Feb 2023 19:54:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44659F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 19:53:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44659F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DRkvBo8H
Received: by mail-wm1-x32c.google.com with SMTP id p22so1661318wms.0
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 10:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A919F9IBosDEaWyCb/73T8vE9zvjGLy6ESUu/4zI1k=;
        b=DRkvBo8HrqhoNEnVQkJijyoTu4tJIpcPAcLm96lSXnKe5xjMxskZREzRJzb/hRRdI7
         7u0VP9Zi3SVJrx7MdavpnGlnDb3GEp3MmB6AA5yMS1+GqBhQhhFhKeu+zr6ONLlmRX9C
         bKZ86QaFOnCExdeuq1xDZq+vrGp3q5gvNpXwgloaqbEpzIRg7R4SDOFsiuE0HA8M2Htw
         /a81hWYdu2EnySIyoC/wtphnGM7I+hsWhUaBIJ98thnhJwabHOGfV0wfsecblEGNJaL9
         x359qx8rdyAQiUX4hV97NI7wvr5zEPUs7MvFlF0rzujfxXWKV9jU9/lrw/YrNcCy/lbb
         xbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A919F9IBosDEaWyCb/73T8vE9zvjGLy6ESUu/4zI1k=;
        b=Mud+/mkCN9naQDejERQQljsIH8hObx+cOfnLWLJDSYuqcpioIdZ6xQALuTDvAAixkM
         TqeAWS1HoRY1ywtaPxWcX0JH+Xi2vr3bRKA7bAQeG8t7ERKFT+zaSQpI2HwLKiH4kQIO
         5ihn66vRDKfw+c5ysLAdaNzzzdqT+L0/umDeLIxX8y5MBG7tlgC7pQqqlNL4UljYZJMr
         ZcMXlBhW9Dk2+Pm9+mzgSPTl0B3mPOdO5pUA5btL8J8D9rfjsNL7dPIrCCl9GwFP8q7y
         Celu216Dkrip42+1E5ExDmSvDRkNIBQ3PSVNi9kQQVTiQ3hAHk3ag+QfnMB0sUGQQdFn
         t7mA==
X-Gm-Message-State: AO0yUKVagXOCu+uZKjTDCWe93AxFNSscBZNO1Jo0jSMcZE03k3D/Ya6Z
	kn3EQ+FUTDCan0TlGFX4p7g=
X-Google-Smtp-Source: 
 AK7set9e9Xm3a3p0mdhhU+9BZol1f16dYjY64XmBIuqiYSW8Vh5fuveUKOhMZlqOed8cGr/wNmFWkg==
X-Received: by 2002:a05:600c:44d6:b0:3e2:cf0:4087 with SMTP id
 f22-20020a05600c44d600b003e20cf04087mr5482571wmo.32.1676659978386;
        Fri, 17 Feb 2023 10:52:58 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d8bd:e692:c27f:c09d])
        by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003db0ad636d1sm2964514wms.28.2023.02.17.10.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:52:57 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/4] ASoC: sh: rz-ssi: Update interrupt handling for half
 duplex channels
Date: Fri, 17 Feb 2023 18:52:23 +0000
Message-Id: <20230217185225.43310-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NRE42EP6ZDSOI5X3NPGP7VZZSGQHGJRK
X-Message-ID-Hash: NRE42EP6ZDSOI5X3NPGP7VZZSGQHGJRK
X-MailFrom: prabhakar.csengg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRE42EP6ZDSOI5X3NPGP7VZZSGQHGJRK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For half duplex channels we dont have separate interrupts for Tx and Rx
instead we have single interrupt Rt (where the signal for Rx and Tx is
muxed). To handle such a case install a handler in case we have a dma_rt
interrupt specified in the DT for the PIO mode.

Note, for backward compatibility we check if the Rx and Tx interrupts
are present first instead of checking Rt interrupt.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/sh/rz-ssi.c | 63 ++++++++++++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 5d6bae33ae34..d502aa55c5a8 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -109,6 +109,7 @@ struct rz_ssi_priv {
 	int irq_int;
 	int irq_tx;
 	int irq_rx;
+	int irq_rt;
 
 	spinlock_t lock;
 
@@ -565,6 +566,17 @@ static irqreturn_t rz_ssi_interrupt(int irq, void *data)
 		rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
 	}
 
+	if (irq == ssi->irq_rt) {
+		struct snd_pcm_substream *substream = strm->substream;
+
+		if (rz_ssi_stream_is_play(ssi, substream)) {
+			strm->transfer(ssi, &ssi->playback);
+		} else {
+			strm->transfer(ssi, &ssi->capture);
+			rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
+		}
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -993,26 +1005,39 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	if (!rz_ssi_is_dma_enabled(ssi)) {
 		/* Tx and Rx interrupts (pio only) */
 		ssi->irq_tx = platform_get_irq_byname(pdev, "dma_tx");
-		if (ssi->irq_tx < 0)
-			return ssi->irq_tx;
-
-		ret = devm_request_irq(&pdev->dev, ssi->irq_tx,
-				       &rz_ssi_interrupt, 0,
-				       dev_name(&pdev->dev), ssi);
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
-					     "irq request error (dma_tx)\n");
-
 		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
-		if (ssi->irq_rx < 0)
-			return ssi->irq_rx;
-
-		ret = devm_request_irq(&pdev->dev, ssi->irq_rx,
-				       &rz_ssi_interrupt, 0,
-				       dev_name(&pdev->dev), ssi);
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret,
-					     "irq request error (dma_rx)\n");
+		if (ssi->irq_tx == -ENXIO && ssi->irq_rx == -ENXIO) {
+			ssi->irq_rt = platform_get_irq_byname(pdev, "dma_rt");
+			if (ssi->irq_rt < 0)
+				return ssi->irq_rt;
+
+			ret = devm_request_irq(&pdev->dev, ssi->irq_rt,
+					       &rz_ssi_interrupt, 0,
+					       dev_name(&pdev->dev), ssi);
+			if (ret < 0)
+				return dev_err_probe(&pdev->dev, ret,
+						"irq request error (dma_tx)\n");
+		} else {
+			if (ssi->irq_tx < 0)
+				return ssi->irq_tx;
+
+			if (ssi->irq_rx < 0)
+				return ssi->irq_rx;
+
+			ret = devm_request_irq(&pdev->dev, ssi->irq_tx,
+					       &rz_ssi_interrupt, 0,
+					       dev_name(&pdev->dev), ssi);
+			if (ret < 0)
+				return dev_err_probe(&pdev->dev, ret,
+						"irq request error (dma_tx)\n");
+
+			ret = devm_request_irq(&pdev->dev, ssi->irq_rx,
+					       &rz_ssi_interrupt, 0,
+					       dev_name(&pdev->dev), ssi);
+			if (ret < 0)
+				return dev_err_probe(&pdev->dev, ret,
+						"irq request error (dma_rx)\n");
+		}
 	}
 
 	ssi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-- 
2.25.1

