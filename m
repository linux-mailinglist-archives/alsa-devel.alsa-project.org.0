Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB9954A534
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:19:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63CB21902;
	Tue, 14 Jun 2022 04:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63CB21902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655173140;
	bh=L4eD9J0MTtWeGzYMeXFppIGyk1FWZFElAdCvuNUix20=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=de6Tiavzuq4x5hpupWnY0bVlIvMYY/Xi6vJr8xsqEvyfTseZa47We7ch2ae0ylnQa
	 QhvKPjsps+dTjVqpKmVcoJ7sQMvRWXC5+9IaXgywu95VtBWLSDMB9yuMEyzmdbmmwb
	 EafNF4fnYkel69AVSPpuu47SJSynLEfrdNgkeveM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D36FF8057B;
	Tue, 14 Jun 2022 04:09:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2EBCF8057B; Tue, 14 Jun 2022 04:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4143AF8057A
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4143AF8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q4c/KqM7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9854B80D19;
 Tue, 14 Jun 2022 02:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477C8C385A2;
 Tue, 14 Jun 2022 02:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172548;
 bh=L4eD9J0MTtWeGzYMeXFppIGyk1FWZFElAdCvuNUix20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q4c/KqM7fW+4W2Kd24MPGnaxzFBRvwevHq0fGAGvbx73zi00jH6jYwiBq0V2EnMHN
 U6hs6vd2eMd8G/w9ez16rIWU9gjPWkPUGSJgo7295S0w8WsWhNHXYEJNFYKVfO6yKu
 GV0yzfC9ihfGFeiS8EZ8gxzsPE0W5zzupQfXTXe94ZuXbpQ5y4xgBWEbNPgQqUwmaR
 tKkWUIoJhznnsQhphxwSxZ3MLbJkcaeR3ghFEQ0QRvlp3f3dcL3ADUhq9XK5C8OmnB
 iM6DoFph2+DUar2Vhqfc2Fersj2l2XbqsRPFLA1+W9XCwl83VcyPRwikx0H0p7Of7Z
 7iq4asjbzwS5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/23] ASoC: cs42l52: Fix TLV scales for mixer
 controls
Date: Mon, 13 Jun 2022 22:08:40 -0400
Message-Id: <20220614020900.1100401-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020900.1100401-1-sashal@kernel.org>
References: <20220614020900.1100401-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, brian.austin@cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, Paul.Handrigan@cirrus.com,
 Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 8bf5aabf524eec61013e506f764a0b2652dc5665 ]

The datasheet specifies the range of the mixer volumes as between
-51.5dB and 12dB with a 0.5dB step. Update the TLVs for this.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220602162119.3393857-2-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/cs42l52.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 2ea4cba3be2a..0daa3b4c68ca 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -137,7 +137,7 @@ static DECLARE_TLV_DB_SCALE(mic_tlv, 1600, 100, 0);
 
 static DECLARE_TLV_DB_SCALE(pga_tlv, -600, 50, 0);
 
-static DECLARE_TLV_DB_SCALE(mix_tlv, -50, 50, 0);
+static DECLARE_TLV_DB_SCALE(mix_tlv, -5150, 50, 0);
 
 static DECLARE_TLV_DB_SCALE(beep_tlv, -56, 200, 0);
 
@@ -364,7 +364,7 @@ static const struct snd_kcontrol_new cs42l52_snd_controls[] = {
 			      CS42L52_ADCB_VOL, 0, 0xA0, 0x78, ipd_tlv),
 	SOC_DOUBLE_R_SX_TLV("ADC Mixer Volume",
 			     CS42L52_ADCA_MIXER_VOL, CS42L52_ADCB_MIXER_VOL,
-				0, 0x19, 0x7F, ipd_tlv),
+				0, 0x19, 0x7F, mix_tlv),
 
 	SOC_DOUBLE("ADC Switch", CS42L52_ADC_MISC_CTL, 0, 1, 1, 0),
 
-- 
2.35.1

