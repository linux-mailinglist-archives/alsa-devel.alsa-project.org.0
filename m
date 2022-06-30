Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1A5613B8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 09:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF65816E3;
	Thu, 30 Jun 2022 09:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF65816E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656575619;
	bh=Acf3pP6gW10YlggtvMFBRzYNaBaupVS6FCVuuj85+94=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEc0hhMKsHNmNXa60OEnQaf+JRRz0xB3QT7Qca5yuCb3t+SM9fJNtxm56h38PESce
	 tVFXREWehYtYgpfEMHAvGuQx9O4SaJYlZPdyo6qb+YAHOulPYuE1mXDPvr0dUVFxQN
	 My6LK3rJRi8XIxW5lfNW36yNqG5afzgAAWV8XEoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04484F8053E;
	Thu, 30 Jun 2022 09:52:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B08F8053D; Thu, 30 Jun 2022 09:52:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71F0DF80107
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 09:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71F0DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="ql8u+nWq"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1656575508; bh=rRoN50bSZ9LjLmVhKTMCvwft+rCdKdFeTqH/6EpOtBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ql8u+nWqq5kjW7gVW/uuylUM6MGYX2NxpAB79e3Pb4yzVmiYelMJ7A0plzO6q7foR
 aa3ifLUMDXLgE5uDzPZkehT/48vQigGGHZ0gc9ZA3zmtBv/HtwrNgFRPt1gMr/CNqH
 yhlxUCT2WK8v0vLL/r/zSTmCQyHXn9xXINECwJp0=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: tas2764: Fix amp gain register offset & default
Date: Thu, 30 Jun 2022 09:51:35 +0200
Message-Id: <20220630075135.2221-4-povik+lin@cutebit.org>
In-Reply-To: <20220630075135.2221-1-povik+lin@cutebit.org>
References: <20220630075135.2221-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Stephen Kitt <steve@sk2.org>, asahi@lists.linux.dev
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

From: Hector Martin <marcan@marcan.st>

The register default is 0x28 per the datasheet, and the amp gain field
is supposed to be shifted left by one. With the wrong default, the ALSA
controls lie about the power-up state. With the wrong shift, we get only
half the gain we expect.

Signed-off-by: Hector Martin <marcan@marcan.st>
Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 55da1b3440e1..846d9d3ecc9d 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -541,7 +541,7 @@ static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10050, 50, 1);
 static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Volume", TAS2764_DVC, 0,
 		       TAS2764_DVC_MAX, 1, tas2764_playback_volume),
-	SOC_SINGLE_TLV("Amp Gain Volume", TAS2764_CHNL_0, 0, 0x14, 0,
+	SOC_SINGLE_TLV("Amp Gain Volume", TAS2764_CHNL_0, 1, 0x14, 0,
 		       tas2764_digital_tlv),
 };
 
@@ -565,7 +565,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 	{ TAS2764_SW_RST, 0x00 },
 	{ TAS2764_PWR_CTRL, 0x1a },
 	{ TAS2764_DVC, 0x00 },
-	{ TAS2764_CHNL_0, 0x00 },
+	{ TAS2764_CHNL_0, 0x28 },
 	{ TAS2764_TDM_CFG0, 0x09 },
 	{ TAS2764_TDM_CFG1, 0x02 },
 	{ TAS2764_TDM_CFG2, 0x0a },
-- 
2.33.0

