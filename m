Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83935CB9C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 18:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED1C166B;
	Mon, 12 Apr 2021 18:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED1C166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618244714;
	bh=9HYb50dPi1Ae7Y1/yULlTErcIe6566C6lYN22Ozqe0A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZisO9S1wNaFug1DiRuhp8HXUctl0EBQVIchP4YQxFSGhlGBhT8xtVDIYyj7Jak887
	 j0nbGNUCNfbhgAFeNcxUXmyjGvpvVGNz6gxi4roUA6cgEvH5GDFB96INAh8CM1CS4S
	 /YXGnNgOWTdEDO8d45kzZEN/DkuyrL5HknYRjKuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D55F802D2;
	Mon, 12 Apr 2021 18:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95B16F80269; Mon, 12 Apr 2021 18:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71916F8025B
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 18:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71916F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EyPosOyL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5A7160200;
 Mon, 12 Apr 2021 16:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618244593;
 bh=9HYb50dPi1Ae7Y1/yULlTErcIe6566C6lYN22Ozqe0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EyPosOyLWYzM5QH/0RID1FW0FkjPOPCftDQsgpoaXR3/91AX31Vkk6Sr/oBaK1WLH
 PKXpKA1SfP2avStQlqnV6fKFq5rXm0mC5Sqc3BnBQxzU6h0bpmXwJAxoX0N02je9BG
 J8iC9ZpXNvjpR6brhPVpkLgD+pzs1+wZU5BK/hZF7I+PXSiH8QD6sTvXcJ0FZht2a7
 EQEPQfCW9IvNIHd3MMgnZHFQVrjjEngokB6rsJfSWStG4W/FpD/66OnfMuc9j7y73F
 t0L86Ll+GUlrHIEr7KC98VM4sICy9clxuWl5LEtf0ZBl5bySTw0mStiQvyRb/w2Anw
 9jdpzHC8n+nPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 13/51] ASoC: max98373: Changed amp shutdown
 register as volatile
Date: Mon, 12 Apr 2021 12:22:18 -0400
Message-Id: <20210412162256.313524-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210412162256.313524-1-sashal@kernel.org>
References: <20210412162256.313524-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Ryan Lee <ryans.lee@maximintegrated.com>
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

From: Ryan Lee <ryans.lee@maximintegrated.com>

[ Upstream commit a23f9099ff1541f15704e96b784d3846d2a4483d ]

0x20FF(amp global enable) register was defined as non-volatile,
but it is not. Overheating, overcurrent can cause amp shutdown
in hardware.
'regmap_write' compare register readback value before writing
to avoid same value writing. 'regmap_read' just read cache
not actual hardware value for the non-volatile register.
When amp is internally shutdown by some reason, next 'AMP ON'
command can be ignored because regmap think amp is already ON.

Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
Link: https://lore.kernel.org/r/20210325033555.29377-1-ryans.lee@maximintegrated.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/max98373-i2c.c | 1 +
 sound/soc/codecs/max98373-sdw.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 85f6865019d4..ddb6436835d7 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -446,6 +446,7 @@ static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
 	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
 	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
 	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
+	case MAX98373_R20FF_GLOBAL_SHDN:
 	case MAX98373_R21FF_REV_ID:
 		return true;
 	default:
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index b8d471d79e93..1a1f97f24601 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -220,6 +220,7 @@ static bool max98373_volatile_reg(struct device *dev, unsigned int reg)
 	case MAX98373_R2054_MEAS_ADC_PVDD_CH_READBACK:
 	case MAX98373_R2055_MEAS_ADC_THERM_CH_READBACK:
 	case MAX98373_R20B6_BDE_CUR_STATE_READBACK:
+	case MAX98373_R20FF_GLOBAL_SHDN:
 	case MAX98373_R21FF_REV_ID:
 	/* SoundWire Control Port Registers */
 	case MAX98373_R0040_SCP_INIT_STAT_1 ... MAX98373_R0070_SCP_FRAME_CTLR:
-- 
2.30.2

