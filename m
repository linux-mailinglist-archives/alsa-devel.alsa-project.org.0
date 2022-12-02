Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB92640AFE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 17:43:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3781852;
	Fri,  2 Dec 2022 17:42:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3781852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669999380;
	bh=tAA/RyVMDfXjeNH66fqwxb8ZxW9yc6ih8Xec8T0fxXM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MC50mIBs04vYkgdqlDo8lf0fwn03htmi7DocumQwpK4XvYzPhIFCpz2+NukhsCtN+
	 /1mtnWHiGgBruIt14JKkdhu8jXDwL+2TJpMcmCl0JDPTIEK+omEp0n0JgDNc3aG+xr
	 7Vbdu+5DtcgDm1KtM7boKPtOG6a3OjOAN95Ai9yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06DF2F804B3;
	Fri,  2 Dec 2022 17:42:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42716F80310; Fri,  2 Dec 2022 17:42:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74AE0F80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 17:42:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74AE0F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W3qrvxNW"
Received: by mail-wr1-x431.google.com with SMTP id m14so8626469wrh.7
 for <alsa-devel@alsa-project.org>; Fri, 02 Dec 2022 08:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NBhUhPdweZ3fTupviVjoDkaZ/Bzxjb/TM6/+Uzw6tYM=;
 b=W3qrvxNWQG18OXMSTFZQkIOrmn9ZkqxlS3C/C5VDGgmacy8F6t4GEmPN7+nIzI3R1W
 UQjqIBsFhs2EmDiU4IouSTnNwPv6jUb97Il4+HByArzo6uADGnPWEGKJLJ0rOnvWxX1Q
 f7y6wk9Q+rYhTodh2rXoXvfytFFWNLtzU0x8mLSiy9Oj/a0izKbpcO//QAVdGSHCTEQg
 x7K8L8ymNYZvoApuerQTVuOL6ysZ97HpDjOG0FG8GgNNUBbRBrKcD2VJFGysU5557HPv
 5o7o9qy8DYTXJzniz5BXdgMtT2ot4J5sVDErgRFSi7f57gVONYVkQTVbHGLr6WJsqv3J
 dNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NBhUhPdweZ3fTupviVjoDkaZ/Bzxjb/TM6/+Uzw6tYM=;
 b=NbVlZeSeV888udvMMkszKsqbUBTJJsc/rd/kJFxa7M3BIBFZeq60V/yUZrSVNy/QN6
 baOgQt974uGswk9Z1CDQcG6tGCOSGhTWw6qADXXvTArSdYtsZUHKN12CmpIcFMzU3hNA
 gVxX5dPhDd7q8ULaIDZm9itnRe7Zs7CkxkKtdNM8qQlaNpr4eVFZZy6sCHwG/kW6tHi1
 DaOJGLMx+WPCHk/uouxg93UafdwzoS/GSgoi2Gl4rGvSUYSdYgxJqkBq07I9lIKpiLrW
 YjMXW4/79G+XmIpVyjX2AHXEBnReUbxhXND4QTQI3LN8WogGsOy0JFijvZpPNjnBCr0+
 MCbQ==
X-Gm-Message-State: ANoB5pn5L/GeczCi4JAtSt/QLBlEt+bpmHXuLISGolg0lOmH6FZ2cX9b
 VvxZ2wTp0hB4EjEJX2VpDPw=
X-Google-Smtp-Source: AA0mqf684oIN5gBFoOCtGHGhakQpJrnScN39W14mgEhGfEioE0MUho6Hs0PFLef9eXd4F5q208iQ/A==
X-Received: by 2002:a5d:46d1:0:b0:242:4698:f0a7 with SMTP id
 g17-20020a5d46d1000000b002424698f0a7mr2151557wrs.77.1669999318410; 
 Fri, 02 Dec 2022 08:41:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0024207ed4ce0sm7491149wrx.58.2022.12.02.08.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 08:41:57 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] ASoC: uniphier: aio-core: Make some read-only arrays
 static const
Date: Fri,  2 Dec 2022 16:41:56 +0000
Message-Id: <20221202164156.1812971-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Don't populate the read-only arrays slotsel_2ch, slotsel_multi, v_pll
and v_div on the stack but instead make them static const. Also makes
the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/uniphier/aio-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/uniphier/aio-core.c b/sound/soc/uniphier/aio-core.c
index b8195778953e..0eba60758134 100644
--- a/sound/soc/uniphier/aio-core.c
+++ b/sound/soc/uniphier/aio-core.c
@@ -277,17 +277,18 @@ void aio_port_reset(struct uniphier_aio_sub *sub)
 static int aio_port_set_ch(struct uniphier_aio_sub *sub)
 {
 	struct regmap *r = sub->aio->chip->regmap;
-	u32 slotsel_2ch[] = {
+	static const u32 slotsel_2ch[] = {
 		0, 0, 0, 0, 0,
 	};
-	u32 slotsel_multi[] = {
+	static const u32 slotsel_multi[] = {
 		OPORTMXTYSLOTCTR_SLOTSEL_SLOT0,
 		OPORTMXTYSLOTCTR_SLOTSEL_SLOT1,
 		OPORTMXTYSLOTCTR_SLOTSEL_SLOT2,
 		OPORTMXTYSLOTCTR_SLOTSEL_SLOT3,
 		OPORTMXTYSLOTCTR_SLOTSEL_SLOT4,
 	};
-	u32 mode, *slotsel;
+	u32 mode;
+	const u32 *slotsel;
 	int i;
 
 	switch (params_channels(&sub->params)) {
@@ -515,13 +516,13 @@ static int aio_port_set_clk(struct uniphier_aio_sub *sub)
 	struct uniphier_aio_chip *chip = sub->aio->chip;
 	struct device *dev = &sub->aio->chip->pdev->dev;
 	struct regmap *r = sub->aio->chip->regmap;
-	u32 v_pll[] = {
+	static const u32 v_pll[] = {
 		OPORTMXCTR2_ACLKSEL_A1, OPORTMXCTR2_ACLKSEL_F1,
 		OPORTMXCTR2_ACLKSEL_A2, OPORTMXCTR2_ACLKSEL_F2,
 		OPORTMXCTR2_ACLKSEL_A2PLL,
 		OPORTMXCTR2_ACLKSEL_RX1,
 	};
-	u32 v_div[] = {
+	static const u32 v_div[] = {
 		OPORTMXCTR2_DACCKSEL_1_2, OPORTMXCTR2_DACCKSEL_1_3,
 		OPORTMXCTR2_DACCKSEL_1_1, OPORTMXCTR2_DACCKSEL_2_3,
 	};
-- 
2.38.1

