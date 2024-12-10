Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBC59ECB40
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:32:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA4B22BC1;
	Wed, 11 Dec 2024 12:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA4B22BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916733;
	bh=QfMAQ3ObJOM7gWSlinrrpwhjt1hderzxfmdZZzAXUok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lu19MzZM52btmP7dC2Ga3LR2Ls2g0KbP9exAqJ5tWMDNJ+BwYGixE+D3mO8i6IGR3
	 PoWlU0D49/tNBsXJHd7IaN/siS+CM3zU22ivdRByvib+uXCiipzECl1r1JfipNT5mJ
	 Y88BFTozeEO9yDMsnugv6DD+jVpeec4ImtYOUR98=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A12FF80CB9; Wed, 11 Dec 2024 12:28:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF4E4F805E7;
	Wed, 11 Dec 2024 12:28:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C5C3F80482; Tue, 10 Dec 2024 18:11:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD809F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD809F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=U3ghXJHc
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso4040636a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850641; x=1734455441;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UysEDL+tYPOXb/CerEK2e/yd8/mnBKQO5ExCdaAA4A=;
        b=U3ghXJHcEbY9e77L9MXiX+p8CLh5w2pFyGBCzw38WrmNBWkioVVB/wTa8FO1Kc4H28
         RjEwfQweb3aFAOvHBWJCvjJEXKBpdZVZpkIPQo0zW7ppuMxFSkxs7VRtpEjWqPz7HEth
         HoNkqO+0OjwNqjWDmqQWaidyUGI7nAL+46g7pDSdd+hB/kXe7GJgL3vhkVooT8Ovd/+o
         wRIC3fbN+p3WEMLI4eB9ZRleN+7sGEY/46gdFm3eEFsQs9hogGWJj9mcqWoH1dsuwHHc
         /lQ4bay+8a4X3dlkEc1VLhM5lr6rjy4WRLyP3TnC6FduBFEzWuiC0rwcYoEApD2UKn/I
         xuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850641; x=1734455441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UysEDL+tYPOXb/CerEK2e/yd8/mnBKQO5ExCdaAA4A=;
        b=nXzmS8PHG3khLJVqDZ1pGhlk8q3wSbKFyGTE/Q8AxdZfa4605sHUdwsb+o+Y6LhyHE
         gp7T1iHCq005ToDSjqxWIwBOk3zszf4Gf0R0qqIH4S9jTISZsBTa5uxGC96FFb9sjUvM
         Ndlq/pQ2YgX9CEyRqqLhMgnssKIiW0GeDsqJz5Ox0cy3Tk2kr+74rAXTVymIZnGqNe++
         /fTzWWtl9arVQlIFnR7e5Hh/ywLPafAgWWtzNvHBUaCsXFDSoBRyg93UeJGkZzrTU+kf
         4VIUd93xxWSEvWJdg5DYz4KXYa1g83lzChbJVVHKj5d7Yhky5gH3BoxJ6vwFBjH1vu0I
         8VvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAbZsJDkvozEEDR/rNziDsqWNPtZLD29drGcEbQYtyxWmN7zz1ICH1w/3ILh/1tr5uzZJkDSYhTDHi@alsa-project.org
X-Gm-Message-State: AOJu0Yxjm5CRoHvWRTLe/aSHK++bmNC3cQ0dklQIzYTnrQ1ex0HuZjYJ
	nn5Yed1StzlYbbHfi0QE8mjRaacy3sbRDeE5APzWga6LsY3o5m/i+86I+x7Dg2E=
X-Gm-Gg: ASbGnctsUa6wYicO0sFSQOE5qE3wcAkAKicfT+99L/o0v9hLJwMuyOUJogRw3YR5eXd
	JHgjTDDiMhGemTr+FwB6XAoAFi3p9fcvkyG/HEaQKmOfbZULHQ5zW2WRZw2QD3aws5mj585TNio
	JxosBk77P7+jU/Un/W2iXsbB4ZS9zvttgCjqNl9NMxB2FF1EZ9YPA6HelcCY2yxKIec7bDsTq6B
	/bwDXieww2yD54/32ln3DuhXEAwUIOF/suFoMtDSVcYrwxqsZav/Bs4YMVCo3ogVvIBw+LVoWS+
	z/yVvyUD
X-Google-Smtp-Source: 
 AGHT+IGDKksFRS7v8EJ79Qo0q8lVB55Bo0RkH6EDk6sqVxrrszOEC3HW/n36JzbvJ+iqRQS48HVTZQ==
X-Received: by 2002:a05:6402:35d1:b0:5d0:a80d:bce9 with SMTP id
 4fb4d7f45d1cf-5d3be71c114mr15442107a12.20.1733850640930;
        Tue, 10 Dec 2024 09:10:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:40 -0800 (PST)
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
Subject: [PATCH v4 15/24] ASoC: renesas: rz-ssi: Add runtime PM support
Date: Tue, 10 Dec 2024 19:09:44 +0200
Message-Id: <20241210170953.2936724-16-claudiu.beznea.uj@bp.renesas.com>
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
Message-ID-Hash: NXJWEVHUIWQ7F3623STZ2NE3MFWVIXIQ
X-Message-ID-Hash: NXJWEVHUIWQ7F3623STZ2NE3MFWVIXIQ
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXJWEVHUIWQ7F3623STZ2NE3MFWVIXIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add runtime PM support to the ssi driver. This assert/de-assert the
reset lines on runtime suspend/resume. Along with it the de-assertion of
the reset line from probe function was removed as it is not necessary
anymore.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index eebf2d647ef2..34c2e22b5a67 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1139,14 +1139,13 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		goto err_release_dma_chs;
 	}
 
-	reset_control_deassert(ssi->rstc);
 	/* Default 0 for power saving. Can be overridden via sysfs. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to enable runtime PM!\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &rz_ssi_soc_component,
@@ -1154,13 +1153,11 @@ static int rz_ssi_probe(struct platform_device *pdev)
 					      ARRAY_SIZE(rz_ssi_soc_dai));
 	if (ret < 0) {
 		dev_err(dev, "failed to register snd component\n");
-		goto err_reset;
+		goto err_release_dma_chs;
 	}
 
 	return 0;
 
-err_reset:
-	reset_control_assert(ssi->rstc);
 err_release_dma_chs:
 	rz_ssi_release_dma_channels(ssi);
 
@@ -1182,10 +1179,29 @@ static const struct of_device_id rz_ssi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
+static int rz_ssi_runtime_suspend(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_assert(ssi->rstc);
+}
+
+static int rz_ssi_runtime_resume(struct device *dev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(dev);
+
+	return reset_control_deassert(ssi->rstc);
+}
+
+static const struct dev_pm_ops rz_ssi_pm_ops = {
+	RUNTIME_PM_OPS(rz_ssi_runtime_suspend, rz_ssi_runtime_resume, NULL)
+};
+
 static struct platform_driver rz_ssi_driver = {
 	.driver	= {
 		.name	= "rz-ssi-pcm-audio",
 		.of_match_table = rz_ssi_of_match,
+		.pm = pm_ptr(&rz_ssi_pm_ops),
 	},
 	.probe		= rz_ssi_probe,
 	.remove		= rz_ssi_remove,
-- 
2.39.2

