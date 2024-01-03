Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC1582349A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 19:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA89CE89;
	Wed,  3 Jan 2024 19:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA89CE89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704307034;
	bh=k+wZ9DUmK1WPFz8OxLLNZ0ZWpbB8ZluB+bNJACGBqHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e4rcP9hoGYqcXK8Xm8FE/p0eEkg3QlyUhNSA7ngV5slz+WPKlvjL/mUa427c5A7Hy
	 0oZtsbq1bA2dc/AMJIYS3r4VRkhbmbfmtyc6FbRno6JFC68ClqS6Ffog7Yx+bwnk3L
	 tsXCywq6D/WXMnVUCGjK4hJ0/kzsqcFiW//wgtzw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C16BF8060D; Wed,  3 Jan 2024 19:36:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7F7F80610;
	Wed,  3 Jan 2024 19:36:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 712F4F80549; Wed,  3 Jan 2024 19:34:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2ECF0F80535
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 19:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ECF0F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mN06hYTJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1AC36B8158C;
	Wed,  3 Jan 2024 18:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39CCC433C8;
	Wed,  3 Jan 2024 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306872;
	bh=k+wZ9DUmK1WPFz8OxLLNZ0ZWpbB8ZluB+bNJACGBqHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mN06hYTJYP4vUJkzIVyJggMtNhH5bjGEC6hbcWm2nZoVDE75nJtA5usZkUEJxobtk
	 OSbPcKja44zFBMGKrJxFfsW8cNTRIuwl5tluLRTqn7GoyXqVzych+HD8AHJOpRCxPj
	 JR3MoBhNhf1GOqAZizk0oo89SDeoTunakH2oqAawKchZqc3WrEVgWmkzI8O9l3tjwB
	 JffOo/wQk4Q3yO/bzmLW03GkQ96c1KPcGQSlAFQb0a1kx6Vam1tN4iBjUQx1aSHfZl
	 GnFLAOGvT7j4bBgqej52HoM86B8nVOOnKWLhJLHVo8XnvI5rdhpFYM/ug+pxnQw8pv
	 cia96wv1Stc6w==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:04 +0000
Subject: [PATCH 4/4] ASoC: meson: g12a-tohdmitx: Fix event generation for
 S/PDIF mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240103-meson-enum-val-v1-4-424af7a8fb91@kernel.org>
References: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
In-Reply-To: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k+wZ9DUmK1WPFz8OxLLNZ0ZWpbB8ZluB+bNJACGBqHw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllaiofg5sZ5UECpsyDPRJXOqEZ9mf0sLO11M27
 kloJ0lo/iqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWoqAAKCRAk1otyXVSH
 0EXVB/9EPTFgsfoqfT5+k9WPYlVvILzv7DRCBrrX4Dk30LFrjy0hOPaay0t+wOgCgFgqVDUcqJI
 LwFTPUnsmA7j5yRuN+SMrAnnFfnQEyuPPV/EFxkREUXU/aCyQKFLmW7OqHmrUwS9htAziujJjrG
 Ww9xm5TT7dpYbhiOpbIFJcRfsDyY3iO2g4BHveT7FZxe4NqiHD7SuRpk6Fye1iM/aF4XgE20rxC
 0n/ft7mDMd1x2vtbccdNl29rtTK2PZd+UwixHb7cG/mkxMcTqlM6MCCvrHnrjU3am5eW2J81emb
 EAzSaCZpR8PwygqGkgKRcUz9e2Bp2lrNwqW1bF/hhufwivfC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: O3WWLSVBBVQ5UII6ZMX3BROBZ4DLZXHJ
X-Message-ID-Hash: O3WWLSVBBVQ5UII6ZMX3BROBZ4DLZXHJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3WWLSVBBVQ5UII6ZMX3BROBZ4DLZXHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When a control changes value the return value from _put() should be 1 so
we get events generated to userspace notifying applications of the change.
While the I2S mux gets this right the S/PDIF mux does not, fix the return
value.

Fixes: c8609f3870f7 ("ASoC: meson: add g12a tohdmitx control")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-tohdmitx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 51b7703e1834..b92434125fac 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -118,7 +118,7 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_spdif_mux_enum, TOHDMITX_CTRL0,

-- 
2.39.2

