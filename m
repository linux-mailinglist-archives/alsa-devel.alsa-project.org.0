Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F03AC70EFB2
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 09:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 682231F9;
	Wed, 24 May 2023 09:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 682231F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684914179;
	bh=rIv0A5Qf9tPl9upoHpRp3OawplgowbPYSCpfX7sHQQs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DPkfC/0+l2ML1x+QnOGUrjZSDZQ76YTZDavj1r5wRAOzNXEmYWXPZD0pbD4DHo8Ks
	 olQNLsi4dZ4mYwiYXo86bB9G9x50LMnJG2MikrvhgSUKIVpgCGoZW02a3WdOpw/4FF
	 OUXc01SpyvjEJP6l6fcFlJyVR3PxjTyjBXuVvlyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD4E6F80249; Wed, 24 May 2023 09:42:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76AB3F80086;
	Wed, 24 May 2023 09:42:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61798F8026A; Wed, 24 May 2023 09:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5625F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 09:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5625F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=mkVmnzX7
Received: from localhost (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BF15D6605992;
	Wed, 24 May 2023 08:41:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684914119;
	bh=rIv0A5Qf9tPl9upoHpRp3OawplgowbPYSCpfX7sHQQs=;
	h=From:To:Cc:Subject:Date:From;
	b=mkVmnzX7hyiNjGwuOi5uJH4qVAYOE2KMAxnr1E4ywOBmJfn+sUDyoZNPzuPGiglxb
	 gjMITxPbcKo/PXM0riNWt26Q9cCbbCMLf1xg+14Awi5pPoebFb0+XrZJRAoJFGb18p
	 bZG+D/xkXEBXtPCrTO9Snx0tTpU5IhcQr5BTYB1femUNNNk+9Mom7bW1avP+DKhS97
	 vo1b9t3qacx9zR97zxM4gap6+CCkprrqy8u8Z4j+aGukg/QSqGwiVoawOJVNslroXW
	 gnSOeGiDQN0MWMr70bjVjF7YIR/R5p0mTqF/lDRQmDFSS4GOtYAfZWsfOPPYVZYmwA
	 cmuZIImgz60TQ==
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
Subject: [PATCH 0/3] ES8316 audio codec fixes on Rock5B
Date: Wed, 24 May 2023 10:41:53 +0300
Message-Id: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LJ3NUGWKM5RONUV2IB5UZKJCAR77QIOK
X-Message-ID-Hash: LJ3NUGWKM5RONUV2IB5UZKJCAR77QIOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJ3NUGWKM5RONUV2IB5UZKJCAR77QIOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series handles a few issues related to the ES8316 audio 
codec, discovered while doing some testing on the Rock 5B board.

Cristian Ciocaltea (3):
  ASoC: es8316: Increment max value for ALC Capture Target Volume
    control
  ASoC: es8316: Do not set rate constraints for unsupported MCLKs
  arm64: dts: rockchip: Assign ES8316 MCLK rate on rk3588-rock-5b

 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 2 ++
 sound/soc/codecs/es8316.c                       | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.40.1

