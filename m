Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66F66B8A6
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 09:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EC3C517C;
	Mon, 16 Jan 2023 09:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EC3C517C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673856187;
	bh=CtVylMFpnJWK4+7d5PUIAjyOIqqFgGyuGsYcvb2iZXE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=URRpsjWZ9y8zz/EDqTGUtP1vS1Dl0QvxjghVw+fxRFCUS7/EOPA8n1IqWl6Ow/F3e
	 qE+/D5RbS7a1Ty5MWsdyl0Hivf90uKwWNXIGC4T8XRak8tV6SerxhfD5puutxWjBrV
	 ENdFGeU5KYHg0k2JyX9P5qwH1jAsYO9C4y/6QTUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B0EAF80083;
	Mon, 16 Jan 2023 09:01:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53A50F804F2; Sun, 15 Jan 2023 20:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7368F804DE
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 20:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7368F804DE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ptg+XxdP
Received: by mail-wm1-x335.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so4467214wmc.1
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 11:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKS96pmJPoYb7b0N1pU8tQ1JoETnhuDxnTgIIKOenYM=;
 b=ptg+XxdP0iKhBkszM3udc/4H9pCnHeQS36Lsg2Ij0gMHkNcIvlvI1Cju75BpLjmsGX
 kHc0qsHeG4rGBEVp+kh2tmeQyyLVyDrdtY0z1CmRapu2VdLNtavrsQKmSz5u++fHJ4aV
 RliGMKFR4cvOcRMAeKpW3D/+zhgiqUyxi66rUm1gNcKYWk/VHZ12gMsoGRD/REB2BWBk
 RDshmY8uokHGzZjixSDoc67PtAdDhIXgjex3/HRthkje6iEvctdN4QX5AlLkD4i+0/Mp
 cIgj3pZ3+0D5e4tpKCaQT8v9Bqajzg8yccQ4Cocq5QqPTPsYdgoplDeH+ulyUInAAH2X
 iqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKS96pmJPoYb7b0N1pU8tQ1JoETnhuDxnTgIIKOenYM=;
 b=ru+J23y7n/2+1E0scvLyhpLjjKW1AMOLapW5XHs0v898b/lLqNOYo5Th9LeGKIkPNl
 tTHx8o8M6X/JgIoch3kerYc1eAAHrSfqkm/TvGXmc6CxESFzeoYqXHooqfjv8ZshOuDT
 g0l/w5Akn9gz8s/LY06H+LohvLuJX5Vd9Vy4956jU3U4D69MnbYmOktnWwBh3fFMne2B
 FInURvUVLI0iHz80kieupqJ7OK30+TdhPUzD7JlF9eN0ScCZwXn84Wq7efHvmLcV4Spy
 DqpCirSsfoB8pDKcCLSQ1NpxKF6hdwsmiTyugY1ZqwkJAqhTlzn9SCnFJ7UNqmawLtYw
 uj9w==
X-Gm-Message-State: AFqh2krEzvxctxpIFSLYQhMYodFoGaJCnwqMHty0IglRz4ZlHsQG5GH3
 zP5aFszcPZDKpFXEE+GqJ2HBpA==
X-Google-Smtp-Source: AMrXdXtiAtWBNInaUn1ciDGHW3hTscUUewtiMApYCrZAJJioAH4xZZgDcR5vCIpdWiBgI2mj0JNJ6A==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id
 s26-20020a7bc39a000000b003d20640c4e5mr63160339wmj.8.1673811239112; 
 Sun, 15 Jan 2023 11:33:59 -0800 (PST)
Received: from neptune.hotspot.internet-for-guests.com
 (ip-078-094-237-238.um19.pools.vodafone-ip.de. [78.94.237.238])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm30559281wmj.36.2023.01.15.11.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 11:33:58 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: dt-bindings: add entry for TAS5720A-Q1 driver
Date: Sun, 15 Jan 2023 21:33:47 +0200
Message-Id: <20230115193347.24190-4-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115193347.24190-1-alex@shruggie.ro>
References: <20230115193347.24190-1-alex@shruggie.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Jan 2023 09:01:06 +0100
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
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Alexandru Ardelean <alex@shruggie.ro>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Steffen Aschbacher <steffen.aschbacher@stihl.de>

Add entry for the TAS5720A-Q1 driver in the dt-bindings doc.

Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
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

