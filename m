Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26395716C08
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 20:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AFAF6C1;
	Tue, 30 May 2023 20:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AFAF6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685470393;
	bh=GQF9lUAe0Utvbi867xCuwYxDhrPJXP6m2MEpKIazxXo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X2BGSL1m/J9Av9ei3REZgpDV5lidJoPVplz/qIUF9GMEDegz+CfkUS2S239UIXXVm
	 3LoXQZkaWEAjY+qtpfwQa2Hw7Yb4jzHPxfVigBVl+WCiD2G459j6mSpV2I8FLtz/9q
	 egkiFoJ4BeFq+fwIOWnizquobemDiatypcZKnOFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54B6EF80528; Tue, 30 May 2023 20:11:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B06A2F804FC;
	Tue, 30 May 2023 20:11:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80DBAF8026A; Tue, 30 May 2023 20:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95D8BF80149
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 20:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95D8BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Gb34rY/H
Received: from localhost (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D11BA66003B0;
	Tue, 30 May 2023 19:11:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685470304;
	bh=GQF9lUAe0Utvbi867xCuwYxDhrPJXP6m2MEpKIazxXo=;
	h=From:To:Cc:Subject:Date:From;
	b=Gb34rY/H0aIJjjGOchyEPTHOzBtnXtSSUbQsHDxYhKy3LCWlhY1z4fewyDPhPSsfc
	 brl+qlCTDcplTnVbe5pdI48q03dxP/JpPd1iiEJiMld3/y2STdpl+kkXHE5gUJUmEH
	 kOyZ/P0lmd3mzC0+aiXvNGlEbXt4Q1ewQz5e7KTuz0+Z95Uts7A3Y2nKgSFcYnKUyR
	 MYYC4keeqB9I5CEfhzMpE/cCcUpCdIpyraA2KamNxlhfOoERTiL8MmoLspVjplJyLi
	 3RppIVXc8AC/rSRches7FtT+H5qT1pmZBsUWNB8mr4yliCZ9dp8loOsUc41lbOHnsZ
	 /qT/mR4f+TWYw==
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
Subject: [PATCH v2 0/3] ES8316 audio codec fixes on Rock5B
Date: Tue, 30 May 2023 21:11:37 +0300
Message-Id: <20230530181140.483936-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KGXRFDQFWN5XVUXEIZ4XAU3FC5OCEDNG
X-Message-ID-Hash: KGXRFDQFWN5XVUXEIZ4XAU3FC5OCEDNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGXRFDQFWN5XVUXEIZ4XAU3FC5OCEDNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series handles a few issues related to the ES8316 audio 
codec, discovered while doing some testing on the Rock 5B board.

Changes in v2:
 - Preserved original dB gain range in PATCH 1
 - Rewrote PATCH 2 conditional statement, per Mark's review
 - Rebased series onto next-20230530
 - v1: https://lore.kernel.org/all/20230524074156.147387-1-cristian.ciocaltea@collabora.com/

Cristian Ciocaltea (3):
  ASoC: es8316: Increment max value for ALC Capture Target Volume
    control
  ASoC: es8316: Do not set rate constraints for unsupported MCLKs
  arm64: dts: rockchip: Assign ES8316 MCLK rate on rk3588-rock-5b

 .../boot/dts/rockchip/rk3588-rock-5b.dts      |  2 ++
 sound/soc/codecs/es8316.c                     | 23 +++++++++++--------
 2 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.40.1

