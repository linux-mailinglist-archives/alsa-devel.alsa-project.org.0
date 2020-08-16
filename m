Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5CE24569F
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Aug 2020 09:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A5B1672;
	Sun, 16 Aug 2020 09:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A5B1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597564615;
	bh=5bwXm9MCyCBR4KAW15HWZXYnI2gDAfCQqiNM+/trxvo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u3yeL7XnQSn2tF8EEdw9tILXgsJ0o9PAy/IgyTq5zwOiS2dU4IrjrcOHvPs5wIGVR
	 yM/Fs0c66x+fIxlRrPIa71E+spTppRVFz7n8irX4h/f75iuc5RvG3Cxi952L5IvDxH
	 vt9P/mtp4uF5qUqlykiin37Yll76U7RdG+1eMTT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A99D6F802E3;
	Sun, 16 Aug 2020 09:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69CB0F8015B; Sun, 16 Aug 2020 03:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC04EF800D3
 for <alsa-devel@alsa-project.org>; Sun, 16 Aug 2020 03:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC04EF800D3
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id 18552E11EE;
 Sat, 15 Aug 2020 18:23:43 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RK4kC8KZ4Uyc; Sat, 15 Aug 2020 18:23:42 -0700 (PDT)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: wm8962: Export DAC/ADC monomix switches
Date: Sun, 16 Aug 2020 03:23:34 +0200
Message-ID: <3662154.EqNIRYjrc8@pliszka>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 16 Aug 2020 09:52:38 +0200
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 "kernel@puri.sm" <kernel@puri.sm>, patches@opensource.cirrus.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
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

This allows solutions like ALSA UCM to utilize hardware mono downmix
for cases where mono output to a single speaker is desired only in
specific situations (like on a mobile phone).

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 sound/soc/codecs/wm8962.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 317916cb4e27..d36aa24da7e0 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -1702,6 +1702,8 @@ SOC_DOUBLE_R_TLV("Digital Playback Volume", WM8962_LEFT_DAC_VOLUME,
 SOC_SINGLE("DAC High Performance Switch", WM8962_ADC_DAC_CONTROL_2, 0, 1, 0),
 SOC_SINGLE("DAC L/R Swap Switch", WM8962_AUDIO_INTERFACE_0, 5, 1, 0),
 SOC_SINGLE("ADC L/R Swap Switch", WM8962_AUDIO_INTERFACE_0, 8, 1, 0),
+SOC_SINGLE("DAC Monomix Switch", WM8962_DAC_DSP_MIXING_1, WM8962_DAC_MONOMIX_SHIFT, 1, 0),
+SOC_SINGLE("ADC Monomix Switch", WM8962_THREED1, WM8962_ADC_MONOMIX_SHIFT, 1, 0),
 
 SOC_SINGLE("ADC High Performance Switch", WM8962_ADDITIONAL_CONTROL_1,
 	   5, 1, 0),
-- 
2.28.0




