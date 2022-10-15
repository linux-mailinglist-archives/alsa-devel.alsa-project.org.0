Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED475FFDDC
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1BE6948;
	Sun, 16 Oct 2022 09:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1BE6948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905405;
	bh=9gL/f3smtuYtNO88ibSb/4tA1ncf2X4a9Cyu3TOsPic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pyiXneborhqAAvTV9A6DltPycWkjwaBjj4XO7M7fPe8HphTkiLI+eIfF2Dyo54tuh
	 j8KRgITbEAPfRjqA+RMsEynE681kEeXfb4OwrxJ/ihrg+FABoG7/S+lnUPZ2OAzG0P
	 97xbYHDObEnbUTUBcNjmL2SMknn18O2uTSqqWETA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6AE3F804FB;
	Sun, 16 Oct 2022 09:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FEBEF801F7; Sun, 16 Oct 2022 01:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45EFAF80086
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 01:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45EFAF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="muSxxiho"
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso9884885fac.4
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 16:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1m0RqvaU8CcvLjEgPz7d1jceF1TiMS+vA+25fd7T9/E=;
 b=muSxxihox91FUI6kHRr7yKu3S6AalcTSrfFTR3dM9yTcSzf+UVf7XV4Y3/C6HLcbzC
 zF56a9IHWYGmkkobPmNpdirA8S7oBMeRcxAx23Nyn78WIhk7S8Je6AV7qAyfb03nkTHE
 YGnu26myGPJXp8c8SyHgGcKnqYfOHQlVMZAydrZiIBaBahKlenipi+6lArTqftxVHg54
 zSTgIT+M2XXE+ifzByhe5LWADKXRhlorj55OEEjwNGcJALm8Du5jEclq1Uxyd69y2L0j
 ilNv1fYAQW8pMEJ4WFyzQ9/LPLFrnTViQ4yCYcOjvso+1RsNT+9epgaZK5GW+dlVMqVl
 SCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1m0RqvaU8CcvLjEgPz7d1jceF1TiMS+vA+25fd7T9/E=;
 b=rlt33hD1tnbc29EW2gmW/w5j0dH5o27J7gBmYM9mPfDHYwb3MFKkXmivDDVN9dtzst
 T6wX2OTrY9zMMGtJBulxn8R8PMVddVfUk6g3lvJfTeqyOS/W3nAOjVLh9pFnb3rwt+gU
 YrC9uXDZcWYP9k/W+eCtQdezJFlRwirsHFIBFgyQW2lU9peo6OaqJGcBab99dWbqs7rP
 /l0PRo68ird4MMXUDc9lnAgxIe7E0mfbfTU4vGsAWB5XbBYgnT54QPDw6ctK+EtgAIjr
 qImtsuSwrrVYdkRBZMMM0P3CZo/qTg0cNmuHuhJMTjaMo5nreV3UHYcJnbMOgO8KZso6
 KTHg==
X-Gm-Message-State: ACrzQf1NJ5m52VmbiAqBVKUQGtoqw2wAVhq8UtcpO8WPyKZqMMMC18xu
 TFoBhvmtJGoHR6oaPNeyvFg=
X-Google-Smtp-Source: AMsMyM6NpoEW7uV+vjQlw5+5bf1zbaYszcJOVcIsToHnDYk6J5ZzPaW3K2Vq+4FMMgDUoApvN7mphw==
X-Received: by 2002:a05:6871:28e:b0:136:4f44:78a7 with SMTP id
 i14-20020a056871028e00b001364f4478a7mr11526358oae.264.1665876856020; 
 Sat, 15 Oct 2022 16:34:16 -0700 (PDT)
Received: from bebop.lan
 (2603-8080-2704-6601-b457-170a-9e05-cc6d.res6.spectrum.com.
 [2603:8080:2704:6601:b457:170a:9e05:cc6d])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a4adec3000000b004808e0d8467sm2653858oou.2.2022.10.15.16.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 16:34:15 -0700 (PDT)
From: George Hilliard <thirtythreeforty@gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH 1/2] sound: dice: Fix "Firestudio" typo
Date: Sat, 15 Oct 2022 18:33:29 -0500
Message-Id: <20221015233330.8679-2-thirtythreeforty@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221015233330.8679-1-thirtythreeforty@gmail.com>
References: <20221015233330.8679-1-thirtythreeforty@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:42 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 George Hilliard <thirtythreeforty@gmail.com>
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

No functionality change, just a small cleanup before adding the
Firestudio Mobile.

Signed-off-by: George Hilliard <thirtythreeforty@gmail.com>
---
 sound/firewire/dice/dice-presonus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/dice/dice-presonus.c b/sound/firewire/dice/dice-presonus.c
index 967cc3119a64..c85178e64667 100644
--- a/sound/firewire/dice/dice-presonus.c
+++ b/sound/firewire/dice/dice-presonus.c
@@ -11,7 +11,7 @@ struct dice_presonus_spec {
 	bool has_midi;
 };
 
-static const struct dice_presonus_spec dice_presonus_firesutio = {
+static const struct dice_presonus_spec dice_presonus_firestudio = {
 	.tx_pcm_chs = {{16, 16, 0}, {10, 2, 0} },
 	.rx_pcm_chs = {{16, 16, 0}, {10, 2, 0} },
 	.has_midi = true,
@@ -23,7 +23,7 @@ int snd_dice_detect_presonus_formats(struct snd_dice *dice)
 		u32 model_id;
 		const struct dice_presonus_spec *spec;
 	} *entry, entries[] = {
-		{0x000008, &dice_presonus_firesutio},
+		{0x000008, &dice_presonus_firestudio},
 	};
 	struct fw_csr_iterator it;
 	int key, val, model_id;
-- 
2.38.0

