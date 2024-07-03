Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BDD925FF2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC9EBE85;
	Wed,  3 Jul 2024 14:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC9EBE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008953;
	bh=RsWsmysnuoF6fY/OCoGbFZiI1xwwnVRPPOdxwdqc+3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QzclUkLEYds6+s7RAZG7Jqb7J1eurq5eHuRo9hyKN90Qy6fekysGNyF2QPtRJq2Ys
	 U5OlgnBg+7nLcaZJpXcvaNk+jPtgkQTUnJi9StqCpSFMhZTF9dDZ64KubZBSz0seyx
	 fkQw1CCTxAnZLAdiTm3ZF5CZQlcU91na8MMHzyIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 744BFF80673; Wed,  3 Jul 2024 14:14:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F1FF80672;
	Wed,  3 Jul 2024 14:14:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36B2DF8025E; Wed,  3 Jul 2024 14:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC647F80587
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC647F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CekzcQ1A
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-36786081ac8so906733f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008682; x=1720613482;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJA9Libl+Uqmyn52YGiFDQqu33nD4AolbxKyly1SWNY=;
        b=CekzcQ1AvnOFCtBbco6D/+tK8cep3aD1xcTGPIahWNqwjQxHYsmIjv7o98/4zNBRZ2
         xij0bjwgOuAd8E9wMMAJFEIY9JPxSvEtIgLBAlqC3RL6cpvErEZnDbrtI0ejrYjrgZxd
         qGF/RHs5qtyXUwo/S8/rPbHzSKxnwyJ+jkearSfe9VC8p5iUQ4m0623uCTtGt/ZG99V2
         thWIE7ONSpYQk9RK5jAAO4Egunjpr9INJva5xPMAVO5LWwKMIUikNtPfGmweQmAPSFEP
         zNa0Gtj0nmmmHt+JN08BzjAL/qZIQ4Aa+ogE93lI/HGiBJHBZFo9NmPs0LZCfoPXdtQv
         fwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008682; x=1720613482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJA9Libl+Uqmyn52YGiFDQqu33nD4AolbxKyly1SWNY=;
        b=wAeFt3x3a5U+9Fo86Q30JCaAZIcV91g5O4U4DOK09PcA03YpGHXik8VyTUZ7Lfk23x
         eUO05SCfw+IiF478eHqNg1FUq7o69hRcX6OPKaDI9klk4k+XKUjgf0HWPAsXQ27O73gQ
         6BdQRqS+IIoJKa4DNUCs6ivWbhHbGr9qFMQYwR/wUCdZWEHr/uLF8BSKmkZqUr5XJEiB
         VFPhFlmF46qCzQeIOUt68K000sA/pJBXbbTOcRYgwIBDCUJ4FFGTpzfuJGmKR8wXNKiM
         s8V2lT19oZ/qQj3JrnojgbT5HxlfeFCNw0LHTbYqi4osx7vIq/MLoQJA+Gf3ZOWgXQtk
         /X9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQT3RuKuSDbCe/Cr8INkuAnFdFUkjYGjDYOyz24chU48HJa6YsVtnfNfzJUEEzZvodb2cCCQZBjh5icaLkkzkJ5qKl5td8oRuFfQI=
X-Gm-Message-State: AOJu0YwBoQszhNUsPD/TqYoRoJnxwO3oObneVGczvmBuf3RIGuTak+UA
	mDRfsbmEtvoa4V3UjT8mOSvkPx4f+6gCGJsTi1L4qC3Fb3ev+Q9P+8kHwCROWIE=
X-Google-Smtp-Source: 
 AGHT+IF/dzKmxxIVuo0OfSIDGShstJ+GWG2IgoFCIidChX+Z7q4QU3VbhgmbdYsAVhPZV4fPfKOv3A==
X-Received: by 2002:adf:fe88:0:b0:364:aafb:5fd7 with SMTP id
 ffacd0b85a97d-36775725e0bmr7848589f8f.45.1720008681897;
        Wed, 03 Jul 2024 05:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:03 +0200
Subject: [PATCH 09/11] ASoC: ops: Simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-9-71219dfd0aef@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2630;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RsWsmysnuoF6fY/OCoGbFZiI1xwwnVRPPOdxwdqc+3o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/ZFFYqtapjqgR+qkmLxS6NgXzZ72SPoiC+n
 AVOrALK50WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/2QAKCRDBN2bmhouD
 1wVjD/9Kmx9Xn33PLX+O7XctVZDImIZXAIG3VS1fDB+WBE3Ein5aZrxm2K8EqHw8WshLKTu0N/+
 NbmILfiW8aIUfLIDgS/w7Bjen5cqwb4YyiT1pfCszbkNiFv2Jyc+MmxD3IXLwvWTr7AuZTqIILI
 l9JAeRHCPjEB2ch/Z/+UfsP1irQnj0d6xIgssBDxo7KRqPT2v/0vr3tqNDKKBnO3tkCd8D53lJW
 BJ5hIYReOcJXnyXU3mQB/GL0qK9daJygRgsofiW7Y94QzLtH6EMZW9u3pkTxrddhFXbD7q8Nvea
 1a6SCrP8t1xmXUNFEphcHVPVNtPsTcH0IAHFufd/Y94WNI+bnMv+/GC3llrBbqaRxVxgcpH1Bd1
 A7zCih62eVxnL2sbHpj/H9ADke3xGuuJ9x5BBWbOQQJhOKSU/k5UEscxiLla2DzcZykz0VpIR7z
 ocdZNaZhCc6ndeIPyrTNdZIpAfMmeyOkcbXUC3PuVzpR1i0jL/2BkOblsoa9+f9G+eCkLnx18XO
 oyPEFhdWrSJgr46XD9ADdva2yLcNZ/mCH+SCw5fP6Ta2U4gb0GKg+bJKArwkV1TsuxbUQ4rcsJn
 qLzd5Is+F2ga+9kpn5L72q578OAib/R87VK+XhAl50di/RTJn47RmDuuPpc1PyIPTJh8k713IGD
 fHN13N60FiqYYSw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: M5RXZNBGCRWLMINKFZJUPA7JY3RYXKFM
X-Message-ID-Hash: M5RXZNBGCRWLMINKFZJUPA7JY3RYXKFM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5RXZNBGCRWLMINKFZJUPA7JY3RYXKFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/soc-ops.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index b27e89ff6a16..19928f098d8d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -11,6 +11,7 @@
 //         with code, comments and ideas from :-
 //         Richard Purdie <richard@openedhand.com>
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -727,14 +728,14 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 	struct soc_bytes *params = (void *)kcontrol->private_value;
 	int ret, len;
 	unsigned int val, mask;
-	void *data;
 
 	if (!component->regmap || !params->num_regs)
 		return -EINVAL;
 
 	len = params->num_regs * component->val_bytes;
 
-	data = kmemdup(ucontrol->value.bytes.data, len, GFP_KERNEL | GFP_DMA);
+	void *data __free(kfree) = kmemdup(ucontrol->value.bytes.data, len,
+					   GFP_KERNEL | GFP_DMA);
 	if (!data)
 		return -ENOMEM;
 
@@ -746,7 +747,7 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 	if (params->mask) {
 		ret = regmap_read(component->regmap, params->base, &val);
 		if (ret != 0)
-			goto out;
+			return ret;
 
 		val &= params->mask;
 
@@ -760,14 +761,14 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 			ret = regmap_parse_val(component->regmap,
 							&mask, &mask);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u16 *)data)[0] &= mask;
 
 			ret = regmap_parse_val(component->regmap,
 							&val, &val);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u16 *)data)[0] |= val;
 			break;
@@ -776,30 +777,23 @@ int snd_soc_bytes_put(struct snd_kcontrol *kcontrol,
 			ret = regmap_parse_val(component->regmap,
 							&mask, &mask);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u32 *)data)[0] &= mask;
 
 			ret = regmap_parse_val(component->regmap,
 							&val, &val);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			((u32 *)data)[0] |= val;
 			break;
 		default:
-			ret = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	}
 
-	ret = regmap_raw_write(component->regmap, params->base,
-			       data, len);
-
-out:
-	kfree(data);
-
-	return ret;
+	return regmap_raw_write(component->regmap, params->base, data, len);
 }
 EXPORT_SYMBOL_GPL(snd_soc_bytes_put);
 

-- 
2.43.0

