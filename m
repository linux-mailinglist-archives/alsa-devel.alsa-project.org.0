Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8666371
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 03:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E81166A;
	Fri, 12 Jul 2019 03:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E81166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562895970;
	bh=1y8e+Jcaq9zqbZbBEi26wx7shUrw+HyhzoRP2u2L3PY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f2VZ+FkLXg+JXXgOm6l8iAhslyPawTwel3sHGRGzSL+gMfLOcYfJS52SMY4pbLS42
	 H4crcaO55UrZ/xrtP8wc4mmNhi49YBly9p47xwodGBWHQTlrZ6R5/8VD9SkV7C14UR
	 P3GfFEB5G6PNyw7oE73ygP90aya3iRwt2cMlJONo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8993F80291;
	Fri, 12 Jul 2019 03:44:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9753F802A0; Fri, 12 Jul 2019 03:44:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4378FF800DE
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 03:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4378FF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kHN+AfMw"
Received: by mail-wr1-x443.google.com with SMTP id p13so8176096wru.10
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 18:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRWVv8sMYMKYocmhKIjrnQXwGIfPiESQt2vqD2pw6zk=;
 b=kHN+AfMwIfWvbCzX/eK7qSCf1BewVjfqp1d9z24xOKwzQlFs6zfqnjUfdMEXe5atJ6
 mFVYkfz2DQeu2rbqGE80IVOPARF4eVPFnukanQJQUpsfEVqu0MvuyhbFIGKOYded9Krd
 dnWH3LHg6SvxKHDupiaPV+ihCRUGSq7cG1LAwlJtXuwN9pTixn3dTA3eZncHJBfzPFAF
 rAdZa4juu3LFLppzcNdCX42Bjf538euDCiVZtkOX1lyEX2u+ZPS1QddMq5EeiK6DBzzY
 zQQ6VnFqwAVqW1VKpUR4MSq4w6RccOGecw9yFjhY+DEWfbH8Ook1N61qpiAEGKTPnLTq
 sfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRWVv8sMYMKYocmhKIjrnQXwGIfPiESQt2vqD2pw6zk=;
 b=sMbRZ4cQG6BrcmQWUF4reW80mXWuAoKbbL0KOhJxzNIDun+MWsR/j2FKRr/5wmfj8Z
 +G/R6zSgYyc319fxsV5mo2sXLqdJnzmhDMvNp2ftwoz8+5PMDmUMh1AiXBmqgtO9TZYO
 H3Z4njXzPCFYx5gDZcDE9sWfhFAxj/Q2+TOQ+o2Epb+OnnQKDnDO2RKu80MfsB93CLYl
 7NhjWiORPMqkWQNf7MgT4uPAdKY6tbqsl80UnBC8yTPbX3uBs+Drm4vrCV5EZMiMzhJL
 2zvotJDYy2PoU2RScsBgqrvOkrPJ0bYOtQOsaum1Wx/AvLRpR7RCR5itAtuISBrFGp4z
 BNlA==
X-Gm-Message-State: APjAAAU6dXLpsW2S2Up8m8zSJhjeYGnUmvdohN65PRSXshQjZ8o4xJnc
 kscHIIVcSH21SbVI46hlBwE=
X-Google-Smtp-Source: APXvYqxW0bEAUwTusv0FyTqBh2bQSqPJE1T0dmhXPjiJpjySvSYlo6VoBdXsoD+zPFlh180GL/mH0Q==
X-Received: by 2002:adf:ce88:: with SMTP id r8mr8254019wrn.42.1562895859848;
 Thu, 11 Jul 2019 18:44:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id y12sm4409747wrm.79.2019.07.11.18.44.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 18:44:19 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Date: Thu, 11 Jul 2019 18:43:57 -0700
Message-Id: <20190712014357.84245-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH] ASoC: audio-graph-card: Constify reg in
	graph_get_dai_id
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

clang errors:

sound/soc/generic/audio-graph-card.c:87:7: error: assigning to 'u32 *'
(aka 'unsigned int *') from 'const void *' discards qualifiers
[-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                reg = of_get_property(node, "reg", NULL);
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

Move the declaration up a bit to keep the reverse christmas tree look.

Fixes: c152f8491a8d ("ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()")
Link: https://github.com/ClangBuiltLinux/linux/issues/599
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 sound/soc/generic/audio-graph-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index c8abb86afefa..c0d262a2ce2c 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -62,8 +62,8 @@ static int graph_get_dai_id(struct device_node *ep)
 	struct device_node *node;
 	struct device_node *endpoint;
 	struct of_endpoint info;
+	const u32 *reg;
 	int i, id;
-	u32 *reg;
 	int ret;
 
 	/* use driver specified DAI ID if exist */
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
