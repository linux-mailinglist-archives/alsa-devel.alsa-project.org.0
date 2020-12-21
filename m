Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE652DFA34
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 09:59:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D040A1737;
	Mon, 21 Dec 2020 09:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D040A1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608541179;
	bh=NF9ETLQ28wxGHAOsmKXKgggBpPUlxrkcjf1A0hfJGrw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vo7O/Hx/4gmG5HGL6SB4rF0I9m9pOhMtG0kYqzWIidSJZsX27hwiEr5AR8zj5GAXA
	 3qoInZCpRmeVQv5za618P17P9opXWsGpbkp9X45UdIJ8v+Ja82MLOknlGKxmjb2XBh
	 0UFzjDBdezT52KLNLKOI6CzFD/gYWPOK1wPgkYGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25759F801EB;
	Mon, 21 Dec 2020 09:57:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02D0DF800EC; Mon, 21 Dec 2020 07:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22EFDF800EC
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 07:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22EFDF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b90kZ8Od"
Received: by mail-pf1-x443.google.com with SMTP id s21so5865621pfu.13
 for <alsa-devel@alsa-project.org>; Sun, 20 Dec 2020 22:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lUDwRVuH6q0jXCQQ4vgnuuE3CYoMs8jTe3meHCZqN48=;
 b=b90kZ8OdCKoSdgloi/UXfEjHlg5gCcx/P7t2HhDFjzuKsGwheSKdVVOcMXSsnZeCgo
 vPQ4dUrnFg9P7sj84yV8Cw/bC8s+glpdJ5E209gh2ZvcIdJktcJh0NE/5IYRUKheZbcC
 7d8OJ8tdCpCbrgedz994RN3vfOjfqVXA2dMok8o42C/iU0EvvuzYMNC9mEBMhHJ+amwb
 qHVJ2mq5/DgaMT3uti/SjQ9+jtGB2oYArw0t4Ree3J3i8JJfyAzxhT7pG0vZXY72jgZg
 vECorHz29QxiVdxXwi2/UfBLnGzqHsWX/BlEQIFsUuIeGI/RH7ak8otKReYJEbZA7HKF
 TVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lUDwRVuH6q0jXCQQ4vgnuuE3CYoMs8jTe3meHCZqN48=;
 b=ZLXNgkSRLQ/YtrlrIKgKNjrGvtrtKKPFQ04BAUl99n89EltfUVTwbl40nLsDxLsc6f
 /WeKnJ6lRdInSTTJSO36BCbsOtDpReSkArSzDFnKRmzCGtQAfjYTHnBHG5fgrmkLUU5V
 YUchkkLPId5U5W55kZc93c49tshTlyC1bogiJgVwE83efpNZgFS7de3uq8cHpYjR+KeO
 wvHdTIYVYkK7X52Trejv4MUS0or8f2Y7fnaPwJjWd+NX6r1X4eACrhSKq275D5ejVVRx
 F/wmH9MlzY5/rOu9OAA8ABJPkPIzGOOBz1DcucvaZpiOzJnTcFG8UmZuJSlTJux8cDI5
 D6ig==
X-Gm-Message-State: AOAM531EbVvOYE2L/q53CG6b6gQZHC/IHrGjyZVOoQZTjnVUFt8+VjHm
 wmDa9MJMESEEfZrl86t+UL4=
X-Google-Smtp-Source: ABdhPJy4JUFSIKuGiBI1ToU8MZo7eXKE0T//GBpjHubr6MboVIIf68bZyKmVLJCyT/yw6iCIannBaA==
X-Received: by 2002:aa7:978c:0:b029:1a9:1989:a07 with SMTP id
 o12-20020aa7978c0000b02901a919890a07mr14590905pfp.30.1608531736511; 
 Sun, 20 Dec 2020 22:22:16 -0800 (PST)
Received: from ubuntu.localdomain ([202.155.238.153])
 by smtp.gmail.com with ESMTPSA id k9sm14367059pjj.8.2020.12.20.22.22.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Dec 2020 22:22:15 -0800 (PST)
From: hui yang <yanghui.def@gmail.com>
To: perex@perex.cz
Subject: [PATCH 2/2] sound: Remove redundant comments
Date: Mon, 21 Dec 2020 14:22:07 +0800
Message-Id: <1608531727-5433-1-git-send-email-yanghui.def@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 21 Dec 2020 09:57:52 +0100
Cc: YangHui <yanghui.def@gmail.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

From: YangHui <yanghui.def@gmail.com>

Remove redundant comments

Signed-off-by: YangHui <yanghui.def@gmail.com>
---
 sound/core/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 764dbe6..75aec71 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -149,8 +149,6 @@ static void release_card_device(struct device *dev)
  *  @extra_size: allocate this extra size after the main soundcard structure
  *  @card_ret: the pointer to store the created card instance
  *
- *  Creates and initializes a soundcard structure.
- *
  *  The function allocates snd_card instance via kzalloc with the given
  *  space for the driver to use freely.  The allocated struct is stored
  *  in the given card_ret pointer.
-- 
2.7.4

