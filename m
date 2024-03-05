Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032958721AE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 15:39:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635091DA;
	Tue,  5 Mar 2024 15:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635091DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709649546;
	bh=5fONkLaHesIMOm70XBSf2qSYOdhmhcWYXBd9O88r6vE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BQG1Ve4ht9gKbLX4l7vO2BX7ltzcesQiceGhMSzAUvFgF1+jo8oWMg+tKshfrYScO
	 I80wUkOeEdwTOe5ZRWYnjHjoONLn9i86aK1GqLJSkMpNkT1nYfVxIrgCFYhP2yPLb+
	 aFK5emngV5kH+F31xRYPVeDTk6oLFUmOOAlEZmGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4287CF80679; Tue,  5 Mar 2024 15:37:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A84D4F8067B;
	Tue,  5 Mar 2024 15:37:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE6D0F80640; Tue,  5 Mar 2024 15:37:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E528F80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 15:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E528F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Dww9oTa0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D724C000D;
	Tue,  5 Mar 2024 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709649422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Covygwy/chhwB+41NdS6+HU1LkO9hceqZpnJ7smcrJA=;
	b=Dww9oTa0Zs55La/ClEwRRMb289+Xa8qxTqSSGm7cweu5BabQ2I3IZ5o+FNt3KVdMirAIKd
	QevEziJV6e7q/KvLKGvUWHNMMewXth7JDTZDTPqVHXjnmdLKPXbsvu8TDJQGIlytJpfzHX
	HCRB0zuURAT/49+Wr0XNKVInuwrgkPxHF+ylqUgWwP39Fxi4firZnH1UWgjj7qlpbQ3+ft
	/d1sT2g6x107dCMPU/NvZZqA1UvpcKl894/MtaFOLo2kb50Cd1MklmY2oyv2zFzPUJPPSf
	tbfeTjRy4hp+5VFxUyiaug0y2Wunib7yj93UpKBm2xPvuB1obwpqBwnEp5f2Dg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 05 Mar 2024 15:36:32 +0100
Subject: [PATCH v4 5/7] arm64: defconfig: enable Rockchip RK3308 internal
 audio codec driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-rk3308-audio-codec-v4-5-312acdbe628f@bootlin.com>
References: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
In-Reply-To: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
Message-ID-Hash: UA4MOVFUJG5DLF44XJLZL6WEWM7RCCRS
X-Message-ID-Hash: UA4MOVFUJG5DLF44XJLZL6WEWM7RCCRS
X-MailFrom: luca.ceresoli@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UA4MOVFUJG5DLF44XJLZL6WEWM7RCCRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This codec now has a driver.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v4: nothing

This patch is new in v3.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..20650b03d25c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -981,6 +981,7 @@ CONFIG_SND_SOC_GTM601=m
 CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_PCM3168A_I2C=m
+CONFIG_SND_SOC_RK3308=m
 CONFIG_SND_SOC_RK817=m
 CONFIG_SND_SOC_RT5640=m
 CONFIG_SND_SOC_RT5659=m

-- 
2.34.1

