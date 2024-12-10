Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A19ECB3E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23D923D6;
	Wed, 11 Dec 2024 12:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23D923D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916703;
	bh=Yz055MkA+pxfsMjRAkbTxtMOq7knGNv3D+SNR/Ylrow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PV8cxvsIF+Bq/PEF4Nh1EMp7Av5lBGLccVhhGwj6sVKYOF9olldW+1qtxSxLGDSKR
	 uaMBCuZIllMatWTxqMYakraqWpByGfxJBhdB1cQ0+yt2FTDzOBS3YTijg/o/zE4sW3
	 5Mp548rTu9pVAs5ssf5q39qDjM77v8v6AioNqozk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A3B5F80C58; Wed, 11 Dec 2024 12:27:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F1EF80C6F;
	Wed, 11 Dec 2024 12:27:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCB1BF80482; Tue, 10 Dec 2024 18:11:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A476F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A476F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=EnIVj3Ks
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8dd1so9452018a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850636; x=1734455436;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGFKtP/kqhSYwKWsXVqygeaqizf9KcZRKhKS1yEgkJI=;
        b=EnIVj3Ks3r/ec5OFaCHzQf5z+dpadP32O6J6fJ2Fh4IGIBBaPA3FB6qejlkglUQLaQ
         cbf7HPrT+vreN2UaN0iLZxrasQggQgN2CosfpwmKbe6CV5qy5qT0AXsSCV+qtyKzdxGM
         Ag8wHcNh0VlaPrAVMhJjE6stfHPs9IPPZgGnArUUKwBHeFHdd+1GTr9CagqBHICx5uOF
         U/pMg8mPemmxo4fEAW8/8tkIoyKM9Ymxq/XJvJwPwQPM09aia1W0FNlCs6cPYaK1V6dB
         1OdJxYNTXb33YAHu4e+I7SPwfMH0GbeOd81KoQ5J4NBWyGHK1E06Av67kE+B8qZ/x4Pp
         +mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850636; x=1734455436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGFKtP/kqhSYwKWsXVqygeaqizf9KcZRKhKS1yEgkJI=;
        b=iBoJLBQSizD80hllpiDLXSN24czIGCGP0rSkhoq6SM8Nx+DlRDu3IcofAcFK6kRCQc
         6/ZlToh1z5pNLx2MUoDBCGI1aMKX0uQ+RnJzdvD+fdz5yNfNrhTzGW4+jrIcqMEDPqKK
         UPYVa49G2JdRjdBniXBSNa6tnzz7/c1Hexi0VUXTe7Gp5AZPORwLC6FVEbXGOMd9uiZK
         G2151XlZjazF7OeDHeK4sZKKNAAsUi5ter1J1DgWGjS9ltLdPWS9jL9EyK1/OcD1Cvir
         /vm4/ZcO7qtDAQfUyXr8EQ9Arx765ukyl5R6Nu5YzQPia8w86jMBLwJf19rR6Nwq29rE
         jupA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYHB3C8KWub/N/nsGecbfkJUkKmY0U4y9iYj9a/GEH37UHdg5rBbYddR1xVArmxKLLWmLPxBjadSI8@alsa-project.org
X-Gm-Message-State: AOJu0YyuQ7aw5uP8Dz10EVKQmadUxwIIOJudMyx+t373YqfSYQv8woz3
	K//227JPuogo/plLBJd4oltNbMmgkcTVU3FMnOyz4+SQ9E63RBgbh+k6aNVjS+c=
X-Gm-Gg: ASbGncucUZbnbhJqR00J0N00ui/YkT8m+DJlnaH9WTVPp2y1RjpxvZuzudXzgAaD53H
	6VNEvB6RCXav9vvqwfAfp/nSupdClAANCWff3lVN4WEXmIRWTGCAVLbzRrsnJMes5AW3KrLJEfN
	w0ZK+yWnnVZTlQQ9wwxlPnwoL3ZTxurktjkw5XFfH37OZFZqV6ygDEyVMWWy2AZOPsKS5UlydPO
	lgTg2pzvoY7n+AUh7umyXhiewM+iKmNS7glumYOcWxX0TG3vlTDUTxNpSVk4t9CcSaXubkh8ANq
	Pd9+ZB7W
X-Google-Smtp-Source: 
 AGHT+IEC55JYbSGMCcanrVtAVCn++NmOM5lxtdpdi4NfwxaJizcleFUS/sRGsmrPp5CnJom5vv0rQw==
X-Received: by 2002:a05:6402:43c5:b0:5d0:b51c:8479 with SMTP id
 4fb4d7f45d1cf-5d3be680125mr18546630a12.10.1733850636238;
        Tue, 10 Dec 2024 09:10:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:34 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 13/24] ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to
 runtime resume/suspend the SSI
Date: Tue, 10 Dec 2024 19:09:42 +0200
Message-Id: <20241210170953.2936724-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6R4IEC7OPL7TRORNC6D3TLU4KUFJLM2O
X-Message-ID-Hash: 6R4IEC7OPL7TRORNC6D3TLU4KUFJLM2O
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6R4IEC7OPL7TRORNC6D3TLU4KUFJLM2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The ASoC subsystem takes care of runtime resume/suspend the audio
devices when needed. Just enable the runtime PM on the SSI driver and
let the subsystem runtime resume/suspend it. While at it use directly
the devm_pm_runtime_enable().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 209b5b8827e5..878158344f88 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1140,11 +1140,10 @@ static int rz_ssi_probe(struct platform_device *pdev)
 	}
 
 	reset_control_deassert(ssi->rstc);
-	pm_runtime_enable(dev);
-	ret = pm_runtime_resume_and_get(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		goto err_pm;
+		dev_err(dev, "Failed to enable runtime PM!\n");
+		goto err_reset;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1152,15 +1151,12 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_pm_put;
+		goto err_reset;
 	}
 
 	return 0;
 
-err_pm_put:
-	pm_runtime_put(dev);
-err_pm:
-	pm_runtime_disable(dev);
+err_reset:
 	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
@@ -1174,8 +1170,6 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 	rz_ssi_release_dma_channels(ssi);
 
-	pm_runtime_put(ssi->dev);
-	pm_runtime_disable(ssi->dev);
 	reset_control_assert(ssi->rstc);
 }
 
-- 
2.39.2

