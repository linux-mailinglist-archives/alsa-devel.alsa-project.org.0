Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DF4E8634
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 08:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C36D0163A;
	Sun, 27 Mar 2022 08:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C36D0163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648361387;
	bh=pu34WrsgZAMVHRmUEQhMgaBbg5TDjBQWiNoWmoUoe98=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qmGR53m8i+ruk/IT77R63HqD50sf3B4KV9xXdCmRe4p44ONDKsYqd2cT0szj0G6b1
	 3FxeWx+wZKwOABYrRjiw5Za8pu9Zj2zPTpChyd7RF1EZz1PrtaSfULcyr6vkblTe3o
	 AQJz1D8vDDHK61qouj1WGTwDWNhAYgTNZBTGZiYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A845F800F8;
	Sun, 27 Mar 2022 08:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30777F80161; Sun, 27 Mar 2022 08:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CF52F80121
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 08:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CF52F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XxWXZt/C"
Received: by mail-pj1-x102c.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so9675220pjo.1
 for <alsa-devel@alsa-project.org>; Sat, 26 Mar 2022 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=WLGme/rACNlsZ/NoBqpCvphC8ae3fvVeZ1qiIRGm49Q=;
 b=XxWXZt/CIQ5HISAsyoesltjNLHrlcH2NIr1yONMkl0bplVYnpAG5GWej4Clhp3dLO5
 GvKx1+YJuelabHz0EuPlf/SFVYswpHRzDiUU4hyRv+FoH+Qsoz7K/CmNJ4y2mUyobXMO
 i+luyiWxak5Ntcr5wR4x0YJ18XnvdMhBbEEvd/gyVEXV5QkbQwmOjOQzGK2PG+SsRlIE
 92FSexrViYOC1HdAVoLO4Faox6KBxhSafHvgs8xTV+0PgfR9kFl5fkvyjp+NpG0C3Yic
 6O5DsvsST/pHNi2c8POVbXvpSvYd2wvu4fNOd8jWvhGJ0PH61VEUULiCffcvBKkSJoeE
 +A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WLGme/rACNlsZ/NoBqpCvphC8ae3fvVeZ1qiIRGm49Q=;
 b=zQOOO9M2yQOucG7+txdcjseFc7axbD/5uxweMgY6PEWNrH5o/CqoB5MWnT9YuB2HtN
 EdFlya+AInbI9f7tVOpF2NvRIEY1Nu68wdlfI4j32bXF+YyMyYnS82e5rn+/beEmitPF
 SAG2eReNkwBTi9Hb9L6e4SJXzEGq+4w5oIfN3ExrN16BetF5pX4pOewqu/QChproAMBm
 hbZW4MzIymOBPvQ+b4/1rpEsaoboONLxTzg4uh3pBt+che2jGICygGHIZvzkPwDvlJ+0
 lrVXlnV5F1lpl7s/hGYbflN5/UejlLTTdxPMq+qSU0Y6uOFZIeu07KEgSquMvDPJY/HN
 mW5Q==
X-Gm-Message-State: AOAM532htjUxMF0ZOGONstNIilM6qSTG7cvlRhhygIqzh0lnyA+AcpgI
 fQvYtSVRyPhtyX+IrGY3URQ=
X-Google-Smtp-Source: ABdhPJzijW7TduNxnjGw5WJJDKE1+upP6F6srZfdjFLh9QanrNnahAQOypcz+SZL3SPFyXcGFOR1GA==
X-Received: by 2002:a17:90b:4b06:b0:1c9:9751:cf9b with SMTP id
 lx6-20020a17090b4b0600b001c99751cf9bmr1363741pjb.0.1648361312296; 
 Sat, 26 Mar 2022 23:08:32 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 m18-20020a056a00081200b004faeae3a291sm11239661pfk.26.2022.03.26.23.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 23:08:31 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: perex@perex.cz
Subject: [PATCH] cs423x: cs4236: fix an incorrect NULL check on list iterator
Date: Sun, 27 Mar 2022 14:08:22 +0800
Message-Id: <20220327060822.4735-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: krzysztof.h1@wp.pl, alsa-devel@alsa-project.org, tiwai@suse.com,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
	err = snd_card_cs423x_pnp(dev, card->private_data, pdev, cdev);

The list iterator value 'cdev' will *always* be set and non-NULL
by list_for_each_entry(), so it is incorrect to assume that the
iterator value will be NULL if the list is empty or no element
is found.

To fix the bug, use a new variable 'iter' as the list iterator,
while use the original variable 'cdev' as a dedicated pointer
to point to the found element. And snd_card_cs423x_pnp() itself
has NULL check for cdev.

Cc: stable@vger.kernel.org
Fixes: c2b73d1458014 ("ALSA: cs4236: cs4232 and cs4236 driver merge to solve PnP BIOS detection")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 sound/isa/cs423x/cs4236.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index b6bdebd9ef27..10112e1bb25d 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -494,7 +494,7 @@ static int snd_cs423x_pnpbios_detect(struct pnp_dev *pdev,
 	static int dev;
 	int err;
 	struct snd_card *card;
-	struct pnp_dev *cdev;
+	struct pnp_dev *cdev, *iter;
 	char cid[PNP_ID_LEN];
 
 	if (pnp_device_is_isapnp(pdev))
@@ -510,9 +510,11 @@ static int snd_cs423x_pnpbios_detect(struct pnp_dev *pdev,
 	strcpy(cid, pdev->id[0].id);
 	cid[5] = '1';
 	cdev = NULL;
-	list_for_each_entry(cdev, &(pdev->protocol->devices), protocol_list) {
-		if (!strcmp(cdev->id[0].id, cid))
+	list_for_each_entry(iter, &(pdev->protocol->devices), protocol_list) {
+		if (!strcmp(iter->id[0].id, cid)) {
+			cdev = iter;
 			break;
+		}
 	}
 	err = snd_cs423x_card_new(&pdev->dev, dev, &card);
 	if (err < 0)
-- 
2.17.1

