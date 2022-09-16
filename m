Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF95BA6B3
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 08:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A200B1A5E;
	Fri, 16 Sep 2022 08:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A200B1A5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663309293;
	bh=qv3PsfhVJm4LSUoHA5gb8P+0TmFLskRxz86ahEX4c9M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h879W808qNHHTURypQKQHqYLj5bVOglSKu/uUHqKk/7AYC2PKaS+OXPQ84dj4XB3i
	 tdX16MflS5344hKRaB/YtKFW+J9wHfWPzUWE8SfoWKP9kBtKkpe0M3PZfIRbiYJWcA
	 isRsKbLqs10rIHv9346cmHSNrnAwQNYrFAUqscsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A0B3F8024C;
	Fri, 16 Sep 2022 08:20:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE703F8019B; Fri, 16 Sep 2022 08:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 852E2F800E5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 08:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 852E2F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gBpgxF3w"
Received: by mail-pj1-x1032.google.com with SMTP id
 o70-20020a17090a0a4c00b00202f898fa86so9980407pjo.2
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 23:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=B/KZqyCS3W8efvkmSNeLGFSECJIUK/0eUjH5dQQxYAE=;
 b=gBpgxF3wg+gZHtpenxDvB6qtS/e4OB0t84WEdbfd6echN2ZwI5vpbiHrlZ2T/faKq9
 ptI4EQZG9V97HluvJlf5R+ps8OBkE/Sj40mYUbFQ7BOkDAya68OjLQYRUi3nlpi3c8g2
 s8sq1JcXclfkqChL7MpKYfPie7upMzOBE1slSSj9dwQ+1bxEGdBecul8wk71JBC7//Rj
 xYZvZs8zo6PbTxtzYLXk0a1Tbibt7TNYezGwbSGVRT423qHpCMEZJRx/MgrPkKpK6C9I
 d9eLYy+H4c3iPX1/PtjGGY1F7WPV9oT53qBxw9nimr1r0zk070VG9iPngp2mwW7LEdGj
 mG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=B/KZqyCS3W8efvkmSNeLGFSECJIUK/0eUjH5dQQxYAE=;
 b=iTmVP8sxYawU/r13z/6A2+pUyG1wJvsVo63eBgiPKv5AW9w8Pl8hGFV6LM6IQmOxdW
 NBcdZOAAI8YKFi9Wa6DcxjHzq0PiZsK1Xjjj3TLklfjTM2JPhj3xxoXFuwIm7lis7PiK
 oP64sITpRfRYbTJGPaHn+oBjs0SlL424RZjmKn6HmURjdO5ycuANB3TrrpdrPH3Ls0OT
 1CC4m0Gbo3Xy/2J39uBWoBqq+Z205DtderaqL971oqGOmaKGSfUwdfuhrUrRWXlXiwj5
 WWzgItefDVGMNYi4r0of2QjDFIkX+AeWSJq0cFAyYj3ixxHXibZGYR/NCqhQ8EIXFfAt
 zbFg==
X-Gm-Message-State: ACrzQf266pcuCSWUk0N/nNbUU2wTKZYqlsxNgLHX51iqooI7U4Orlqxe
 OVtTCyHQ1EbIXlkY3G1M0wV/1phAZpk=
X-Google-Smtp-Source: AMsMyM7tULTs63HRISt+17Wr58NGvjlbAiBrcc6asNPP1uQnYW/K6JYPBmH1AGsYbwX+ygKY++oDGw==
X-Received: by 2002:a17:90b:3b90:b0:202:80ac:467c with SMTP id
 pc16-20020a17090b3b9000b0020280ac467cmr14130663pjb.17.1663309232370; 
 Thu, 15 Sep 2022 23:20:32 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170902f60300b00174c0dd29f0sm13934831plg.144.2022.09.15.23.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 23:20:32 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: broonie@kernel.org
Subject: [PATCH linux-next] ASoC: amd: acp: use function devm_kcalloc()
 instead of devm_kzalloc()
Date: Fri, 16 Sep 2022 06:20:27 +0000
Message-Id: <20220916062027.152815-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, AjitKumar.Pandey@amd.com,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 lgirdwood@gmail.com, baijiaju1990@gmail.com, akihiko.odaki@gmail.com,
 ye xingchen <ye.xingchen@zte.com.cn>, Vsujithkumar.Reddy@amd.com
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Use 2-factor multiplication argument form devm_kcalloc() instead
of devm_kzalloc().

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 sound/soc/amd/acp/acp-mach-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index f0c49127aad1..4c69cb6e3400 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -584,7 +584,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 	if (drv_data->dmic_cpu_id)
 		num_links++;
 
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) * num_links, GFP_KERNEL);
+	links = devm_kcalloc(dev, num_links, sizeof(struct snd_soc_dai_link), GFP_KERNEL);
 	if (!links)
 		return -ENOMEM;
 
@@ -749,7 +749,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 	if (drv_data->dmic_cpu_id)
 		num_links++;
 
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) * num_links, GFP_KERNEL);
+	links = devm_kcalloc(dev, num_links, sizeof(struct snd_soc_dai_link), GFP_KERNEL);
 	if (!links)
 		return -ENOMEM;
 
-- 
2.25.1
