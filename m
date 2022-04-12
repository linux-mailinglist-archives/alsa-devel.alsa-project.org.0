Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728274FE453
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 17:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1935018B9;
	Tue, 12 Apr 2022 17:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1935018B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649775975;
	bh=ZPXNsQhBlY5X7mvV2wpDPubtYGw02FRf8N/D8DsT7fs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q6v67tEeQqXc9wJpmWN7qL+AfJBOnY9vSURanqRlyKx09/73tkEqO71yTPA1hh/9K
	 qCbSO9J9AQ0PDBvh3XDfKkAQd6hTU26HLUFwno23s+5aV7OPIS7J7Vrl0Kas2MrzXQ
	 1NCDzvf0r9AVftn9VR36q5SaAog6qXOaaaimQL4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D8EFF80095;
	Tue, 12 Apr 2022 17:05:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D040F80154; Tue, 12 Apr 2022 17:05:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF152F8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 17:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF152F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="FLvdqRwx"
Received: by mail-wr1-x435.google.com with SMTP id c10so7031943wrb.1
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AU2XsmDlDNlX0BEIJLBYiWWgvTto/3B9fgEktWGlYes=;
 b=FLvdqRwxsxx8Xo/stue2ji1qIfkqVdTAjxTS4EXVFaBypzDQTGplbAch/Ak2V+kLAO
 1VSMTefrGAQ8MwRJM9lsr/J1AZ5q7x33iM3UKBRn63jlvQSSyuLOCPbubYe8xOPzCY0S
 CZAfT9NJWSAKvXuIZlHOsKDY7zua6SrVtoyS42Ymh5XNMQiUYasLIjio4vYF3T6FUmf+
 DXC7rNP1FKqVsxUMzPoJE3mIANYsQp4U2hnDwClCb0ezUCJSlojSetiiznwCkfsPLoi8
 BQQE+P3W4xSrSR0p7HD4UOCeshOvLd6Yz2oLZqKUZppDnJV3WGLPTPJm7nNzIcMS3piu
 bPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AU2XsmDlDNlX0BEIJLBYiWWgvTto/3B9fgEktWGlYes=;
 b=3VL8m65IK9F6hthSmpOkHU7CbyMR8r0/5RzVhNoAwIe4GdP28rd5jLDPrYGxHf06Qq
 o2+eFceYRv7BKu/deew4NODCp6vH9pYtTtVGPX37YKLVdH5GXxXM3nI/I6GexZg9C8vU
 WjthHwRQuN9PUOeiljdk5+Py7/f/TtAWKl0iwBUOCqr3qKuJYBii3Yf/HS+vchSJ4Ano
 T0cp5REMwYCicvVYqsdQanHGmPZeh7FzIZIHD0idxUJbUDWMg0ybQSY5VAZgipF4SzCO
 nJ0ydq5p+FxAOjX0Ma3awBqo2JpwVntyCibjDKhLct/iTl611RVr6OdbLzXtnkG6eOZv
 X3Mw==
X-Gm-Message-State: AOAM532u9iH0VNOKHxcIvlB6H9NaIMhU7RauMjaoV30iEJ22deEchCJj
 RIrC41tv1U3TX1JYhVmIPv6E/g==
X-Google-Smtp-Source: ABdhPJxd7WjJ9ssivqQBFFzu00/JymmKh7NNpLeijb6Bysb443KvBJi9evGO+J3pEkJBE/id0C1F5Q==
X-Received: by 2002:adf:ee81:0:b0:206:1b32:d6f2 with SMTP id
 b1-20020adfee81000000b002061b32d6f2mr28536137wro.144.1649775903583; 
 Tue, 12 Apr 2022 08:05:03 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id
 61-20020adf8143000000b002061d8d807esm19685371wrm.87.2022.04.12.08.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 08:05:03 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 robh+dt@kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: tas27xx: fix invalid yaml
Date: Tue, 12 Apr 2022 15:04:44 +0000
Message-Id: <20220412150444.3918829-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
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

The word "or" is useless and breaks yaml validation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Change since v1:
- Added reviewed-by
- Fixed subject

 Documentation/devicetree/bindings/sound/tas27xx.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
index 191f4bceb4ee..66a0df8850ea 100644
--- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/tas27xx.yaml
@@ -20,7 +20,6 @@ properties:
   compatible:
     enum:
       - ti,tas2764
-      or
       - ti,tas2780
 
   reg:
-- 
2.35.1

