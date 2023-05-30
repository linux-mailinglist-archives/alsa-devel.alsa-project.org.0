Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF0716C0A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 20:13:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695C483E;
	Tue, 30 May 2023 20:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695C483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685470423;
	bh=iHcb9BFc/X1bbxtUKpaxg5GTnEgeVVJ1yraooXSIn1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SflIJc0fYbRSvYmLZ+yYCGBwLsVCV8jekLF8q22Gn12CUoEnsPDWiMm64pgcQQE9J
	 yzyroZaeUHS8fcrWlZHhWlCTfltV+fJVTAozrdka2RKnb7KUqCu5EMWmiFChpEsf5f
	 M6c3b99suddMzJzvXZT8L7zAJDeoAQQUU6IjHwA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEB34F8057D; Tue, 30 May 2023 20:12:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0605F80563;
	Tue, 30 May 2023 20:12:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85F07F80552; Tue, 30 May 2023 20:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38F98F80551
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 20:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38F98F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=kVgtbEN3
Received: from localhost (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3512C6606E76;
	Tue, 30 May 2023 19:11:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685470313;
	bh=iHcb9BFc/X1bbxtUKpaxg5GTnEgeVVJ1yraooXSIn1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVgtbEN3hqRjjWYAhVn3DNUVrLbzogAUD3ZcQ6srLv0f6+cM8SjLXGVgwHRq751qy
	 AgUnx+6VWIYyHU8oLQ5/WBDwbY/Z8sGpfUwOCuKp/2LH5EYVhEsRfBDh/X4tvdhXAK
	 FCABiS0A1FDOV/C7rJMrx8UdWqQvf6fPQeJI94xn6D091IxAsBvJYBFq5LLbo97eY5
	 f4csibbvqoXLChNyuFKbc/4iblvSsZhz+hY5RBjlTyE9Nil/Xz4qxaa47CLjFASdfv
	 xwM3QLj7S02aaP9MQ2X2T057l51nlM6kDQeyq0HtRfZJg5ovfDqT05zaL07SIavHbt
	 Oeov1kSSDiI/Q==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	David Yang <yangxiaohua@everest-semi.com>,
	Daniel Drake <drake@endlessm.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Assign ES8316 MCLK rate on
 rk3588-rock-5b
Date: Tue, 30 May 2023 21:11:40 +0300
Message-Id: <20230530181140.483936-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530181140.483936-1-cristian.ciocaltea@collabora.com>
References: <20230530181140.483936-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IJTE6M5GDMUDQWI2M3VTRM7CID3EUAQE
X-Message-ID-Hash: IJTE6M5GDMUDQWI2M3VTRM7CID3EUAQE
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJTE6M5GDMUDQWI2M3VTRM7CID3EUAQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The I2S0_8CH_MCLKOUT clock rate on Rock 5B board defaults to 12 MHz and
it is used to provide the master clock (MCLK) for the ES8316 audio
codec.

On sound card initialization, this limits the allowed sample rates
according to the MCLK/LRCK ratios supported by the codec, which results
in the following non-standard rates: 15625, 30000, 31250, 46875.

Hence, the very first access of the sound card fails:

  Broken configuration for playback: no configurations available: Invalid argument
  Setting of hwparams failed: Invalid argument

However, all subsequent attempts will succeed, as the audio graph card
will request a correct clock frequency, based on the stream sample rate
and the multiplication factor.

Assign MCLK to 12.288 MHz, which allows the codec to advertise most of
the standard sample rates.

Fixes: 55529fe3f32d ("arm64: dts: rockchip: Add rk3588-rock-5b analog audio")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 3e4aee8f70c1..30cdd366813f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -133,6 +133,8 @@ es8316: audio-codec@11 {
 		reg = <0x11>;
 		clocks = <&cru I2S0_8CH_MCLKOUT>;
 		clock-names = "mclk";
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
 
 		port {
-- 
2.40.1

