Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A962850B091
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 08:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBFB1716;
	Fri, 22 Apr 2022 08:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBFB1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650608890;
	bh=Tm7c/xEh3ka7YhXR5PbyrJwugrwmCCdcTDu1+FsxSvQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WzqDFIyISYEOO2Hq7ieqV72xnS4zyg+xRl6UCQkL1RRlL+bm80AYc67+tIKUUQMGO
	 EVVtLX7G4fs3mk4IFX36HaKojhfH5G/PCDWW/dXH6bIfnUj1UXw/5BQiDEWaZG35Ia
	 z8YL++QkHNwW8Ve78nrC07XbZDSdGNIDyKeDcbcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C78AFF80249;
	Fri, 22 Apr 2022 08:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 091E9F80125; Fri, 22 Apr 2022 08:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0DB4F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 08:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0DB4F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fhDY+Gu1"
Received: by mail-pl1-x633.google.com with SMTP id q3so8747311plg.3
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Y1YHaeXBfTbZfoBkSkWzaPdDe8ew5e9JhA6bfb6pRoE=;
 b=fhDY+Gu1VdlyMnkVxX8ZSA+fulTIKGS1pUFJKkEwCBZfAXOAQ1b24SC36olqknBP/4
 hQm8Fryq5s4n2AwOmTEchOXe3pHKJZttQq/3GGotS37ho3UsFMtVzOioJeqXB0HV03dK
 rwkwQ/H/+5pF/+jJZHuUBmNTUlIAxK+vW8+7+VL6d2YbjUuyseKlrUWY0avncLbDZkLf
 Qen3ZRACqL7ATPJ0jrTP4w/iMCfzHYIQryWsMTVfzSOAt2jHT4GsdDAC+IL82gl7CBP+
 nRQV4jLpTtLFamcSHv/6iEfSqzZ0TU6eqUr65GROcBfS3HzskiOAK9g3KzUfZNoCJt4e
 Gq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y1YHaeXBfTbZfoBkSkWzaPdDe8ew5e9JhA6bfb6pRoE=;
 b=WUhuI6SP+BC/70mrSjh98Lz4DOAZrzrR6L9jnwmKmEpcC1me3XVe8edSL8ioL3KWPP
 PHHVC4yFWZ5w7sYWeT1vHpSSqIO7MKXezAI6XKJhZUR5Y+oJKSTF29IjBtGb4UqnibwO
 lUiXza9G9IWbyZ4NhXu/63DWHaR26QKF/+P6JJ1rbr1iCRASHPuMEE8IRE1XLZP93Y2A
 CxSW8qIgeYDEnFdc3gXvokk4XJoovdWvGivWKWVuTyeatvgNjducDdKazbHfqUiAs+hu
 Ocb/Upc7/ZXW8YLSBswg/ndK12Ty+SqUCr35catZN3jT9SwlK8lW7qqeYEGUBZc+6IyO
 GRUA==
X-Gm-Message-State: AOAM532UWU5KF/FAUIKV+06J7twrhxEahWkIdXvy8buU6GogcD/j09Fu
 MFf4xmbjiL1qJM79H9Sdn1I=
X-Google-Smtp-Source: ABdhPJxlKzf+MZG6ybuWwrjftcHjKzx28RfjZXreCxWvDH1j7z8ZhQAAp6VzX1pfWf/O1RTMUWYiHw==
X-Received: by 2002:a17:902:d717:b0:156:20a9:d388 with SMTP id
 w23-20020a170902d71700b0015620a9d388mr3104594ply.19.1650608817581; 
 Thu, 21 Apr 2022 23:26:57 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:477:11a5:b8c8:12d2:abba:7a5c])
 by smtp.gmail.com with ESMTPSA id
 76-20020a62194f000000b0050abaf80f99sm1159200pfz.114.2022.04.21.23.26.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Apr 2022 23:26:56 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ASoC: rt9120: Correct the reg 0x09 size to one byte
Date: Fri, 22 Apr 2022 14:26:50 +0800
Message-Id: <1650608810-3829-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, broonie@kernel.org
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

From: ChiYuan Huang <cy_huang@richtek.com>

Correct the reg 0x09 size to one byte.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Sorry, in the original datasheet, reg 0x09 size is marked as 2 bytes.
But actually it's one byte RG size.
---
 sound/soc/codecs/rt9120.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index 7aa1772..6e0d7cf 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -341,7 +341,6 @@ static int rt9120_get_reg_size(unsigned int reg)
 {
 	switch (reg) {
 	case 0x00:
-	case 0x09:
 	case 0x20 ... 0x27:
 		return 2;
 	case 0x30 ... 0x3D:
-- 
2.7.4

