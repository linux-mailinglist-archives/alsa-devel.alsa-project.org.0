Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5855F70EFB8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 09:43:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A2C3E7;
	Wed, 24 May 2023 09:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A2C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684914228;
	bh=faNfSMxsboihf/E9pG9NmNCYt8187yJ11iV3M4yxj3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S3KKNis8Id8ff+Ro0Bp16g6b0j+hRMWEVSBBBx4/IwvFMQ8Yw6z7yW1IxeVRU+GhR
	 BtorEFasmwmXoIetjSjg1sQINx5gZg0cFhTZxpJh0Eta8PgyB4q3XuTUCPRWtO25rH
	 6l2Fwu1V90rp51TdrGjFOR+XjCYe2/4kNg9dLG7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BE73F80563; Wed, 24 May 2023 09:42:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F5E2F80553;
	Wed, 24 May 2023 09:42:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16643F8026A; Wed, 24 May 2023 09:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AE9EF80249
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 09:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AE9EF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=fQkj2bN3
Received: from localhost (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CE0296606E73;
	Wed, 24 May 2023 08:42:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684914123;
	bh=faNfSMxsboihf/E9pG9NmNCYt8187yJ11iV3M4yxj3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQkj2bN38h3Di9mMwX+6e0iyLG8XxNYkrqv0WHX9HQak78Jbs46ss/kXVOF+9PmPe
	 wbZk4DhZLsc4N1KDwZ06dsBy9g8j9KOt30+0na6+YYpBT+IIlRvyw8qnM+8SA75bhm
	 OCMw1nDs4pC6kblznJuR8I9UKR5pw0uP4HTIOrT57Ji/+U3wAKaR4LPj/BPAANgOKS
	 liUyIiql8a0BddF0uis/FYqY+BskTnpfuP+MOU2cuILvFRwz7iag3XqEpvUIWlLJtW
	 E7h+9yO0DphnPj+YrvWWTnV8lpK5B7WF10o1GPadhsn2CvWZhX8L39Xzk6DVTXU1DP
	 b3CcBpr8VaWfg==
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
Subject: [PATCH 1/3] ASoC: es8316: Increment max value for ALC Capture Target
 Volume control
Date: Wed, 24 May 2023 10:41:54 +0300
Message-Id: <20230524074156.147387-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2WRHJYVXHFDFBZDIXM6BYTBLDF5V5Q4W
X-Message-ID-Hash: 2WRHJYVXHFDFBZDIXM6BYTBLDF5V5Q4W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WRHJYVXHFDFBZDIXM6BYTBLDF5V5Q4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following error occurs when trying to restore a previously saved
ALSA mixer state (tested on a Rock 5B board):

  $ alsactl --no-ucm -f /tmp/asound.state store hw:Analog
  $ alsactl --no-ucm -I -f /tmp/asound.state restore hw:Analog
  alsactl: set_control:1475: Cannot write control '2:0:0:ALC Capture Target Volume:0' : Invalid argument

According to ES8316 datasheet, the register at address 0x2B, which is
related to the above mixer control, contains by default the value 0xB0.
Considering the corresponding ALC target bits are 7:4, the control is
initialized with 0xB, which is one step above the maximum value 0xA
allowed by the driver.

This means that either the hardware default is wrongly set to 0xB
instead of 0xA, or the specs are incorrect and instead of having the
range 0xA-0xF mapped to -1.5 dB, the single value 0xA should have been
mapped to -1.5 dB and the remaining range 0xB-0xF to 0 dB.

Increment the max value allowed for ALC Capture Target Volume control,
so that it matches the hardware default.

Fixes: b8b88b70875a ("ASoC: add es8316 codec driver")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 9e033fb320a0..773c94fd3547 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -115,7 +115,7 @@ static const struct snd_kcontrol_new es8316_snd_controls[] = {
 		       alc_max_gain_tlv),
 	SOC_SINGLE_TLV("ALC Capture Min Volume", ES8316_ADC_ALC2, 0, 28, 0,
 		       alc_min_gain_tlv),
-	SOC_SINGLE_TLV("ALC Capture Target Volume", ES8316_ADC_ALC3, 4, 10, 0,
+	SOC_SINGLE_TLV("ALC Capture Target Volume", ES8316_ADC_ALC3, 4, 11, 0,
 		       alc_target_tlv),
 	SOC_SINGLE("ALC Capture Hold Time", ES8316_ADC_ALC3, 0, 10, 0),
 	SOC_SINGLE("ALC Capture Decay Time", ES8316_ADC_ALC4, 4, 10, 0),
-- 
2.40.1

