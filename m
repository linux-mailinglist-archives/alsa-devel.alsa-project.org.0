Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C361C92BECF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3F91908;
	Tue,  9 Jul 2024 17:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3F91908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540337;
	bh=6htGzMwQBaR8fepxCewe5VS66mt6hPOxDx6kiYIGOgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Phi9HvEd3czkL9Oq5wc4DVGCTRWCv6x8aj2eFMmRZtyejcAKZd7rbLjq6ABXmZWhz
	 FQGvHyesHAvCvjQoN9IAoQhyeY4Cc4ZDt0BaAEBX9TtExnDdLYlsO84dBVBuZzP2J0
	 LcB/CvnHA1nJCIZ5N9aHjD+walyPKQPXm+R827z4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A189F8079B; Tue,  9 Jul 2024 17:48:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50538F8079B;
	Tue,  9 Jul 2024 17:48:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF3DBF8025E; Wed,  3 Jul 2024 18:21:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3641DF80301
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3641DF80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EQBuDbl5
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a72b3e1c14cso665448566b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023682; x=1720628482;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dJoSywsR4Em9gf/1ysM9oqz07c6C9thgpVrMtwr4Ro=;
        b=EQBuDbl5WVoXKYRvzktbAvHb5mrtvbYlxIeuybAhjJwliQmv5n0rb+kNy4g3XbCr/i
         RPJpA0q1S5kLcE6yeYFmWVGqaOfm0+L3CleQncapDj43W18+6KtByWTXv0qXeqi/v6tL
         cDfg1+eiUhNRpuCRYXNAiuAXHJgQSbKabD6KLWXZg6Su/xuAZVV+VhoM6ilb5vrgZ8nU
         MuMyE8pwYThNgZUB2/ymv7fNlYp3nw+RTzBAn60kfamI81vOQyNrN4ee1jcqZDk5hFii
         f5ir4JH+3sx2jUEBeXOIr/HibhnVvmcRFr1CDE7DbWUmv6E+9u9XNqsicNrXkNM7l+UD
         l+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023682; x=1720628482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dJoSywsR4Em9gf/1ysM9oqz07c6C9thgpVrMtwr4Ro=;
        b=XkNQWNpUxiqHu28CU3iQgmXkQVPuzaPte2EL2AJRrIoJyy0QvenHfiHZuMTtICeqow
         L7RJmx2r8YfyHogP3awKeZs5kqsxRPkk4ACpfa/mwb2dBrZsorpbE+kr3G+ZIZrvr4w/
         T3rbr5DGBKz5RsFF1NbRVS+Qb1ZW8i2mbxgByczifn7af/ZUXLnWQ6lPufIHhmcUTY6w
         9oO4V0OZ1qGxMXE+CAtMEUOSa5oQ9nSXXfj6/ldjRmz55DfayfgGPGiU57WrytKSaOn9
         FatARcJwTHWvdgdEptodRtTX2+Xw7BcJFP5cU11nBCgTsByfIItQwur69h8s3KPRRiQ9
         7Z6g==
X-Gm-Message-State: AOJu0YxTQRqqTDPBFZjmFOT3fL1U7nNotKZMjq1rIAVz+ByT+PIGePOm
	zRlZsUi5pxTtVeddA+9TJKpZqyrdBIUr3/y5LI1D388QayyjoC9e
X-Google-Smtp-Source: 
 AGHT+IGZj1uqADWWLvZQE0V4WUOmTVTU10XuRxNdD3aNhQeOCo0eTyEoVBnQTRz75jMlg4RB7DKe8w==
X-Received: by 2002:a17:906:3408:b0:a72:4d91:6223 with SMTP id
 a640c23a62f3a-a75144a2b2amr803804066b.62.1720023681902;
        Wed, 03 Jul 2024 09:21:21 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:21 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:03 +0200
Subject: [PATCH 7/9] ASoC: wsa881x: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-7-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=761;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=6htGzMwQBaR8fepxCewe5VS66mt6hPOxDx6kiYIGOgc=;
 b=syuSi/vNrxsgXte3PF53cJhibfzYzPANo9dEVu81sruWIsCF5fNCZwS7swGb1Tw2Mxo2p8/bZ
 N5zAmxRL6JTDPD259YRWk8LyURFMmPglGFpG1Hs+NyfAGISSkTJKpBQ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DW2ZD33CZIIEH2SJ6PXNAVU2GG3A4MS3
X-Message-ID-Hash: DW2ZD33CZIIEH2SJ6PXNAVU2GG3A4MS3
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DW2ZD33CZIIEH2SJ6PXNAVU2GG3A4MS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`wsa881x_regmap_config` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/wsa881x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 1253695bebd8..0478599d0f35 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -634,7 +634,7 @@ static bool wsa881x_volatile_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_config wsa881x_regmap_config = {
+static const struct regmap_config wsa881x_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1

