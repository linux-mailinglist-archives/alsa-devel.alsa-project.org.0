Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 563BC5B11C3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 03:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB49F169A;
	Thu,  8 Sep 2022 03:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB49F169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662599065;
	bh=x8o60E163okxT1YE4F+AJ++z5GS9Nt3ip72XJ9mj/Wc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kg9rd8sT0Uun7k1RZ0F1RU9nxH7ro6nRcI9l8IaDn2wIQPJnjEO7D6xsGLJnhOFUj
	 t7MYfMgkkxxZCyqKy7BcaOB+C58Y7IIWenQ6OkVhQvNR3Sa/f+df6z89uuIiRiaiIl
	 hcPJ9ApTylQJFRMUUsve5SXPPm6Ai0tbPESG+Owg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15276F8023B;
	Thu,  8 Sep 2022 03:03:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDF66F8028D; Thu,  8 Sep 2022 03:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D7EF8023B
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 03:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D7EF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pYaGtvp9"
Received: by mail-pl1-x633.google.com with SMTP id iw17so9630620plb.0
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 18:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=jvDToQFtXFl/fXXdAtA0T0IxqEcublWPg7VFJpipTAQ=;
 b=pYaGtvp9DqJTmGd3yUvNnTpThOcFlYjDrK6thviuS+GHE8qL2jCjHncZjmeQ6bxyCb
 ZYI1PeF3eZPFDyeC2tAlNwMCFdUTihCfq52aIq8Fk1RtnAXBtUH2lVYeOsDU2yVg8XWJ
 81Q04up7aCATXk0RGEaUWOsjUrl/R0M6VQ5XNlEMcfulSb6ZPWhhqVbmLrjoqk1IKJM2
 1/tLBVc0EdmUO7bX0v/bKvH2qF1dNlKtga3biYGt8c1kkehrT+BqCy4BKR8KUppYarHL
 mKbYxHkIQS7i+wf2eGLnd7Dec9u9WGGcF9gDp1r2oVV4/9e3xKp7sC7BlWGFWVeQeVT3
 Geuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=jvDToQFtXFl/fXXdAtA0T0IxqEcublWPg7VFJpipTAQ=;
 b=nNPVtdWls5RCyC62wghJGkWvVx3csFC/j+IorGAK4J0IqqKtf15S9qYq6ELPKryuM8
 wNpCiuZmL166pUx7QzvYu1ivWQbuMlQE3ORBkNrDcgX82Pk0qHlyUyw2ReBQ1cCcwfkQ
 OZmBmLLfdeiD37+Yzi+0zmXu67HnOA4u0fJdi1GKU6A3r3l2Nful4UUb7Ys7fKmO6bDJ
 I+dT7XVcntUG5mRcl8QZdtgcabs72PAB+7I+jUB5DT35mTcZjVkjtPXHaSrzJ3hBEor3
 5AYw+E/EiJLbVx63TLzNKKb2mezGTwcEQwt27kkEQ/kBK3VAgA8436jQELbNYnmNHNWE
 VcYQ==
X-Gm-Message-State: ACgBeo3m8TyN5FyXkOYXfcIIQY0oto97JKHRg7nnTbxkrYgICyBXzExc
 4vr1cRCb2Eh2l2+GXwbcD6A=
X-Google-Smtp-Source: AA6agR6AA9LQedEcnTizibqzbhGgIseP2qpOWJ7Q3eYXI3X3poyls3EL1+szMq9KuUQHVKJgkGTVDA==
X-Received: by 2002:a17:902:ebd2:b0:174:3e94:d01 with SMTP id
 p18-20020a170902ebd200b001743e940d01mr6903878plg.112.1662598989436; 
 Wed, 07 Sep 2022 18:03:09 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a625501000000b0053804c5b4aesm13400502pfb.208.2022.09.07.18.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 18:03:08 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: sti-sas: Remove the unneeded result variable
Date: Thu,  8 Sep 2022 01:03:04 +0000
Message-Id: <20220908010304.342760-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org, tiwai@suse.com
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value regmap_write() and sti_sas_init_sas_registers() directly
instead of storing it in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/codecs/sti-sas.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sti-sas.c b/sound/soc/codecs/sti-sas.c
index f076878908ee..99545bcb2ba9 100644
--- a/sound/soc/codecs/sti-sas.c
+++ b/sound/soc/codecs/sti-sas.c
@@ -96,11 +96,8 @@ static int sti_sas_write_reg(void *context, unsigned int reg,
 			     unsigned int value)
 {
 	struct sti_sas_data *drvdata = context;
-	int status;
-
-	status = regmap_write(drvdata->dac.regmap, reg, value);
 
-	return status;
+	return regmap_write(drvdata->dac.regmap, reg, value);
 }
 
 static int  sti_sas_init_sas_registers(struct snd_soc_component *component,
@@ -385,11 +382,8 @@ static int sti_sas_resume(struct snd_soc_component *component)
 static int sti_sas_component_probe(struct snd_soc_component *component)
 {
 	struct sti_sas_data *drvdata = dev_get_drvdata(component->dev);
-	int ret;
 
-	ret = sti_sas_init_sas_registers(component, drvdata);
-
-	return ret;
+	return sti_sas_init_sas_registers(component, drvdata);
 }
 
 static struct snd_soc_component_driver sti_sas_driver = {
-- 
2.25.1
