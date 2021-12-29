Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4C481232
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 12:47:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A25E1764;
	Wed, 29 Dec 2021 12:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A25E1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640778444;
	bh=rL8ZPfVzmsXb/rhU9/SbTtonaQKFrbJNem8w3xo3P/8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuLTS/oO+pzQSOE+IYpD5MaoKtsODjmQsxfixokqvs94DrXu2KRHA/WEGCi6fsLty
	 ftQRTub2hsSqsT+0WXYVuhZ63CtAIbbjHwexix1A+7K0cxngA95C6nBnvDb7rO9i2q
	 4ci+Ah0e/t7WPdI+2TpXdBRF+/MySb1hJYwnLu7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57835F80237;
	Wed, 29 Dec 2021 12:45:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 018A4F80224; Wed, 29 Dec 2021 12:45:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF099F800D3
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 12:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF099F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QaaWm25I"
Received: by mail-qv1-xf31.google.com with SMTP id q4so18931558qvh.9
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 03:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J7SHaD+qL+xn75BeM0wQMqzoBEdIIKU7LvXPDFvW+jc=;
 b=QaaWm25IggmxfkFg2/z8xvRZVa73/4M7wtoBQShr1BcOtS7P3cEq0Qob/Ehmeb4FHl
 Jn1QUi0kx0s4dJKgNUESPwf+SiPFj7ae4oRmrakAMFOMMQ6QSutw1CY1EpAO5AUCHkGb
 lyee0fNv5LyN75+GXtUWvJgpa5bKXWIpO3fNcQcnkKKu3jr/XUG6YluU+AnMfh0S/X3v
 OSKyboeOL+9rxO5+PtwamXGEhg/5LnsBUUc4CQg/vWOkTiPYrOsiIqaCYBmkk4EDt1s8
 R/DtqXZugREVbabyPyLqVhkGUSR2kxjge2goAwAsNKoBfvC9zCoGczZ50+oI7L7tLiOD
 3j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J7SHaD+qL+xn75BeM0wQMqzoBEdIIKU7LvXPDFvW+jc=;
 b=45kZ5ExDD2pTl4UR6azoUxZY00g7UVg2Mk1mUbKLrauAcvvQajHPviDzi1V5dW/X7v
 f4S9Xay8hMdNzXH+jAWUHDZhX1Day2EO/X6+yNKcZMcj8wxJZWD6+37NccvUBQGDVikH
 Ao4Jh5nyc55CJfHdMjKiE1HSS1/TVWU69XtpO0REI7kI1LYVJe8NuplUdI9FBBnGyYKA
 vMA7ARtWSA2Qsr+HSt+IqqUxNchtWS53j6D15LgY/CTj1bQN3uGY+uaki7kdAQgVOOD6
 cz5XcHQe+cEXaJe0cJtWz3JJYWstSInovlq7nSuaf1IDriQIAVyaGhm1cRr9aURDrou2
 yr2Q==
X-Gm-Message-State: AOAM531xsWvKXlSuKJrEHP0wtud2p9mn3geOUKflkxo2WfsxkLJYwrtP
 5YBAQGTxRBcoYQojCXewFRE=
X-Google-Smtp-Source: ABdhPJz7VPC+hv4I1hqv8iuFoZXBuJL3mMGIOO0SQ8v9vDvurZwAU7I0NTFCd8z/zOw2s1lEG7XZZA==
X-Received: by 2002:ad4:5969:: with SMTP id eq9mr22885803qvb.108.1640778329786; 
 Wed, 29 Dec 2021 03:45:29 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:4bbe:5997:2c6c:1a08])
 by smtp.gmail.com with ESMTPSA id
 g14sm18085936qko.55.2021.12.29.03.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 03:45:29 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v2 2/3] ASoC: cs4265: Fix the reset_gpio polarity
Date: Wed, 29 Dec 2021 08:44:56 -0300
Message-Id: <20211229114457.4101989-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229114457.4101989-1-festevam@gmail.com>
References: <20211229114457.4101989-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, Paul.Handrigan@cirrus.com,
 james.schulman@cirrus.com
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

From: Fabio Estevam <festevam@denx.de>

Currently, the reset_gpio polarity handling is done backwards.

The gpiod API takes the logic value of the GPIO, not the physical one.

As per the CS4265 datasheet:

"When RESET is low, the CS4265 enters a low-power mode and all
internal states are reset"

If a devicetree describes reset_gpio as active-low, the correct behaviour
would be to retrieve the GPIO and put in its active state (GPIOD_OUT_HIGH)
and then move it to its inactive state so that it can be operational
(logic level 0).

Fix it accordingly.

Fixes: fb6f806967f6 ("ASoC: Add support for the CS4265 CODEC")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced patch.

 sound/soc/codecs/cs4265.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index b89002189a2b..294fa7ac16cb 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -590,13 +590,13 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 	}
 
 	cs4265->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-		"reset", GPIOD_OUT_LOW);
+		"reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(cs4265->reset_gpio))
 		return PTR_ERR(cs4265->reset_gpio);
 
 	if (cs4265->reset_gpio) {
 		mdelay(1);
-		gpiod_set_value_cansleep(cs4265->reset_gpio, 1);
+		gpiod_set_value_cansleep(cs4265->reset_gpio, 0);
 	}
 
 	i2c_set_clientdata(i2c_client, cs4265);
-- 
2.25.1

