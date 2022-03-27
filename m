Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C724E86DB
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 10:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2087857;
	Sun, 27 Mar 2022 10:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2087857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648368692;
	bh=lU2q51eDBsOC91/3mJgnqWWe7jWrCM2t/6XTwl+/GVA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=clrhk16bKkW6lUm0FezGP+QpG8CVT4ZMNIYb/jkweHA50sIEHrMua1Eca3/ntuIZx
	 HPdV9hCjTHNTVc16iK2jxoSOWXZmJkpo60UquHZiwLES85OJZ0BYthhLWlBZXc3k/Y
	 xNmfbwUHDMkFP8HCP8VBlbFwZh+BeokzZN8AMuJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15550F8019B;
	Sun, 27 Mar 2022 10:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB76BF80161; Sun, 27 Mar 2022 10:10:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CDCF800F8
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 10:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CDCF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CorJydGu"
Received: by mail-pl1-x634.google.com with SMTP id i11so12274617plr.1
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=I209+IAp2J40nkpM0RDSrYtutE4hanVMPBM3jUoLkOo=;
 b=CorJydGuWbpBLptQES0lIYPHSX347xTaMw1Sk2SkCs6fzw4msOZh2MpVN3AGKd6mjF
 UHwkI43v50nxY22D36ezJIGpCpIN0DYliXHFy9f+WO/63qhPqPzVIJe40C/drJgjuzSO
 ZAaofmmyh2oID+sameso90LvpPKGlCqsRGHivbQ7IDtUUP6Xn6qZF4okz9jO3Bdmnyip
 1roaiT9NX/we0WM8EluW9OELn9Vc25IVPc3h/+XaYSV6rHlqgFh7HXFPuC97ibaylJTz
 xA2pyj4fpXGEyJGmyifqcnH8OgNZeZLIzPtZsy0QazlMfD80Gag2v+8HzdPV+macj6Cl
 ulSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I209+IAp2J40nkpM0RDSrYtutE4hanVMPBM3jUoLkOo=;
 b=RAO2e+x2fRSIppZRUvuY9higr91IsMfv6qweu6LNr/nlkUS2WJ/6lwCg4qJBm/Qzsu
 RCFc9WMG+gbmBrj3Q24Pap0xb/+/LbybOGwU1rwpIwVnDED7SYB0V9CLGEgoRHBew6oE
 6ZMa8/uqelbvH4uq+iuVGclS36iRMXhhxoUmWY6/btBwWbUgoJgLuSzo9KIZUKK9mw+l
 /JskDVGaftdy4SEdYx69Okcp4JwAQjvCgKwFvSj0nfQ1t/c9CqXXL8ViOg7jOOphHM77
 rkJWRMisXKKLUosIgvQEzugmNJbW3EwpSC6iclG0TNz3hBK8bbzAin+B9ybge6aaSsM0
 fBNw==
X-Gm-Message-State: AOAM533wsiPwC6aivV4Br7zjfaPgsYMQmlTlREinEF3NnNQ8DnjgZ8Nx
 2F1xA1TscRXVXK0rQS9OwGs=
X-Google-Smtp-Source: ABdhPJyeYcEUJKV2iJ85uQKvTTnRsUSASXeeh0pFRxzZpGOxsJZMFZco2VjE0HpPVwf67S0u05yGUA==
X-Received: by 2002:a17:902:daca:b0:154:aa89:f12f with SMTP id
 q10-20020a170902daca00b00154aa89f12fmr21057923plx.98.1648368617435; 
 Sun, 27 Mar 2022 01:10:17 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056a000b8600b004faa49add69sm11898172pfj.107.2022.03.27.01.10.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:10:16 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH] codecs: rt5682: fix an incorrect NULL check on list iterator
Date: Sun, 27 Mar 2022 16:10:02 +0800
Message-Id: <20220327081002.12684-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Xiaomeng Tong <xiam0nd.tong@gmail.com>, alsa-devel@alsa-project.org,
 derek.fang@realtek.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

The bug is here:
	if (!dai) {

The list iterator value 'dai' will *always* be set and non-NULL
by for_each_component_dais(), so it is incorrect to assume that
the iterator value will be NULL if the list is empty or no element
is found (In fact, it will be a bogus pointer to an invalid struct
object containing the HEAD). Otherwise it will bypass the check
'if (!dai) {' (never call dev_err() and never return -ENODEV;)
and lead to invalid memory access lately when calling
'rt5682_set_bclk1_ratio(dai, factor);'.

To fix the bug, just return rt5682_set_bclk1_ratio(dai, factor);
when found the 'dai', otherwise dev_err() and return -ENODEV;

Cc: stable@vger.kernel.org
Fixes: ebbfabc16d23d ("ASoC: rt5682: Add CCF usage for providing I2S clks")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 sound/soc/codecs/rt5682.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index be68d573a490..c9ff9c89adf7 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2822,14 +2822,11 @@ static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	for_each_component_dais(component, dai)
 		if (dai->id == RT5682_AIF1)
-			break;
-	if (!dai) {
-		dev_err(rt5682->i2c_dev, "dai %d not found in component\n",
-			RT5682_AIF1);
-		return -ENODEV;
-	}
+			return rt5682_set_bclk1_ratio(dai, factor);
 
-	return rt5682_set_bclk1_ratio(dai, factor);
+	dev_err(rt5682->i2c_dev, "dai %d not found in component\n",
+		RT5682_AIF1);
+	return -ENODEV;
 }
 
 static const struct clk_ops rt5682_dai_clk_ops[RT5682_DAI_NUM_CLKS] = {
-- 
2.17.1

