Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F00853E560
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 17:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28FD918B9;
	Mon,  6 Jun 2022 17:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28FD918B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654529037;
	bh=1qVUS/BzihxAe+W87h5OVIov3OzXgna3j6bRi+OLJw4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h12s/TCbCHjaJQ43248GJROFcC9nr3bMOPALDIkNQ3PGMcgo1r3lEy0fL7xbYChE1
	 D8OeVGWXJw0PdJ5rG83eWA7PAnBLz4LCHjFHNaGJOkmtIeyb0tJ6a3tPHBopX2cUlk
	 J3xqSvWIgqXIuAWHGOQoqgQuKX2hMp/BmIiEaMCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90870F80310;
	Mon,  6 Jun 2022 17:22:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22400F801D8; Mon,  6 Jun 2022 17:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7708F80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 17:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7708F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m09w9gwj"
Received: by mail-ej1-x635.google.com with SMTP id s12so22420067ejx.3
 for <alsa-devel@alsa-project.org>; Mon, 06 Jun 2022 08:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+Uwlf6qgJvF453WbwLN1jaXprVYO3wmuZLS2RkkxFs=;
 b=m09w9gwjIR2RAinzDyK8VruLeAVFJvHbrpa+jH7oL4BHaYqSW018C8VDZ5FfT4vyLg
 kNefBfLJHsDLZlV8RkJKC8ykSn5cgqkyB6k4jQdfBwSycSwz2Y4276a5v4F77KXSferg
 ZsKhu1CptfVOlueQ7oisLW6pMvU18Zv1B3k7IZq8sAB2opU8HQ1H2/L2XhGAvkO1NjTC
 mSVFBgdgRwsaDa2j/z3wTMl7LluZzvd7rYgBGxwur8G+FAr0zglFNsEyZlsKhYcP0EWW
 VJlrkvanXxE7DYNxjSJLAFFpi170XqtRM3xZi4myMc9TxZ/3uTlRHveq0na6un/jV+D5
 PavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+Uwlf6qgJvF453WbwLN1jaXprVYO3wmuZLS2RkkxFs=;
 b=CAgl75BXkwB+WKcrLD4yHkUKEqYyJBfj3l45YPZpWsA37J8BGoiizWxRToklehOS9p
 gc3DtChI0ihTbi4jLSZ/G7WBS5sp8qU1XqBatwYDU/mmBxauJ9xxpCX0Xp8S5K6c1Jqt
 3Bsx4Pl2ncTUDdxOPcE+MI6Vmpn/zrMPPaJ0Qeb6zk6WNw9ypcWt9WMEP0be8yHyjuX1
 UHHxZtmYygU5WiJ8JgTblYDiOp5PtNe5PFHcMBNFy0YbfA0YVVDdJrGvw5TCMP9uiKsw
 yZDQMNR5qU/QGUCafBQbw6Q2ZZH5covvLSZBcbotTfJrmJRkJFPUJbN3M84eI1+fvaWi
 Z6vA==
X-Gm-Message-State: AOAM533qUpJzrzz9904iOlNjqO8VfBLYHt4sQfHC6aDJs11hzGsymSa3
 VbKPZE2Niry114ZVi5nahS4=
X-Google-Smtp-Source: ABdhPJwanu3lq40yFMgYXOPYxN6gLx5qlezisxn9fc6ryWKeN9LAGfPx4pY2ol6YBGm4gXEwZyWM9A==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr22180895ejc.671.1654528968351; 
 Mon, 06 Jun 2022 08:22:48 -0700 (PDT)
Received: from localhost.localdomain ([138.199.7.159])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170906660300b00711aed17047sm2348128ejp.28.2022.06.06.08.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:22:47 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: wcd9335: Remove RX channel from old list before adding
 it to a new one
Date: Mon,  6 Jun 2022 19:22:26 +0400
Message-Id: <20220606152226.149164-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, linux-kernel@vger.kernel.org
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Currently in slim_rx_mux_put, an RX channel gets added to a new list
even if it is already in one. This can mess up links and make either
it, the new list head, or both, get linked to the wrong entries.
This can cause an entry to link to itself which in turn ends up
making list_for_each_entry in other functions loop infinitely.
To avoid issues, always remove the RX channel from any list it's in
before adding it to a new list.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 sound/soc/codecs/wcd9335.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 617a36a89dfe..597420679505 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -1289,9 +1289,12 @@ static int slim_rx_mux_put(struct snd_kcontrol *kc,
 
 	wcd->rx_port_value[port_id] = ucontrol->value.enumerated.item[0];
 
+	/* Remove channel from any list it's in before adding it to a new one */
+	list_del_init(&wcd->rx_chs[port_id].list);
+
 	switch (wcd->rx_port_value[port_id]) {
 	case 0:
-		list_del_init(&wcd->rx_chs[port_id].list);
+		/* Channel already removed from lists. Nothing to do here */
 		break;
 	case 1:
 		list_add_tail(&wcd->rx_chs[port_id].list,
-- 
2.36.1

