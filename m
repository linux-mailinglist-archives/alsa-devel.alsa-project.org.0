Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9087E25EF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 14:45:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F75E846;
	Mon,  6 Nov 2023 14:44:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F75E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699278348;
	bh=WQVOaUmhr1yLm37BGN8S5efIb1zMfK+uO5p5vb+HqTo=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SOkFCfrEXQto01e4cYXd+k9HQWp/mlNCsU8NgOJd9ULl8RWLmlx95I/w2UgEfvezh
	 00eUlll4kmVBZtMKtfZx33H9cOhWkEHiVEvOnBG/lUxJb54t2KR8i5vi0agHZmH9p4
	 P9YPaQBz2VZvvpTiOAaHB06mOxTrRWMBXi068ozA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A2A7F80557; Mon,  6 Nov 2023 14:44:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4614F80169;
	Mon,  6 Nov 2023 14:44:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 539DEF8016D; Mon,  6 Nov 2023 13:53:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E269F80100
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 13:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E269F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dHsM7WVY
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1cc5916d578so40146845ad.2
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Nov 2023 04:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699275171; x=1699879971;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkJFm7AWqgoxZKtuuwPEj91uzHEQLQCaygX1QJt5r6M=;
        b=dHsM7WVYg4CBnqIaUJ0pB0zZsN++1Ew0K/C2jK1GwhRzC8eBsmrXrcf3J6mlr9BMqb
         wIdxUL7B7w50XwJa/jcrP9k2SQFVdIB5jAqzgxztszVfNZXlw4AFlQMfJPkti5q8yjo2
         EZKvFbNCeBAdJyF2+YMUYnqKKhDK7891ynkIFVpq3NGf7GgPNoB1gQkulDEmhCRdmj8O
         GhxKD7ecGhynzX9a2dTxG3R5kXF8HkO4+MrRF7OuiW9AQuUnYBHnj86aGG96tSmetoq1
         a2W/Adb4tkadzwfk8fwwkihDbTGlOPVnt7bgYUR2AnmUbjNIZjCWT/cUZELZbEUkorMk
         L/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699275171; x=1699879971;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkJFm7AWqgoxZKtuuwPEj91uzHEQLQCaygX1QJt5r6M=;
        b=LZkuX04CKSLAXrGknZb0ovzRJC++CaE1sW6N0kQbk5PYY/wJ4+phw7BckH7RjBxMsq
         qsHNdFnNFgw1P6I+hX2dfeLaMHAeGmOiDnVi2ELFxcXjTzIIzK+Rlk8KcQCp1TSpZOAr
         MREqU6W1WzLYur5jT9+KOx+2iUYd8VdP+/kW5SOy1eLgSWzlFcMRaddEbPgJ4dFq4QVL
         EnaS+1qEZ9UL/TEMSqGYW3KLKDmSeZNmzq8OiClqvKEbGX82r5dL2x9fW34t7Taq/b9S
         72mecDMUrNg2jlL+SOE7WsZ8hEyyc8SsZzvXS0xCaoYaWSnZpO0ISifF77+C8sYN+YqT
         iqLw==
X-Gm-Message-State: AOJu0YzLRRErtWHGI5o/r50jp7GzB87FB+c89/pX3uzAPuWTPXLJoqTS
	WMtwxsemHnuHTFywOSQp1gs=
X-Google-Smtp-Source: 
 AGHT+IE2fBaQIh1ucFOQ2glJodobpZq4qRV6qGrShP4/Og+3rFK1m2kOxKs0zK5ib5GN2WPQ97ZTSQ==
X-Received: by 2002:a17:903:18a:b0:1cc:65b7:812b with SMTP id
 z10-20020a170903018a00b001cc65b7812bmr23955169plg.22.1699275170720;
        Mon, 06 Nov 2023 04:52:50 -0800 (PST)
Received: from [127.0.1.1] ([103.184.129.7])
        by smtp.gmail.com with ESMTPSA id
 iy18-20020a170903131200b001cc67103a15sm5884376plb.16.2023.11.06.04.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 04:52:50 -0800 (PST)
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 06 Nov 2023 20:51:03 +0800
Subject: [PATCH] ASoC: sti-uniperf: Use default pcm_config instead
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-sti-uniperf-v1-1-b2d8749cfa2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIADbhSGUC/x2NwQrCQAwFf6XkbKAboaC/Ih7S9a3NwbUkVQql/
 +7W4zAMs1HADUHXbiPH18LetUE6dZQnrU+wPRqT9HJOqR84FuNPtRleWEUgKBfBkKkVowZ4dK1
 5OpqXxgI/xOwotv43t/u+/wDckKYZdgAAAA==
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.12.0
X-MailFrom: keguang.zhang@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VNEVJKNYI3YMH5JI77MIEELXMM3ZDLKR
X-Message-ID-Hash: VNEVJKNYI3YMH5JI77MIEELXMM3ZDLKR
X-Mailman-Approved-At: Mon, 06 Nov 2023 13:44:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNEVJKNYI3YMH5JI77MIEELXMM3ZDLKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sti-uniperf pcm_config is the same as the default pcm_config.

Since commit 43556516fffe ("ASoC: soc-generic-dmaengine-pcm:
Use default config when none is given"), passing a NULL pointer
could let this driver use the default config.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 sound/soc/sti/sti_uniperif.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index 2c21a86421e6..ba824f14a39c 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -461,10 +461,6 @@ static int sti_uniperiph_cpu_dai_of(struct device_node *node,
 	return 0;
 }
 
-static const struct snd_dmaengine_pcm_config dmaengine_pcm_config = {
-	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
-};
-
 static int sti_uniperiph_probe(struct platform_device *pdev)
 {
 	struct sti_uniperiph_data *priv;
@@ -493,8 +489,7 @@ static int sti_uniperiph_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	return devm_snd_dmaengine_pcm_register(&pdev->dev,
-					       &dmaengine_pcm_config, 0);
+	return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 }
 
 static struct platform_driver sti_uniperiph_driver = {

---
base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
change-id: 20231106-sti-uniperf-a22e2ef92e6c

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>

