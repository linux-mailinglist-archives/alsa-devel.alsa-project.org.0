Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807F2E25D8
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Dec 2020 11:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2906D1815;
	Thu, 24 Dec 2020 11:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2906D1815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608804542;
	bh=ZIyBW/OdCjm9OgNgwmgcJadImSmbzl+RKE3MWvR5MHU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HjlDP9QStmFshNs1zx7qCu2ExDBjMyrKTsJ31fPGFhK+t7zy32T8YACgt+EBJUBue
	 xk7geLyFEoIUFWsfU9G3Dv4Y8k8LwFxj5bkuFoufQTadsOjUlco900ZNZ5S7FpRDy+
	 HWh+B55INqaifuKp9/A2mBl2rLF/R/TAUGHqIQAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F0DF804CB;
	Thu, 24 Dec 2020 11:06:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C1FF804CA; Thu, 24 Dec 2020 11:06:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A87F804C1
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 11:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A87F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="knmXjOC+"
Received: by mail-qv1-xf4a.google.com with SMTP id i13so1288797qvx.11
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 02:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=91fsL1pp4XLPsEvvcENGJE8PRwu4ZAo87pxxJcnuKws=;
 b=knmXjOC+U0U1WB4qx0X9WZJXMcnkL/pzaGHJ6kT5ap+mWIlPKInBio/2+gordkTHnK
 +oFOvZnYjV5J3qiSiYvmdl9Y4laRL5u7QwTl0fmt0rXSNuq4uQUHW85HvZwLP5TmkHhp
 NsK+gfmMZbGul6JfwI453baGUpvPo20VJ8kiyUgiZ7WVjw7KAm4xdaoCIXluHqNMf3WR
 UjX7kB1x9Gp5Oav4MZI3N1XDjcZ8e4Cfe3XaE5+OWuh9pruA9zUEPeoIa7VkkYJsRAud
 TEPgHOswaHNzPrpGa9QSI1ewEVyuDSXc+5efRZ1JxjP8syl5UvTVywZcUvGP0cBRxaQF
 sJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=91fsL1pp4XLPsEvvcENGJE8PRwu4ZAo87pxxJcnuKws=;
 b=VK1hn0a4g5KGMPb6C1oR7k2CzaFRPaLTt95Eq0vEc6IV6PyR50zWrx0CSQWOzQATMd
 uNLRSUrZj12k32XgX/lRt3NllF5rispKla4u50nDMcWTcuQVWzMRtFbb5EWgwJrWN8pQ
 6CG82uYTkR+3Zmv5Wyf9WP1ex+WRuSL1TiYODpjprwf9njRF+PgBuApJag1Mxu21P+05
 47qPlB2buS5SJu0ei7X01bRyjtYoT2feL3xPWA6FVI9Xdd3qqiaJbfBQ7CSEDr3iv98U
 Sw7q2t7FqqRyiHL6TrUncojmeeuKFEUDGtEv35B1v6h7qKIVHY/uA7hTU/Qj9hcSAA23
 Zhbg==
X-Gm-Message-State: AOAM532yIYnD5Vjd25LcrlKJ/qdFSMdA6vML4hHCYawihWAPSPrUxWrL
 gFWOhqlizpiKcXncwsQ5pwdFsByhbuA8
X-Google-Smtp-Source: ABdhPJzg7/USQygC4uwY8eQcVkRFZFmavk2XgbxeG00pBVgrZJuVjaf4bSC4wwcUNzQfaGtuBzZHX13pnDG1
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:e651:: with SMTP id
 c17mr23148264qvn.34.1608804384288; Thu, 24 Dec 2020 02:06:24 -0800 (PST)
Date: Thu, 24 Dec 2020 18:06:05 +0800
In-Reply-To: <20201224100607.3006171-1-tzungbi@google.com>
Message-Id: <20201224100607.3006171-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20201224100607.3006171-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH 3/5] ASoC: rt1015: return error if any when setting
 bypass_boost
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

Returns -EBUSY if DAC is using when setting bypass_boost.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt1015.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 696e00478991..93e4763ece11 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -548,17 +548,19 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 	struct rt1015_priv *rt1015 =
 		snd_soc_component_get_drvdata(component);
 
-	if (!rt1015->dac_is_used) {
-		rt1015->bypass_boost = ucontrol->value.integer.value[0];
-		if (rt1015->bypass_boost == RT1015_Bypass_Boost &&
+	if (rt1015->dac_is_used) {
+		dev_err(component->dev, "DAC is being used!\n");
+		return -EBUSY;
+	}
+
+	rt1015->bypass_boost = ucontrol->value.integer.value[0];
+	if (rt1015->bypass_boost == RT1015_Bypass_Boost &&
 			!rt1015->cali_done) {
-			rt1015_calibrate(rt1015);
-			rt1015->cali_done = 1;
+		rt1015_calibrate(rt1015);
+		rt1015->cali_done = 1;
 
-			regmap_write(rt1015->regmap, RT1015_MONO_DYNA_CTRL, 0x0010);
-		}
-	} else
-		dev_err(component->dev, "DAC is being used!\n");
+		regmap_write(rt1015->regmap, RT1015_MONO_DYNA_CTRL, 0x0010);
+	}
 
 	return 0;
 }
-- 
2.29.2.729.g45daf8777d-goog

