Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDBA3DDFAD
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 20:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB63172C;
	Mon,  2 Aug 2021 20:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB63172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627930680;
	bh=KrAMSf/8DxvOx0FIftHjzBPNIZtoAtkus193ctXppjY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TIYkxK7Fnh/F9iAqHCB0DeDHrR28Za+jbQ6e4ZTEOsNQ+xGVIKglFyuJOQCgdtZUw
	 YyblH6a9uuYMxYKspZzuzcQAlaH/dTHX0Ot5qpS6xVROLuIa0NGG3R8OigIshkYp7/
	 lSHmoYfMBJPUhkFhRVHjp4RjNFweRE+trDXW5e6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B72B2F800BF;
	Mon,  2 Aug 2021 20:56:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E26ADF8025F; Mon,  2 Aug 2021 20:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A20CCF8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 20:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A20CCF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kSiO1YSZ"
Received: by mail-lf1-x12f.google.com with SMTP id bq29so9939999lfb.5
 for <alsa-devel@alsa-project.org>; Mon, 02 Aug 2021 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MbqGPSW8VOThkKarLLIufkakwj9Fc62iaxbn2qNAotE=;
 b=kSiO1YSZOk7TO0KPkB22ZwpNedL0nwTIEb9zJQHnwDdZsJsKDswNMVN6J1ggep7Q8S
 C8x4WJ8NyDRfKByxmK9Vm9K1VL+7gPi3SrEzWVJfD/HLfMhIIW22BsAuw9ZEPe2HPBsF
 7hsZ/gQIW7m5r3RqFTBmyalUhRbrz04V/Slz6xODQ0w80rEIi/CAufYkCR5q7EacTwEp
 TP/vWSCJLSFbDb7+2WudiwyLXERQuHtkX1p4hPDBpy21USUJd1ZON/IkWXwi6we7gfZ6
 vcTXo9fZpxbhKrfC1q+ona1AalFYFV6gPW1V6Cwl5NIaUH1CrGFjxrA8CKRkUxd7bQsp
 ZXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MbqGPSW8VOThkKarLLIufkakwj9Fc62iaxbn2qNAotE=;
 b=m/RHVTkbJOthSNsBLkRbHXzfjmWUFaOIOhnCa7/cOme2XBzjemLPW+6FRFzAuRa65W
 p+CqCI3dHpLyeV6PlemoXhQ/lvaEKdH81FekrhZDjM4tboK3d+LuKd7SdxeQJfcWrw/8
 nW2iQshfAhaAcpJtBGXuG4h3f9VKQf2i0qMVI62BPXi2xS6J20WqAAxLF1LCfmrSmpz8
 TdWBLNxXBKT/xlGtujZg2LzNn/W6AzzjQs6epcLDtZJQFBtYvzAM8W+18YrVGKddElos
 pvr65vJNrNnIU04d/09P8apH1NSdbWP5HnVYqpV5NQAy/Ly5sk+bNIoL0vHvBazrOvbX
 1E6Q==
X-Gm-Message-State: AOAM533qHyIGyyWIIqGZ3IICjTLsGsInAPS8jVX8JG6cDe7ImORG4m+4
 OGWfFDmYynSJdrIqio5vPAAqYqiRtQU=
X-Google-Smtp-Source: ABdhPJygQ2hzBnGLJ9Jw0i/SBv5WluES3z3AMhjnXjFEYyrsdJfXmCxBRwWqQy6jIhwOKBrHK5ALZw==
X-Received: by 2002:a05:6512:118c:: with SMTP id
 g12mr13817379lfr.143.1627930586424; 
 Mon, 02 Aug 2021 11:56:26 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru.
 [94.29.22.96])
 by smtp.gmail.com with ESMTPSA id p17sm907269ljc.32.2021.08.02.11.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 11:56:26 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1] ASoC: rt5640: Silence warning message about missing
 interrupt
Date: Mon,  2 Aug 2021 21:52:58 +0300
Message-Id: <20210802185258.1881-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Interrupt is optional for the RT5640 codec. Nexus 7 doesn't use interrupt,
this results in a noisy warning message that looks like a error condition.
Make interrupt explicitly optional to silence the message, use modern
IRQF_NO_AUTOEN flag and correct the reg[q]uest typo in the message.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/codecs/rt5640.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 9523f4b5c800..0f5087a7644b 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2836,15 +2836,18 @@ static int rt5640_i2c_probe(struct i2c_client *i2c,
 	if (ret)
 		return ret;
 
-	ret = devm_request_irq(&i2c->dev, rt5640->irq, rt5640_irq,
-			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
-			       | IRQF_ONESHOT, "rt5640", rt5640);
-	if (ret == 0) {
-		/* Gets re-enabled by rt5640_set_jack() */
-		disable_irq(rt5640->irq);
+	if (rt5640->irq) {
+		/* enabled by rt5640_set_jack() */
+		ret = devm_request_irq(&i2c->dev, rt5640->irq, rt5640_irq,
+				       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN |
+				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				       "rt5640", rt5640);
+		if (ret) {
+			dev_err(&i2c->dev, "Failed to request IRQ %d: %d\n",
+				rt5640->irq, ret);
+			return ret;
+		}
 	} else {
-		dev_warn(&i2c->dev, "Failed to reguest IRQ %d: %d\n",
-			 rt5640->irq, ret);
 		rt5640->irq = -ENXIO;
 	}
 
-- 
2.32.0

