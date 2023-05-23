Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6539D70E77B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B63F208;
	Tue, 23 May 2023 23:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B63F208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684877988;
	bh=KDw2ZLbAjb9ApTiS0Uv1aBM7bX9yFQks2YcBbU/B23c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qUxHTREwBwPLMEJeV0907+Gqh3nK/7BX8OP9iVN3mUyKbzLr0P68YE4Z7KZD84QB5
	 VJFqTkpRr16vga/AvSmcQ0tZD34Ac+5QM89H/eGPiWQBVblq6blKxQu4RXt41/+LzM
	 lWmE+QN+PWTxN1mJoXgawFBg1L6+poBwoL9uSNP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11603F80548; Tue, 23 May 2023 23:38:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EADA2F80249;
	Tue, 23 May 2023 23:38:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B965EF80548; Tue, 23 May 2023 23:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA3C8F80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA3C8F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=IxRFm84j
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-394440f483fso199894b6e.3
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 14:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684877913; x=1687469913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VI4om0ZWAsAxPDpD0mRnXUe2apysOtTyxuri6O2D2jQ=;
        b=IxRFm84jrNoDiWcn5yW738bsCP5iCB0+EmH3a0i5BluwYlfXaNm4/LO8GY3bKEzmJk
         aCUSC36WK9GhGYMwwepdNTbFoMHV+9TH1Ejv1JYzw5H3OvwuyM24dFrcbPcCDReJJ6Kr
         8cvW4zgnlcdef4f+/ud0PKulsS+offM0b4j5G/PpjSgQvaMfFsEU1iSRwDnvXhDXcRTe
         46yPBK/3n5BC8K/XM8nT30CAWlpnUdlK4IHeL9973nRjPXGsjhek9YbZ+zWCLD1/L+ew
         iHluVRTd64DZ++VBCcP8GyEJxneQgfoWmLWDH2UJdk4ZZDp6zVOqV7imaCV51v09G+Cr
         f/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877913; x=1687469913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VI4om0ZWAsAxPDpD0mRnXUe2apysOtTyxuri6O2D2jQ=;
        b=MvhCzVafb06QM5zK7x58jNA9Da5B8bm3nt4/Vn4PI7A/3iIpJsxUXFBAUp1jXdkZ7V
         a6gpHRsg76M5zpqfBLe++RqcdEtkrU0TEg97i6qJxBGeTbUSR/uzDO20R2ZGTJDlh9XM
         srIjrLBd74CJp6m202zi3IXj+4A92xHEfUJPBTV7C6BaAiyJTEj6dB4omfTilDP/MsEb
         2uOaWRxz/hskrhEnYIrqiHY39DK/O/iNNAJjjF9cVTNt20Erk136CNbSg8RmA4zm9ZQH
         kJqQ4+yucSYim7jPxI0b/RGFqO9nCxPP1J8vb9VbGW0MMQkXA1KEdC5Lbrp6ZHKhyYrn
         ZkWg==
X-Gm-Message-State: AC+VfDysHbw+KqFI40VZJk0VvIXaAxlbHNkVUctRejLU9vOB/lf3D+OG
	36JFDck1eLbsMc9k6FdUMnM=
X-Google-Smtp-Source: 
 ACHHUZ49snHGywQm22s3ZruIpUwwW0LIO0zG7T/h5lkdyPqari17yoPFvSZJS3L1hb8wzc7tjabbWQ==
X-Received: by 2002:a05:6808:4043:b0:398:9ae:50cc with SMTP id
 cz3-20020a056808404300b0039809ae50ccmr4312004oib.41.1684877912654;
        Tue, 23 May 2023 14:38:32 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 y83-20020acae156000000b0037832f60518sm4442359oig.14.2023.05.23.14.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:38:32 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	zyw@rock-chips.com,
	sebastian.reichel@collabora.com,
	andyshrk@163.com,
	jagan@amarulasolutions.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/6] ASoC: es8328: Enabling support for 12Mhz sysclk
Date: Tue, 23 May 2023 16:38:20 -0500
Message-Id: <20230523213825.120077-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523213825.120077-1-macroalpha82@gmail.com>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IMB6GWGEDA4ASGD6HREP3XYD2TCOGBDV
X-Message-ID-Hash: IMB6GWGEDA4ASGD6HREP3XYD2TCOGBDV
X-MailFrom: macroalpha82@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMB6GWGEDA4ASGD6HREP3XYD2TCOGBDV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

Enable support for 12Mhz sysclk on es8328. This sysclk value is used on
the Indiedroid Nova rk3588s based single board computer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---
 sound/soc/codecs/es8328.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 160adc706cc6..3918be5fc3f1 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -36,6 +36,16 @@ static const struct snd_pcm_hw_constraint_list constraints_12288 = {
 	.list	= rates_12288,
 };
 
+static unsigned int ratios_12000[] = {
+	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
+	48000, 88235, 96000,
+};
+
+static struct snd_pcm_hw_constraint_list constraints_12000 = {
+	.count = ARRAY_SIZE(ratios_12000),
+	.list = ratios_12000,
+};
+
 static const unsigned int rates_11289[] = {
 	8018, 11025, 22050, 44100, 88200,
 };
@@ -577,6 +587,13 @@ static int es8328_set_sysclk(struct snd_soc_dai *codec_dai,
 		es8328->sysclk_constraints = &constraints_12288;
 		es8328->mclk_ratios = ratios_12288;
 		break;
+	case 24000000:
+		mclkdiv2 = 1;
+		fallthrough;
+	case 12000000:
+		es8328->sysclk_constraints = &constraints_12000;
+		es8328->mclk_ratios = ratios_12000;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.34.1

