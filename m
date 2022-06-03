Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F398E53CA6A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 15:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EC531828;
	Fri,  3 Jun 2022 15:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EC531828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654261675;
	bh=n3BNbz8LSf5liop3k9Eky8jNDsHfWgBFjy/9gD1PCyI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AgfaBAR86ryOmua4brYZmSQcIZJGecRYG6l0Gly+ax+WWyC/GvYLYR4FAN4xtch1m
	 tIrEwcjFXdePrzAHUlZPAjtWZ6220PJ3DC+FGpIwyXOv0JDYS66c2bWceEXYLTiuHn
	 cUCXrM2MD+KZYMiVWGBVpTk8Fn1ydm1+RLf5wHCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3AA0F804D1;
	Fri,  3 Jun 2022 15:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA59F804CC; Fri,  3 Jun 2022 15:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08001F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 15:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08001F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZWgpkAaw"
Received: by mail-pj1-x1036.google.com with SMTP id
 mh16-20020a17090b4ad000b001e8313301f1so1058453pjb.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3vUdnokUr6xPDhF0AvWg+SWqFU7xQQlluilxzt4oqA=;
 b=ZWgpkAawyrGv5cgAys6c9xPOe/uIe6rZD87MpikzCyKjdtbY40ZPvb3fx4HxB/pcXG
 Sg2rNs8MkzfbO51CRppIyrmFW4pUfZZ8tApmbt6RSWRm3LgVUY2o2MDMNtetT1iuRtbO
 /IKuAwA6BHaCfx6a2A0k3jbIpE99MXPPjEv1VTl+K2GUnN1LYVlbTAQe5rBfomQ8mQ8Q
 TtncodvkSHgrpt6Bp56owgYjVx9kCPpi8BNxeMys5wh/1zn2BXmHIrqKwHKvNiczR6wh
 NiBwWkH4puarM+tiSttArLJVA+tUSbMODcc7GE3lEC+BlbTV+q3kx+yJ3KxnCaf+y+98
 stRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3vUdnokUr6xPDhF0AvWg+SWqFU7xQQlluilxzt4oqA=;
 b=EMNkScwKTD8hRurkIo017DRW3oj9oVUjzCDiaOsxCNkHcnM/Dnn5qBWrUFeYU7VbjI
 f34SCH9OPQa30gPe0lFakRZ2VFllw58iCTLSQN154eMRcaC9LAAyDVcbrOkQdf+eq2K1
 TXnYV3liNxtuDH/XP4i8FQZRpW2NR8l04g7HshjvD8rpCZMsh87UVdCAaBONtTr/PcAG
 cpNvh3XtROF5G+mTAR9uq631eu/YK/QrdchJuBDz3oRXRoI6LrgC/Xjf0UnP/E/TXkiW
 Mcb4oRh1JbrHtWkuP0brAeXa7xcqmO71MD+KMkE2d0Wjl4VtZDtkB0lQyy4zWsBT7/6m
 8PJQ==
X-Gm-Message-State: AOAM533wwxqWv9O1t3j4+FkIrT92JvyoqDk9LMqAWolXmQzipEwdP2f/
 1WxGCAnhk15kQkGh+h7dQzY=
X-Google-Smtp-Source: ABdhPJyVzZsXhLPbZlT5aB7VVCZYSxkeRJt3tG4+jZj5qunY+vfuaTRanCISxwpBR7kKfWr1H0a1/Q==
X-Received: by 2002:a17:902:ac8f:b0:163:fbb7:b057 with SMTP id
 h15-20020a170902ac8f00b00163fbb7b057mr10294401plr.67.1654261609606; 
 Fri, 03 Jun 2022 06:06:49 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 fh6-20020a17090b034600b001cd4989fec6sm7608329pjb.18.2022.06.03.06.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 06:06:48 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Bakker <xc-racer2@live.ca>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: samsung: Fix error handling in aries_audio_probe
Date: Fri,  3 Jun 2022 17:06:39 +0400
Message-Id: <20220603130640.37624-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linmq006@gmail.com
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

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
This function is missing of_node_put(cpu) in the error path.
Fix this by goto out label. of_node_put() will check NULL pointer.

Fixes: 7a3a7671fa6c ("ASoC: samsung: Add driver for Aries boards")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- update Fixes tag.
v1 Link: https://lore.kernel.org/r/20220602130218.14901-1-linmq006@gmail.com
---
 sound/soc/samsung/aries_wm8994.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index bb0cf4244e00..edee02d7f100 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -628,8 +628,10 @@ static int aries_audio_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	codec = of_get_child_by_name(dev->of_node, "codec");
-	if (!codec)
-		return -EINVAL;
+	if (!codec) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	for_each_card_prelinks(card, i, dai_link) {
 		dai_link->codecs->of_node = of_parse_phandle(codec,
-- 
2.25.1

