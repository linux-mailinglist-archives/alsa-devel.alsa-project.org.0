Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094F91340B
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 14:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28DBD93A;
	Sat, 22 Jun 2024 14:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28DBD93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719060686;
	bh=keK1XYJG51HSPMkUrZrJr9eY/iWHfg/MR+unKus+/qU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=k91BMivCeYuNtLD78IK/vZsKw3+mlFepXn8L3kn5t1wejf2DJMqiLSlxYkfCJ8Vx5
	 wtUYLNbpMdxw/w1UMCklhUg9DyQLJBkjmqAwoVVWjNE8jxwRhYgp12FjF6zj9k2JTD
	 Ll0ZafdFkw4lRk3Q5PMmNXkBFOJ85O01Cefp3Guk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E95DF805F8; Sat, 22 Jun 2024 14:50:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96486F805D9;
	Sat, 22 Jun 2024 14:50:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28A7F80266; Sat, 22 Jun 2024 14:46:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED9ABF80236
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 14:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9ABF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VyuDANQY
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso3554895a12.3
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Jun 2024 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719060373; x=1719665173;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xtc3YQWwhEs2vXvOR2PH5mI51fSfcNplDTd0O8+xCVQ=;
        b=VyuDANQYIUHUecQV+rE17L82w5JCN2JDtk2ugk7LVw+S1qs4xHW9jHp0Vddtz4riSW
         RJy/Km0mAcDh55KhCFkyUAkhTkhMvVt9T81VhgvZrArbnZ1CePfO7hlNO1ki+wpQhsrT
         dyd8eIYE1Bqxl+QwHLsTe+AnVraWyp1Thr2Aucb+zLdoD5Dy0RuBtpr8b4MNZL2rG7Fu
         4jsqZsmONifLgz2g42P0LhtFh0TPeUNVvnF+01t12y5zrRo8wK3ArTPsK9BULLC3015M
         o86EMSpl5L9ugjWOakIFEAx5sgqaAKKMuJZ/e7h3ch1nyyPdBiOLwONHJBy0NFrT4G3h
         unfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719060373; x=1719665173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xtc3YQWwhEs2vXvOR2PH5mI51fSfcNplDTd0O8+xCVQ=;
        b=d+y0XtHlXo681PNkkvEbBwLsP/VO5+zwhfhEZlMXIuqR3xNkCFwyelyrNtjjTysvXv
         wnGroM8Xa29u2jIan3Dz5MRsnz22tXwuM9CfV3JWycqftB7LJvO+xEVijpN7jg5zZGmL
         gzlLm9aIXUaFvs0NViLqwmJe1ddBO3Rp6lzemh+D8NiRvLS2FNlNy65mA5CO5tOu24t0
         3hL+b3+6R02prR8OECPcp6VFqQ9ui6qjer3N+AX6zpTcqmNNErgFhMCTuTEEyaes/KXc
         5d1vuyfSskRX6LBQwskPVq7Vys3cHHT4f3kHWAp4lkM2sdjSVXtX4699vmmAukd56bhU
         Mb8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJgAq5m8v/OSw41hROhdCIzXbKZcH8fZKcJFtDUAFk97wfdbNrxa1YUGNtewte7v96pIjQ62BR+9r8btha2r/FltzW8FhJGgISQDg=
X-Gm-Message-State: AOJu0YwuU5rYXJxRoleGvoOx9NfbLbP5XeDk25vEktd3WSmwVy7KGXbK
	TQU29ZB9UoM/z6Q1gTWkjcT6PfqrOVdSAOHNpGMauqm0QSGAklmK
X-Google-Smtp-Source: 
 AGHT+IFBzxDcxx1CE0ZViNgLB0t0MgmBfPXQf2y4zveVJIRjgSOlbuN6rI8Qp7AbWoS6dX8BDOzBdw==
X-Received: by 2002:a50:d58e:0:b0:57c:7eb6:440a with SMTP id
 4fb4d7f45d1cf-57d4a27397emr231724a12.3.1719060372830;
        Sat, 22 Jun 2024 05:46:12 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d31f33086sm2122853a12.61.2024.06.22.05.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 05:46:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Add support for ti,pcm5242 to the pcm512x driver
Date: Sat, 22 Jun 2024 12:46:03 +0000
Message-Id: <20240622124603.2606770-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622124603.2606770-1-christianshewitt@gmail.com>
References: <20240622124603.2606770-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QMYFXDNBGJIQFMSZTQE3YK7AXF65ITXT
X-Message-ID-Hash: QMYFXDNBGJIQFMSZTQE3YK7AXF65ITXT
X-MailFrom: christianshewitt@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMYFXDNBGJIQFMSZTQE3YK7AXF65ITXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a compatible string to enable support for the ti,pcm5242 DAC chip
in the pcm512x driver.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 sound/soc/codecs/pcm512x-i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/pcm512x-i2c.c b/sound/soc/codecs/pcm512x-i2c.c
index 4be476a280e1..92bcf5179779 100644
--- a/sound/soc/codecs/pcm512x-i2c.c
+++ b/sound/soc/codecs/pcm512x-i2c.c
@@ -39,6 +39,7 @@ static const struct i2c_device_id pcm512x_i2c_id[] = {
 	{ "pcm5122", },
 	{ "pcm5141", },
 	{ "pcm5142", },
+	{ "pcm5242", },
 	{ "tas5754", },
 	{ "tas5756", },
 	{ }
@@ -51,6 +52,7 @@ static const struct of_device_id pcm512x_of_match[] = {
 	{ .compatible = "ti,pcm5122", },
 	{ .compatible = "ti,pcm5141", },
 	{ .compatible = "ti,pcm5142", },
+	{ .compatible = "ti,pcm5242", },
 	{ .compatible = "ti,tas5754", },
 	{ .compatible = "ti,tas5756", },
 	{ }
-- 
2.34.1

