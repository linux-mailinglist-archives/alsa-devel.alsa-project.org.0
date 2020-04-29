Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 809761BE6E6
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 21:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C9D1689;
	Wed, 29 Apr 2020 21:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C9D1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588187062;
	bh=k1c7skf26uck2a+94CZdd64alO29RBND7c74GvqRTck=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CsM16tCHcgwQ1QbVHhPr3emh77Ywz88M4HdplZRzZW6C0bFFwXLnH7XoI3NS2dV92
	 Jcmp8OpCHfE2DhSyy8iUpvP1nRQ8mZdr+7V0GmjJAvo50uSzbaUqGymakLlMzLmFKP
	 +evX547pv+sEKuyQwqRgcJaN1Wt1DX07HJN5qZZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 035A7F80232;
	Wed, 29 Apr 2020 21:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2B58F8022B; Wed, 29 Apr 2020 21:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18381F800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 21:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18381F800B6
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MLRDv-1jlfhp0Uz5-00IWDA; Wed, 29 Apr 2020 21:02:18 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: opti9xx: shut up gcc-10 range warning
Date: Wed, 29 Apr 2020 21:02:03 +0200
Message-Id: <20200429190216.85919-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+pDqwisosq8IRMVZs9c7qvMueRcXlRjdnVdd/4nRecwJrh6oDHT
 Hk2Bj3hLCzMNMvJv5ipHRa0YzqmfJVD5xHFL8KaWvVWN35+kdWmb2gpK+sePVacbkQrr5nQ
 azKLanUlr1s5veUtSELmvDYCpNSUPW+dn4tPimfRra0N/Z9W2M4XSn4ht86XufpMjpB89bo
 t3GO9kGViXWXGNMtR4J0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9cO2hF9lnlU=:/v7dR+GNPbFvFEJ1vkKpKS
 wxaE29IFQ8i4X/RNJk3qQBnKMPsfw/dBIykU/RpE94huZCjxIuEuI8mHvmuK2A64sS9lY7e+W
 Jxlo1vrWI930gBbR1qIPvdrYE8NiO8QadB+yGE4O2+JCydkw20/yYxaH11nx4uQjwMrjl3Rag
 39Lo/vbX9R97KI3FwOQWKsrAZBUZ60WUwBeGbEGdNU/SNOcazbQgMw0C3tWHX4yJoIJPgzACE
 GsoGOZl/n0aatAENgvTvMG+/FGzWW1m5c418qVK+SgMaFghvMW81tvdjb9BT57+OaKC1m604g
 q98VuycwUTnCuakAqKnq3vTLZ40xyyd9KIwinX6jPsh1nN1TTOG8Pz9EOCx4qK/Ur1oZOwSRf
 nuFBmgxE/HqGMKgysxqvmjXHGwReXx4TwVp32rjONRbu5Zk7L19npgclts1BK0AVdtJwVpV6Q
 u8QugluZn0yPwQKDdlp8mh75jl4ZTw63snCWBRbSPbWKdNwaJ+KHT08mUYHdrpkXaZNuLKyAi
 aimjTmHuxsAJ7iTfh7gFTdrH4+mTbYmFkdS6IcnGPxHmQe1/4K/RvtodHCMM57IoCiHhlfkll
 mqYO7OfuQQKH6ycavc4CG07pDLpDDnXNwYiEUkFIvPh8cKTjASTutzEyTW4bbE3pcNzVSqagg
 uww/RNxxMa1dMWT+WXiuGcE5SEr2UFNP4y8+d4Vlp01XdQ3AFUZVBOlJtXw3XQ62oIfhpy/m5
 ABbnFWBCQOqT/C6YwkzrKHSVxIvQfWYd3H7yHHg0RvvDdGEFLi2I2OYc7SQEN+y9134fL5KMW
 fxqRVo5+RVqiKAT4u/lJbm522qA9y/kzNsE3oAOHPuCMQnGOmg=
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
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

gcc-10 points out a few instances of suspicious integer arithmetic
leading to value truncation:

sound/isa/opti9xx/opti92x-ad1848.c: In function 'snd_opti9xx_configure':
sound/isa/opti9xx/opti92x-ad1848.c:322:43: error: overflow in conversion from 'int' to 'unsigned char' changes value from '(int)snd_opti9xx_read(chip, 3) & -256 | 240' to '240' [-Werror=overflow]
  322 |   (snd_opti9xx_read(chip, reg) & ~(mask)) | ((value) & (mask)))
      |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
sound/isa/opti9xx/opti92x-ad1848.c:351:3: note: in expansion of macro 'snd_opti9xx_write_mask'
  351 |   snd_opti9xx_write_mask(chip, OPTi9XX_MC_REG(3), 0xf0, 0xff);
      |   ^~~~~~~~~~~~~~~~~~~~~~
sound/isa/opti9xx/miro.c: In function 'snd_miro_configure':
sound/isa/opti9xx/miro.c:873:40: error: overflow in conversion from 'int' to 'unsigned char' changes value from '(int)snd_miro_read(chip, 3) & -256 | 240' to '240' [-Werror=overflow]
  873 |   (snd_miro_read(chip, reg) & ~(mask)) | ((value) & (mask)))
      |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
sound/isa/opti9xx/miro.c:1010:3: note: in expansion of macro 'snd_miro_write_mask'
 1010 |   snd_miro_write_mask(chip, OPTi9XX_MC_REG(3), 0xf0, 0xff);
      |   ^~~~~~~~~~~~~~~~~~~

These are all harmless here as only the low 8 bit are passed down
anyway. Change the macros to inline functions to make the code
more readable and also avoid the warning.

Strictly speaking those functions also need locking to make the
read/write pair atomic, but it seems unlikely that anyone would
still run into that issue.

Fixes: 1841f613fd2e ("[ALSA] Add snd-miro driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/isa/opti9xx/miro.c           | 9 ++++++---
 sound/isa/opti9xx/opti92x-ad1848.c | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/isa/opti9xx/miro.c b/sound/isa/opti9xx/miro.c
index e764816a8f7a..b039429e6871 100644
--- a/sound/isa/opti9xx/miro.c
+++ b/sound/isa/opti9xx/miro.c
@@ -867,10 +867,13 @@ static void snd_miro_write(struct snd_miro *chip, unsigned char reg,
 	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
+static inline void snd_miro_write_mask(struct snd_miro *chip,
+		unsigned char reg, unsigned char value, unsigned char mask)
+{
+	unsigned char oldval = snd_miro_read(chip, reg);
 
-#define snd_miro_write_mask(chip, reg, value, mask)	\
-	snd_miro_write(chip, reg,			\
-		(snd_miro_read(chip, reg) & ~(mask)) | ((value) & (mask)))
+	snd_miro_write(chip, reg, (oldval & ~mask) | (value & mask));
+}
 
 /*
  *  Proc Interface
diff --git a/sound/isa/opti9xx/opti92x-ad1848.c b/sound/isa/opti9xx/opti92x-ad1848.c
index d06b29693c85..0e6d20e49158 100644
--- a/sound/isa/opti9xx/opti92x-ad1848.c
+++ b/sound/isa/opti9xx/opti92x-ad1848.c
@@ -317,10 +317,13 @@ static void snd_opti9xx_write(struct snd_opti9xx *chip, unsigned char reg,
 }
 
 
-#define snd_opti9xx_write_mask(chip, reg, value, mask)	\
-	snd_opti9xx_write(chip, reg,			\
-		(snd_opti9xx_read(chip, reg) & ~(mask)) | ((value) & (mask)))
+static inline void snd_opti9xx_write_mask(struct snd_opti9xx *chip,
+		unsigned char reg, unsigned char value, unsigned char mask)
+{
+	unsigned char oldval = snd_opti9xx_read(chip, reg);
 
+	snd_opti9xx_write(chip, reg, (oldval & ~mask) | (value & mask));
+}
 
 static int snd_opti9xx_configure(struct snd_opti9xx *chip,
 					   long port,
-- 
2.26.0

