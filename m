Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB564E8D3
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 10:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6EE3172C;
	Fri, 16 Dec 2022 10:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6EE3172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671184089;
	bh=Rk+XUbebVXCh694DgtWDhN5UyiMI1s8gQshk6aScB+0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gTsLgVn+Y+kWCK+BNUmYLVS+p09JbcRAmfRSDW1z33kohzY2CQXoRf6NnwJzToWFc
	 YFs/ZQFAGeIg93rhA/5HgoA6+7K/eC8FJFxw5RBd38PoDk4Xe/7a0KKtC0H4oZTBbF
	 KzUejQqUq0bJbbBgyvCxk5Omab9QYTnhEPZh8lYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D962F804CB;
	Fri, 16 Dec 2022 10:47:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B7B1F804E7; Fri, 16 Dec 2022 10:47:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B9A7F804E7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 10:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B9A7F804E7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=rNGlylIt
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl
 [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4A937851FC;
 Fri, 16 Dec 2022 10:46:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671183998;
 bh=WOaRp1o2Jv3EJCkvPGwU9coZufEjr6sI22bltN9JL4k=;
 h=From:To:Cc:Subject:Date:From;
 b=rNGlylItoItOvElXqnnbH37EsM6DM9gINpC6+fj4W3IUHrZyi/8IUhN5tGxSlYzp7
 pNxdX1830iKdCZjGrk4HoC0NZfJtgSMGUzA032x4ZUdIo8QBqKUZQDtAiZdxj1X3wm
 +LJZy1+UFlaOvYqKSWqf1sdF5GGdje0ynQcrJwilfiSqRhAoh8eEVIHmpGC04YW6G6
 rOacsev2iK9KSz7zF7mzMFpVKJPzyE4xsackHi5YaJWdWahwa8bydVlP447moPwNSW
 Np2/Z3zulHY/Q9CTVYLEnY0Ar/V64JbJyvyTgQh+h1nthmPL3RUA7Z88HzVLazgSEq
 RrlVv7Oe5PKeg==
From: Lukasz Majewski <lukma@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v3 1/3] ASoC: wm8940: Remove warning when no plat data present
Date: Fri, 16 Dec 2022 10:46:22 +0100
Message-Id: <20221216094624.3849278-1-lukma@denx.de>
X-Mailer: git-send-email 2.30.2
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The lack of platform data in the contemporary Linux
shall not be the reason to display warnings to the
kernel logs.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

---
Changes for v2:
- None
Changes for v3:
- None
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

