Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E39689429AB
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58AAA2C77;
	Wed, 31 Jul 2024 10:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58AAA2C77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722416002;
	bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CSFqtgkV2tuMGNmVXHDJak/RpEk871HPfkyy6pp0bu1D+wp0ttSkkS/asGXZXz4p8
	 mE+rlH9yBpvV+Qltqk8Z+aXFGzjr6uIyKcLHvfoiga3z/4xkxywSM2RQJ/uuNcYPsh
	 rVGZxcJTV3oADmnFhCZ4cZIE5QmCZ86mtQ/sUSPE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30523F80856; Wed, 31 Jul 2024 10:50:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D9CF8081A;
	Wed, 31 Jul 2024 10:50:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9B04F80269; Mon, 29 Jul 2024 11:40:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86FEBF80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 11:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FEBF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lbPyXhg5
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so4937111e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jul 2024 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722245870; x=1722850670;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=lbPyXhg5uh7gEloQ4SLJ76gKEVUiTK/H9wNwZgQz/XLDHZBS+1CfwpVfWaHHvy/EXZ
         TlBCH96Z5d1R++qufqOLEO2fiao+CRikXxL8S57b0riEYuqxHn2/XtNE9Rq3l/P7cEst
         RVHPxbGQ85+jvpbR//FwCYQ6Ikb8W18DUSR0mNmh8u7QtV19TohNmmzVR/hTXqwnym5l
         CdW7egX2ZgY6pvhwZcj5/pfLtvKTkjcxDMx9TGuFbIl92JL14kvDMUq0tfo0962bGiCS
         leN1p+jWYzpetchu4J2mv1EvOSA/qRyubQPvNxOYfPiSIH6VmpYrbzjuJ1b3TW5EE2a3
         Q2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722245870; x=1722850670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=BygNewkoG02H6b1DbitR4QJJOYoiscWB/1KK7+/URVEZOnDL0xFSAOnQkM5yZw5lHl
         RvQdJ/MkhUxaZTJ7/IIavDr2ygGqdPkDcDEuqsTp2RIwLYOSPuprLOPFWMPOD5boR9PX
         vUdwYcj6QIyS6bdYb9enuxqWMXTtoLsMjyKKzd/UZcF1Fkre5NIrX1amQIdWGG64NQD6
         T9RaiR71FleDHE7hZ8Q3Pi3OCP5Uba1JbMEd1ONsUzth/c7yef8ju40lplRUyYmsHl8s
         RfaZkF1sG9JXCQezwMSu/wGeaO6B7hSXh1FtTX2+7QsKgBCw0qb3ju76IHonKi4qZGAM
         WU9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0cprUcQ8nwjeCyE+dAd+d1gcBHBNa2ugZdeCEKQk7cNaqNoewTpphUq3HqpPh6V24rijxy6L8TgQis6JkZntozukv9ZBeGarl3Ao=
X-Gm-Message-State: AOJu0YwFh28xxeExjo8ETjBus/eAAeZwkDYnTe3X+AgcVlW3cPnTtHsI
	lkg6f3P4Y5x/o3ddTWxfaFdFRfMlROvIM4Ckan60BVppfivdamde
X-Google-Smtp-Source: 
 AGHT+IGp8Xl1NyteK2cTJheiqkYuxoPksdVWbAT4rxFLqcdzbR1MWL/U0yFGfpkoM2CelSanXwxOeQ==
X-Received: by 2002:ac2:4bd2:0:b0:52e:9be7:91aa with SMTP id
 2adb3069b0e04-5309b259b5dmr6037212e87.10.1722245869608;
        Mon, 29 Jul 2024 02:37:49 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41b24sm481617966b.116.2024.07.29.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 02:37:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 29 Jul 2024 11:37:37 +0200
Subject: [PATCH v2 1/2] media: i2c: tda1997x: constify
 snd_soc_component_driver struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240729-const_snd_soc_component_driver-v2-1-1994f44f1ec2@gmail.com>
References: 
 <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
In-Reply-To: 
 <20240729-const_snd_soc_component_driver-v2-0-1994f44f1ec2@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722245866; l=964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
 b=VMyTy/QXOHFk3SHVvDT19NltCELdp9XjDYOsQIhbx4wsTvUrAlC+4pd5dk7/VTqxZG3pTVCol
 Ay5w0EMq1AkB3kS+nWJsctwKtLCO2KA8PB5McC/Lm/vGTVmaaQFcDeo
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3F74WKPBJISNPZJGBFUZPI4PHL3XLDVN
X-Message-ID-Hash: 3F74WKPBJISNPZJGBFUZPI4PHL3XLDVN
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:49:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3F74WKPBJISNPZJGBFUZPI4PHL3XLDVN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`tda1997x_codec_driver` is not modified after its declaration, and it
is only passed to `devm_snd_soc_register_component()`, which expects
a constant `snd_soc_component_driver`.

Move `tda1997x_codec_driver` to a read-only section by declaring it
const.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/media/i2c/tda1997x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 58ce8fec3041..3b7e5ff5b010 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2514,7 +2514,7 @@ static void tda1997x_codec_remove(struct snd_soc_component *component)
 {
 }
 
-static struct snd_soc_component_driver tda1997x_codec_driver = {
+static const struct snd_soc_component_driver tda1997x_codec_driver = {
 	.probe			= tda1997x_codec_probe,
 	.remove			= tda1997x_codec_remove,
 	.idle_bias_on		= 1,

-- 
2.43.0

