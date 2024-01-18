Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C44831E10
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 18:00:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84CD3827;
	Thu, 18 Jan 2024 18:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84CD3827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597232;
	bh=l7DGGpCso7bX08YQvGfXDvfIrpjxnzkTzOG8xe3VBVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fc2uZ2QVPCtopV3J2WsRGbuNF2BcRdxhZbTZeZcp4IASDasudpv27TThfS+eRPpJQ
	 8yxg7HI3GuGyd51zQtLONkP+nd2nhkQ+5GUNDsEZ81wYGjFOQCxU6UJEBVny02si9t
	 mj+xSUkpoOQd5tYfj6eeMJO/xpOFb01Lgytz5vS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC8A2F8067B; Thu, 18 Jan 2024 17:58:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 941ABF80693;
	Thu, 18 Jan 2024 17:58:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 758B1F805CA; Thu, 18 Jan 2024 17:58:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 539D1F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:58:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 539D1F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dNPc3o1T
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F1A09B818F2;
	Thu, 18 Jan 2024 16:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5613C433A6;
	Thu, 18 Jan 2024 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705597105;
	bh=l7DGGpCso7bX08YQvGfXDvfIrpjxnzkTzOG8xe3VBVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dNPc3o1TZelTNhdGXAREgHUPw1ZrgBv+4XMHedohsa6BG6u2M1btngUjF2WxpFYrV
	 TwdxVuD6ZG/3nvEX/N7tBahtLKwnSNb0ptKnsuAk0pbF08F3xwOU020V6NO2xAo47a
	 uOYltEr2CRFyYd/SlLjUITRKUxoepTyk2tuKJuxR/twFK5qbHhGJkuzcVy5DPAi96U
	 guhDlYAWyLmgXmLrlqjvkkBQE5pIdPXdgC/BGzBUk9Bwo5j8UAGxnofU+dn0jYUZr8
	 hgGaTpUd1CTKOwg4Cs3tcngujxqYSn9eu3mV8OQS+beMZV5uGBdCdtulH07dJb7DDY
	 4Enz5H/ieA+ww==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQVir-0003Z4-2l;
	Thu, 18 Jan 2024 17:58:33 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 4/5] ASoC: codecs: lpass-wsa-macro: fix compander volume
 hack
Date: Thu, 18 Jan 2024 17:58:10 +0100
Message-ID: <20240118165811.13672-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118165811.13672-1-johan+linaro@kernel.org>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UILDQPUGHZUUHSPHJXA55IO33Q4REZYY
X-Message-ID-Hash: UILDQPUGHZUUHSPHJXA55IO33Q4REZYY
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UILDQPUGHZUUHSPHJXA55IO33Q4REZYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The LPASS WSA macro codec driver is updating the digital gain settings
behind the back of user space on DAPM events if companding has been
enabled.

As compander control is exported to user space, this can result in the
digital gain setting being incremented (or decremented) every time the
sound server is started and the codec suspended depending on what the
UCM configuration looks like.

Soon enough playback will become distorted (or too quiet).

This is specifically a problem on the Lenovo ThinkPad X13s as this
bypasses the limit for the digital gain setting that has been set by the
machine driver.

Fix this by simply dropping the compander gain offset hack. If someone
cares about modelling the impact of the compander setting this can
possibly be done by exporting it as a volume control later.

Note that the volume registers still need to be written after enabling
clocks in order for any prior updates to take effect.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Cc: stable@vger.kernel.org      # 5.11
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 7e21cec3c2fb..6ce309980cd1 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1584,7 +1584,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 	u16 gain_reg;
 	u16 reg;
 	int val;
-	int offset_val = 0;
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
 	if (w->shift == WSA_MACRO_COMP1) {
@@ -1623,10 +1622,8 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
 					CDC_WSA_RX_PGA_HALF_DB_MASK,
 					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
-			offset_val = -2;
 		}
 		val = snd_soc_component_read(component, gain_reg);
-		val += offset_val;
 		snd_soc_component_write(component, gain_reg, val);
 		wsa_macro_config_ear_spkr_gain(component, wsa,
 						event, gain_reg);
@@ -1654,10 +1651,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
 					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
 					CDC_WSA_RX_PGA_HALF_DB_MASK,
 					CDC_WSA_RX_PGA_HALF_DB_DISABLE);
-			offset_val = 2;
-			val = snd_soc_component_read(component, gain_reg);
-			val += offset_val;
-			snd_soc_component_write(component, gain_reg, val);
 		}
 		wsa_macro_config_ear_spkr_gain(component, wsa,
 						event, gain_reg);
-- 
2.41.0

