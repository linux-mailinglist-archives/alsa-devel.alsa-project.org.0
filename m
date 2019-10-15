Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BD5DA549
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 08:05:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24780167E;
	Thu, 17 Oct 2019 08:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24780167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571292349;
	bh=31UePl50nyyW5X3w5AxY9zLA5re0PFTNyULBIBzDMLg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPf5hYT1IOQWtjroCbZ1Gb7+8g/3eG8vIN9U2AQC/n0yKsQRTsoJYYMqpPiiXoQdl
	 DejhhfYPXNZzk2tOePG9BNRUZl8tymxYyUodHn4GtchT/11tlLx8aUfJnw8YV8d2aW
	 kdAk+7Mw3U8t6ooPzLTVqm07VbLWckaF9l1r37tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24E70F80610;
	Thu, 17 Oct 2019 08:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CBB8F804AA; Tue, 15 Oct 2019 22:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF4A5F80323
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 22:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF4A5F80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LJ1MunfE"
Received: by mail-lf1-x141.google.com with SMTP id r22so15513548lfm.1
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nr7E38S2s3eAbbfCUSywjHEZ4H8fhbZYB2USx6be+tc=;
 b=LJ1MunfEen/5WdeqXuaYfAP+Mh+nhP6YEzWmf5tSN4j9pOg3kLWozDpA4ZFx9S4KLM
 j4S4Qe1TlUoZ/MjuBP0YlV7Yd4yWwSoEvKWNoxcEEEGZORwpYLk7QM/iyRVTCh7KFEV+
 If0rE6YeD27XziCo8oUODUrM2N5SWDT9OKrfyxImYTkevN67rtFIhlV0X4hnr4uBy9yO
 ag/uvka4qAnkwoEusS9ByPKqLrpoEFYze8o/2ylH3nblVhYDK8lVEq3C4wRQqHz9i4Vz
 3XXM3DAf9VqDEOxkDwiil7XC2uL+I1dHEofimY7U6Trb+k0L7xi8XYLEDAKgJF9+OJLj
 3JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nr7E38S2s3eAbbfCUSywjHEZ4H8fhbZYB2USx6be+tc=;
 b=QzP3+Wqiu5Omw/ljQQ1koVkjslApkk2KkA2acP/g/ma9TFzoZjt1zCiGaLutTohF6Z
 SnANg0zjg7HqKaRmArfBPKRl49QzSB6newk/lL2plH24XSvTkEV2HNF4EfUI76ZCKiDI
 GWBGiAhH9w8gPY4qyHB4SBQsrq/UlzgIb4jfa+QzDNIMM4nGWKI0VUZz1oa6ndgpN41J
 CIJEFjOnetBxKfJ71FF33fVqeJ+af7jcjXAYlmog/nqw+hUCkMU/4Eq84RUNDTkhnaGu
 Cn4KIYWXXuNAdA+/HHjr7nHNnxvjgzVKq7y3qT9fl13oBSLNry+Y0ZN4TXB2jSZA1xhy
 wgtQ==
X-Gm-Message-State: APjAAAXsiY2skUXWKOfR1+1VVdzW8S9b/QJBINxJXojKzRnH3iSeCyGT
 bgJAH6k1FgPgEVrDfBTzzsM=
X-Google-Smtp-Source: APXvYqy6f+ml42eTBF5EHpYvS0lb6p+kxv1I3hYXXpOAPXEeKvhwdtR7+dKPRDqNLQwk6eE/hOn3Sg==
X-Received: by 2002:ac2:5595:: with SMTP id v21mr9864950lfg.168.1571170169683; 
 Tue, 15 Oct 2019 13:09:29 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-153.NA.cust.bahnhof.se.
 [98.128.228.153])
 by smtp.gmail.com with ESMTPSA id z1sm5266247ljh.88.2019.10.15.13.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 13:09:28 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: dmurphy@ti.com
Date: Tue, 15 Oct 2019 22:09:00 +0200
Message-Id: <20191015200900.25798-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008181517.5332-2-dmurphy@ti.com>
References: <20191008181517.5332-2-dmurphy@ti.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 17 Oct 2019 08:02:16 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 navada@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: tas2562: Fix misuse of GENMASK macro
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Arguments are supposed to be ordered high then low.

Fixes: c173dba44c2d ("ASoC: tas2562: Introduce the TAS2562 amplifier")
Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
Spotted when trying to introduce compile time checking that the order
of the arguments to GENMASK are correct [0]. I have only compile tested
the patch.

[0]: https://lore.kernel.org/lkml/20191009214502.637875-1-rikard.falkeborn@gmail.com/

 sound/soc/codecs/tas2562.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 60f2bb1d198b..62e659ab786d 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -62,7 +62,7 @@
 
 #define TAS2562_TDM_CFG2_RIGHT_JUSTIFY	BIT(6)
 
-#define TAS2562_TDM_CFG2_RXLEN_MASK	GENMASK(0, 1)
+#define TAS2562_TDM_CFG2_RXLEN_MASK	GENMASK(1, 0)
 #define TAS2562_TDM_CFG2_RXLEN_16B	0x0
 #define TAS2562_TDM_CFG2_RXLEN_24B	BIT(0)
 #define TAS2562_TDM_CFG2_RXLEN_32B	BIT(1)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
