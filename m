Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3391E67C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 19:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF0C9FAA;
	Mon,  1 Jul 2024 19:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF0C9FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719854419;
	bh=P21qd1OkbuiMrCjx3m8pH2sGiiMR71WkUYVgzpHXae8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PZwrNl/JQV+44Kh4ZQV6ARRa8Hi4kP7BH+XEfypdeaI0FaGUfM3fI78P5l0YUNAr4
	 z9XZ+ZqSHKt7lGYYEEA8dauf6PppybAXysK3YPYfLMYjL47y5OA1kxeVEs7XUJNyaC
	 PtizqZLRAo76GO8uNRM9lw3Bc8u8Nmuw+H/7srXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9540DF805E4; Mon,  1 Jul 2024 19:19:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A0A8F805DA;
	Mon,  1 Jul 2024 19:19:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 362EAF80238; Mon,  1 Jul 2024 19:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14080F800E4
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 19:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14080F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MEI4XdVt
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52cd717ec07so4160251e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 10:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719854362; x=1720459162;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqja86UDKTFIc+qc3NF0+FAZFhHDXQ4XzxpjOTJHZXE=;
        b=MEI4XdVtGCluz/o2P9Xlerzkt74Td/MJ2AsGmJiRw2AZdFk0+cJcuS4V0IQ59NeX5/
         i7c6l9SpEFJnINMC0FI/ZT0WolIpapGV/zQNdvQ/B8KBzu+/KcOE/BiDIdCBa5BBb+M/
         n5QA7vAcWyK/PZgLOnGqn6VxNqefjkhDvqpHnt6yHo5TXV9XGmmMb295CeZCMWWMshzw
         BfuJTJ5k3pvtxG+clb3OOKpdkTcN1u7AUpjCDr2WIE8xXxVRxvH6WHnvHCa3Y6zs9DmJ
         yoG/6BAuCaRv1sjr1XcNmKUsHFCyYRLMW+/g7+j2G3AqojypaKVB0k7H2GCumhw0/s1L
         EQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719854362; x=1720459162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqja86UDKTFIc+qc3NF0+FAZFhHDXQ4XzxpjOTJHZXE=;
        b=wTrwW6OX3Bha8YmNAwHgLhFyO16LP7i1RQm8qBPND+1U2IlQ245c3o7r6DalQ+JUcS
         JdRkdPgyw3Ks387CdcarvZeXCTWe4C7bGbpVslbwNNviMHI7t4K1KLIPhDJc35Wm07y6
         bYMm6Rr5R7iI8bEFq8lscKWx8MBixntYaiZLWdWaY1NdQl6eRr9WJZ8HtQ8LDZxRu8MA
         YWZJPdB0X2kuapECOYDZXHFWioJTShhwpHYTqSj5oTyTNzqnfM2zz5zWOy8ny3M92J8B
         cO/9Bc4+j06RbcOp+r/3LOWvsk5IbpZJt3dj2w2A/SCfzL5N8jZJpe+b8P4gw2Cg4Us0
         utaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlhGgjTESljGOtC8Z4xFGTdbwsyhrkcak1afuvCtztPsPvH9POfgVyuo5uIdBwYYQAW4X1T70DG6ySGsnsVWFMtnb4Sg1X2QNl9QQ=
X-Gm-Message-State: AOJu0YwIB2RMIzyGb3xuPcq/oQtuDHo1DuADWI7JAgn+aJJpRUmIeNX5
	FgQbKnrzB2X5a3recQdE8rTAf7m/uBhGRxO8llkX7O/1DOlnrggc5OPk7RGWQDI=
X-Google-Smtp-Source: 
 AGHT+IEpcOPlfAXhpzDXXuXPLW36uadem/IXz8BjMrFDaiR4x1PqQz5+4iXhrAFqE4LAPZjFn+z0sg==
X-Received: by 2002:a05:6512:1599:b0:52c:dc69:28f3 with SMTP id
 2adb3069b0e04-52e8270fa7dmr4370670e87.52.1719854362487;
        Mon, 01 Jul 2024 10:19:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a112e19sm10581137f8f.116.2024.07.01.10.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:19:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: topology: Simplify with cleanup.h
Date: Mon,  1 Jul 2024 19:19:17 +0200
Message-ID: <20240701171917.596173-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
References: <20240701171917.596173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DWK74J3IAVDQ6WCK3EOAIZGFTIW7WABU
X-Message-ID-Hash: DWK74J3IAVDQ6WCK3EOAIZGFTIW7WABU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWK74J3IAVDQ6WCK3EOAIZGFTIW7WABU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate memory, which is being freed at end of the scope, with
scoped/cleanup.h to reduce number of error paths and make code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index f4d62ea60baa..83319a928f29 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2020, Linaro Limited
 
+#include <linux/cleanup.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
@@ -1288,18 +1289,19 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	struct snd_soc_card *card = component->card;
 	struct device *dev = component->dev;
 	const struct firmware *fw;
-	char *tplg_fw_name;
 	int ret;
 
 	/* Inline with Qualcomm UCM configs and linux-firmware path */
-	tplg_fw_name = kasprintf(GFP_KERNEL, "qcom/%s/%s-tplg.bin", card->driver_name, card->name);
+	char *tplg_fw_name __free(kfree) = kasprintf(GFP_KERNEL, "qcom/%s/%s-tplg.bin",
+						     card->driver_name,
+						     card->name);
 	if (!tplg_fw_name)
 		return -ENOMEM;
 
 	ret = request_firmware(&fw, tplg_fw_name, dev);
 	if (ret < 0) {
 		dev_err(dev, "tplg firmware loading %s failed %d\n", tplg_fw_name, ret);
-		goto err;
+		return ret;
 	}
 
 	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
@@ -1309,8 +1311,6 @@ int audioreach_tplg_init(struct snd_soc_component *component)
 	}
 
 	release_firmware(fw);
-err:
-	kfree(tplg_fw_name);
 
 	return ret;
 }
-- 
2.43.0

