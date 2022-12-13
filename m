Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD164B2D1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 10:55:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CEE61901;
	Tue, 13 Dec 2022 10:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CEE61901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670925304;
	bh=wz2x8sSZP+2ZhM4wXsF5opLSCVBRhkyY4w8KqKoH1Kw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gaDwNbEhcYynnwxsxjT3d5AGWxqYSleZVFu9CL1TDeaiiDMofo1NoxkXRZGFH5F3C
	 qoECUXjgIcLM6gBct0yr6hfr4PHZ2TkxSckY/TiJOrwWDick8hzQeS+LrZRCgv+vOY
	 xSILFjzWiUKEmwTr1Q/dx7wnx4EeB9mjeD8KIwy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0AEF8047D;
	Tue, 13 Dec 2022 10:53:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 665C3F804D6; Tue, 13 Dec 2022 10:53:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F0FFF80431
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 10:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F0FFF80431
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=localhost) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <r.czerwinski@pengutronix.de>)
 id 1p51yc-0000eF-QL; Tue, 13 Dec 2022 10:53:30 +0100
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: max98088: fix dai1/2_hw_params access
Date: Tue, 13 Dec 2022 10:53:27 +0100
Message-Id: <20221213095328.122309-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: r.czerwinski@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
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
Cc: alsa-devel@alsa-project.org, Marco Felsch <m.felsch@pengutronix.de>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Marco Felsch <m.felsch@pengutronix.de>

According the reference manuals [1], [2] updating register 0x14/1c
should only be done after #shdn bit is set to 0.

[1] https://datasheets.maximintegrated.com/en/ds/MAX98089.pdf
[2] https://datasheets.maximintegrated.com/en/ds/MAX98088.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/codecs/max98088.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 405ec16be2b6..7f108e147355 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -977,6 +977,8 @@ static int max98088_dai1_hw_params(struct snd_pcm_substream *substream,
 
        rate = params_rate(params);
 
+       snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN, 0);
+
        switch (params_width(params)) {
        case 16:
                snd_soc_component_update_bits(component, M98088_REG_14_DAI1_FORMAT,
@@ -990,8 +992,6 @@ static int max98088_dai1_hw_params(struct snd_pcm_substream *substream,
                return -EINVAL;
        }
 
-       snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN, 0);
-
        if (rate_value(rate, &regval))
                return -EINVAL;
 
@@ -1047,6 +1047,8 @@ static int max98088_dai2_hw_params(struct snd_pcm_substream *substream,
 
        rate = params_rate(params);
 
+       snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN, 0);
+
        switch (params_width(params)) {
        case 16:
                snd_soc_component_update_bits(component, M98088_REG_1C_DAI2_FORMAT,
@@ -1060,8 +1062,6 @@ static int max98088_dai2_hw_params(struct snd_pcm_substream *substream,
                return -EINVAL;
        }
 
-       snd_soc_component_update_bits(component, M98088_REG_51_PWR_SYS, M98088_SHDNRUN, 0);
-
        if (rate_value(rate, &regval))
                return -EINVAL;
 
-- 
2.38.1

