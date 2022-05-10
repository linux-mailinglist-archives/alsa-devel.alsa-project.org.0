Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE1F521EF4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:35:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0DD217AA;
	Tue, 10 May 2022 17:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0DD217AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652196918;
	bh=6YiaQ1CeXTlQscNsDXtuzavEqbdvobXJtY79krsVXU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hegKzrsiveZhdF19lIox+T91VLG6UgGmxY5F/9oB53VGWJhrmejkt6N3gc3LVWIwq
	 xE+MMx3oFYiUXcGRNKpQCz1bfMlQIxbhG/RFbdZksdfn4VLpH4s1WWo85lqYptexDP
	 1jEsT5l+1LACkyn1Wm+E+EekpEnO46NdJb0COhXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FCDFF80517;
	Tue, 10 May 2022 17:33:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE5EF80516; Tue, 10 May 2022 17:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F9F4F804BD
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9F4F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QvY4Ezq+"
Received: by mail-pf1-x435.google.com with SMTP id d25so15246877pfo.10
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XUdUcfiagybpsQd1lg5V2fMeg0EXQcI6829QJGv7lks=;
 b=QvY4Ezq+fW8krO2OWe5Wx3kco/r+crV5eM0nwCM02Ofn4Qg7Qa2uUWgmNMxQvf5GzW
 3CzrriRzkyIZP7KTfQXKpPH9KBtIOOG+se2tgtqH2+kiz+C3iWntyhUedg7hWyIz8SVn
 CR5CehLZ40IueILzP+w0dBR9okD5t4jqeBp1EDIFQ/5nNqsRQGQ8VEAiTzcqzyxV7lYh
 MVfjVZJGo2NFi/rVHK8xAmFW/go+ywwLx8oT3BCVmYdwYXrhT4+aO9JMjp8b5ZjkemnO
 MDvf3sHPZt94kiWUkzQ2CB5ZDwFdU1ioPbjUkZBZrd41klzat64x5r/Ow1WM8drWNvBR
 zffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XUdUcfiagybpsQd1lg5V2fMeg0EXQcI6829QJGv7lks=;
 b=0ZSxHdwK9NtmOx439y3+8+XyJLzn9quLIBjA/vfvyr+sKCew1jVEnfSJYo/iAmI82i
 2kbmfxYBIAUu8zpCU9lJnxpb88hYa3DHjD9496huyS8HCXYmMYVwQy3O4Xxrz7mh58Lx
 Yb6jJUxedC1YpwaDHx21N8sZ9EjEt3ix/PmRBmPDCTZSXTRAyC03GILWbxDD/T9DLSFT
 gXHrdt7sYAff/zDCJJN5V6DjAgjf/bG6sKUbEWVc8Ztlg9UdD2UJqw1pO+l2rmJaFEuj
 ojl1Se+keslhJgrLi/2MTMdiDDJG3KMdvzoLDOrRr85iW2DCzR+twNpcEZsJSeUmrlFk
 f+7w==
X-Gm-Message-State: AOAM531TPxB7g8NMb+7/wQFORqao1XEbAuKpJO4A8nP2CRn+ralIwfR9
 ZDAO+2J9hywmHnOd9ZuaJA==
X-Google-Smtp-Source: ABdhPJz6N6qu89EDF0qEJaevMwCr86YbRgvjBFpTUFU7LzuQoM3gKa7lp4Q1bFnsxtUTB5NhIbzAfg==
X-Received: by 2002:a62:d0c5:0:b0:50d:a467:3cc8 with SMTP id
 p188-20020a62d0c5000000b0050da4673cc8mr21129069pfg.81.1652196814749; 
 Tue, 10 May 2022 08:33:34 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm11104248pfb.170.2022.05.10.08.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:33:34 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 oder_chiou@realtek.com
Subject: [PATCH 3/6] ASoC: rt5645: Fix the error handling of rt5645_i2c_probe()
Date: Tue, 10 May 2022 23:32:48 +0800
Message-Id: <20220510153251.1741210-4-zheyuma97@gmail.com>
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
 sound/soc/codecs/rt5645.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 1518eb7e9201..ccdea234a3ba 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3943,7 +3943,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 		ret = PTR_ERR(regmap);
 		dev_err(&i2c->dev, "Failed to allocate temp register map: %d\n",
 			ret);
-		return ret;
+		goto err_enable;
 	}
 
 	/*
@@ -3974,7 +3974,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 		ret = PTR_ERR(rt5645->regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		return ret;
+		goto err_enable;
 	}
 
 	regmap_write(rt5645->regmap, RT5645_RESET, 0);
-- 
2.25.1

