Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434E61E401
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:06:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D211FA;
	Sun,  6 Nov 2022 18:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D211FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754404;
	bh=spFnfVlKiS7/MeFJFoXk3DlejXOfIoIgoxHhLFjuejU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXjX5UnAYw4NmYjIZ2nTcRKk3mTda5JawWo7Nfk7YhCY3dyNIM+yTnEQM3EqelQDN
	 1a3yN8jIawQpBh+IG5sXiHiscNogWaeQY4HQwELUxkGwaNDmSi1qk7fQuc2SK7+ua+
	 YTjU7IBqfOxbYbKuDsvATHsRBkpBbLROeaDvL57k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F6A8F80588;
	Sun,  6 Nov 2022 18:04:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA27F8056F; Sun,  6 Nov 2022 18:04:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_16,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45008F8056F
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45008F8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xjwao+G4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E73F560CEC;
 Sun,  6 Nov 2022 17:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A96CC433B5;
 Sun,  6 Nov 2022 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754252;
 bh=spFnfVlKiS7/MeFJFoXk3DlejXOfIoIgoxHhLFjuejU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xjwao+G4p7m2jaPnbZLXeUJ4ImDCeoqjGgGrgBsfIVVWWktMkexEEtCRHiAu15fFE
 8OfaiOn/jDOUamtvjNIMzXpHAIsJrlozTk+WMKlZ0NDFIu6K3rbu0ELkjzn4iGYK0M
 hg6JuOA9lRbOpXnOklCK1+DS8/KVMoz0ZOled4GANg8W2r4T3ifZQUuX7JzJrb5vqi
 yYZ5ZMBEcjPb3uGk1G1SdwF19Zs0A43+oM1GRB7/naYNkHFb6W93ec1OmyMRFNNGjm
 3uItGrmcciaQ79WhezLfWIG5uBmlaV6VGlCMr2o6ib2y3cp+4hbBgJVoqaV+f+3wEc
 8wqgbHMN8LOog==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 12/30] ASoC: codecs: jz4725b: fix reported volume
 for Master ctl
Date: Sun,  6 Nov 2022 12:03:24 -0500
Message-Id: <20221106170345.1579893-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, paul@crapouillou.net,
 Siarhei Volkau <lis8215@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mips@vger.kernel.org
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

From: Siarhei Volkau <lis8215@gmail.com>

[ Upstream commit 088777bf65b98cfa4b5378119d0a7d49a58ece44 ]

DAC volume control is the Master Playback Volume at the moment
and it reports wrong levels in alsamixer and other alsa apps.

The patch fixes that, as stated in manual on the jz4725b SoC
(16.6.3.4 Programmable attenuation: GOD) the ctl range varies
from -22.5dB to 0dB with 1.5dB step.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
Link: https://lore.kernel.org/r/20221016132648.3011729-3-lis8215@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/jz4725b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index cc7a48c96aa4..72549ee2e789 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -142,8 +142,8 @@ struct jz_icdc {
 	struct clk *clk;
 };
 
-static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(jz4725b_dac_tlv, -2250, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(jz4725b_line_tlv, -1500, 600);
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_dac_tlv, -2250, 150, 0);
 
 static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 	SOC_DOUBLE_TLV("Master Playback Volume",
-- 
2.35.1

