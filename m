Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4E66377
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 03:48:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5A81663;
	Fri, 12 Jul 2019 03:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5A81663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562896138;
	bh=eGU88JDcgaVUvNDDKtSgezoQmruVit4kYqiPxMuLJ38=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EX15X0mMOtl8akA67G68xcuFtSoF17O/vkIshR3/zY+jfc5PcOgX6ow17rFD/rt1X
	 DHQpwok6VJQ8BESSzjAcCODL81C6zIhlQORXWY5IouHx7i309EGLXpwsxJFFzYQJZf
	 zvDHbSo3IdlKNFDWn0kIiJZurjuOq0w38qNe/7G0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C55EF802A2;
	Fri, 12 Jul 2019 03:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8150FF802A0; Fri, 12 Jul 2019 03:47:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B12AF800D2
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 03:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B12AF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uk1BXR95"
Received: by mail-wr1-x443.google.com with SMTP id g17so8207112wrr.5
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 18:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TSFGt+Q1og6AA+SdNnXRjxSfv/MJFeGddK8TCtYrMOg=;
 b=uk1BXR95kMsdF9sHBlyG55rS2E1xeWRMYuIBC5lVMxQgjAcvzJIMynUBe3wm/zfSQD
 OC66fX/RzQlpJ44bj9120Ft2Tap9PgBHxgB/NX0Fjq0IvZe7WVXJzc4YskygtPm8UctJ
 QfmADfQxwVc1xW/vqRuRDxe0QO/w9RGgZBVyjvkTiBspm9mRMrBtPxuu5oTWyoVhIBnF
 TQauhcIgrgyVBirznKq2EzRvhq+2+0wZn+Bmu7JKfx2fhfT2m3CaVQwquawx60O3Iwk7
 IFye7kfK9w42vtwfGEwwfOo+oPGAGMPLrlxD8Ur60/Kwisr53dIEpOJnQ8OZlKpr1yPK
 Dt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSFGt+Q1og6AA+SdNnXRjxSfv/MJFeGddK8TCtYrMOg=;
 b=MbXY7s1pHY3L8K8McyAPzQ8ucyGbaFK5dCXO6aBylxP/GZpSnW1zswJV33gEm4kAt5
 oBi8WwgQs3YBiI4at00wGjxv/OgsM8TRZDMKt8fvOnoYRljLXZgxsqI2xL+TotbnAFjj
 8fLdb+z8qjm0+MAXKhan5taUZ8aJv8JKb3EsCUMdfuEGjTIR4nhXWwCZ1NuvSOu12bON
 TgWM3zNGXVzttUnEiRT4+MLPj4sM3AQgy80U/6YgjQ7DRA5omcNhlfmHO3lSnfI4jGrh
 LirkpP27f6HjqrMS2Xc+wNYfk7S4KDLaEiZuZzDVo4I/JWBVZaU3L5LFZEEfWuNk4MgI
 2n3Q==
X-Gm-Message-State: APjAAAXGqoa6QbkloG0v19WKMLUkq7zGIIz96MSRFw+zZot46gGuISHs
 gNyx7+P1IsRVXHWQrok4n6A=
X-Google-Smtp-Source: APXvYqws0ImOdE7ZSUr6OyBuf5RgiTHk1I5zYJ43oxLwLXzH9OoHbxuh7mnT0trEjl87OLL0XXHcPA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr7958812wru.179.1562896028018; 
 Thu, 11 Jul 2019 18:47:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id v15sm5904425wru.61.2019.07.11.18.47.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 18:47:07 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Date: Thu, 11 Jul 2019 18:45:55 -0700
Message-Id: <20190712014554.62465-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190712014357.84245-1-natechancellor@gmail.com>
References: <20190712014357.84245-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH v2] ASoC: audio-graph-card: Constify reg in
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
Link: https://github.com/ClangBuiltLinux/linux/issues/600
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Update link in commit message (sorry, I create the commit message and
  send the patch first then create the issue and I forgot to check the
  closed ones for the correct number)

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
