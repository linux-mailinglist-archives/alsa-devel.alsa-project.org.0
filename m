Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F24F11E0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 11:20:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31E9516CC;
	Mon,  4 Apr 2022 11:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31E9516CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649064040;
	bh=a9ZE9qUHrlGK5IbCV8JwVFxG0pRgi+KoXPAg/KyQ+y4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hu67xFy4bCujWlBcevsl0a9MlyxwgG8OY6i7SoYCba0vGh4udQvUj0xNEbIqxsj0N
	 M1mPEYBG2OG9SIXxVYcKrJy4B/MN+taFJhPY7pC+jHnsUpqqhtaKWN3oIsMAz1vG+j
	 Ox4xLxz+LiBNWAjEmKd+QioKcO/XmCFGII6wDe4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E750F801F7;
	Mon,  4 Apr 2022 11:19:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 523B5F80162; Mon,  4 Apr 2022 11:19:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951AAF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 11:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951AAF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QhY3lkav"
Received: by mail-pj1-x102d.google.com with SMTP id bx5so8129292pjb.3
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=qelAC5YBe1yCBESGwxgX8ahq4gTeEnW6KQzbNy86Lmw=;
 b=QhY3lkav8Do3muF1gDCrngcr8qjDJsUGqV5+jSiL9RnhGvCVCVxHc4U3HJUMCUawiK
 SExYUSdLGARgxQYmRuVi5P/UoCLVmwB+rjMb0/3/t3ksuVTO9moUrXWdJhfIQKvLvtxO
 0w7swdR+B5zpWIuCZacVt4q5IDtHcT1RABQdWnjGG6N+e5NpVUk+dlIK79B3DelTcFBp
 dcNA0Eb65hlCwcV7XVxghU8v5DcylXg55svAKLR9ttpTDaF6Grf7VxVb7vKyymcLymEx
 ik0ZHvKLojiskAxAw1bDToCjpHgCbzKC/A94J6nlKbWqSZwhgMd8qxi6BbH34W9HxmcA
 wHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qelAC5YBe1yCBESGwxgX8ahq4gTeEnW6KQzbNy86Lmw=;
 b=4+F1vZXW0RDpDR7a50GiF8r6SF9fHBX0T2ZseFkQqq7TNkMJCK/tDiEjkYS+XXWaqQ
 zJPYve0USDtYs9qcJIqHx6abMOLVYO4/qmFIywnw2dBvO0mYLUTr5kqSmqxB4Hlu8gvq
 PM2n8btkvxhTaeW/iceCeczt+mFHIjtkVTZLIURhLAF94Y45YRiuHwnplzog0sC+nR25
 ihVA/xR+1irSORULTBu0DvJZSuP9e21qJ4FDu6peyejbMHr5jC9Y42PTTpdvqGRjY1Ge
 rpVsxu3yCGpOGeRGdusk/Bp09o7xT2vnX8L3ppZZr2qaQKOek8+8UZD7qx8rlojaaVQL
 4/bw==
X-Gm-Message-State: AOAM533AD7Q3OS20BvTwfTzDjtdL0MvZhhmTPhX2wzo6sWu63B+HBmXS
 RCDRUwoKm88jAzWf37XbSWY=
X-Google-Smtp-Source: ABdhPJy408c3fmOLzgDMpCG5li8dOVT+a7bUMRN+8w6SDFrtFTqFr0YJgL7iSUdPJQYwwQrK67gANg==
X-Received: by 2002:a17:902:bcc6:b0:153:53c2:7e2c with SMTP id
 o6-20020a170902bcc600b0015353c27e2cmr22483820pls.14.1649063972253; 
 Mon, 04 Apr 2022 02:19:32 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 n52-20020a056a000d7400b004fad9132d73sm11135143pfv.129.2022.04.04.02.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 02:19:31 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pxa2xx: Add missing of_node_put() in pxa_ssp_probe
Date: Mon,  4 Apr 2022 09:19:26 +0000
Message-Id: <20220404091926.22115-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

This node pointer is returned by of_parse_phandle() with refcount
incremented in this function. Calling of_node_put() to avoid
the refcount leak.

Fixes: 2023c90c3a2c ("ASoC: pxa: pxa-ssp: add DT bindings")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/pxa/pxa-ssp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 7f13a35e9cc1..167b90b48d7f 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -770,6 +770,7 @@ static int pxa_ssp_probe(struct snd_soc_dai *dai)
 		}
 
 		priv->ssp = pxa_ssp_request_of(ssp_handle, "SoC audio");
+		of_node_put(ssp_handle);
 		if (priv->ssp == NULL) {
 			ret = -ENODEV;
 			goto err_priv;
-- 
2.17.1

