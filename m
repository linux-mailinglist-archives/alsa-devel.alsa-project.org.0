Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B8867F652
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 09:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 254C8EEB;
	Sat, 28 Jan 2023 09:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 254C8EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674894612;
	bh=3B3vkN1sWvv+jJA+eruD391VnHkUWkeJjdq7x5rYycE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GLIIDI9DEKHavVmTfKA06OTBiOLVnEVungcryRghvEInF35wfaCFOV5UfUgXfRn1I
	 d6Ymx5cIVnOLOy1zU4CGLk/mDNQQOCEjI/9QE6ROyQ+Sm1Ntq+1y7JWd0x8KBoKYc+
	 6iQorUIGT3zGimgfv8JgUgtoEomzkRnxxXS4+o8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32478F80549;
	Sat, 28 Jan 2023 09:28:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91BB6F803DC; Sat, 28 Jan 2023 09:28:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42880F80171
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 09:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42880F80171
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=rZT95hm6
Received: by mail-wr1-x42b.google.com with SMTP id a3so209697wrt.6
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lMGU9rK9OB+8LEnGHVaRIc7MkDB7sJchlMUQDFM0y0=;
 b=rZT95hm6VQ/dlTbnr5z6N8UBMsvLchadHMEBFMV2XBGkUsGHD/QU6n79nClcObpn1F
 kZ1u7qoE3HHGHLdTExOQbKq7fxX4xpw8sX8reg/4wxQW+49VnNTttFu9WUrrj8ngtazc
 R2v+fAQSFD9IG/M0OLBdTYCZuttfeKyGCycpWAtJe6HehLpKcjFotFzo3UPgVerWsPzN
 /LY+EaIdi0bowkLb2llHseF+GLlumd1HYKjnbB/GSTUBF3Hzq5xkrqCYUS1jpFOj6TH+
 4godhj/H9s6ABtxRHD2vJop06pBMu5Thhw0NHswBxuXH5oatFwHLtni0/S2wjkM3weK5
 CJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9lMGU9rK9OB+8LEnGHVaRIc7MkDB7sJchlMUQDFM0y0=;
 b=31uctuJ76CMvSxReAO2b+EbeMsH8tizF0crZgXcABbUdWXcy8FguGdd+bM+FhAqjzF
 EEQasb9HCa/jODMKgOQ6EWdKEcgBqChEsUlq8CQEy0NSSpJ9xYyrBAZymrVh92f3VxLY
 UPjejnrtsrKmjIRzeumfxUKB8zJHxGtFBonh2TWdjO72KQhzMJ3L3CMC83X1a03PKYj+
 cbByFNahFxiFwwtyIfA2nIoV9dOARoAzxPbo81WLeT1qiSuaITfNwWG6e1CmxXVlm4cl
 iu9fDBmOiZz4/L2QTN3WKEC+6HlPqNyZ1yXMXDxkL9j/PvRbTtGzKH5C4q4xUSbdyaGm
 0esQ==
X-Gm-Message-State: AO0yUKWHn9EU7XyV9EI9kHBdjEbUmbWW6FAo64j0P6+s98Jl23VmyJmk
 Q7CevqRP4i11WZbde+T2/MZmiw==
X-Google-Smtp-Source: AK7set9oxXFIdFSQ0KSzUdDUbKWvmM3nTWEb9JSr0orKabeTKM8Oto3DClgUXqezk8BKyXibl5ayZg==
X-Received: by 2002:adf:ffcf:0:b0:2bf:c134:befc with SMTP id
 x15-20020adfffcf000000b002bfc134befcmr8591012wrs.18.1674894486339; 
 Sat, 28 Jan 2023 00:28:06 -0800 (PST)
Received: from neptune.. ([188.27.130.91]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4cd1000000b002bfd52f31f6sm3815338wrt.9.2023.01.28.00.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 00:28:05 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 4/4] ASoC: dt-bindings: add entry for TAS5720A-Q1 driver
Date: Sat, 28 Jan 2023 10:27:44 +0200
Message-Id: <20230128082744.41849-4-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128082744.41849-1-alex@shruggie.ro>
References: <20230128082744.41849-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: steffen.aschbacher@stihl.de, tiwai@suse.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Alexandru Ardelean <alex@shruggie.ro>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Steffen Aschbacher <steffen.aschbacher@stihl.de>

Add entry for the TAS5720A-Q1 driver in the dt-bindings doc.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---

Changelog v1 -> v2:
- https://lore.kernel.org/alsa-devel/20230115193347.24190-4-alex@shruggie.ro/
- Added Krzysztof's Acked-by tag

 Documentation/devicetree/bindings/sound/tas5720.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tas5720.txt b/Documentation/devicetree/bindings/sound/tas5720.txt
index df99ca9451b0..7d851ae2bba2 100644
--- a/Documentation/devicetree/bindings/sound/tas5720.txt
+++ b/Documentation/devicetree/bindings/sound/tas5720.txt
@@ -6,11 +6,13 @@ audio playback. For more product information please see the links below:
 
 https://www.ti.com/product/TAS5720L
 https://www.ti.com/product/TAS5720M
+https://www.ti.com/product/TAS5720A-Q1
 https://www.ti.com/product/TAS5722L
 
 Required properties:
 
 - compatible : "ti,tas5720",
+               "ti,tas5720a-q1",
                "ti,tas5722"
 - reg : I2C slave address
 - dvdd-supply : phandle to a 3.3-V supply for the digital circuitry
-- 
2.34.1

