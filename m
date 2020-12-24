Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857A2E25DB
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Dec 2020 11:09:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B2E17EF;
	Thu, 24 Dec 2020 11:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B2E17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608804579;
	bh=lxIgOnn7nn4gp0NnJ8H8XVWkj1lGeGIeRa/iJ9KF0Dc=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X2l4S+kY+DU8gtGA2Ro55P2C6WwK9yn1pKEKWtXo+QBagjQ9HDHKAqxfiEWxanyg7
	 yEB9hgbmstexTnvMA/cAmLZJnREgXoSszgiIzs07+niw3arYMUpvURNAL1PIPCkEWX
	 XbboReiqPY1mNg50W6rbMa83RN2FF4yopEFu28bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4360F804CC;
	Thu, 24 Dec 2020 11:06:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3719F804CA; Thu, 24 Dec 2020 11:06:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B3C4F804C2
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 11:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B3C4F804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LM8U8c+W"
Received: by mail-pl1-x649.google.com with SMTP id y5so984700plr.19
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 02:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=cesefJeA9SG97IrQXCu6DnjriyZpRNEevem65s6SRwg=;
 b=LM8U8c+WIobkOFLgAb3KQHLWG4QJDkkcdDPQ5VSH29EpeRAL2xXpIxxPUZQ0C80zY5
 tjfD/5kkHKoL1W+lFkDxatK78otky02zZVnY2EnqK5r4C2HGKZ5I3Bg1V0pSWphoiSP8
 WzdxkjzaRVIeZ8zcZzuSrKMNTMJNtHNWZYjwq4TtbwKUXiAIZxt1WDF2NvlpzwnUJblX
 qnOYBuZnUQSXCuDuVjfCzv9bohSw8q8bdZynga4DEt+hl7FXJlDHfJ4QEQd9dyAcE47+
 K7z6EjGMizdZI576LkLyGIjPyB7G5vNFrJMdwU15mX0T8MWpkuG+/79SEdErQxc9oSrL
 eo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cesefJeA9SG97IrQXCu6DnjriyZpRNEevem65s6SRwg=;
 b=mHLuttuhOQsKGLwQyMCRiXOb76e4RPTwzWHLYc+dnu6reCt4ESn/jYMsqwHVjcuBdo
 YodGQNwaZ8i1/eULrvBxadrdjSyj3zhWtC2PSkbaXYDkft9aiLJXtYCTfR4qKddhxDWo
 810caGEtDXIb4756PY3ZeqdBVDK5D5fMeuLqSmjp38FI0KpCkiSG9mEky9QtfmCKDkBP
 DH0+bTX8kRtpnenN3sPsN2kuniBVR1yclg7rGRNY3KgyxzEAp95IiGD5KeWqS6NT8PZ0
 8OiLjyf4UZfiw2faIZm4YN4vgF5J924I4lnui0w1VoklC/svlB9exbaN1nNqyXsmhjS8
 VVYg==
X-Gm-Message-State: AOAM532U1CKkWHMQLLVadjaiy9yf8Xn59OQ6MgK6eKXXV0qU6M1nNah6
 T3grjgEd+bANIgICC/zIqC37/0f10Gu/
X-Google-Smtp-Source: ABdhPJyX5iFk4UiHk7i/gjhzX40fEO68EHg1ZYqtyKvAkyRCN9jNscVshEFCp7i1C0gs0tLI/kMNTqTz8bav
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:ff0e:b029:da:d4ee:eca3 with SMTP
 id f14-20020a170902ff0eb02900dad4eeeca3mr29244211plj.41.1608804388362; Thu,
 24 Dec 2020 02:06:28 -0800 (PST)
Date: Thu, 24 Dec 2020 18:06:06 +0800
In-Reply-To: <20201224100607.3006171-1-tzungbi@google.com>
Message-Id: <20201224100607.3006171-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20201224100607.3006171-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH 4/5] ASoC: rt1015: refactor retry loop and rt1015_priv
 allocation
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Refactors retry loop in flush DAC work.  It is more clear to use a
for-loop here.

Uses !rt1015 to check if NULL.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt1015.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 93e4763ece11..a7b9dfcb4b0f 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -570,15 +570,14 @@ static void rt1015_flush_work(struct work_struct *work)
 	struct rt1015_priv *rt1015 = container_of(work, struct rt1015_priv,
 						flush_work.work);
 	struct snd_soc_component *component = rt1015->component;
-	unsigned int val, i = 0, count = 200;
+	unsigned int val, i;
 
-	while (i < count) {
+	for (i = 0; i < 200; ++i) {
 		usleep_range(1000, 1500);
 		dev_dbg(component->dev, "Flush DAC (retry:%u)\n", i);
 		regmap_read(rt1015->regmap, RT1015_CLK_DET, &val);
 		if (val & 0x800)
 			break;
-		i++;
 	}
 
 	regmap_write(rt1015->regmap, RT1015_SYS_RST1, 0x0597);
@@ -1187,9 +1186,8 @@ static int rt1015_i2c_probe(struct i2c_client *i2c,
 	int ret;
 	unsigned int val;
 
-	rt1015 = devm_kzalloc(&i2c->dev, sizeof(struct rt1015_priv),
-				GFP_KERNEL);
-	if (rt1015 == NULL)
+	rt1015 = devm_kzalloc(&i2c->dev, sizeof(*rt1015), GFP_KERNEL);
+	if (!rt1015)
 		return -ENOMEM;
 
 	i2c_set_clientdata(i2c, rt1015);
-- 
2.29.2.729.g45daf8777d-goog

