Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB00654D29
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 09:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964DC482C;
	Fri, 23 Dec 2022 09:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964DC482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671782649;
	bh=YM14M0G++EQf8uQcFXGB62bbcyA50BDOjMaNomxxz5g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=K8VfZB7Y14yJadVZHq/H+a9DYJ9yuD09nZMAsGbnGYHansjJ7FkVsvVvFm9t6ajVT
	 vDxFnvK9F/eDTve3GK4g5FtRAZloHa55aXDuFpmWwp+mkh6SIWCoc0qY/UtzApgWcz
	 ZCxjFtdzxMIAj+K3lyH/w1OUlLxEve18KplFpBpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27BFBF8024D;
	Fri, 23 Dec 2022 09:03:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFB6CF804AD; Fri, 23 Dec 2022 09:03:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-out-03.comm2000.it (smtp-out-03.comm2000.it [212.97.32.66])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C4C5F8024D
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 09:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C4C5F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=quClVVKX
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id B2BDBB42941;
 Fri, 23 Dec 2022 09:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1671782583;
 bh=YM14M0G++EQf8uQcFXGB62bbcyA50BDOjMaNomxxz5g=;
 h=From:To:Cc:Subject:Date;
 b=quClVVKXo0IMk646fsTtVZNEy3gdB3GaS94tS9gYpr60T62Q6Ov+oVb929MzRa9md
 LYq1IZfy7rNk1mmJlwI10I0vb7YNU+5aizhOr1GJFlQq/oMv+BYzR2JWMO6wwNYqrs
 pPLnaHDGjWkctjnNCbkvpSfPAl9OGeL1hn1ouiurC9bPdeBiyLYlw4IedqlgEyn5Ab
 J2RCe51HWKWqQFlGBjK1iozGa9+O7mZkqzSkylm+PJa3nSE3sSIzEQxXQl/tG1AcqZ
 x4JVlcVTqWQVz1PBUdwueEvCQweKxKJcct5MaK5jbLkDonlZ3NXXDYM4NZJ/bHowbm
 6mGYVbOnth8Qg==
From: Francesco Dolcini <francesco@dolcini.it>
To: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v1] ASoC: wm8904: fix wrong outputs volume after power
 reactivation
Date: Fri, 23 Dec 2022 09:02:47 +0100
Message-Id: <20221223080247.7258-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Restore volume after charge pump and PGA activation to ensure
that volume settings are correctly applied when re-enabling codec
from SND_SOC_BIAS_OFF state.
CLASS_W, CHARGE_PUMP and POWER_MANAGEMENT_2 register configuration
affect how the volume register are applied and must be configured first.

Fixes: a91eb199e4dc ("ASoC: Initial WM8904 CODEC driver")
Link: https://lore.kernel.org/all/c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com/
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 sound/soc/codecs/wm8904.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index ca6a01a230af..791d8738d1c0 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -697,6 +697,7 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
 	int dcs_mask;
 	int dcs_l, dcs_r;
 	int dcs_l_reg, dcs_r_reg;
+	int an_out_reg;
 	int timeout;
 	int pwr_reg;
 
@@ -712,6 +713,7 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
 		dcs_mask = WM8904_DCS_ENA_CHAN_0 | WM8904_DCS_ENA_CHAN_1;
 		dcs_r_reg = WM8904_DC_SERVO_8;
 		dcs_l_reg = WM8904_DC_SERVO_9;
+		an_out_reg = WM8904_ANALOGUE_OUT1_LEFT;
 		dcs_l = 0;
 		dcs_r = 1;
 		break;
@@ -720,6 +722,7 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
 		dcs_mask = WM8904_DCS_ENA_CHAN_2 | WM8904_DCS_ENA_CHAN_3;
 		dcs_r_reg = WM8904_DC_SERVO_6;
 		dcs_l_reg = WM8904_DC_SERVO_7;
+		an_out_reg = WM8904_ANALOGUE_OUT2_LEFT;
 		dcs_l = 2;
 		dcs_r = 3;
 		break;
@@ -792,6 +795,10 @@ static int out_pga_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component, reg,
 				    WM8904_HPL_ENA_OUTP | WM8904_HPR_ENA_OUTP,
 				    WM8904_HPL_ENA_OUTP | WM8904_HPR_ENA_OUTP);
+
+		/* Update volume, requires PGA to be powered */
+		val = snd_soc_component_read(component, an_out_reg);
+		snd_soc_component_write(component, an_out_reg, val);
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
-- 
2.25.1

