Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E7F9258D1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:37:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E5FB1E93;
	Wed,  3 Jul 2024 12:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E5FB1E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720003041;
	bh=Nwe0xlKfiyDOaLPbyz9qVTptKB4D1oRYsTHNGpFlOMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wh+zDuhBBZzlYy8NPZSNb+0N7kH/v6J9WtbwdyKLg5NifyGl6XG6unN2zd/xD1Rto
	 N+WUlfDVXbo1cPQ5Y3CVPELhBGNOjiU870JduRfrSa2KwOWast8BbEbOE1whZKnDv3
	 mhUJnbFARrvYHXgt/xA4NdiJsOC2BOl0YbDvv7Q0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE765F805E1; Wed,  3 Jul 2024 12:36:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD1FF805C7;
	Wed,  3 Jul 2024 12:36:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9165FF8014C; Wed,  3 Jul 2024 12:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0607FF804FC
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0607FF804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oOtJJHcB
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a725282b926so587854466b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001775; x=1720606575;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfTnFwv4IUNzXvE0oSrrhVXmiYatYs6QJJBq0PCSPdk=;
        b=oOtJJHcBMvtoNcCkcFOoEwOSfK96X3fRM3kWvdVGIRsc2L0k2s666KmXIeEpLh97mE
         /HJxE5x2AOQdMgZuTXjvJV8Yck9XrGF/F6EFhqxqCdC0jua36T//cr4zvF/vYFV/IL1o
         fl8I2Kk6WECImhjSPxre+DqIA6u+l9FZpV8OAUtZSDy0C5LPdAXZTamxoMC6QOJpk4ir
         BSKNvrROMl7JG7vvvJdyw68zeRPBBkJuN4Adwhjcy7D6uYMZ9Zh+ob5dq518ND2gK6hm
         FjU8UqGPy94MdBpr1AZkif8t/C5SMgvgoBbgKLsA/ngl4zodsFvs1UaOKVxLIKUtaFbT
         P15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001775; x=1720606575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfTnFwv4IUNzXvE0oSrrhVXmiYatYs6QJJBq0PCSPdk=;
        b=PTdcGJ3n74dEnqQisMQZkKLJhamI166t1yoHgjcD+6rq0YPnbjQCPq7qxnIQ5cXmNM
         bEJ8mNWLj6G6TW3G7Rp3l1dz/BuuCSHQjsVx/zQOlIBzi5B8KtnXtAv3R81oQJX+CiLA
         Ikyde35VrkzFOZO8mxMOwFnQfWqtafsnVZcohTkzhqI0lQkzoD7Igj6gGxiU+X7z7IN0
         sCaU85sSjjCku1w5hPWuJ087gP+0xcDjYBAL5VMH5vSf2cbYIEIawHQOHg4b4bRTycgx
         d+dYGRWj9G2l3Hx4fxtHl1gYc/AYwjbtv/fOMLvF8jMzYailhYNOao4a56zorZC92zAT
         noYQ==
X-Gm-Message-State: AOJu0Yz4VNDBsTy96pDy6qAGW4VQ5cd2J/EjPYdL/x9yV31awPC5CKdz
	spHACaTrv/KMu7hOWEcH0mP3Ah9FJv0slvJstQ2MFkxXOiChKBkLASYcRoQlyLM=
X-Google-Smtp-Source: 
 AGHT+IHEpkDA1cTbqIue4QyD+vUx5qAFNk1xfrPOtv5WQ36h5sxJbjzXsmByi+3O7e+BsSkBPh3SRg==
X-Received: by 2002:a17:906:3106:b0:a6f:5609:9552 with SMTP id
 a640c23a62f3a-a75142d873cmr807100666b.10.1720001775533;
        Wed, 03 Jul 2024 03:16:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:15:55 +0200
Subject: [PATCH 3/9] soundwire: amd_init: simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-3-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Nwe0xlKfiyDOaLPbyz9qVTptKB4D1oRYsTHNGpFlOMk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTkpUkUyMw//T6vaBK4PU7FEkGwJPparyv6X
 fM0Zahd6duJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk5AAKCRDBN2bmhouD
 18xzD/9s6VRQ9i414HlaH5OFxg36sEnNg9LfehqxzJuG0E7kt3XaAmMcYoA2rR7Ffn83iw+4AJu
 5ItCS9iNlNtl+pXecAinp547m3YU6QH1PiZCNXpIfF7ETnnj7tbP3D442qaKDJ1Q96eOpO73EkY
 dSDeTNjC9wr6k4vgLpUqr4Rz5Y63SBEZm9E5WBHcCgTI3Zu0ha5hOuKGd1Z1qRuQCpN8UWWZt0F
 hn1NOznUQ6VPaZTkkCyv1RQWyncGN5t74p65+LRuPP577dlgq1gH9OQLEin9e1zCF72Rz/iyvxq
 KFTu69tQpmmNfSVh3rpOl81860NqcReO9+DQnBPSeKLxHSn1H/cM4RavuXiEozPfyQaJaTdufRr
 tstL3LTVrdanQrVXR+d8uLH0q/Ylu4ESxP8RJqGTeomCgkVdxD+/9JBvFM7LExRuW6bUlMeyCfu
 tvu7tx6CKGuv6CRwLEHIguOp1ZrXuoIB+YMvM3Q1ii5ZFflcKOXHINYDfzEjUWrnTt071E0csmC
 oun40ZtnuDT0yUI9Ll+DilLTcM/aIAkPp2YMtYlrsf/NLs/O0sxanFychJhb+0ZFxVR8veVRgaS
 rKvmhypzuD+87RRhi5Z4fzp6Fu3ox+wAg2N+8PTw6eHp3qKty+v30+ZCm5U5d4uWX7og5ZssvXo
 l9JutBGgyHSEYmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: QACDJIZV3E264M2IVCT6J3AXRCENSQD5
X-Message-ID-Hash: QACDJIZV3E264M2IVCT6J3AXRCENSQD5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QACDJIZV3E264M2IVCT6J3AXRCENSQD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/amd_init.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 4cd26f3a21f5..db040f435059 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -69,7 +70,6 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 {
 	struct sdw_amd_ctx *ctx;
 	struct acpi_device *adev;
-	struct resource *sdw_res;
 	struct acp_sdw_pdata sdw_pdata[2];
 	struct platform_device_info pdevinfo[2];
 	u32 link_mask;
@@ -104,7 +104,8 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	ctx->count = count;
 	ctx->link_mask = res->link_mask;
-	sdw_res = kzalloc(sizeof(*sdw_res), GFP_KERNEL);
+	struct resource *sdw_res __free(kfree) = kzalloc(sizeof(*sdw_res),
+							 GFP_KERNEL);
 	if (!sdw_res) {
 		kfree(ctx);
 		return NULL;
@@ -132,7 +133,6 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		if (IS_ERR(ctx->pdev[index]))
 			goto err;
 	}
-	kfree(sdw_res);
 	return ctx;
 err:
 	while (index--) {
@@ -142,7 +142,6 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		platform_device_unregister(ctx->pdev[index]);
 	}
 
-	kfree(sdw_res);
 	kfree(ctx);
 	return NULL;
 }

-- 
2.43.0

