Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 335614803E9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 20:06:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7A41738;
	Mon, 27 Dec 2021 20:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7A41738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640631982;
	bh=/nQrN0FXgdsX6Q6P3JVEqCU9UTngUmRgVqifX+Y7/SU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mnq9wjyeFfTuiS7dwIqoZ7FAWM53vT+nyalfdbIp+BKWdEcQxfdnysupPt4ccrboU
	 4KM/BnFxKix67oNvHm4+h+sbeeWPJJoeVOMqjiunS5XgJAllQCMsWPPQEb8xb/YIUx
	 ZQzRypU4ZcJaugwp4whw/BvM//amO9aTLow2ToAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA264F800D3;
	Mon, 27 Dec 2021 20:04:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C968F80515; Mon, 27 Dec 2021 20:04:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3963EF800D3
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 20:04:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3963EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HOuigBzP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9F9FEB8113E;
 Mon, 27 Dec 2021 19:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF57C36AEB;
 Mon, 27 Dec 2021 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640631849;
 bh=/nQrN0FXgdsX6Q6P3JVEqCU9UTngUmRgVqifX+Y7/SU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HOuigBzPYhBA/FDEL9YFssd/zSQe0wHzOdg9JMpGU6HANCCoVeIWoiipbPYUPEaIU
 auWSZVlTDs/X1Fqs/I9MhkWgQZzQJDeSNAsKQCw26olaPyPBfivvl09cKfAYqQkR7n
 hwSjBmZwNrD62V1CKR2P8muhPxHjdCIGcL5f15k0OO7LhGCT3aEMukN8+IkTWAKhjZ
 rD3ocYFAztAR+y8hCstsavSaBvhbGzuN64ACzGbx5bNGiyGZIc596lpjiEaNCUCzk4
 lplTeC5bV3tbqxEqQrqVzpFnSJGdqefeNfTv3E3olPFbMHcYkd5lgcTBmkRFWhxtAd
 yQbza4OXUfBBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/26] ASoC: tas2770: Fix setting of high sample
 rates
Date: Mon, 27 Dec 2021 14:03:11 -0500
Message-Id: <20211227190327.1042326-10-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227190327.1042326-1-sashal@kernel.org>
References: <20211227190327.1042326-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik@protonmail.com>,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 pierre-louis.bossart@linux.intel.com, yebin10@huawei.com
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

From: Martin Povišer <povik@protonmail.com>

[ Upstream commit 80d5be1a057e05f01d66e986cfd34d71845e5190 ]

Although the codec advertises support for 176.4 and 192 ksps, without
this fix setting those sample rates fails with EINVAL at hw_params time.

Signed-off-by: Martin Povišer <povik@protonmail.com>
Link: https://lore.kernel.org/r/20211206224529.74656-1-povik@protonmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tas2770.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 172e79cbe0daf..6549e7fef3e32 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -291,11 +291,11 @@ static int tas2770_set_samplerate(struct tas2770_priv *tas2770, int samplerate)
 		ramp_rate_val = TAS2770_TDM_CFG_REG0_SMP_44_1KHZ |
 				TAS2770_TDM_CFG_REG0_31_88_2_96KHZ;
 		break;
-	case 19200:
+	case 192000:
 		ramp_rate_val = TAS2770_TDM_CFG_REG0_SMP_48KHZ |
 				TAS2770_TDM_CFG_REG0_31_176_4_192KHZ;
 		break;
-	case 17640:
+	case 176400:
 		ramp_rate_val = TAS2770_TDM_CFG_REG0_SMP_44_1KHZ |
 				TAS2770_TDM_CFG_REG0_31_176_4_192KHZ;
 		break;
-- 
2.34.1

