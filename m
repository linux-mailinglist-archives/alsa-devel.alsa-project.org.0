Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73E93C0BC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 13:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B801EF50;
	Thu, 25 Jul 2024 13:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B801EF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721906734;
	bh=H3zPQHTWirqb+YKkh6z42j305IWpTK+pFRf3UJIfZsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hNRc+nCBD2OQzZrzimlcnrwnHkzCI+p32a0MiAdIsGJYke1HMgggipYSqk/2WmNzo
	 urHHlQhlW7xWTq/RvSrHO82m/apDd2av3/WuzajRI9sheuucYzvJAJ4Eu/5XzXcUK8
	 qbAvjMcG0I/5hm7oLaR6UUDexbMNoSuOpL6+f6QQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C232F805F5; Thu, 25 Jul 2024 13:24:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 067F7F805E1;
	Thu, 25 Jul 2024 13:24:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8EFCF80588; Thu, 25 Jul 2024 13:24:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72B5AF8007E
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 13:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72B5AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iULi9ThJ
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3687f91af40so509872f8f.0
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721906636; x=1722511436;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTBSTTOkb+WSl1iUVchSrVeyD6kc7gtLT8y+Hn/zjv8=;
        b=iULi9ThJEXe4ouj1fcfGKSOjQ6Pdi6E31DYXtq626KqiS+b4lFaGQPigu6w/5eMzK7
         Y6VOi87lVBDmcf5UktHEZUzYlKqNPgcyZ/aesWb6ufHsI/MUeg5S/4+IZCpM9zoTVgM6
         7nYrjo01dINeY9OaYW8EP8njRBFjVmL5HfjmdiV4ryptAKCVsb+D/kYMsSIK/c7Yvh/u
         XntyFyzfOyUHMr6fv8uuJbobVN1zVW2mnzAHl7WHehB6qaFyvr8Gwh40OTG0NKM9dT0Z
         V/LVjh31kNbRKnaa46CI8x/a1po2/6f3glSKP4wxixHug6tD35yLKIEzhAEvn0G/Fgvv
         CZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721906636; x=1722511436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTBSTTOkb+WSl1iUVchSrVeyD6kc7gtLT8y+Hn/zjv8=;
        b=twrR+aHTx9iFCE8qvVUcryG5Lt+NV1/LCcNJCDg8VbLdqBpxACEWPFt4uAqIC8SJ6o
         JoOK20E7iiFH+NMK2yK9qHKrDURKqW9I8W3KozE28yew5/etgrYY4T3403FVU2vtdUQW
         RIbnd/hYsheNjNoJz2zGQBRZAUCO5GNDSw/AMrmxyYy1L0PlkMQsl108QsCrQKEvCon1
         AaZjkqDrCBYXMKG4w7NYcadSmk4x29aaojSjLCKIngsNWhBITGGKJYNTPu4t5xB7T4vw
         0ZpEIbyoy+FmkAEVz6BpkGk7rzZVkC/wkibkveAw/lmkX8Hfm582J5Z+fBIXIYPIn1+L
         Rttw==
X-Gm-Message-State: AOJu0YwyAZUtSnSh+BFnkNYPofpOOmGyEG0lf7ecdPwlc+I96HAYpE7/
	U1Qz/pnyJ7wFrvsAAKLNsuKErPj5gwSE1Sda3xXmkxEfr4Vqd2NENgl0XbOBQLo=
X-Google-Smtp-Source: 
 AGHT+IHAfTlo9M6e5r9HgMHgdhErs0TlhZtiXo/7lrlvfs1/razJ48JKVhDyFjVXqWYom0Upw/26mQ==
X-Received: by 2002:a05:6000:e02:b0:368:3b1f:fe40 with SMTP id
 ffacd0b85a97d-36b319df228mr1806585f8f.20.1721906636120;
        Thu, 25 Jul 2024 04:23:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367e072asm1823607f8f.42.2024.07.25.04.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 04:23:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 25 Jul 2024 13:23:43 +0200
Subject: [PATCH 1/7] ASoC: codecs: wsa881x: Use designator array
 initializers for Soundwire ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-asoc-wsa88xx-port-arrays-v1-1-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H3zPQHTWirqb+YKkh6z42j305IWpTK+pFRf3UJIfZsM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmojXD18kJb1J8ilpNX0TqXikxBBqVB+AYDoX3s
 ofz9k9fE5eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqI1wwAKCRDBN2bmhouD
 10rxD/oDw2zy6A5vr/mf1lFcmwK5FKJCWh5Fk9QW6Xgt5ZPo0Z9CEooxuhCynFyOQ2ZpFiWVVCA
 zQjbNrj4nOoHuwcmmFAXkBLRbybce9FHqoLQ9U2rxOyrTOqjh15OV7G9cpbncYtWGWEfNBm0NTI
 GE4W4e+9s3ERSChCy6Mc5rTP5bhB/c3JYg3mpI7Olx3C+ZcYqwjmf33TxmQW2wL/+zkHO7qf9Nc
 G2WpUQpxY+HpAslqcFienRtcGthZSTBVNSX3OvSV4Tdyug9owWh3rt5bHIwwUf2tzkIwnVJMrnI
 xgPHcGu8oYNk6bSGWpUkLQy4xQ5/svZuhHZ8cbEUt7wkiWpE3cjb945wXYwAOP1+bKYGHk7Y/2Z
 vqSk0qY6tyVwAtHYIBfFtFR/4+iEptZ6yqe4NTEGjWOfnLc5g7IBRgb5RurvqssAwY3jIl5bO4M
 OM6Qqtu4HulnwD2aX2otXE7WgAxyV29k+4Rv1WdUV0jRklzDmcYFWiapRofQrGQBS5L0PkyzjQ9
 wFpYqJmouMApelh/fUq2V+ypxUrXfUkas6hZm/KEdAhMjTLSZVS+UkKCbioo4sYd0UpJoCXRIOs
 H3QccdYt6Dz991XlRfQTZ23lIGq6EqyEOJfT2o2akCNp9R3QsJf/5gCgCQVvPUcpuvGjRJwDE/T
 3/cJvitndAM0LqQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: JDXDYGV4K5OLDAOMUEJNW75XN3ZETYZ2
X-Message-ID-Hash: JDXDYGV4K5OLDAOMUEJNW75XN3ZETYZ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDXDYGV4K5OLDAOMUEJNW75XN3ZETYZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
store configuration of Soundwire ports, thus each of their element is
indexed according to the port number (enum wsa_port_ids, e.g.
WSA881X_PORT_DAC).  Except the indexing, they also store port number
offset by one in member 'num'.

Entire code depends on that correlation between array index and port
number, thus make it explicit by using designators.  The code is
functionally the same, but more obvious for reading.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 0478599d0f35..a5e05c05fd3d 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -386,33 +386,32 @@ enum wsa_port_ids {
 
 /* 4 ports */
 static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
-	{
-		/* DAC */
-		.num = 1,
+	[WSA881X_PORT_DAC] = {
+		.num = WSA881X_PORT_DAC + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
-		/* COMP */
-		.num = 2,
+	},
+	[WSA881X_PORT_COMP] = {
+		.num = WSA881X_PORT_COMP + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
-		/* BOOST */
-		.num = 3,
+	},
+	[WSA881X_PORT_BOOST] = {
+		.num = WSA881X_PORT_BOOST + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
 		.read_only_wordlength = true,
-	}, {
-		/* VISENSE */
-		.num = 4,
+	},
+	[WSA881X_PORT_VISENSE] = {
+		.num = WSA881X_PORT_VISENSE + 1,
 		.type = SDW_DPN_SIMPLE,
 		.min_ch = 1,
 		.max_ch = 1,
@@ -422,17 +421,20 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 };
 
 static const struct sdw_port_config wsa881x_pconfig[WSA881X_MAX_SWR_PORTS] = {
-	{
-		.num = 1,
+	[WSA881X_PORT_DAC] = {
+		.num = WSA881X_PORT_DAC + 1,
 		.ch_mask = 0x1,
-	}, {
-		.num = 2,
+	},
+	[WSA881X_PORT_COMP] = {
+		.num = WSA881X_PORT_COMP + 1,
 		.ch_mask = 0xf,
-	}, {
-		.num = 3,
+	},
+	[WSA881X_PORT_BOOST] = {
+		.num = WSA881X_PORT_BOOST + 1,
 		.ch_mask = 0x3,
-	}, {	/* IV feedback */
-		.num = 4,
+	},
+	[WSA881X_PORT_VISENSE] = {
+		.num = WSA881X_PORT_VISENSE + 1,
 		.ch_mask = 0x3,
 	},
 };

-- 
2.43.0

