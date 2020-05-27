Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7BF1E441D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 15:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E7A217BD;
	Wed, 27 May 2020 15:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E7A217BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590587042;
	bh=Vb704gGv0WI69fuN2388dwD9ZaQ8WCf+a7m1Iicsff0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dFPJoRDOvDfjUYW+Vhw25hBVc65snRDT1U7z6LyAzNMFqYl8QKM2tsMC3kmfDlocW
	 XRD8l9HHL25RZE5zTr4Rnbh2rxks7nWoLRVHexzxriQxTR7W7VB67TsF13pdcLp1Xy
	 7Q0oTQpxye8jKrF1qsdJMStOcvND1Xj52KA76sUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63DCBF80149;
	Wed, 27 May 2020 15:42:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98695F8014E; Wed, 27 May 2020 15:42:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE10AF800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 15:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE10AF800FF
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MTR6K-1jRiyz1AU8-00ThIV; Wed, 27 May 2020 15:41:53 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ASoC: amd: rt5682: fix soundwire dependencies
Date: Wed, 27 May 2020 15:41:26 +0200
Message-Id: <20200527134151.834555-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8w0UY7i3gtk1GlJ6DgwH4652yE7awyeT85Ve0hq9YQBCGEle3h6
 3vsPoqite4j5z00ZU1QXxNWgj+ddiYeGTfz5J9uAspEkrglL2qtrXKRrUYz4vF/VIY5cWRF
 BUZFe0Y9khfUoSr1iGSlUt6t94FUwl9wp4lMmwlKZr1s2+H7TnyDPYkVoRAr/OFUv5od1M9
 3FPkdaBiYZYcRah97SMcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KphJHlOFwj4=:b8BE9AWVjfNstdog+V5iy4
 TJUEkhl0DCNIxSiMx6TOeBmS99Jd/8nYECxADoAD24hPpt238BqFnNsVDm29aSdv8t3wEp82Q
 6ZbIpNdYrqQoGBotCWMhyfMzsPszxxkM0kk8515CdyIdpibP8ujeQgrWG6XFgLPk+8AsH+A5G
 Ng/pupBLuXVe+eEYUyc9jta7os9kiG7CHpO+Wb6zAWuYXbSPj/Yfx0CVbXtN45XlptzHmx77J
 P817Ov19LVbRk//I09hv2DyMlderupDjtX52oSBMIt1+d9FsEbfUbt0JtCBUay3AG0/W6ZBOG
 C2Qz1vU5qZpDLR2MwZwuPWNDsp1UWumPDAcoC36F8KQ/LDQDS4/n0nzDtbu0/o67cVMrXP0uP
 KJjBGPuyTJ/zkvsFhdPZXR1jD6P4ZKADhSYH54ZqJxCiV3YKmiTgYatTI9yqQCE6g4b/mwBoV
 +fTW/3RD7Zt0zgvH/J/V6UpzyjY5E78/FlX/8WGqLq5dAsxD/zKEz8GE3B9dAJLz4M0buytxR
 1xXw6rJ/hzJxHFNt6S52QBEJNmz8XBL7xPTfhgUg3zLaj5lP82JJqp65LQEeBtL7bbsuzvJ3I
 qxETWMAyn4ctpk4ZOOGHKopjyMWcYuuMe+q/k4+uT+1FfIqj68OtNJgdrUFXdkcGcBTBKS34V
 uUoKAncMEY+FVFpOVoYmS68V3+tTbY7+JfonHBWz0RFbUaWust0KR+ItTPhdPmGYmFfhuqJNu
 DueDkDAPbLVGBPRtW38LP34huInsMXpysQvggkZZ19hEQPd/v1wdRKend0lcRpvmYTjwUzSaR
 jN5AQpU3sKnJ4v2vW4E65f3xuNQ+U0vfLVLnuhys2eHoCg3who=
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Takashi Iwai <tiwai@suse.com>
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

A built-in SND_SOC_AMD_RV_RT5682_MACH driver can not select
SND_SOC_RT5682 when that is linking against a modular soundwire
layer:

WARNING: unmet direct dependencies detected for SND_SOC_RT5682
  Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (I2C [=y] || SOUNDWIRE [=m]) && (SOUNDWIRE [=m] || !SOUNDWIRE [=m]) && (I2C [=y] || !I2C [=y])
  Selected by [y]:
  - SND_SOC_AMD_RV_RT5682_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP3x [=y] && I2C [=y] && CROS_EC [=y]
  Selected by [m]:
  - SND_SOC_RT5682_SDW [=m] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=m] && (I2C [=y] || !I2C [=y])

This one is a bit awkward because the AMD driver itself has no interest
in soundwire, but I could not come up with a cleaner workaround so far.

Maybe the SND_SOC_RT5682 driver itself can be reworked so that
the common part depends on neither soundwire nor i2c and the two
bus specific options can be loadable modules when the common part
is built-in.

Fixes: 6b8e4e7db3cd ("ASoC: amd: Add machine driver for Raven based platform")
Fixes: fd443a20c2f0 ("ASoC: rt5682: fix I2C/Soundwire dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 77ffdb41bee5..878cf97b050e 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -34,6 +34,7 @@ config SND_SOC_AMD_RV_RT5682_MACH
 	select SND_SOC_CROS_EC_CODEC
 	select I2C_CROS_EC_TUNNEL
 	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC
+	depends on SOUNDWIRE || !SOUNDWIRE
 	help
 	 This option enables machine driver for RT5682 and MAX9835.
 
-- 
2.26.2

