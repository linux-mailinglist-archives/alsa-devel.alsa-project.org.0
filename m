Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD121ABE08
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 12:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8E4167B;
	Thu, 16 Apr 2020 12:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8E4167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587033385;
	bh=6MhVoR3KSPqu64IpyCcvbV9nOZUImUOz+3u415e+byU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUmiqsobwdC4K69HWtILpop/pmPQFiQeY8KjyMSSnH1gL8tHxfMwaqfcysE1BgEXD
	 Y1/UbODsJcEg0CJxwal3DTljVLkzElaiiwUI85DU4yUBXRXevj7z7gyVsGGfWlVF9j
	 SWbaYpYWIJx+LaPi+f05ofbuXLaUZJjvGPKdnby0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F0EFF802A8;
	Thu, 16 Apr 2020 12:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FC71F800AB; Thu, 16 Apr 2020 12:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6E27F8028C
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 12:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6E27F8028C
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
 by andre.telenet-ops.be with bizsmtp
 id TNWz2200b4dKHqf01NX0RZ; Thu, 16 Apr 2020 12:31:23 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0001cw-Ou; Thu, 16 Apr 2020 12:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0003zL-Nb; Thu, 16 Apr 2020 12:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Stefan Popa <stefan.popa@analog.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial 5/6] ALSA: Fix misspellings of "Analog Devices"
Date: Thu, 16 Apr 2020 12:30:57 +0200
Message-Id: <20200416103058.15269-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org
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

According to https://www.analog.com/, the company name is spelled
"Analog Devices".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/isa/ad1816a/ad1816a.c | 2 +-
 sound/pci/ac97/ac97_patch.c | 2 +-
 sound/pci/hda/Kconfig       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/isa/ad1816a/ad1816a.c b/sound/isa/ad1816a/ad1816a.c
index ce4c8ba2fa9873e7..ca18fe3ff8a59a9f 100644
--- a/sound/isa/ad1816a/ad1816a.c
+++ b/sound/isa/ad1816a/ad1816a.c
@@ -54,7 +54,7 @@ MODULE_PARM_DESC(clockfreq, "Clock frequency for ad1816a driver (default = 0).")
 static const struct pnp_card_device_id snd_ad1816a_pnpids[] = {
 	/* Analog Devices AD1815 */
 	{ .id = "ADS7150", .devs = { { .id = "ADS7150" }, { .id = "ADS7151" } } },
-	/* Analog Device AD1816? */
+	/* Analog Devices AD1816? */
 	{ .id = "ADS7180", .devs = { { .id = "ADS7180" }, { .id = "ADS7181" } } },
 	/* Analog Devices AD1816A - added by Kenneth Platz <kxp@atl.hp.com> */
 	{ .id = "ADS7181", .devs = { { .id = "ADS7180" }, { .id = "ADS7181" } } },
diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index ebf926728c5f84af..45ef0f52ec55b803 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -1356,7 +1356,7 @@ static int patch_cx20551(struct snd_ac97 *ac97)
 }
 
 /*
- * Analog Device AD18xx, AD19xx codecs
+ * Analog Devices AD18xx, AD19xx codecs
  */
 #ifdef CONFIG_PM
 static void ad18xx_resume(struct snd_ac97 *ac97)
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index e1d3082a4fe93153..7ba542e45a3d7f88 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -99,10 +99,10 @@ comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_CODEC_REALTEK=m
 
 config SND_HDA_CODEC_ANALOG
-	tristate "Build Analog Device HD-audio codec support"
+	tristate "Build Analog Devices HD-audio codec support"
 	select SND_HDA_GENERIC
 	help
-	  Say Y or M here to include Analog Device HD-audio codec support in
+	  Say Y or M here to include Analog Devices HD-audio codec support in
 	  snd-hda-intel driver, such as AD1986A.
 
 comment "Set to Y if you want auto-loading the codec driver"
-- 
2.17.1

