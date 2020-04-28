Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3141BCF14
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 23:48:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A77168C;
	Tue, 28 Apr 2020 23:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A77168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588110538;
	bh=wZnqPgFYjX9/OiIm4wWXNu7iK0FURWhNzdNytdnEINc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aioaumOyMML3xYxOgGgUt7uJrMn7l0vujzrE+vIHpWqcxY6kr9c0vgyh6j+Gki5RF
	 962A8EKsj/QZDkDZTlBBX3fqMGTPnv3Dz6bne2L/Nmgh+1hWMJPSe+2hruZauPZEPI
	 SgtizM0Lhj7zeUsa4ZzinNrmcdM7+EOt6VRbfJjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A14F800B8;
	Tue, 28 Apr 2020 23:47:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7882F801DB; Tue, 28 Apr 2020 23:47:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C33F800B8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 23:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C33F800B8
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MNbtD-1joGmV3G95-00P4Gf; Tue, 28 Apr 2020 23:46:44 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: rt5682: fix I2C/Soundwire dependencies
Date: Tue, 28 Apr 2020 23:46:14 +0200
Message-Id: <20200428214642.3925004-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LjpCd0o0srZhlkXmKTYqi2kzkFjj8wOMi3UgGvZfhHwihrM2ZVK
 po+jmWaIRXwaEFPAix4bogG21pyYWTA+mjs+9fJP7UQkVRxcH099TCrSRRrDi2zbSW3q6fH
 aBP1db4kBRs2/IQtjmZPXOXXW9bJN+qqAuialfeXrl4bYwkfWYhxGD6X5GE7NBtKxHJhoNw
 YBnj+zR/OD1wyM18k0xUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RitVMxCvchg=:YzXMmPSbKEkthW6/6Sna2e
 ZlsFFGHLJK4HZl3QB1eIBSH8IeLm8qrCcWVzORws3LRh5HlqqvGV3diOIzbAqZZvbxKh3UTFs
 8sqwWDDc/3bM7bVE+a+ZCbcw9++h8gCMGTgT1iALxNHyWDeJ2/Ml3n3HjgcOR1wD7Ro86caLK
 nEtjixxhsg9Obg1J1nZWGQPS7Tn9Y5SEqx+GO9fVI2wx/7J+IyxGHHhp7dqiNcL4x6bAgMGvi
 /JqFgtH+95MLmql7ZPOx9GGr6rnBqkDPTK5pu1b3NakZlZxR9i2+NMoGqmtPOF1WlHDWxqsIq
 62GecHr+rlX4Tcx2ctIAmzDwNU4NBZwJIdydD0dhWFj2oOuS1/IKh2XtyUrtvWwdgVN8Vf2cX
 paaV9kZr05A2bqLZGItOAs3S8B2S7UhR+aAmIglTS12UNWaTMyoKCd+4vKt0kPkpnqT1gMsHN
 p34QR84rPgwRCYBVb44IBw7WYEICnbZiarylnlvnxZ2tVLYXFw9HNaz61ueSLd/OxI41iQcoI
 m4iOb35E3lYa52qUrEw0RCQdh70bx0GzTfDBkNiluMvCVhi3BTnQ81ZBEXrb6DHZl7DhjCnU9
 mGpj6KcYoFJCE8YB3jJOPGaPfRiQhKMankcbVZQ3QDndTxrh5NcMB5A2V+QfVKx062LJk3L2C
 5A7a+4B4VqQVq+pjlxkH5i2vpZ/JXNgTUEVtKNdgMj3KtO90IYcWb5ZqdPC4MTewD1h6LP0nk
 e0HEQjGDKiUQeXIMLMPZdwY3HeSk6qRMRthY3ZbKlDpaGjrDW4AhWTtHIcL4g+x0mLZ+pDPg+
 JS0+NZRbUTcXnhbtb5gKwEuejrM02qPu79NAwQ4szosU+S4FMk=
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 kbuild test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
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

If one of the two is a loadable module, the combined driver must
not be built-in:

aarch64-linux-ld: sound/soc/codecs/rt5682.o: in function `rt5682_sdw_hw_free':
rt5682.c:(.text+0xb34): undefined reference to `sdw_stream_remove_slave'
aarch64-linux-ld: sound/soc/codecs/rt5682.o: in function `rt5682_sdw_hw_params':
rt5682.c:(.text+0xe78): undefined reference to `sdw_stream_add_slave'

In particular, the soundwire driver must not be built-in if
CONFIG_I2C=m.

Fixes: 5549ea647997 ("ASoC: rt5682: fix unmet dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 1ce76f04c154..d911956c591d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1137,10 +1137,13 @@ config SND_SOC_RT5677_SPI
 config SND_SOC_RT5682
 	tristate
 	depends on I2C || SOUNDWIRE
+	depends on SOUNDWIRE || !SOUNDWIRE
+	depends on I2C || !I2C
 
 config SND_SOC_RT5682_SDW
 	tristate "Realtek RT5682 Codec - SDW"
 	depends on SOUNDWIRE
+	depends on I2C || !I2C
 	select SND_SOC_RT5682
 	select REGMAP_SOUNDWIRE
 
-- 
2.26.0

