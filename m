Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17033521EFB
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:35:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990F3172B;
	Tue, 10 May 2022 17:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990F3172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652196942;
	bh=ri+sCHH7zR5Qr4NuIo5Bp472x9xeX6cYYhsSDDpwdz4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJU1usICKCCEebHnIQCTMnB9vHiZTn5vn3MouNp4HzHwhgAad5FIVZLEO6b0X3vdv
	 BTZpXflJR+EdWaAxP4qmDRYxDRltkPDnCbhM0sgt08eGKoabrVGfSuYkC+8eoo5rw4
	 WIKAe6dyauX9qBjgwjUW5Eyxf0VqJG/3RaeROgGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 605FBF8052E;
	Tue, 10 May 2022 17:33:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D887F8052E; Tue, 10 May 2022 17:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E5F2F801F5
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E5F2F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DjyipPBY"
Received: by mail-pf1-x42f.google.com with SMTP id a11so15245467pff.1
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sDdu0AZ+jhN6LtNsF/DsY4tnnS9mzbYgTFP2SBX4foc=;
 b=DjyipPBYQ6Mz0BJ2YvmmPz0cPF4YSA0a+fMtYgqkJ77LqbIEqTP2yuaOxzXI8J7Puz
 YzVfttMONRDIJC1uBKKFmiOMdzXhIY9xzklKp1v6OLrinXC4FwDdGdvem9IooJboBvQy
 GK3dj2Q+gZYRcoEU7Z7AiRFj/wT5y5HMn74dI7mKWcCAPxzbxqc3nUTTc71NsoQZPHgZ
 jysRaf4Dr0FqZBFsUbvMJw3fhoye8auxXOIELHpDwhvf02EHOeW5Hk0Jq5xfIZZk+ghD
 6oQdmho2n+LrTWDfHjY0tktn7MLxE9rfJyCILgySVpSsBEMTM2+WKb/gJpGdMt1NhQz/
 LdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDdu0AZ+jhN6LtNsF/DsY4tnnS9mzbYgTFP2SBX4foc=;
 b=X3GUWLxpd4iZw7eYGh7ijHTDauDdMcWjg2NaMT11fw8QCR7RbLBInzqtzhTqKzBNs4
 xiAhjaxT6PZUwdZFBqZsUP72gAtER4TWRlA8lRKPe5xSCD8UtwS2UJZ0Jtbqlj05IUB7
 YaDFSWDjSOxlDqsznucwtuISVg7NUpQE/rpL+8zb8RIC8w6QkM0cKTHFzGUPb5NsG1xt
 AU/ex6bcZwDxdy/B8LJqFUYkcIVTmuqSdrmLKAfAvOcs+Y6Q9zgAwF6qfVXqDRllfXTG
 gBtVHNjdikjk5QTYs1KPSy3RYlKwCoU7eBx8wvjf+C2iFahzpy2Xb4MwlLHZcJqgp1QZ
 5SzA==
X-Gm-Message-State: AOAM530hOwH9pWRk9rr3CZ2inGTm5ArD8pAUim+HcNaMTgUti9WgHtt8
 Af2Q5g7PmNnQ6Di2ULcKRg==
X-Google-Smtp-Source: ABdhPJw4MmnXegA0D1ntyoBvAJlyQNEK5XXB9HZ+vF5ceB7uq8uJuv4AGpKomxKh2ohAEsSAha8rIQ==
X-Received: by 2002:a63:fd51:0:b0:3c1:977e:1fed with SMTP id
 m17-20020a63fd51000000b003c1977e1fedmr16894976pgj.246.1652196822757; 
 Tue, 10 May 2022 08:33:42 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm11104248pfb.170.2022.05.10.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:33:42 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 oder_chiou@realtek.com
Subject: [PATCH 4/6] ASoC: tas571x: Fix the error handling of
 tas571x_i2c_probe()
Date: Tue, 10 May 2022 23:32:49 +0800
Message-Id: <20220510153251.1741210-5-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510153251.1741210-1-zheyuma97@gmail.com>
References: <20220510153251.1741210-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
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

After enabling the regulator, The driver should disable the regulator
when failing at probing.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/soc/codecs/tas571x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index dd289774efb2..7b599664db20 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -833,7 +833,8 @@ static int tas571x_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(priv->pdn_gpio)) {
 		dev_err(dev, "error requesting pdn_gpio: %ld\n",
 			PTR_ERR(priv->pdn_gpio));
-		return PTR_ERR(priv->pdn_gpio);
+		ret = PTR_ERR(priv->pdn_gpio);
+		goto disable_regs;
 	}
 
 	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
@@ -841,7 +842,8 @@ static int tas571x_i2c_probe(struct i2c_client *client)
 	if (IS_ERR(priv->reset_gpio)) {
 		dev_err(dev, "error requesting reset_gpio: %ld\n",
 			PTR_ERR(priv->reset_gpio));
-		return PTR_ERR(priv->reset_gpio);
+		ret = PTR_ERR(priv->reset_gpio);
+		goto disable_regs;
 	} else if (priv->reset_gpio) {
 		/* pulse the active low reset line for ~100us */
 		usleep_range(100, 200);
-- 
2.25.1

