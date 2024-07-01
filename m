Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EF891E767
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 20:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FA77E80;
	Mon,  1 Jul 2024 20:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FA77E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719858459;
	bh=wDmAHasbwyDrav/gjz/1HfTelzHzs8MHoUaZv+UsTFU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L0j7rR3qYPkbWNwbfV7Iz9eD1JAV/TW2kfIOZoS3vZVEi5k7mTg0c92G2tQlrrlCL
	 ej8lfikCVYHUnsI+oKxKj8LQew8VchPN9+FC+1plYDcxDVQNmGpnHTOePtV9F17knP
	 K0RlWSnfUmry5vN1Ny7vgEMNuPFreV7nVwQgi5oE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 238ECF80578; Mon,  1 Jul 2024 20:27:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D08A7F8059F;
	Mon,  1 Jul 2024 20:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FCF6F8028B; Mon,  1 Jul 2024 20:27:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F40E8F8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 20:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40E8F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ImT+Hj/5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EBB8FCE1A96;
	Mon,  1 Jul 2024 18:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8271C116B1;
	Mon,  1 Jul 2024 18:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719858420;
	bh=wDmAHasbwyDrav/gjz/1HfTelzHzs8MHoUaZv+UsTFU=;
	h=From:Date:Subject:To:Cc:From;
	b=ImT+Hj/5dJ6/oeZzaMtoDUKPqVouhuQg5ZghBti5V/Zb9CIbeYILdEXNobBZR7OZM
	 6/F3s18gDPLwS+5+BU46R/28U5CRFYH300eR7xtiMYAZ6jFeY7nFfgWsfVAwRLdB6X
	 L/LaGyvl6O+1EiVdU4/vyUMtUjWrHEldxrMEU0AN5YmlcUoUP9slhUx4qFk8hMaG6m
	 aTI03n62QvpZUZzHSI6aaIrdrn6ji1Owb0G2Db7Q8mpLPwCXlE6AX/u4fqVLerKtMY
	 sAB8NKe6T8mPqmCt3Uljd1pNc6i9Y9ufOs9XP1MJgXuc8Uf8FvuA8V0JexnQMJid5H
	 Vd0gB9q7jZAOw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 01 Jul 2024 11:26:38 -0700
Subject: [PATCH] ASoC: fsl: lpc3xxx-i2s: Include bitfield.h for FIELD_PREP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-lpc32xx-asoc-fix-include-for-field_prep-v1-1-0c5d7f71921b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN30gmYC/x3NXQrDIBAE4KuEfe7Cai39uUopxeimXRAVJUUIu
 XuWPn7DMLNB5ybc4TFt0PgnXUpWmNME4evzh1GiGixZR1cymGo42zHQ9xJwkYGSQ1oj41KamlN
 818YVjaM439zFW7qDrmmo7f/T87XvB2yNv3N5AAAA
To: Mark Brown <broonie@kernel.org>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2810; i=nathan@kernel.org;
 h=from:subject:message-id; bh=wDmAHasbwyDrav/gjz/1HfTelzHzs8MHoUaZv+UsTFU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGlNXz7XTWQI3vX8Z+WFtsqwSZJCPwvOnNXlsv5SxPirZ
 kJz3ErpjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRDdUM//PUFujO11fQ/po4
 a/MK4bnLf+Qp95d/YJv2suyfgmVs0VGG//XZ6ayv2O4oq+azrayL5L9ReDj6jHw/e+utz4FWN97
 q8AEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Message-ID-Hash: VZKA6HO5Q375WB3AMLW5YOVIU2RDKHIR
X-Message-ID-Hash: VZKA6HO5Q375WB3AMLW5YOVIU2RDKHIR
X-MailFrom: nathan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZKA6HO5Q375WB3AMLW5YOVIU2RDKHIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

bitfield.h is not explicitly included but it is required for FIELD_PREP
to be expanded by the preprocessor. If it is not implicitly included,
there will be a compiler error (as seen with ARCH=hexagon allmodconfig):

  sound/soc/fsl/lpc3xxx-i2s.c:169:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    169 |                 tmp |= LPC3XXX_I2S_WW8 | LPC3XXX_I2S_WS_HP(LPC3XXX_I2S_WW8_HP);
        |                        ^
  sound/soc/fsl/lpc3xxx-i2s.h:42:30: note: expanded from macro 'LPC3XXX_I2S_WW8'
     42 | #define LPC3XXX_I2S_WW8      FIELD_PREP(0x3, 0) /* Word width is 8bit */
        |                              ^
  sound/soc/fsl/lpc3xxx-i2s.c:205:34: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    205 |                              LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA0_TX_DEPTH(4));
        |                                                       ^
  sound/soc/fsl/lpc3xxx-i2s.h:65:38: note: expanded from macro 'LPC3XXX_I2S_DMA0_TX_DEPTH'
     65 | #define LPC3XXX_I2S_DMA0_TX_DEPTH(s) FIELD_PREP(0xF0000, s) /* Set the DMA1 TX Request level */
        |                                      ^
  sound/soc/fsl/lpc3xxx-i2s.c:210:34: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    210 |                              LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA1_RX_DEPTH(4));
        |                                                       ^
  sound/soc/fsl/lpc3xxx-i2s.h:70:38: note: expanded from macro 'LPC3XXX_I2S_DMA1_RX_DEPTH'
     70 | #define LPC3XXX_I2S_DMA1_RX_DEPTH(s) FIELD_PREP(0x700, s) /* Set the DMA1 RX Request level */
        |                                      ^

Include bitfield.h explicitly, so that FIELD_PREP is always expanded,
clearing up the compiler error.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/fsl/lpc3xxx-i2s.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.h b/sound/soc/fsl/lpc3xxx-i2s.h
index eec755448478..b6657853017a 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.h
+++ b/sound/soc/fsl/lpc3xxx-i2s.h
@@ -9,6 +9,7 @@
 #ifndef __SOUND_SOC_LPC3XXX_I2S_H
 #define __SOUND_SOC_LPC3XXX_I2S_H
 
+#include <linux/bitfield.h>
 #include <linux/types.h>
 #include <linux/regmap.h>
 

---
base-commit: 55f0a1fa6ea4e339c797e9a3292ca0caa4ab3885
change-id: 20240701-lpc32xx-asoc-fix-include-for-field_prep-140db845a209

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

