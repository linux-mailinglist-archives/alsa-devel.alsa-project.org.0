Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5CD5A45D0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 11:14:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8C4386E;
	Mon, 29 Aug 2022 11:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8C4386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661764479;
	bh=AlQyGFRcWwxUgoOejrBsR1Ds7shH7miJ+XqxOibG/RI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kwsx9C6sNwwgCTrBEqr/JWruyABdn+F7AKQWI9DA3zWSm2cqw/gdgxn16KJvMRtsG
	 GdSwMHLYvBTRAGbIhkF89IYOuI+gJp1f7EzMVKfVJj/dh8EJsblh53mqR+5ydTxGSc
	 Vofgfo+BCW9B+mcMx4JDuef50LF7VuS/vyBodGNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 179C8F80115;
	Mon, 29 Aug 2022 11:13:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6B10F80115; Mon, 29 Aug 2022 11:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35E9FF8012A
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 11:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35E9FF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kf8UdLoG"
Received: by mail-pf1-x431.google.com with SMTP id t129so7573625pfb.6
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=cK9gFkwcVqBLXSkw4yJqMZFLcyT936UDHTKjLWRpM7c=;
 b=kf8UdLoG7Ht7Jcb3/PwyD5CLqoyET5/HlWgYtG5WpoUpvw2y3rGpYhi7JPKNsP5rV2
 HVsoRX5Aq0mJOlV7CW8EyK1jp95z98f+M3haosjwWfbuiHPAARSOug3neRY7sVY0mBVi
 +WQtKj8SbTnVEST48gH+/d8O2nQqEhKi+7AWUw+FubjiaJHuO0dv5o1zg1A0RF8qfnIn
 mjuXfJ1b7Hsye9aM2jT5enJcXeoXp0MHwtALIIjDVxzlX3izmO86qANgFGFSIPfTR+t/
 8mFphPXLzKaf+a7RAUthjwk7IpSgpxwzObk3EOKItmW1w5cqSj7ZzAnq5FdwDa1bF+L+
 tYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=cK9gFkwcVqBLXSkw4yJqMZFLcyT936UDHTKjLWRpM7c=;
 b=dirfhN75/gGbxaD0dXDD+oyuo82dZ/2T2FkJAVHT2TElVCTFtG86Y8OPsw8qGMqafW
 2AIS0MiGf/pBvL4JYeAFq3FijuwwSgnN3gPwZ6/xDOkygzEDPcOl103KAQRD9D7L8aGv
 bXwysS6uKYG0LE4+dSq5Bzm86bTWdwL+HsPswstbtF4TRYOkYy38L1jrM/ktSlR0hKO/
 PGbq8PL05IWzRCyer14vpkaEGvqRdTxLh17r3T71wpyhCZpkDiV9+JQ7iPaNKGu1Co7d
 CRPW+kmZrN3Cfv9rCPXAkhwTSLINagLf6h5U9cbjb6jJPOSnPeW9G3qG1fBMG30mM8z0
 invw==
X-Gm-Message-State: ACgBeo0eSYcTsOs5J3e83bPDolHRNJn/0YSqqkz4g6zx5F2uoVaKD98G
 XN03gBNPFBfwC+8qdCMPX+8=
X-Google-Smtp-Source: AA6agR6AGSiG4FoJKYvBtVFtKdgps4YVa0oOGS+yvyvkUiJcgqSc1EL4lEKJSItJS+Bt63snYd74zA==
X-Received: by 2002:a05:6a00:2787:b0:537:d9b1:f942 with SMTP id
 bd7-20020a056a00278700b00537d9b1f942mr12615968pfb.30.1661764406193; 
 Mon, 29 Aug 2022 02:13:26 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a63e504000000b0041c66a66d41sm5982280pgh.45.2022.08.29.02.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 02:13:25 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: cui.jinpeng2@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH linux-next] ASoC: codecs: max98088: remove redundant ret
 variable
Date: Mon, 29 Aug 2022 09:13:19 +0000
Message-Id: <20220829091319.266068-1-cui.jinpeng2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: jiapeng.chong@linux.alibaba.com, alsa-devel@alsa-project.org, steve@sk2.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 tommaso.merciai@amarulasolutions.com, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, cui.jinpeng2@zte.com.cn
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

From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

Return value from devm_snd_soc_register_component() directly
instead of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
---
 sound/soc/codecs/max98088.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index b208fb530a8b..405ec16be2b6 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1749,7 +1749,6 @@ MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);
 static int max98088_i2c_probe(struct i2c_client *i2c)
 {
 	struct max98088_priv *max98088;
-	int ret;
 	const struct i2c_device_id *id;
 
 	max98088 = devm_kzalloc(&i2c->dev, sizeof(struct max98088_priv),
@@ -1772,9 +1771,8 @@ static int max98088_i2c_probe(struct i2c_client *i2c)
 	i2c_set_clientdata(i2c, max98088);
 	max98088->pdata = i2c->dev.platform_data;
 
-	ret = devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_max98088,
+	return devm_snd_soc_register_component(&i2c->dev, &soc_component_dev_max98088,
 					      &max98088_dai[0], 2);
-	return ret;
 }
 
 #if defined(CONFIG_OF)
-- 
2.25.1

