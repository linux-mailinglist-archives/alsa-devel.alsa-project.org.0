Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1C831E07
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 17:59:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AD9B7F8;
	Thu, 18 Jan 2024 17:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AD9B7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597151;
	bh=j++VE3yyl/3Aq6hN2lI/I5Lv3fNUZ9f2+8EY9q5HghQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jpEM9A6OmdL45RAI56MizQsv2FZlt+hGtmG9oGTm6v94Ul0CEUwc2+9d+S0PRsdvr
	 Qj1bEeZcfDqgYT3KYHqYZ9dhVYJH6/PuKrryXqXrIC9l9TMKJy2kWEpe4zCZNPhdz/
	 72g+YstxcONsGjRleYYbPZEyD51zwnOngx9HRO0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 011CFF805BA; Thu, 18 Jan 2024 17:58:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEC45F805C0;
	Thu, 18 Jan 2024 17:58:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 814CEF8059F; Thu, 18 Jan 2024 17:58:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E854F8057E
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E854F8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JSLp7lP+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3F6C9B81890;
	Thu, 18 Jan 2024 16:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEFFC433C7;
	Thu, 18 Jan 2024 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705597105;
	bh=j++VE3yyl/3Aq6hN2lI/I5Lv3fNUZ9f2+8EY9q5HghQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JSLp7lP+yt2+TNDtjYwQo3EhajRF3UyEJl8Qt1EyujY64k5U+PZVx5JcOKgBs+35j
	 6n3xNowULaMqLpw5e66YN3REKKMbwnPoceprkwxWR18V4gXCc8z3+DYZClyIIHNX/9
	 CejlplkAfn1oKeq2i3MofOS4s4MMM2K9dhViBL7eiziFiW+DbnxgIN/W4SnItWKGzU
	 1D00ayoUHdNqDpTBxrzzT7o34mt6DRlKEvYW5kzNfpCuVdvss2jiLNZGZcNPlj7Hgj
	 NcuDaBV7sw7h52cu8Zg+kq1ou4oStn41Bh8sbtJqOj1cMENM3ZQwzLAp4aEyaBiPvU
	 9COmIaQoyDZfw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQVir-0003Yy-1q;
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
Subject: [PATCH v3 1/5] ASoC: codecs: wsa883x: fix PA volume control
Date: Thu, 18 Jan 2024 17:58:07 +0100
Message-ID: <20240118165811.13672-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118165811.13672-1-johan+linaro@kernel.org>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QAPAI4YRWLNY5RAA76BKP4DQOKEIFIJ6
X-Message-ID-Hash: QAPAI4YRWLNY5RAA76BKP4DQOKEIFIJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAPAI4YRWLNY5RAA76BKP4DQOKEIFIJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The PA gain can be set in steps of 1.5 dB from -3 dB to 18 dB, that is,
in fifteen levels.

Fix the range of the PA volume control to avoid having the first
sixteen levels all map to -3 dB.

Note that level 0 (-3 dB) does not mute the PA so the mute flag should
also not be set.

Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets and map")
Cc: stable@vger.kernel.org      # 6.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index cb83c569e18d..32983ca9afba 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1098,7 +1098,7 @@ static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, -300);
+static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, 0);
 
 static int wsa883x_get_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
@@ -1239,7 +1239,7 @@ static const struct snd_soc_dapm_widget wsa883x_dapm_widgets[] = {
 
 static const struct snd_kcontrol_new wsa883x_snd_controls[] = {
 	SOC_SINGLE_RANGE_TLV("PA Volume", WSA883X_DRE_CTL_1, 1,
-			     0x0, 0x1f, 1, pa_gain),
+			     0x1, 0xf, 1, pa_gain),
 	SOC_ENUM_EXT("WSA MODE", wsa_dev_mode_enum,
 		     wsa_dev_mode_get, wsa_dev_mode_put),
 	SOC_SINGLE_EXT("COMP Offset", SND_SOC_NOPM, 0, 4, 0,
-- 
2.41.0

