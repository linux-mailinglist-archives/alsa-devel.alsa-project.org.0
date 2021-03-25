Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CA83490EC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468671708;
	Thu, 25 Mar 2021 12:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468671708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616672530;
	bh=yMuhbu+PuTYWLaBM0axWm3jnFKTc2UTzNEaA9HXQU5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3/XGmD7fSKzbaSlT+6wMVCdmoivgMWlEnuXaTz+5zyFAoqNzM2USkEMLNAHZoIqn
	 llAu+gJ3wI5j1YCkBpdrFqGzhPwU7YDsR7MsQp4EYiQo5y/fbs5CDq+QNVnOfwZdSG
	 QzuC1T+w5vPc4RZWvSb0J6rpHHVnbCAqQlTqK1GA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC8CF805F2;
	Thu, 25 Mar 2021 12:28:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F13F805E7; Thu, 25 Mar 2021 12:27:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DC8BF805C2
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DC8BF805C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LbN22X+A"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA31061A47;
 Thu, 25 Mar 2021 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671656;
 bh=yMuhbu+PuTYWLaBM0axWm3jnFKTc2UTzNEaA9HXQU5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LbN22X+A7jgxFJ8sxEbkrZk3N8UOJDo7kdtbzlE/6zVlvRsWmTG9IfBlxmVQUkj1q
 1TTqiFaJTSB/J20d4YpyNAuXLnBDJCS7QzIxF7ssAsAyqpOaE9uhbviya0b7JauyLo
 STDUr9x9g9JdUdfPGE3iSmpXEYXzVpP3sxR/OvSUs45n5mNbV+AvWA3ETJvOZlAe9e
 tF/O9qP0s4lcYt7BOwfXs5rHjiCbLyqQqsdwVuZQocs7FCXTxiovl91U0m/wb03eoT
 PlfI7MDn+gTsvgD7k/QwQu3eLRTsf7or/L61YopUnK0Bvc/YDpA4Ir6alu1roW7BFY
 oBT6yoqcaRL4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/20] ASoC: cs42l42: Fix mixer volume control
Date: Thu, 25 Mar 2021 07:27:13 -0400
Message-Id: <20210325112724.1928174-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112724.1928174-1-sashal@kernel.org>
References: <20210325112724.1928174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Lucas Tanure <tanureal@opensource.cirrus.com>

[ Upstream commit 72d904763ae6a8576e7ad034f9da4f0e3c44bf24 ]

The minimum value is 0x3f (-63dB), which also is mute

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20210305173442.195740-4-tanureal@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l42.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a5bd9cff7085..a8ba518ba043 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -405,7 +405,7 @@ static const struct regmap_config cs42l42_regmap = {
 };
 
 static DECLARE_TLV_DB_SCALE(adc_tlv, -9600, 100, false);
-static DECLARE_TLV_DB_SCALE(mixer_tlv, -6200, 100, false);
+static DECLARE_TLV_DB_SCALE(mixer_tlv, -6300, 100, true);
 
 static const char * const cs42l42_hpf_freq_text[] = {
 	"1.86Hz", "120Hz", "235Hz", "466Hz"
@@ -462,7 +462,7 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				CS42L42_DAC_HPF_EN_SHIFT, true, false),
 	SOC_DOUBLE_R_TLV("Mixer Volume", CS42L42_MIXER_CHA_VOL,
 			 CS42L42_MIXER_CHB_VOL, CS42L42_MIXER_CH_VOL_SHIFT,
-				0x3e, 1, mixer_tlv)
+				0x3f, 1, mixer_tlv)
 };
 
 static int cs42l42_hpdrv_evt(struct snd_soc_dapm_widget *w,
-- 
2.30.1

