Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC74191E0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 11:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F24E1662;
	Mon, 27 Sep 2021 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F24E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632736581;
	bh=i8ymyzqgvI3wLotGeaYebjXlqYY+zZQePxuRiKJ8yDI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xg7AqjAE8jE51rgooChM5akhHcnC0AbhFbf67cOhVuaWLqYmEPSyZgR+U+CbDlRgZ
	 joKRFc5LasZ+wJSZzCa4TXivtlwYspGiqSR9zuppjXCciT+3zlMAJWvDbSAG8y1Gsm
	 Ei4M5fL4JknOs9hcPlWHwcAl4bBZMp97rhxFgqgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D01F8026D;
	Mon, 27 Sep 2021 11:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F99F80227; Mon, 27 Sep 2021 11:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DF96F801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF96F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cAhI7i4/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C0CF60F70;
 Mon, 27 Sep 2021 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632736494;
 bh=i8ymyzqgvI3wLotGeaYebjXlqYY+zZQePxuRiKJ8yDI=;
 h=From:To:Cc:Subject:Date:From;
 b=cAhI7i4/kvjjIQ8w6lFk9uJKpSBk49kmUx+eOhilqKcrDvvWOCZP4vxNPLALMVnK4
 2WsbCOyVsrkqDV6Z2AJ2DMxHpEDoP5asyOCKZmtHPY12LPsZpqZzWGwWC2NTl7oCkI
 XR1b7RoT46auZGQEnXZkOAa/J5tN1icDYh0fU/IvPzYWE1gcrroTu3j82+Mct9Tv/U
 n2I7OAoa7f1JVogt2FlEqAPhI6eS8mC85XugcNe1T5zUZKehWz/99mcV+KXZxS+FGZ
 uI8OgL37A88pA2rYMjnfFVlDd8urJ4PMr/1HCjtYrhnT1QPk44qpGBwyTeHMrp0tNy
 nYC8AhBL5k6Gg==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: samsung: add missing "fallthrough;"
Date: Mon, 27 Sep 2021 11:54:34 +0200
Message-Id: <20210927095449.1070639-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>
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

From: Arnd Bergmann <arnd@arndb.de>

With gcc, we get a warning in this file:

In file included from include/linux/io.h:13,
                 from sound/soc/samsung/s3c-i2s-v2.c:16:
sound/soc/samsung/s3c-i2s-v2.c: In function 's3c2412_i2s_trigger':
arch/arm/include/asm/io.h:92:22: error: this statement may fall through [-Werror=implicit-fallthrough=]
 #define __raw_writel __raw_writel
                      ^
arch/arm/include/asm/io.h:299:29: note: in expansion of macro '__raw_writel'
 #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
                             ^~~~~~~~~~~~
arch/arm/include/asm/io.h:307:36: note: in expansion of macro 'writel_relaxed'
 #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
                                    ^~~~~~~~~~~~~~
sound/soc/samsung/s3c-i2s-v2.c:398:3: note: in expansion of macro 'writel'
   writel(0x0, i2s->regs + S3C2412_IISFIC);
   ^~~~~~
sound/soc/samsung/s3c-i2s-v2.c:400:2: note: here
  case SNDRV_PCM_TRIGGER_RESUME:
  ^~~~

From all I can tell, this was indeed meant to fall through, so
add "fallthrough;" statement to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/samsung/s3c-i2s-v2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/samsung/s3c-i2s-v2.c b/sound/soc/samsung/s3c-i2s-v2.c
index e9481187a08c..de66cc422e6e 100644
--- a/sound/soc/samsung/s3c-i2s-v2.c
+++ b/sound/soc/samsung/s3c-i2s-v2.c
@@ -397,6 +397,8 @@ static int s3c2412_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 		/* clear again, just in case */
 		writel(0x0, i2s->regs + S3C2412_IISFIC);
 
+		fallthrough;
+
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (!i2s->master) {
-- 
2.29.2

