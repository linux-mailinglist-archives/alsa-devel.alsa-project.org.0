Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C28328BE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:27:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7554827;
	Fri, 19 Jan 2024 12:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7554827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663658;
	bh=l7DGGpCso7bX08YQvGfXDvfIrpjxnzkTzOG8xe3VBVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e4Go+njyUFW1yep68jH0auzvErasb85rZJ7hjTM0geEE5m0GeOLhEuz5zqmvVeYO+
	 eu5h2joaN41biqXI6IeTPActNnAL4VzXsQKGxfl4mLti+Fy1qiWl2jDmNHTGnOh7vc
	 OuSd9QpaO8AoN9EC+6xhEgITRdjR1g1KZZ+jQnXI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EB52F80580; Fri, 19 Jan 2024 12:27:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD48F8057F;
	Fri, 19 Jan 2024 12:27:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C3CCF802E8; Fri, 19 Jan 2024 12:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A84C3F800C1
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:26:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A84C3F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YhJkk+cM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CCA94B81B99;
	Fri, 19 Jan 2024 11:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A93C433A6;
	Fri, 19 Jan 2024 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705663615;
	bh=l7DGGpCso7bX08YQvGfXDvfIrpjxnzkTzOG8xe3VBVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YhJkk+cMaTlopP1irGiiDq13+a7TBtsEZ6otbU7M/ljnD1V55EZePRM0XtewkayqI
	 UeyqWcv6XBo//CpsOZwirvLsTenlMeTkrtCq5RBz0m3/3MavweFxj46tRj0ADjKj3d
	 2aYFpqtsrJs2973P54qVLkBGOjt4BhDhLSuAk8B+PEMpXz6ZDiJmjn867D1dLYq7rs
	 7Qq56OAjruTuHV18kW0T0U5hhu4P+hodxMSfJbQmuunEBxbA+iAgyFVZbhwsi9fa85
	 qMZgPi//RtVTz9TFUE5gc7viZH2lk2UINQbmIX349Lfd+KejHhSCNhdrph5rUardAc
	 eVBmMXD2G+KvQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQn1b-0001xN-3C;
	Fri, 19 Jan 2024 12:27:04 +0100
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
Subject: [PATCH v4 3/4] ASoC: codecs: lpass-wsa-macro: fix compander volume
 hack
Date: Fri, 19 Jan 2024 12:24:19 +0100
Message-ID: <20240119112420.7446-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119112420.7446-1-johan+linaro@kernel.org>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OHAQ3BFNZELCGWH5IGJQ5I7LG7NKP5CK
X-Message-ID-Hash: OHAQ3BFNZELCGWH5IGJQ5I7LG7NKP5CK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHAQ3BFNZELCGWH5IGJQ5I7LG7NKP5CK/>
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

