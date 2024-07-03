Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C269F92BECE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D5B5210F;
	Tue,  9 Jul 2024 17:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D5B5210F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540337;
	bh=GEk39FRydi1fT70oPtE+ZJuGWxA/nAzFfLAJ2IHsPtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B+MsoDCcUUjzq2SkLfHubDGdepY7I4SaRzJ/EsfkMWl1LYGD6NbsHMokAnwueSpMW
	 iVijqin1Ix4Swrp5SIGmUyRK7ANwRB/4QHucxveROvFICGKhLO0KiNTOMmsemp8pcP
	 CXW33rV3iSBc719zMxhE+owY61rduThc9PtocrB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BE55F80637; Tue,  9 Jul 2024 17:49:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E66F80771;
	Tue,  9 Jul 2024 17:49:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F082F80587; Wed,  3 Jul 2024 18:21:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8357FF800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8357FF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bgWh5v5u
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a751ed17b1eso145423366b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023684; x=1720628484;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gG++efZ7r1OnmtfXthfdtG2tmWWRLh+fSeybQPYJHDQ=;
        b=bgWh5v5uhmMgH5LCBzafJ7cvDmlwxEwYxaeHN8PiT7WYi98vLWoVYVuJmG87a3EZi1
         5nDbkKw4erijS5hatV3xph/RWroi+2mBELF/kQwnmIN1oju+9NfqmHkCsK4u29f0D+un
         aXpX+997A4+OEWn5uvoH1DXEZZtQsm3NnenYQz8nlykphFtnQJI4b+JFkWUQW+96SCx0
         kpUOZAIuu+nnv1pedUIBQUquiCFMIUrPp1jzTXh2ibkBQea9gcZZy8bmaOE0rESXMLqS
         FJVdyQL30VeCJ/hLVQrgJ/Ybfcn7SdHX+O6ohNHElQsi6IRo282at+CADLqVgv5msnLz
         38lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023684; x=1720628484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gG++efZ7r1OnmtfXthfdtG2tmWWRLh+fSeybQPYJHDQ=;
        b=shNzBWrpZG0CeRWmycVFXGKWxN4VMOmyN5OCwLDPTRsmCh3CF1U0AShxv3zlkV3Pr9
         JkFVqh/d9iXA2foHpV7S+JviRA5dUC/Nd54fjY2HpGQcibaYSDd9O804DZPQ/RVgvk5K
         1mc33SYKKkw7OwwK7OaC0Q2sNbkemDT8gCcHGn1IyMWIEwTAPsBQs5XJR4HbBb5z78fw
         DaKO+IDYKL3GmwfjjztO4BOIeJ69FO0PtgsFXeM2yhkAdOQyZ3iwlMtQNEYwHWVMYR/a
         3rYsstgyBXEhqL/ekphPlSz1CAuR++iTu0s2WSMMeXHN7XrC5TECN7NMSnQabaMRjM1x
         Z6zg==
X-Gm-Message-State: AOJu0YyOtLaEVy2YlnVxpn87ygbTqy9dfZNt0WHL40ewpAf3o0bUuaMH
	0tETM+FkPmxMAtt0Sxv/lOXrbe718TAtWUbWTGc572qppyZG2gPP
X-Google-Smtp-Source: 
 AGHT+IF1wtHFL+7cLyQBLapJSHhoz/9l0imQ+li63K8X61yyAq8uOaolAshVRhS+rXWk32NgpulPFA==
X-Received: by 2002:a17:906:a259:b0:a6f:dd93:7ffb with SMTP id
 a640c23a62f3a-a77a2404383mr140720766b.1.1720023683153;
        Wed, 03 Jul 2024 09:21:23 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:04 +0200
Subject: [PATCH 8/9] ASoC: wsa883x: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-8-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=803;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GEk39FRydi1fT70oPtE+ZJuGWxA/nAzFfLAJ2IHsPtE=;
 b=mBVpWmb88Olh/VCUWZconNdt8PnC5GlUgHDJFhFJmq4s9dXsX5xDlJDoQxBO0xm95ScDZadiC
 VHXdrkMl9zeD7CnE3OeehfrVKkA94ViNvLhIHXY09hkgLZNnSICo4Om
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YNPDKHERWUPGRE7BCLIHR4T7YUTKQLSS
X-Message-ID-Hash: YNPDKHERWUPGRE7BCLIHR4T7YUTKQLSS
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNPDKHERWUPGRE7BCLIHR4T7YUTKQLSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`wsa883x_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index f5a15f0e891e..d0ab4e2290b6 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -934,7 +934,7 @@ static bool wsa883x_volatile_register(struct device *dev, unsigned int reg)
 	return wsa883x_readonly_register(dev, reg);
 }
 
-static struct regmap_config wsa883x_regmap_config = {
+static const struct regmap_config wsa883x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1

