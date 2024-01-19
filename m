Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C7B8328C0
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 12:28:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85940846;
	Fri, 19 Jan 2024 12:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85940846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705663692;
	bh=7FAxMSZYO+6rp+32a2jHSpUGNLMh3wVgFHZWk8Irimk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=suGzmfGiLL0TvunrYVGlXN/QKkRR46WCPu1bVG4YeHyhAwaWyDH4MZyyuspJisyZ5
	 kdF5julVqr0FFeB4XrP1/JL4jK8ya8wX3+ozzmqjOKyx6zIczjKfyzqpFcxHdVB+i8
	 Ub5Gc3sL1PlECjR7b6yxJ1zV9wHBHOBxhwuZHdOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ECD8F805D2; Fri, 19 Jan 2024 12:27:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C06DCF805EE;
	Fri, 19 Jan 2024 12:27:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0669F805A1; Fri, 19 Jan 2024 12:27:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB6EFF8003A
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 12:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB6EFF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ADbkUCsi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D51861908;
	Fri, 19 Jan 2024 11:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2516BC43390;
	Fri, 19 Jan 2024 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705663615;
	bh=7FAxMSZYO+6rp+32a2jHSpUGNLMh3wVgFHZWk8Irimk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADbkUCsi+gQ1V2GpTItDg1bSvrT+UDjAIdH8Caif9AX6/QklxHnXtFj9V2PwLYXrN
	 +rr++YYQLjOVEmSPlmRA9YRO6tzcsJSjuQ0rJZCQNybWvQIApMUyAtE3YcWFLuXJ1i
	 46VSQHXGXxM9/0uy577nOpXGEIvfTGnpNHUpEmYboHUSo97p3DfJMyt09cXmfwMNMb
	 qvCp3h2J48QXN3oUyaP2Xwej7iF8R+QDzI3MgXJ0oopYKRzmNbETZJXHAoaCnI7ZDX
	 YRLoZkRih5NxYqvH0qec6PIJzE+/Ra6OnWNQLjJXT27wS15etRRROmLfOXSvZmQLNi
	 yPoKG/ATmo8VQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQn1b-0001xJ-2g;
	Fri, 19 Jan 2024 12:27:03 +0100
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
Subject: [PATCH v4 1/4] ASoC: codecs: wsa883x: fix PA volume control
Date: Fri, 19 Jan 2024 12:24:17 +0100
Message-ID: <20240119112420.7446-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119112420.7446-1-johan+linaro@kernel.org>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MJ57VKDPZ7WXAYOKYL4CQVXJ6MASQSYB
X-Message-ID-Hash: MJ57VKDPZ7WXAYOKYL4CQVXJ6MASQSYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJ57VKDPZ7WXAYOKYL4CQVXJ6MASQSYB/>
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
2.41.0

