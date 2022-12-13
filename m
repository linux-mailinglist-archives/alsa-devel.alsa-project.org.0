Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983DF64B2D0
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 10:54:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 346BA18CB;
	Tue, 13 Dec 2022 10:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 346BA18CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670925279;
	bh=S26bqUHx8Ihsy8S2KeToBHsCBQZTKUuZo+PEwrm0GzQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZdtIqbYtEpVfRq0WHX+yGqB+Z9kWwfBkw1fInI2qPbNbxKPs6n2bKl5mdFNtdfz9z
	 f6y1zckAHlwiXD4QPJZK6cvsKE8yoHr1NN8UXKvnhl30FffwSH9Ezs7AaGQiIGHO+s
	 4JwiCSpGDcpW9HCt5hXtyAKQTQfHxFWgWWupIJk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5E52F804E2;
	Tue, 13 Dec 2022 10:53:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B465AF804E2; Tue, 13 Dec 2022 10:53:40 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id AC445F8047D
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 10:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC445F8047D
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=localhost) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <r.czerwinski@pengutronix.de>)
 id 1p51yd-0000ec-M5; Tue, 13 Dec 2022 10:53:31 +0100
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: max98088: fix initial dai mute state
Date: Tue, 13 Dec 2022 10:53:28 +0100
Message-Id: <20221213095328.122309-2-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213095328.122309-1-r.czerwinski@pengutronix.de>
References: <20221213095328.122309-1-r.czerwinski@pengutronix.de>
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

According the datasheets [1], [2] the initial value of register
0x2f/0x31 (dai1/dai2) is 0x00 which means that dai is unmuted. So upon
the first playback request the register is not touched since it is
cached by regmap. But the device output keeps silent. After ending the
playback session the mute() callback updates the register. Now the 2nd
playback request updates the register again (-> unmute the device) and
now we can really hear the output signal.

I've checked the register initial value which is '0x00' so the driver is
correct. Accroding the above inspections it seems that the hardware does
not update the register correctly on power up because the output is
muted.

To fix that we need to explicit set the mute state. Now the first
playback request gets played correctly.

[1] https://datasheets.maximintegrated.com/en/ds/MAX98089.pdf
[2] https://datasheets.maximintegrated.com/en/ds/MAX98088.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/codecs/max98088.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 7f108e147355..c00d7726ac04 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1710,6 +1710,11 @@ static int max98088_probe(struct snd_soc_component *component)
        snd_soc_component_write(component, M98088_REG_1E_DAI2_IOCFG,
                M98088_S2NORMAL|M98088_SDATA);
 
+       snd_soc_component_update_bits(component, M98088_REG_2F_LVL_DAI1_PLAY,
+               M98088_DAI_MUTE_MASK, M98088_DAI_MUTE);
+       snd_soc_component_update_bits(component, M98088_REG_31_LVL_DAI2_PLAY,
+               M98088_DAI_MUTE_MASK, M98088_DAI_MUTE);
+
        max98088_handle_pdata(component);
 
 err_access:
-- 
2.38.1

