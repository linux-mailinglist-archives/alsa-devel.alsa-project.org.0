Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1045E34F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 00:27:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD0B818E2;
	Fri, 26 Nov 2021 00:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD0B818E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637882837;
	bh=Hu4VT6pQTRz1kDWfdBUOllKsCNvq5ZBb6BYmfid0H04=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QWOyEUptS6w69pupTHpOxv7A+ry1PMl/6TwaBhHy1IT0oC/e/2WekjE1U+GH0p5s3
	 87t7wedXFx72LuswaD3E8JGf/gQQuKBgJ30lU/EnWDxxB0/prsC/yhaw1D0EzVvXPd
	 FxsnD+TyXr6Oyx4jVn7/EHXpSP9aA3+e7RPoBezk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1578EF804AB;
	Fri, 26 Nov 2021 00:25:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 029E4F8049E; Fri, 26 Nov 2021 00:25:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34094F8007E
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 00:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34094F8007E
From: Paul Cercueil <paul@crapouillou.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: codecs/jz4770: Add missing gain control after DAC/ADC
 mixer
Date: Thu, 25 Nov 2021 23:25:43 +0000
Message-Id: <20211125232543.117074-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Cercueil <paul@crapouillou.net>, alsa-devel@alsa-project.org,
 list@opendingux.net, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

The capture and playback paths both have a configurable gain after their
respective mixer, which can be set from -31 dB to 0 dB in 32 steps.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 sound/soc/codecs/jz4770.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 6b60120f59a6..1d0c467ab57b 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -307,6 +307,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(dac_tlv, -3100, 0);
 static const DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
 static const DECLARE_TLV_DB_MINMAX(out_tlv, -2500, 600);
 static const DECLARE_TLV_DB_SCALE(linein_tlv, -2500, 100, 0);
+static const DECLARE_TLV_DB_MINMAX(mixer_tlv, -3100, 0);
 
 /* Unconditional controls. */
 static const struct snd_kcontrol_new jz4770_codec_snd_controls[] = {
@@ -319,6 +320,14 @@ static const struct snd_kcontrol_new jz4770_codec_snd_controls[] = {
 	SOC_DOUBLE_R_TLV("Line In Bypass Playback Volume",
 			 JZ4770_CODEC_REG_GCR_LIBYL, JZ4770_CODEC_REG_GCR_LIBYR,
 			 REG_GCR_GAIN_OFFSET, REG_GCR_GAIN_MAX, 1, linein_tlv),
+
+	SOC_SINGLE_TLV("Mixer Capture Volume",
+		       JZ4770_CODEC_REG_GCR_MIXADC,
+		       REG_GCR_GAIN_OFFSET, REG_GCR_GAIN_MAX, 1, mixer_tlv),
+
+	SOC_SINGLE_TLV("Mixer Playback Volume",
+		       JZ4770_CODEC_REG_GCR_MIXDAC,
+		       REG_GCR_GAIN_OFFSET, REG_GCR_GAIN_MAX, 1, mixer_tlv),
 };
 
 static const struct snd_kcontrol_new jz4770_codec_pcm_playback_controls[] = {
-- 
2.33.0

