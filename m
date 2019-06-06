Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB8D36BDB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 07:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D7FC17E3;
	Thu,  6 Jun 2019 07:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D7FC17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559800100;
	bh=mL5Ppg0OPbBPpqpDLBLqOs9ZGLsJM2S4mWhwEnWusuc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PaJjzEErKCx3B11LzA+RtObgRfn0FqaA4ZwYR58SKkiiSUCEsGSgVoTJCV1LY+TMl
	 tFZnxl0EeQg5L9fjZyi0y8SJU12sG4ohXCFEjSScLlSuz+7skEv+ceBQGpkiB9XaLo
	 NQU0/w689Lkj+yiEtRqyZd9/RhCaR5R0Mv4L3vsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C98E1F896F7;
	Thu,  6 Jun 2019 07:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7944AF896F8; Thu,  6 Jun 2019 07:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01B83F80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 07:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01B83F80768
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MjFf2ldx"
Received: by mail-ed1-x544.google.com with SMTP id w13so1429276eds.4
 for <alsa-devel@alsa-project.org>; Wed, 05 Jun 2019 22:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TB8sS/vN2hoBvG32s7LAFoRj2modDqZ8Vw8VYR421Os=;
 b=MjFf2ldxuuMeQK2ueNysoMCjQ5uKFh8bYW8bd5QRJmBjp0XW72ybPDZ50jMKO/LiSV
 wgh4Z7KeeN2RzBRojIpnBqr/dnP8CiGrpyuCbbQjDXDTnExaiokJE/zfXJ0IDTqCaz9D
 FJMVk+QLuSm/PqCjPGqONXD6twdngAgROD4C5SxKe2qF/9kxBec3iI3PtqPrUyzIEwbC
 900yi3vGFTHpBMUa/30nkasZZ/WPO0YYlmp66kgZbudm+p5n4VwfBWMsOvmDCNIAOZeJ
 n8oajfRGrZciYch4GbP81eTkeDknI7VQ2TdstrYft6tCJb55UaVFmgIEFiL1iLZ9Doi9
 +QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TB8sS/vN2hoBvG32s7LAFoRj2modDqZ8Vw8VYR421Os=;
 b=agcV4i2ibpnhfwPK07PH4iFH6NFVb4xA9N/lQHXu2Gn+/sQ0lYLZU92woRMAvwjk66
 ae0AVbch9igwDr/ixL0f5zlzJ/mNk4p0jCafsKAr4CA5gwabaMvA6Ma5izkdiA657fUh
 B7AdygWI14KxCpjZ7mCLQ/qqysGncR6bpB118IzaRNW5X9N4GJdF/5Jx/xbUhwFtaeKU
 RUR6/LSBIN87eKOSl7vrcNMxyLZ7AbXfyMVE9wR6SfPFQ9szaOKuURiHMlvYG5xnM0oq
 SQYIcC2ffnZHotQKzZxxdZLAqzRsRLuooGlKYNrpTIXtfq6OuWa0cwW7FumBsz+/JGDk
 fCqA==
X-Gm-Message-State: APjAAAU4n/avR5mw56yTq0/PEtYhPZdaaivnzlPkdpXcq4c4NPMiyejU
 WheErqxPJN6R/TR9J5NO/d8=
X-Google-Smtp-Source: APXvYqyUItVGIKxTOm7o1yTUkO+9+3tvHBVATXfJBTetD2HC4spaXlxx/ZTWFbNQ68lfH2yFzqCfwA==
X-Received: by 2002:a17:906:6a97:: with SMTP id
 p23mr39152490ejr.203.1559797993974; 
 Wed, 05 Jun 2019 22:13:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id f3sm141499ejc.15.2019.06.05.22.13.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 05 Jun 2019 22:13:13 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Shuming Fan <shumingf@realtek.com>,
	Mark Brown <broonie@kernel.org>
Date: Wed,  5 Jun 2019 22:12:27 -0700
Message-Id: <20190606051227.90944-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0.rc3
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Bard Liao <bardliao@realtek.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: rt1011: Mark format integer literals as
	unsigned
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clang warns:

sound/soc/codecs/rt1011.c:1291:12: warning: integer literal is too large
to be represented in type 'long', interpreting as 'unsigned long' per
C89; this literal will have type 'long long' in C99 onwards
[-Wc99-compat]
                format = 2147483648; /* 2^24 * 128 */
                         ^
sound/soc/codecs/rt1011.c:2123:13: warning: integer literal is too large
to be represented in type 'long', interpreting as 'unsigned long' per
C89; this literal will have type 'long long' in C99 onwards
[-Wc99-compat]
                        format = 2147483648; /* 2^24 * 128 */
                                 ^
2 warnings generated.

Mark the integer literals as unsigned explicitly so that if the kernel
does ever bump the C standard it uses, the behavior is consitent.

Fixes: d6e65bb7ff0d ("ASoC: rt1011: Add RT1011 amplifier driver")
Link: https://github.com/ClangBuiltLinux/linux/issues/506
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 sound/soc/codecs/rt1011.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 349d6db7ecd4..3a0ae80c5ee0 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1288,7 +1288,7 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
 		rt1011->r0_reg = ucontrol->value.integer.value[0];
 
-		format = 2147483648; /* 2^24 * 128 */
+		format = 2147483648U; /* 2^24 * 128 */
 		r0_integer = format / rt1011->r0_reg / 128;
 		r0_factor = ((format / rt1011->r0_reg * 100) / 128)
 						- (r0_integer * 100);
@@ -2120,7 +2120,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 			dev_err(dev,	"Calibrate R0 Failure\n");
 			ret = -EAGAIN;
 		} else {
-			format = 2147483648; /* 2^24 * 128 */
+			format = 2147483648U; /* 2^24 * 128 */
 			r0_integer = format / r0[0] / 128;
 			r0_factor = ((format / r0[0] * 100) / 128)
 							- (r0_integer * 100);
-- 
2.22.0.rc3

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
