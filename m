Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6FB1BCEA3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 23:29:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3151168C;
	Tue, 28 Apr 2020 23:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3151168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588109363;
	bh=FTNSHOd3SisHRYyqE+0Z+4BhgPYBVxdi0eIqmAk6jbw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uTKsRwFjHPgkzCGYr4BdcvJyEiWWBqkMzm+sKErv3hqK14W37QKobFi0J7Zm0Mjri
	 m/pV4faqUgGfyecCMlaH8VoEfjOhmeXxBa5KNPje9yNyzV14SAmiQRJRU5lD/Df9fc
	 ELv4FoVdxpKEOIjycnpdyojXRvte9MOCEtdKVw2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE9AF801EB;
	Tue, 28 Apr 2020 23:27:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C91FF801DB; Tue, 28 Apr 2020 23:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C332BF800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 23:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C332BF800B8
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MbRbr-1isGzy40yX-00bpfL; Tue, 28 Apr 2020 23:27:24 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: codecs: wm97xx: fix ac97 dependency
Date: Tue, 28 Apr 2020 23:26:59 +0200
Message-Id: <20200428212721.2877627-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:plHfexjdZVApeeYxLAvg4KGlWurVjoh6zwIn/tqrNJ5GenZjv/D
 SOu3gT/FHq9H3n8SpVLPKq+EbuaBFtJ6QBzwtP6ZjS34IK/AT9+Nxt9nJ8oSR56KSiHo0Hm
 L3qi0f1qKGLoRsZs3njFLrEyXHxyK1WXGUJ/mouBSnUypfoDwLbq/cuJXm+54CE29n3hy3k
 aXUa6i6o9nMgvGCs0mdjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6spdvlTUeP4=:ezGBOGOkfKs5xXi84nOUKK
 vc3TdvTCvmW/yAb4yr55mTZWG61nWuvHBGmNSE7CLJJFF/bTyOYxtG1DzMLl1ktUM9FqVTJ95
 Yv38MCHBZn83CLUHzOiHeOVZdK+pWyKru8uuiC16WZdePnXK8FOl+T0/PHnJs+c6YIt53NqD+
 7aNZdUE6iAeew1k3KkzXQsN353depZcnaOiK+Ku2zR0G+3mlydcu7rW2DHWxm6k1loTLe9HpT
 txsQuAK70neviPr8jDhirqEzFVd+2/uoBEL5PmXTuCWi2MSIg7zd+AvB3x4WUsY1de2iSm99P
 UCiXK7vWUd7qEYpUSEvNpYlMdmegyyDIWjKi5B0a6254+RkPRfeAbXq4KwRrZwMo8EJwpY4W8
 DiUMe6nync6UcUUzbQE+AvmpC3rCC+r+xmirsyW3ciC3giX2mRqrxWHWsUSyDfzZPTvShpoQr
 Q/HCe+t74s6/Bv13UOe0+jA1jBYE1J5RnZqnAF1Qh4p83r4zg54CrEe7Ufy3m7N61V/UbzGZr
 1wsnXXbvXXHRriyf1XqHm3/i7PuzEQ8k3uGxSDUpZXLP0yhhtx2WdILaOeg4QOMDjYnnvDdvm
 1wQjrg+mNgP8a+xEQNjDhPjMDRRqT3s1Qr5ohJ0YYOjAP29xx329V06msEP3uFCQyOxA6qQDg
 K2W3Skq5pfVW8IYlZelxnZso1AOcKN9gEDKmKnwktHpxZCaxxM5AAZVg6PDMda2FyErn5VOS0
 6cbcHJrJyAqhOdHd6/9QyFumRW2ZXftFKhRWkdOv9LMJVJ6Q8aSUfUe/AA0SPPbjVnIphCjcU
 33eo6blx+kl/RxzQncsMrBgV/cScD5B+roxASW84z8Vd/UBO3w=
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
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

A recent build fix got the dependency slightly wrong, breaking
builds with CONFIG_AC97_BUS_NEW:

WARNING: unmet direct dependencies detected for SND_SOC_WM9713
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
  Selected by [m]:
  - SND_SOC_ZYLONITE [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_PXA2XX_SOC [=m] && MACH_ZYLONITE [=y] && AC97_BUS [=n]=n

WARNING: unmet direct dependencies detected for SND_SOC_WM9712
  Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
  Selected by [m]:
  - SND_PXA2XX_SOC_EM_X270 [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_PXA2XX_SOC [=m] && (MACH_EM_X270 [=n] || MACH_EXEDA [=n] || MACH_CM_X300 [=y]) && AC97_BUS [=n]=n

Change the dependency to allow either version of the AC97 library
code.

Fixes: 5a309875787d ("ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1de97680858f..d911956c591d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1626,19 +1626,19 @@ config SND_SOC_WM9090
 
 config SND_SOC_WM9705
 	tristate
-	depends on SND_SOC_AC97_BUS
+	depends on SND_SOC_AC97_BUS || AC97_BUS_NEW
 	select REGMAP_AC97
 	select AC97_BUS_COMPAT if AC97_BUS_NEW
 
 config SND_SOC_WM9712
 	tristate
-	depends on SND_SOC_AC97_BUS
+	depends on SND_SOC_AC97_BUS || AC97_BUS_NEW
 	select REGMAP_AC97
 	select AC97_BUS_COMPAT if AC97_BUS_NEW
 
 config SND_SOC_WM9713
 	tristate
-	depends on SND_SOC_AC97_BUS
+	depends on SND_SOC_AC97_BUS || AC97_BUS_NEW
 	select REGMAP_AC97
 	select AC97_BUS_COMPAT if AC97_BUS_NEW
 
-- 
2.26.0

