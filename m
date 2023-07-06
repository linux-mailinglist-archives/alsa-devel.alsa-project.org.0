Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BDA74A6A8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 00:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1FDE1DC;
	Fri,  7 Jul 2023 00:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1FDE1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688681988;
	bh=IEiMYE6Rei1W0hvm7CFZq9eK5YAq7WXNM4zmBFHKDM0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NTrw0jnCU/wSISyUnfujAHPyaC1c8gZlJ4+Kj1FAnWa7LvGYw3SXHlMPYHvO3Ld6B
	 DuHacTuSAMexP4FZj/j5xstIog3OQ/2s0DLg+m2YC/vl4M3hcAzc3QM8+AA02ZqUg6
	 jh60RcoiQWcb/K1AGF+YoQ4Mjk0Sa6S3Oe1WkwvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82CA0F80535; Fri,  7 Jul 2023 00:18:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F12E8F80124;
	Fri,  7 Jul 2023 00:18:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4373DF80125; Fri,  7 Jul 2023 00:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52094F80104
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 00:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52094F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=QknGzXf7
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-565e4741723so124189eaf.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 15:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688681918; x=1691273918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bu4ArN757zrK6429dA+5bQX13DVBTagf2yg0iXGGPcU=;
        b=QknGzXf7i6AU7TTviRyC3tzzf+EQYyXQjMOkPUfvQ7s4nJG1+MllzFOfQ79sOLX0DO
         muej3qCZuuVYAJO+ErY1H3BCZ+EKAmGx76ieSBR+ev+pof711p43KhdzBaNou6DhNjND
         Ehe+HnPka0Tf95GS12lg5/ka78XThImyXtd2HKRVgmKTrq11V4ko1miWO+BZjccvcsiI
         ccuFGU6171Ib/rxRELkGlMrw8L4xcMr1aJOBKMIt8VgBuAmAFlsESL3MvSkVS1yoVGwL
         A6w9HCgfRTtIxK3C/yh+8hRa2zJCXqYXo0nY7SckAGj31tcphKmhGnrsvwkDXsYxlBis
         EDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688681918; x=1691273918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bu4ArN757zrK6429dA+5bQX13DVBTagf2yg0iXGGPcU=;
        b=NuC7Y4peeOmQV209zfPKArNQZR9uPQoqKmf8W1W/o7m7FoKL5zsCUfEq86yRNEYrja
         CUMWLQ/C2WbOQtjJGRacmnBlebsoh5q28BgsrbzfRx9n9RhT8iroGvTRnO+4oFsisLHs
         Pswc3WhcYKy4TGkLgvJmBpq36ct/HY/Ei08PAdZio9e0pFZL3xRu93WFBRhHYk/XnxeO
         MN5YNok0gerDA+r1yG9ldZc/DTIM3GIryJkFXjfs+IxylthYf8RT/leL6HGL1BudoyHA
         Hxo6WBq6f6LqMXHmBks313kY2GNrv0rRQVWM8U1HuFd+7CNq9dm7no+M9nRdbe7lZoea
         qliw==
X-Gm-Message-State: ABy/qLZ49KYO2kXOIhr9MskEfe84D8oyBU2PQCzwrTzoCwaTDJuKmvEg
	lJQ91PPVG0P8RqlY6EAPMFQ=
X-Google-Smtp-Source: 
 APBJJlHS7EV2bmXMGM2r/VB1wrv4UFoC7vNpA114sabEnY7BGHNtjRyj+Oi6h4CO77mm9NagfbHJ5g==
X-Received: by 2002:a4a:c4c4:0:b0:563:3b56:5dc1 with SMTP id
 g4-20020a4ac4c4000000b005633b565dc1mr2269131ooq.0.1688681918360;
        Thu, 06 Jul 2023 15:18:38 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:da08:7cc0:c10e:810f])
        by smtp.gmail.com with ESMTPSA id
 bg30-20020a056820081e00b00558c88d131asm1005708oob.36.2023.07.06.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 15:18:37 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	alsa-devel@alsa-project.org,
	andreas@fatal.se,
	hans.soderlund@realbit.se,
	Fabio Estevam <festevam@denx.de>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable MCTL_MCLK_EN bit
 for master mode"
Date: Thu,  6 Jul 2023 19:18:27 -0300
Message-Id: <20230706221827.1938990-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U4B6HVKH3IBRLPHXBBO27KG3PKS577UI
X-Message-ID-Hash: U4B6HVKH3IBRLPHXBBO27KG3PKS577UI
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4B6HVKH3IBRLPHXBBO27KG3PKS577UI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

This reverts commit ff87d619ac180444db297f043962a5c325ded47b.

Andreas reports that on an i.MX8MP-based system where MCLK needs to be
used as an input, the MCLK pin is actually an output, despite not having
the 'fsl,sai-mclk-direction-output' property present in the devicetree.

This is caused by commit ff87d619ac18 ("ASoC: fsl_sai: Enable
MCTL_MCLK_EN bit for master mode") that sets FSL_SAI_MCTL_MCLK_EN
unconditionally for imx8mm/8mn/8mp/93, causing the MCLK to always
be configured as output.

FSL_SAI_MCTL_MCLK_EN corresponds to the MOE (MCLK Output Enable) bit
of register MCR and the drivers sets it when the
'fsl,sai-mclk-direction-output' devicetree property is present.

Revert the commit to allow SAI to use MCLK as input as well.

Cc: stable@vger.kernel.org
Fixes: ff87d619ac18 ("ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode")
Reported-by: Andreas Henriksson <andreas@fatal.se>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/fsl/fsl_sai.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5e09f634c61b..54b4bf3744c6 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -507,12 +507,6 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 				   savediv / 2 - 1);
 	}
 
-	if (sai->soc_data->max_register >= FSL_SAI_MCTL) {
-		/* SAI is in master mode at this point, so enable MCLK */
-		regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
-				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
-	}
-
 	return 0;
 }
 
-- 
2.34.1

