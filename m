Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D219E5F69
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 22:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D48E18E3;
	Sat, 26 Oct 2019 22:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D48E18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572120563;
	bh=gxDWjQusrh4qW5jpLFhyJvh3JqexuLNkTL5yq+Ih2Hg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zi8/sQDInjEJPtoprp1/fpXBxscj+PHlIoU+CmeJF3U/3ae9ocLitFNK1Ugcd7AvS
	 yLfHQ6o4bLVNGqOYm+Mpvb2jK1x5M+tuB5fpkSLR9Yo/s57n9HO2+PomERB7EmHTgI
	 IxtamY76bRRPrci+vdo5u4crtrmfMwrZWeRThhQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60D2DF80367;
	Sat, 26 Oct 2019 22:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B32EF80228; Sat, 26 Oct 2019 22:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=FREEMAIL_FROM, KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL autolearn=disabled
 version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
 [80.12.242.132])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9472EF80367
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 22:06:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9472EF80367
Received: from belgarion ([90.76.41.223]) by mwinf5d19 with ME
 id JL6B210024otT8A03L6B8P; Sat, 26 Oct 2019 22:06:12 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 26 Oct 2019 22:06:12 +0200
X-ME-IP: 90.76.41.223
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
 patches@opensource.cirrus.com
X-URL: http://belgarath.falguerolles.org/
Date: Sat, 26 Oct 2019 22:06:10 +0200
Message-ID: <87a79nqnkd.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] wm9713 regression on pxa platforms
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Wolfson maintainers, hi Mark,

Recently, the wm9713 support broke on my platforms. I'm pretty sure that a
previous harmless warning became an error preventing the probe of my driver
(sound/soc/pxa/mioa701_wm9713.c) : the error is shown in [1] ("Control not
supported").

The warning "ASoC: no dapm match for Mic B Source" has be there as far as I'm
aware for ages, and it never prevented the probe before.

Now, if I apply the ugly patch in [2], everything works as expected ... but
that's definitely not the right fix.

Would any of you be able to figure out a fix please ?

Cheers.

-- 
Robert

[1] Kernel log
[  129.888985] pxa2xx-ac97 pxa2xx-ac97: ASoC: dai register pxa2xx-ac97 #3
[  129.889052] pxa2xx-ac97 pxa2xx-ac97: ASoC: dynamically register DAI pxa2xx-ac97
[  129.889102] pxa2xx-ac97 pxa2xx-ac97: ASoC: Registered DAI 'pxa2xx-ac97'
[  129.889135] pxa2xx-ac97 pxa2xx-ac97: ASoC: dynamically register DAI pxa2xx-ac97
[  129.889176] pxa2xx-ac97 pxa2xx-ac97: ASoC: Registered DAI 'pxa2xx-ac97-aux'
[  129.889207] pxa2xx-ac97 pxa2xx-ac97: ASoC: dynamically register DAI pxa2xx-ac97
[  129.889249] pxa2xx-ac97 pxa2xx-ac97: ASoC: Registered DAI 'pxa2xx-ac97-mic'
[  135.341942] wm9713-codec wm9713-codec: ASoC: dai register wm9713-codec #3
[  135.342019] wm9713-codec wm9713-codec: ASoC: dynamically register DAI wm9713-codec
[  135.342077] wm9713-codec wm9713-codec: ASoC: Registered DAI 'wm9713-hifi'
[  135.342109] wm9713-codec wm9713-codec: ASoC: dynamically register DAI wm9713-codec
[  135.342162] wm9713-codec wm9713-codec: ASoC: Registered DAI 'wm9713-aux'
[  135.342193] wm9713-codec wm9713-codec: ASoC: dynamically register DAI wm9713-codec
[  135.342234] wm9713-codec wm9713-codec: ASoC: Registered DAI 'wm9713-voice'
[  139.362113] mioa701-wm9713 mioa701-wm9713: ASoC: binding AC97
[  139.362302] mioa701-wm9713 mioa701-wm9713: ASoC: binding AC97 Aux
[  139.367170] wm9713-codec wm9713-codec: Control not supported for path Mic B Source -> [MPB] -> Mic B Pre Amp
[  139.375450] wm9713-codec wm9713-codec: ASoC: no dapm match for Mic B Source --> MPB --> Mic B Pre Amp
[  139.383448] wm9713-codec wm9713-codec: ASoC: Failed to add route Mic B Source -> MPB -> Mic B Pre Amp
[  139.393422] mioa701-wm9713 mioa701-wm9713: ASoC: failed to instantiate card -22
[  139.403089] mioa701-wm9713: probe of mioa701-wm9713 failed with error -22

[2] Ugly test
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 6497c1ea6228..ec140ccbab0b 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -630,8 +630,8 @@ static const struct snd_soc_dapm_route wm9713_audio_map[] = {
        {"Mic A Source", "Mic 1", "MIC1"},
        {"Mic A Source", "Mic 2 A", "MIC2A"},
        {"Mic A Source", "Mic 2 B", "Mic B Source"},
-       {"Mic B Pre Amp", "MPB", "Mic B Source"},
-       {"Mic B Source", NULL, "MIC2B"},
+       /* {"Mic B Pre Amp", "MPB", "Mic B Source"}, */
+       /* {"Mic B Source", NULL, "MIC2B"}, */
 
        /* headphone capture */
        {"Capture Headphone Mux", "Stereo", "Capture Mixer"},
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
