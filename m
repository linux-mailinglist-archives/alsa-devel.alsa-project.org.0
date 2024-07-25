Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042D394297A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:46:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA74ED1;
	Wed, 31 Jul 2024 10:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA74ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415595;
	bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qwnwH/CfFgU7CgXMmLY30ZuWmt+2Xb9n3mrzK3F9B0wrIzZqta7M/FDFp/07R82yw
	 TulEJn7CMlnIZmWmCBtAHxydq3geQXnk4Sz3kZ7d7mRCHMpG+EBYnk8ipup/zdg73e
	 k+15VwXF9HVudLWjYi2sqVZFy6R9DCeOyy6++Wlo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17B0FF80606; Wed, 31 Jul 2024 10:45:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00249F805FC;
	Wed, 31 Jul 2024 10:45:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E581F80482; Thu, 25 Jul 2024 12:31:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEFFAF800AE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 12:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEFFAF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TqpRbL+h
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7b2dbd81e3so38755566b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Jul 2024 03:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721903506; x=1722508306;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=TqpRbL+hqcMS6cKbWlWtrR0GnDcfgTFEl74OvSmF1ZvUdonqwu/ZVa88Qm4n9uzZNW
         fvcbUJhaB7HqeDnkMHw5dIIV5YWQafnjMpYSZACFeyGzbvS+RVWSQNQ3yvQ5QkG13BQm
         BPep0ekYseXSb0spMgBU5GIfWwHH42i2ezarhWVOFfStzxAvmgPjQqdMm2/Sw4Op2YPy
         q4iaXJnJDcydEE+h0ZR8NYzGF1t7T+cOb8gYYOHgkuXFjlpC8I4iiIM9S7bQoMAqeIkY
         ZUhlBzQFy3YLBOMOHQP9vRjfSbtBgU0bOiQaLYdEaV5QMB0lDN2ulPb7e/NfdGPz3NEg
         QpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721903506; x=1722508306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOeiGXeuTWh9ihbymAzgAMoDAdspVLgp4kSjE/YSgxc=;
        b=W1Teq0GIjFABzSyL2nQGfrRmdArkVBw5tFbF5FSMctHRamOKjFpNAUrzt0SPfpyY/U
         0vByWFlr1MMYcALIz/KWgCNAsFOKXQfhqTVOtXjHkpBcRye2ZMMsb2qG7hj6Mf881Li1
         TMmZFt5uxP51BvEymkpvkF/Ixja66wpQfAMNqy/tfaGT5mwA4Tq/VntOsbY84M0E9V3g
         fWYw5z4oZMl4sPjOkiVXxRa3wRr6pvQOJOxQ9oltOHVXWjBtzAoBls/CJmGBIYvk2nik
         zYK8Yl5g4TbnHBvbxR01ojrWlGxtfrCxWaDUPkLw3FVNIilqth6fDQC3tqPWyWvd43Aw
         koTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0eXUP5NjSfcsXAqe+5tXNaR1BaC6uWaJrLNDzlgQOQB4f7hQHYttew/DXDsCsGNH3k213ykCh5k3pQBV5WzSDlPCLCDcYx4TsQtA=
X-Gm-Message-State: AOJu0YyyRO0/wlRPmfHoQ043sriTR0W1wnG5KySER1kCLKkZn/edzIGj
	1fVOcSj6YWbJkJrFIw8ifucGSBFDsKdxVi6cvGeW244ii5ccZ6vGL1EbNTFm
X-Google-Smtp-Source: 
 AGHT+IE0/hpUdAcQx4dLRlMWzDI99oBJN7+P7fRlBEFw3PDOuVabqJfYozkGN3UY2efNKiho/QNr+Q==
X-Received: by 2002:a17:907:2d0a:b0:a7a:a212:be48 with SMTP id
 a640c23a62f3a-a7ac5087e56mr177990766b.56.1721903503189;
        Thu, 25 Jul 2024 03:31:43 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad903f1sm57280766b.152.2024.07.25.03.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:31:42 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 25 Jul 2024 12:31:39 +0200
Subject: [PATCH 1/2] media: i2c: tda1997x: constify
 snd_soc_component_driver struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240725-const_snd_soc_component_driver-v1-1-3d7ee08e129b@gmail.com>
References: 
 <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
In-Reply-To: 
 <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721903500; l=964;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wAda8xQPhY/5MLE9114YUL4s08mmQAnyb/WJmp3W3Q0=;
 b=g+GwinB2Om+/QI19eL/QDvSqsxnmXjF9gdTgw9VQo6YTUwrcAxKL/wFe4IHNNaaiUzHHdXQ29
 T8cWG+KHnUBDrYJ+zT75Qz2Wr485h9ieY+INwWbKf+ktYVDL378CLex
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UC2NPSK5HCCRJORQ5D4JO7KNHSXC3UC5
X-Message-ID-Hash: UC2NPSK5HCCRJORQ5D4JO7KNHSXC3UC5
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:42:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UC2NPSK5HCCRJORQ5D4JO7KNHSXC3UC5/>
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

