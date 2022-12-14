Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62D64C926
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 13:39:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D30AD29C1;
	Wed, 14 Dec 2022 13:38:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D30AD29C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671021571;
	bh=6UKyqhoE+104iGmuRgMEEkd+q+3dSfhpuzs6x2u26lY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Tks+BFdKvNI6AEF1Owa7/nsAUQzqCzWwqksiD6vtrF/iXRkYaJ6N52AUSwcg8FFNW
	 8Oxk5mwd+N7C3Jat+lPfMdRzivfy4KGwD4iUBNxL6tFqn+TEamait4rFgTD/fAYbxR
	 ZaKrU99pE5wcpj448F+RkqB3/2P5Qlg02Q40fYDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A72CF80141;
	Wed, 14 Dec 2022 13:38:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 828C5F804F1; Wed, 14 Dec 2022 13:38:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 672C4F80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 13:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 672C4F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=y1lyj8rz
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3F7BC85104;
 Wed, 14 Dec 2022 13:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671021485;
 bh=/73in4YIE8G8CYnWx0Er3I9VVvTCTYIHLYd83My0KlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y1lyj8rztDUuWEwQvfddAazUNzjyPhv/ZgvWDuX5GQCWDOp3PCgGI1rbRYGxFtsu3
 QFYHzd4roZ/kNz6LwXfmJv6YvE9wvRQEaiFKwoyJSfyU+3zN1s2YEbUWAt+KOYvhuc
 p2mLHdtMOFJm+vKFyvwyosBmLApcxNNTYfdJXbq27gvmh28aKAAC9xvLAxQu1R4lOa
 KwtLykZhJc4yy4EkrM5J7pJhwy3eajOTRDufW6MFXFyXy8mydRkMRjWvPLc2jvIa7Y
 TXL9iGNDHv3M1/z9mz7N11xQIAYC/aqtuDglNmpI74DZ5bR2ySJ0qMeT14c2euyYcu
 147ezol8DSALQ==
From: Lukasz Majewski <lukma@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Stephen Kitt <steve@sk2.org>
Subject: [PATCH 1/4] ASoC: wm8940: Remove warning when no plat data present
Date: Wed, 14 Dec 2022 13:37:40 +0100
Message-Id: <20221214123743.3713843-2-lukma@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221214123743.3713843-1-lukma@denx.de>
References: <20221214123743.3713843-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The lack of platform data in the contemporary Linux
shall not be the reason to display warnings to the
kernel logs.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 sound/soc/codecs/wm8940.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 8dac9fd88547..0b59020d747f 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -709,9 +709,7 @@ static int wm8940_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
-	if (!pdata)
-		dev_warn(component->dev, "No platform data supplied\n");
-	else {
+	if (pdata) {
 		reg = snd_soc_component_read(component, WM8940_OUTPUTCTL);
 		ret = snd_soc_component_write(component, WM8940_OUTPUTCTL, reg | pdata->vroi);
 		if (ret < 0)
-- 
2.20.1

