Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777A3FE038
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 18:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 341BA1786;
	Wed,  1 Sep 2021 18:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 341BA1786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630514524;
	bh=IgcW+d5/MtmXnoDhkwyXEn1B10t2koIKwxRxHQAt+QA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d8/GqPhiXc28+3baZmSb1OnLBHlQVrUBNcJ7omOym4gyJ2n1k2jLXAim1PUqJvnBb
	 GlfmX6+eFV2MsyEiYEI0IeAPCQ4TlQOgk1v43MUfQyuUGocC+Yv4ZDp8DVRRQmKfsl
	 txqELrW8YUHnZuGelrgLk5aOj7Hns+h21fyhav0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4958F80218;
	Wed,  1 Sep 2021 18:40:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7209EF80218; Wed,  1 Sep 2021 18:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5702F80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 18:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5702F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="RmYm1BYT"
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 181GeCO2005174;
 Thu, 2 Sep 2021 01:40:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 181GeCO2005174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1630514413;
 bh=sQ2RhCsMu7aC76iwNKL9hAmPl8fQjIe1J0BMr9NvZ0o=;
 h=From:To:Cc:Subject:Date:From;
 b=RmYm1BYTcVeJRHPm7je0GVran6Qp+4DLC45oR77rSi4UO6CSNc8eM3OJJgPiqHIZq
 yfmAG7FOOTugHXxovjhfvPFwwQ6oBbCbIIhzlHjKsOv1fQjNxRJ1sVryoPai+ZyAt9
 Nu9DmxfAeGyORCVP6trNudIw/me93dZBun5VPxnN0cgoAx9pUvC9ay3v8rqqi54fNm
 gPJNmJT08CgJnP8N4APonhJGQQRhIRcrnk43GkCLv0Y5HtiWC5Br5GT3h+rxe6jAe1
 ZisgioWcqZbCGyX3W+KoFsot35itxdScZ4oLkicRBlt1fRBzMI4HUdQ2P8ve8jN2n+
 XuZpYroh1dGzw==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: ti: rename CONFIG_SND_SOC_DM365_VOICE_CODEC_MODULE
Date: Thu,  2 Sep 2021 01:40:09 +0900
Message-Id: <20210901164009.1546967-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=8F=AB=B1ter=20Ujfalusi?= <peter.ujfalusi@gmail.com>
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

Kconfig generates include/generated/autoconf.h to make CONFIG options
available to the pre-processor. Symbols with the value 'm' are suffixed
with '_MODULE'

Here is a conflict; CONFIG_FOO=m results in '#define CONFIG_FOO_MODULE 1',
but CONFIG_FOO_MODULE=y also results in the same define.

Also, CONFIG options that end with '_MODULE' confuse the Kconfig/fixdep
interaction; fixdep always assumes CONFIG_FOO_MODULE comes from
CONFIG_FOO=m, so the dependency is not properly tracked for symbols
that end with '_MODULE'.

For these reasons, CONFIG options that end with '_MODULE' should be
avoided in general. (I am planning on adding a check in Kconfig.)

This is the only case in the current kernel.

The new option name was suggested by Péter Ujfalusi. [1]

[1] https://lore.kernel.org/all/d9e777dc-d274-92ee-4d77-711bfd553611@gmail.com/

Fixes: 147162f57515 ("ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 sound/soc/ti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 698d7bc84dcf..3260a30d3d54 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -211,7 +211,7 @@ config SND_SOC_DM365_VOICE_CODEC
 	  Say Y if you want to add support for SoC On-chip voice codec
 endchoice
 
-config SND_SOC_DM365_VOICE_CODEC_MODULE
+config SND_SOC_DM365_SELECT_VOICE_CODECS
 	def_tristate y
 	depends on SND_SOC_DM365_VOICE_CODEC && SND_SOC
 	select MFD_DAVINCI_VOICECODEC
-- 
2.30.2

