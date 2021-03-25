Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11DD348F9C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 12:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687711685;
	Thu, 25 Mar 2021 12:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687711685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616671750;
	bh=CDd15vNGaWLUqR63Q6Okm9EKlIgZ1VWYnN7Vj1s12aI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ETPgw239CujVkk7VLYNf8wmbzidSU7dGNjX/w4mjfOXq3OmdBaOowERX3VDktLspb
	 82Z60t1W24MUC/uVo+U9oolxxtmQHbbsgPucxV2ta6UIc+i5cSdU+skmR/hDZxk8xf
	 TuySngaE5ZF/BeFCgmb81/+qXKIqfyVK1lPlMvkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9BAF804CF;
	Thu, 25 Mar 2021 12:25:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16B1AF804A9; Thu, 25 Mar 2021 12:25:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9331F80423
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 12:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9331F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G0qhYAEV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EBCD61A2E;
 Thu, 25 Mar 2021 11:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616671521;
 bh=CDd15vNGaWLUqR63Q6Okm9EKlIgZ1VWYnN7Vj1s12aI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G0qhYAEVtnsGXbLu1DbMRZ+z6Nd0bdHw1Wx1/UKyVYpbqfs8tGBjjMJH/ltFFqBJm
 xLDRLhdFGAmzTTzwmQ5dRjGYS9Awwn4uyv68k+N6bU3mP9zRvwky4FgfE1snFQcWAT
 vZKuecheGsWcahqcC4ZIWQUbt9EbR/Wm0BSF9aUSPtszo+kuZUqoIY6qfhaY4Kpana
 F+n3oIQNPmgtiRJBFscnDLhrmk3CK7dN19R78BUep8Ne232tuEibLSVCN6Hi9Drt69
 hnotZWqG0y8uLf1pEPEBV98bqblsyPOAPTJDqRyqCfHnCHvA4nrnhw4lB/mhpSVEVF
 do8CRSm3cdcsw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 17/44] ASoC: cs42l42: Fix mixer volume control
Date: Thu, 25 Mar 2021 07:24:32 -0400
Message-Id: <20210325112459.1926846-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112459.1926846-1-sashal@kernel.org>
References: <20210325112459.1926846-1-sashal@kernel.org>
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
index 4f9ad9547929..d5078ce79fad 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -401,7 +401,7 @@ static const struct regmap_config cs42l42_regmap = {
 };
 
 static DECLARE_TLV_DB_SCALE(adc_tlv, -9600, 100, false);
-static DECLARE_TLV_DB_SCALE(mixer_tlv, -6200, 100, false);
+static DECLARE_TLV_DB_SCALE(mixer_tlv, -6300, 100, true);
 
 static const char * const cs42l42_hpf_freq_text[] = {
 	"1.86Hz", "120Hz", "235Hz", "466Hz"
@@ -458,7 +458,7 @@ static const struct snd_kcontrol_new cs42l42_snd_controls[] = {
 				CS42L42_DAC_HPF_EN_SHIFT, true, false),
 	SOC_DOUBLE_R_TLV("Mixer Volume", CS42L42_MIXER_CHA_VOL,
 			 CS42L42_MIXER_CHB_VOL, CS42L42_MIXER_CH_VOL_SHIFT,
-				0x3e, 1, mixer_tlv)
+				0x3f, 1, mixer_tlv)
 };
 
 static int cs42l42_hpdrv_evt(struct snd_soc_dapm_widget *w,
-- 
2.30.1

