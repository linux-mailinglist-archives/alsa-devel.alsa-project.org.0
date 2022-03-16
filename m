Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34324DACCB
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 09:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F9A4172C;
	Wed, 16 Mar 2022 09:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F9A4172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647420467;
	bh=oWZmzz921yMEuQ7hj52reClr6cZytreQG/qZtGDPd7E=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S39lUKCdYwi/yCZqXhuogb21SnYm8IGwabJbiYcagJKz3jx49iKm4FpDDsiySz7xE
	 PlYVb86yNcA8lbayqk+wPdIq2apeHgVjvPkh5ck7CDOnIMSY98kOuW0z9lG1Ftv14J
	 Uzbr+L/fRHZ3McyB3NgxMXITT9BkBhLFm4rvGfsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F13F80087;
	Wed, 16 Mar 2022 09:46:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D74CF8019D; Wed, 16 Mar 2022 09:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF806F80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 09:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF806F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GNDL68UB"
Received: by mail-pf1-x42b.google.com with SMTP id f8so3102810pfj.5
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=o2a1XLIA6SCc0OXj4X5fM3NulfHLBIGjv/KhHaIx6PQ=;
 b=GNDL68UBBmY9vm3mPI6hh9CD2lRNaMjHpLpzwJYp4vN18zMrNfL27bTXmeAheLjH7Z
 ecZl5cZJ34sM/UeT0NIJxgjzQOAw/qlejEiRiv1+pBxV9tsO461LciCvRpMAE2cgajjU
 z830dTGPQ+ZAvvyzvy1Pc6UbLiLN4rDNupCRklX8g1Y4zE/SKTxak6T8hbT/v4ZMp5+G
 7C56/ec+oJnQXcXHzmPbWmj0/RrwPCU9g+oQa37G6Uc0V7OIwplZH4PiV5Amn5HO9P+F
 qKbi3nrAxG9LnsTuVdfE069vEEzlbTr+1ysYmMF0qoA+svztQ6fDMkHJcE4m6sXMmDEc
 fueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=o2a1XLIA6SCc0OXj4X5fM3NulfHLBIGjv/KhHaIx6PQ=;
 b=mDZO1LnVKQRDiMuW8ay0ckia43C8wMLlqMQhaItAFTNN0bZa7BquZTHtOBmumoRBSx
 DBLV1qtFAoucv/ICy5Iii6ZgVGai0pzn39OW+cSWLHH57u9jgMMX/bQFFb2Suha9RXAd
 0xOBeBKkdwqGc3YDGnaXPBqmQcmKeLWronbfi3Bxz7oO6QQz+zkw6YftaVUo0Ydzhuuw
 FQx/R/Cq6Re615jRdIcI5X08jCFrGeRIVvHWCpjoMusAOX2zLk4E4eVjavb9DW2nj/9v
 5EtZgnTvLqHroSD/wyRYws2BZ6Zab8phxTaVMLr1oE82JdJVrppPpS5v3nynmWQWgM8i
 C4gQ==
X-Gm-Message-State: AOAM533DaQgiU7+HmvBAmrItBeO55kqwJKEArO1Q/7mni/pvKmykuwQT
 deP05UuQoQlRS5+IUx/lexNeYQKbnaR06rtykjgxEA==
X-Google-Smtp-Source: ABdhPJwcB/cDd4LmceuZ9xTWzG6XnUJNJeFpS8VorH67V1q4Tm8M7vPqz5CjVnvFBNjLjZwice/4BA==
X-Received: by 2002:a63:5751:0:b0:381:4050:143a with SMTP id
 h17-20020a635751000000b003814050143amr10698013pgm.410.1647420391500; 
 Wed, 16 Mar 2022 01:46:31 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm2055283pfu.120.2022.03.16.01.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 01:46:31 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 YC Hung <yc.hung@mediatek.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, Bixuan Cui <cuibixuan@huawei.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8195: Fix error handling in
 mt8195_mt6359_rt1019_rt5682_dev_probe
Date: Wed, 16 Mar 2022 08:46:15 +0000
Message-Id: <20220316084623.24238-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error path.

Fixes: 082482a50227 ("ASoC: mediatek: mt8195: release device_node after snd_soc_register_card")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 29c2d3407cc7..e3146311722f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -1342,7 +1342,8 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 					      "mediatek,dai-link");
 		if (ret) {
 			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto put_node;
 		}
 	} else {
 		if (!sof_on)
@@ -1398,6 +1399,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+put_node:
 	of_node_put(platform_node);
 	of_node_put(adsp_node);
 	of_node_put(dp_node);
-- 
2.17.1

