Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DB800BC5
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:24:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BDA9DF1;
	Fri,  1 Dec 2023 14:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BDA9DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701437063;
	bh=FeYjB4CWMAwbwNmOamDg6MachCt2fEEDFfSHen4U7NA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m4CEc1RhBZbBG4ko7bfhuD4lIQGhhygwjXtWif0v/xmNJLSF7vbqFGE7keSOfWkPO
	 uANP+lD4I1rMuOKuFUhvuyqOR7O9p17XVzZtkVwD9tEbwRKchzmeYGe/pFpPvdTcv0
	 BuuGkKaQ89PA0dV32pMVckvAZGDsJoycusWn4eO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE817F8057F; Fri,  1 Dec 2023 14:23:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A2FF8057B;
	Fri,  1 Dec 2023 14:23:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 003BCF80254; Fri,  1 Dec 2023 14:23:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2BD0F80236
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2BD0F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eNgKlQZx
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bba1dd05fso2952698e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436837; x=1702041637;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmhoeNK2XrxfkfGdL3xKNy/HfoA09+0EnEv8OOqmFiw=;
        b=eNgKlQZxG/TwZ3qrenqQNIBkm3K35yAlVp0bgDtn9xR/M1eMZWh09xEdTvRRVIRNqs
         UUHWDdaX9ji1oyNrUL/DMUiM5h+V2QTvUjKcMrVsX5hlz2XPPFxtPVipfuOntq+Xe1d8
         NYD/bHQVyL7Bd7V7iGP1p0jaIJoYPd84Bn/THCuvKWPt/PcuWH8TQ42gtKyLsL1tEIwm
         +ArX7wPh59G7sLqndb7zXY3ZsowAuyqGYYNunmbKJQoq7RxfVJ+G7QQxUF6ryG59NYW/
         FAwJaGOxF0A/McyX93H07FX9gKTzleVPn5TKdojBz89tEyRV3fwa3wAxVUp+a9qM3Of4
         /NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436837; x=1702041637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmhoeNK2XrxfkfGdL3xKNy/HfoA09+0EnEv8OOqmFiw=;
        b=qJ/wYiQ58gv+E0Lhic+B5olyRmAgb5boyQTTzlrypSe0XcgLDxxbCimZxkONvnGg4J
         bRHstPBtaiaKEFnKAf08tKGc8LchnpzwfRwYsEsTbVnsC9ZEGsgMFLmrx79hkaydlvJT
         3IwwJszwHYXGFc0/Aangtyc8lCCjQURm0QQWFvU+JUyEUaGnmLghpgg+l117g5xgA4RG
         6ADog5I5SUFxWsQcUIRt/EMSdPp2cmbWz6TRdlqCpsghYQZhmcfmuZJDlmiQNANJzbMf
         FYRX9NtbUKbbc9zIXOx2yEcKIXFFnmVRb64idH0YvI1bL15/8EZ6g/OtYdCurRNL+Kes
         O0Gg==
X-Gm-Message-State: AOJu0YzM1HICDUdn+AyCbZG2E+z6IIcmzIsRn/mV7tt8Uj7xzY+6J8an
	LI+ym9sL0Va45kROhYtrikt/qodw5E1h5PL+cXc=
X-Google-Smtp-Source: 
 AGHT+IFSgPDic86kEaX7pw26R4wwmabuIQgTcHwgTfrqNNG5jSVMDDG459yzdd7DusaO3vXR73bQLQ==
X-Received: by 2002:a19:7906:0:b0:50b:d764:8819 with SMTP id
 u6-20020a197906000000b0050bd7648819mr784054lfc.101.1701436837631;
        Fri, 01 Dec 2023 05:20:37 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:37 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:34 +0100
Subject: [PATCH v2 05/10] ASoC: cs35l36: Drop legacy includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-5-ee9f9d4655eb@linaro.org>
References: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
In-Reply-To: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.12.4
Message-ID-Hash: HS2M4HIGAHQZTQBDEM2Z3C3B7EI3Z6JD
X-Message-ID-Hash: HS2M4HIGAHQZTQBDEM2Z3C3B7EI3Z6JD
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HS2M4HIGAHQZTQBDEM2Z3C3B7EI3Z6JD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add <linux/irq.h> include, apparently the driver relied on this
  being implicitly included from <linux/gpio.h>
---
 sound/soc/codecs/cs35l36.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index f2fde6e652b9..f5bd32e434a0 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -17,15 +17,14 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
+#include <linux/irq.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
 #include <sound/cs35l36.h>

-- 
2.34.1

