Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F305088CAC1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 18:26:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2945C2BF3;
	Tue, 26 Mar 2024 18:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2945C2BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711474013;
	bh=Ka0BqODwFrLwyN3SMEtrICxiPAvB0WKMvGb82tkKccg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cruEPtnaIY21xoJf0DXjbIjhZ+FDBpvUrNY+wRNAUu5BywY7KvPkJRgYqVxAhtqVw
	 tph39vfwORG4cybams3gO5eAqhxCwxZOs9jDCQbBXE+TwdA3WYlpPRnYmrkqgez5fc
	 JezShotLv8H7QKc9pPP83+Uc8d/OA3rafEwwZIe8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C52F2F8057C; Tue, 26 Mar 2024 18:26:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1D58F805A0;
	Tue, 26 Mar 2024 18:26:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA29F8025F; Tue, 26 Mar 2024 18:26:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=T_SPF_HELO_TEMPERROR
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19D85F80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 18:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19D85F80093
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rpAYb-000658-2p; Tue, 26 Mar 2024 18:25:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: (subset) [PATCH v4 0/7] Add support for the internal RK3308 audio
 codec
Date: Tue, 26 Mar 2024 18:25:50 +0100
Message-Id: <171147393346.1162935.3469121716836265382.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
References: <20240305-rk3308-audio-codec-v4-0-312acdbe628f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QOHDCFVF3ZNYICFUZAI4UU43UD4SO5UB
X-Message-ID-Hash: QOHDCFVF3ZNYICFUZAI4UU43UD4SO5UB
X-MailFrom: heiko@sntech.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOHDCFVF3ZNYICFUZAI4UU43UD4SO5UB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Mar 2024 15:36:27 +0100, Luca Ceresoli wrote:
> This series adds a driver for the internal audio codec of the Rockchip
> RK3308 SoC, along with some related patches. This codec is internally
> connected to the I2S peripherals on the same chip, and it has some
> peculiarities arising from that interconnection.
> 
> For proper bidirectional operation with the internal codec at any possible
> combination of sampling rates, the I2S peripheral needs two clock sources
> (tx and rx), while connection with an external codec commonly needs only
> one.
> 
> [...]

Applied, thanks!

[5/7] arm64: defconfig: enable Rockchip RK3308 internal audio codec driver
      commit: 9fdd7b45da18b84d5e7d5a6b8b4b0167910f2d13
[6/7] arm64: dts: rockchip: add i2s_8ch_2 and i2s_8ch_3
      commit: b5ffc424360eaced41f405f0e38bcabe61fecf39
[7/7] arm64: dts: rockchip: add the internal audio codec
      commit: 30d72458624bb1ba7bab1c7a1d5f4c42f512010c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
