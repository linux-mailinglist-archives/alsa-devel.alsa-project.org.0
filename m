Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAA76FC6F2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 14:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12EAB10DB;
	Tue,  9 May 2023 14:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12EAB10DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683636231;
	bh=dquZ/gjdJbCd9F6+dgEOhV+T+WTFFOYNKUSdggxnN9w=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hzuV+SO5LSdOTwoUS87QygtB9yDnawO1bjRsSqK9mOW6QKY1hjppvlEmGfia7s5fo
	 OvAlrEHUSvQR4ZhBdxSyMteHy54IR5yJHjmSwZo0U/XJc5bVcNWAE8Y2XgvAaxae//
	 yODXcQafx6JTkEB1WGY/CFcdPXC6hMY4nEvnayzo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA5A3F80310;
	Tue,  9 May 2023 14:42:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4154F8052E; Tue,  9 May 2023 14:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7E1BF8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 14:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E1BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=bP7R2553
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f41d087b24so22116265e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683636163; x=1686228163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ogUelxBN/iBvkYaR2z1a5yJ9iiiICSJTX6onuQ39wKc=;
        b=bP7R25534DGHvBCha1PbVOLFyNyApN14uU0+rqLMNhnVLU10jdo0WpgiD4Fm5V0yAI
         qB9qqNDTJNCGQpxxKLifFkvcNrAT6QpRIzcuFAQOHfNsG4T1LJkdu9BJqroSTIQuCnSH
         hVmH8GmS4d3T4uHCkbAxE+GJfb+6wFmAyVPw8Qr8/MJJwoTr0DX3abclrKNkPLwDd3qq
         QnkES30ONz6qzfN90XpFKCc6PfH1ofxZHL/Kfgi8YzSg/5h5z+MdHLX6fTrmTadngxAg
         nsULLXonZPl8d+eq1IQ4r5tR/1ucDnjMokuQ606bWx9lLRVU7nOwih+KSmfHz8CWWfn8
         2Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683636163; x=1686228163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogUelxBN/iBvkYaR2z1a5yJ9iiiICSJTX6onuQ39wKc=;
        b=fw7thQI9lYJLbBAkVqXe8+2+d2GEEQf3HnzfXRVzknB29aWlYQE4PTRsKIdAPpPOlF
         1GaGig6UTVjFNOCQc3Ts0bwKkbJGVEp7vwFjfVkKdmPHLL+0K1KMoOeUMVB5no+iB1V/
         04q9Q/E9bsdUSeuhk2pYHzmlhrQWwKGBZTY9z33iiu1F0RpESMq+kDUfzQnopPhl7t5M
         RZWd1YKAJbW+zJPbb9AcxS2sGT0xYb3ULBXIGNxgWhrHBEmvg84DBRLuralxuh8rXbu9
         d6JQrV9lETxPaJKnCLgFeQKEIpYKUH/K5aMcXqsF+J5ujjl8Zf4j32t6DMmF8I8QY0Xa
         L9Ew==
X-Gm-Message-State: AC+VfDw3qJ6ZG/HRqMXvn0W1fCsQn0Q6U6Vr/1pakWYI28aFJcc93T8c
	TJD90R2X395WqoW76ikmoWs=
X-Google-Smtp-Source: 
 ACHHUZ4OvsksKT0JGRCaHiq1efo16lO58Z2ioXMGYLZCNfBtE3MpDpTy4POSymXX2RrynXBHt6s39g==
X-Received: by 2002:a05:6000:1a48:b0:306:34e4:be40 with SMTP id
 t8-20020a0560001a4800b0030634e4be40mr8884827wry.33.1683636163178;
        Tue, 09 May 2023 05:42:43 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a5d558e000000b003079f2c2de7sm3058083wrv.112.2023.05.09.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 05:42:42 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	paul@crapouillou.net
Subject: [PATCH v1 1/3] ASoC: jz4740-i2s: Add support for X1000 SoC
Date: Tue,  9 May 2023 13:42:36 +0100
Message-Id: <20230509124238.195191-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EQJMXV4PIT6W5373DZZENMUFVASEPONX
X-Message-ID-Hash: EQJMXV4PIT6W5373DZZENMUFVASEPONX
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQJMXV4PIT6W5373DZZENMUFVASEPONX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The X1000's AIC is similar to the AIC found on other Ingenic SoCs.
It has symmetric playback/capture rates like the JZ4740, but more
flexible clocking when outputting the system or bit clocks.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 6d9cfe0a5041..7cb563bb8b09 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -329,6 +329,14 @@ static const struct i2s_soc_info jz4760_i2s_soc_info = {
 	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 3),
 };
 
+static const struct i2s_soc_info x1000_i2s_soc_info = {
+	.dai = &jz4740_i2s_dai,
+	.field_rx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 24, 27),
+	.field_tx_fifo_thresh	= REG_FIELD(JZ_REG_AIC_CONF, 16, 20),
+	.field_i2sdiv_capture	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+	.field_i2sdiv_playback	= REG_FIELD(JZ_REG_AIC_CLK_DIV, 0, 8),
+};
+
 static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
 	.playback = {
@@ -440,6 +448,7 @@ static const struct of_device_id jz4740_of_matches[] = {
 	{ .compatible = "ingenic,jz4760-i2s", .data = &jz4760_i2s_soc_info },
 	{ .compatible = "ingenic,jz4770-i2s", .data = &jz4770_i2s_soc_info },
 	{ .compatible = "ingenic,jz4780-i2s", .data = &jz4780_i2s_soc_info },
+	{ .compatible = "ingenic,x1000-i2s", .data = &x1000_i2s_soc_info },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jz4740_of_matches);
-- 
2.39.2

