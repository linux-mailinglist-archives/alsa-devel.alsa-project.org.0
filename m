Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57890925FED
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:15:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7434EF50;
	Wed,  3 Jul 2024 14:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7434EF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008908;
	bh=S5zvkzQpDxgR0YGwGmmFBfehEAbVxpQY2x0q3BNuI2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XrIRnTB4jN3+jDZB9PVzhPesAFSJqYaGWdE537+nfRGpI8pPBYTQoN7wVJ7rtUTx4
	 m6pVDNJwTF9bG0fLRyVjw216Q9M7hyeIJMRVDIYKzjwWyrXaoIQ5sk39Cnn4XLhqeY
	 eL26yuIHe7SSQMZS7sVtbIBFMmX0s1AGOfM+MsDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33C6DF80603; Wed,  3 Jul 2024 14:14:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF9DF805ED;
	Wed,  3 Jul 2024 14:14:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23378F80589; Wed,  3 Jul 2024 14:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01A50F804FC
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A50F804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MFFGHiAr
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-425624255f3so3799835e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008679; x=1720613479;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJVuVtK10DRmUdGmaG4/PmO6Oec2LjszDDiQAZFkSrc=;
        b=MFFGHiArLaimer+bByTJ798lVH7QIchY+JPcsasGxULNEjVjwH6f4BNNkQYxrevjlF
         6DoWYZFqPvxLn7d0YRmHLubyKQduFs4u1BtEBS1nWv37ueGOnsyMScveqaVHWjV/mfBm
         y1lOryq+lzoD9v0hv9pRU8bDTmOVV7qLbxW+rnoyczf/dPs6cKJaO/URwycQZ/Q9qgm3
         b/RiQDbvNiK4pk2RoxIMmK+YMGczHQL5F+IR+BwlWAgq4tbPsNNGIw9336B26d3lK5AU
         y37R5ZAe+2RQpO8lZYe28Y+TG+P1rNOCbwsqGhNsQvzEHav3iwr+x21FlV6ZsCwbj12K
         lI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008679; x=1720613479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJVuVtK10DRmUdGmaG4/PmO6Oec2LjszDDiQAZFkSrc=;
        b=P7Kv0XA8VqiYr71WiW+oQjO5RVqwBbk5rI6/kVIGDxuVQ6UNJm6E1ln2TJI2o3eIH6
         BkY8Fla+tm7F9sIlHSd1NdRG4WxRS4LTYdsUrISCekgqyxfudUmhVRDtpszy2Wdl21DS
         TlM7xeWz5d8mXtdHkVF2Neh+dPQ1C3hynMCm5xP2uDgCpc3HN2+QJkGmcL18xruRCV1E
         ZdwVVHM+yHqiMg6V8tLSMw3RFKRsT53mi9/tVMoQ+mcfe348wsJg1h5IeyYG0QCIOVOH
         JnvaKQb+woEhsI3+jyWiZSL2Ntg/TrGUzUkMONKrQPS2uBB5lD5E6gp/gHdHnv+KKQ4v
         mLQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6JS/lLNp/096afz0PHuPSzQMTlc4uSaYMWeAfCYh7hwoAZVq5JgUfyiN9uMdJ1E4VbSCScgY1kXI+rCXFflzfQ0DkX2XCLSq6IQ0=
X-Gm-Message-State: AOJu0YzqE/58LAmLHZFtf2VjLK6Rslur6CNUi92IMitpJIOYL8JiA6Vb
	6Ue7FsCi/l3+806nVHt6YuF+8Ipx6aM7ES44tTFMBg86U8txnv9FMdNpDTzyL68=
X-Google-Smtp-Source: 
 AGHT+IGxHphf5D82gF71UP89obxHtvR4jIfjhlOvTO3r6ArO5pT2ywt5RlxUaNm4CuKeT17LcvrrIA==
X-Received: by 2002:a05:600c:4506:b0:425:7c42:d24b with SMTP id
 5b1f17b1804b1-4264093f010mr12776955e9.18.1720008679207;
        Wed, 03 Jul 2024 05:11:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:01 +0200
Subject: [PATCH 07/11] ASoC: audio-graph-card2: Use cleanup.h instead of
 devm_kfree()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-7-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=S5zvkzQpDxgR0YGwGmmFBfehEAbVxpQY2x0q3BNuI2o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/XW0SWctuZtJUcXCPlhsiWx2TNOffJ8CK/G
 W7SJVqOCxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1wAKCRDBN2bmhouD
 1wwmD/9/pdf7GwTIbhrVdNSj8ifQJAxH/unze4Doo1292r/QQqP/NTi6JIM9k11NGv/KmT68EbP
 wNtd2gHNAOILhJhnS83opBMJfoZWYjEguTMZtaD5RevZ2UuufFqvZRID1ikULZVGwuayXjCUebq
 BahUAoPu1hzTYOwToTFdCJYnTQAl+dg/umhIGuC7Hhsf8n9votw1LG7D0XJUEiCYC88xcT1Z/IR
 fRuzt1+eHyDSkSEFF3AtQlns1pVsDFe6IAGb9HDG24oLwD2glp+UmzdaXtlpTXAYPqmwXkFhe7r
 tBE7PSWWyGH3HgldHG0CDe8lVhj2yl9Gf3eqXWDUv7NsxrsbwRpVuaumm6BBXG4YbGnfTiyjXPQ
 b3qJY1g7ko5/Q2b0I8EXPh/Ca6yJ/+XwWZg4tjnEld0PBCtT+AOXhYgdZuQ3jODb4qMC0H6yvEI
 buwQeuR5d/DgsJAIUSRGIyGYKrUOyb97fJrDuk3VYDTflh9kwMw8Kn2qQrhp7aBDOC1pndwf5xG
 7RJduqVwRtVICBdGI0bP22ckUVhXToXgc6XnOlbQznn3Eakd+Qn2gsKlRw5jQdIfPnQrYVnVupW
 8sZ5WMY69SEMC0YZsiAMkSP+HfRvZcK+xH2NasIDubd2B2TuMG+zKFQKNndW03d/Ur2KJuIvmE4
 4mikRl8ItjzC1gQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: M3LZAHSH6KVJYQQPGIFUB564LKSKXV3O
X-Message-ID-Hash: M3LZAHSH6KVJYQQPGIFUB564LKSKXV3O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3LZAHSH6KVJYQQPGIFUB564LKSKXV3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h, instead of devm interface, to
make the code more obvious that memory is not used outside this scope.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/audio-graph-card2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 93d9d045587b..56f7f946882e 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1350,10 +1350,9 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 			  struct graph2_custom_hooks *hooks)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info *li;
 	int ret;
 
-	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
 		return -ENOMEM;
 
@@ -1417,8 +1416,6 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	ret = devm_snd_soc_register_card(dev, card);
 err:
-	devm_kfree(dev, li);
-
 	if (ret < 0)
 		dev_err_probe(dev, ret, "parse error\n");
 

-- 
2.43.0

