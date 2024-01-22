Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7E836FA6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:20:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E54D786F;
	Mon, 22 Jan 2024 19:19:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E54D786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705947600;
	bh=J3pJykalQ9z5qLyd0IoXv2mhNXbeb8C+rJuQjv479Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZiXgrgboZ4KqucQKa+0R8mKc+9KPuFgF49Q0RLvNIxRicCUXy6ozyYkHO2EKoc8s/
	 jf0lZgJtmt9Y0DHTJ4YfJFCgSyIgHvSlXZvKOk6naWsrDhnkbVt9QFMLqwdrj76o59
	 421B/wJ6atPcOUn/6GO88II23Tz5QWCJu2e94Kjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA7EBF80609; Mon, 22 Jan 2024 19:18:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB9AF80608;
	Mon, 22 Jan 2024 19:18:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CAA5F8025F; Mon, 22 Jan 2024 19:18:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CE25F80149
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CE25F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K24fJxSp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F07FCE2C13;
	Mon, 22 Jan 2024 18:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC71C43399;
	Mon, 22 Jan 2024 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705947507;
	bh=J3pJykalQ9z5qLyd0IoXv2mhNXbeb8C+rJuQjv479Gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K24fJxSp+FVgatotrYgfDwSUxsJpUEUirW5i9YYtNy82g7DIQQb8BNKtVxHiXa4Pe
	 WbtgD6zZUdGpU2tphB1q7HqEvldJNHIzfIVA5R6RjTYkHDg4xTQdFzAvTkAx+CUEFf
	 hwbwP2fPqRCrLn1XxDA8XEKKB2eavF044La9klYHiWDFyVANSqK1S+AII7R+G92SbJ
	 KA84JkyVeb5KQdZV1Mz9MEIcHpZg9tzeSCMyk/4P16zr14RMCLe9ylTrFoUgVDzD2c
	 lpakAwNuE/2+uRRsEOFN20SObhp9DBfyjH+n8P8z/rzHIPf9JnlQYmD53TJy4jvHE+
	 Z9TP1RLO37Chg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rRysa-0000000013T-1ZCx;
	Mon, 22 Jan 2024 19:18:40 +0100
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
Subject: [PATCH v5 1/4] ASoC: codecs: wsa883x: fix PA volume control
Date: Mon, 22 Jan 2024 19:18:16 +0100
Message-ID: <20240122181819.4038-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122181819.4038-1-johan+linaro@kernel.org>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BQFC7W42J7C2VAAL7CJFL2K7LYPB47AD
X-Message-ID-Hash: BQFC7W42J7C2VAAL7CJFL2K7LYPB47AD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQFC7W42J7C2VAAL7CJFL2K7LYPB47AD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The PA gain can be set in steps of 1.5 dB from -3 dB to 18 dB, that is,
in 15 levels.

Fix the dB values for the PA volume control as experiments using wsa8835
show that the first 16 levels all map to the same lowest gain while the
last three map to the highest gain.

These values specifically need to be correct for the sound server to
provide proper volume control.

Note that level 0 (-3 dB) does not mute the PA so the mute flag should
also not be set.

Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets and map")
Cc: stable@vger.kernel.org      # 6.0
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wsa883x.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index cb83c569e18d..a2e86ef7d18f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1098,7 +1098,11 @@ static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, -300);
+static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(pa_gain,
+	0, 14, TLV_DB_SCALE_ITEM(-300, 0, 0),
+	15, 29, TLV_DB_SCALE_ITEM(-300, 150, 0),
+	30, 31, TLV_DB_SCALE_ITEM(1800, 0, 0),
+);
 
 static int wsa883x_get_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
-- 
2.43.0

