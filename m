Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B90304E86EA
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 10:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B01C15C2;
	Sun, 27 Mar 2022 10:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B01C15C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648369300;
	bh=VMzAN0V0wSrg3XOZ/8vkkbM7tEuhVR20WIhd9G2z7Pc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XmEj27gm9XX8pASUNBQkBGwrTwq3j9WIyS8gn0FUXFSByuiDaE4YCuUieiHtprRWt
	 XHn1XfiQV003MUHA7W1gl4gKdvpwYfcrUFFtuAjYqvxlFmomAVhuEBNpULSu9y0q+1
	 24tE54eSOa0kwGMmKq0KxIDNc2mbO5Odtnp/RUNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA3A0F8019B;
	Sun, 27 Mar 2022 10:20:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9970F80161; Sun, 27 Mar 2022 10:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 394D4F80121
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 10:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394D4F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C4/csvfM"
Received: by mail-pg1-x530.google.com with SMTP id q19so9906285pgm.6
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=iQQ+IOJD8woJe4Cpni8NJ/Jh5Shpl0rcuLhtMKYlCKE=;
 b=C4/csvfMTnPgRmrp6b0hSz55zfUOjucPIygLPMoAFdpf/mf8cfZ5uaKc2XsrBVJGDw
 1UFFBIkCGoZaeqG6HJ0eJwEkUgkjm+/M71eaHw3ShJpH3fvpKh8AQlmzIr+s7zjgJeGc
 BUfUHgZgc3aXDKLXy51waL0eESjiXyWBF2OJ5IMcOUXbts/QR71+0G6TCkUE1pNq5gIR
 TfZZXy40zj7JNGNgKQTFPn5JSagRXLGmtUjuU5MwNEFk3Anfx8Do79XM6JEXLy+crlmm
 2WY0E/iTKId+cs4brT1976qOIbexdNLbkfNsP4sUjnz7c0dTLTv7TUOv94gn0brjH4Bj
 IXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iQQ+IOJD8woJe4Cpni8NJ/Jh5Shpl0rcuLhtMKYlCKE=;
 b=11ZFSRYC39prOuvR/hULfLGV6E8aEKEncNmWjfJMlYL4dJ1v2qzP7t8SlkpyXlGKtO
 NdLbSVYvfBhb6NeC7BNn2t4UINIO9M0ojyTlgQodW7+nYzvoH7UUVOudtPDh5gYlrx3T
 gGmVjB99Nqvg/ijpRv77GiD26uQ1t+z3oht3d1RZEDPaNCPkW76LODf6OfAnR3UVFNDU
 EvfuHO9oNDTRsSK50496+ahe0KUBRYP8C5X6THFdSkRDDdoAcM3LI04Btrfw7hd/g/8K
 k4MgpxGudiwGzQ2IcMOaxNKbiHyo/2SuTsiOzOe1QSUSltDAz4Ir4CyyRVb8g8aMtzfe
 Se2w==
X-Gm-Message-State: AOAM531XPgsYUXmryZ6Y3x5SPSyrEE3iy/36xvcxyuhcEFwYYRDp60fs
 c6eeIBlNa9SXfOes31h9I94=
X-Google-Smtp-Source: ABdhPJwbp3kze+Q3ithWE8CbHeNMYcS362en2Df3psbrfIL/PeoiasPCpV/OGshUDQeCQe9vAw45fQ==
X-Received: by 2002:a63:1459:0:b0:381:7672:e79f with SMTP id
 25-20020a631459000000b003817672e79fmr6069259pgu.214.1648369224925; 
 Sun, 27 Mar 2022 01:20:24 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 w6-20020a17090a460600b001bf355e964fsm17099915pjg.0.2022.03.27.01.20.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:20:24 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] soc: soc-core: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 16:20:18 +0800
Message-Id: <20220327082018.13585-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, linux-kernel@vger.kernel.org,
 kuninori.morimoto.gx@renesas.com
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
	*dai_name = dai->driver->name;

For for_each_component_dais, just like list_for_each_entry,
the list iterator 'dai' will point to a bogus position
containing HEAD if the list is empty or no element is found.
This case must be checked before any use of the iterator,
otherwise it will lead to a invalid memory access.

To fix the bug, use a new variable 'iter' as the list iterator,
while use the original variable 'dai' as a dedicated pointer
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: 58bf4179000a3 ("ASoC: soc-core: remove dai_drv from snd_soc_component")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 sound/soc/soc-core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 434e61b46983..064fc0347868 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3238,7 +3238,7 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 
 		ret = snd_soc_component_of_xlate_dai_name(pos, args, dai_name);
 		if (ret == -ENOTSUPP) {
-			struct snd_soc_dai *dai;
+			struct snd_soc_dai *dai = NULL, *iter;
 			int id = -1;
 
 			switch (args->args_count) {
@@ -3261,12 +3261,19 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			ret = 0;
 
 			/* find target DAI */
-			for_each_component_dais(pos, dai) {
-				if (id == 0)
+			for_each_component_dais(pos, iter) {
+				if (id == 0) {
+					dai = iter;
 					break;
+				}
 				id--;
 			}
 
+			if (!dai) {
+				ret = -EINVAL;
+				continue;
+			}
+
 			*dai_name = dai->driver->name;
 			if (!*dai_name)
 				*dai_name = pos->name;
-- 
2.17.1

