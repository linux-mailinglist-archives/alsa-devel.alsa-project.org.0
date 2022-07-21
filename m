Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC3C57CA80
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 14:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0E2817E5;
	Thu, 21 Jul 2022 14:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0E2817E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658405773;
	bh=vBTCRcHWGtDqiA4fxJOYlqI6XHGxo1rup1RqlhRSdD8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m5Hxjg6wvPvg0UGgVPyyj8WFpKVURUJwaIjEMRzYtrALed8IwUn/rQhEDln7sS0GG
	 4ECaxycXte096hzkao6yZZeLOOzsj48+v8+/CE6kG3YsJSzrjfmQvvTC3AUbxEDB4P
	 GrPv9Kd/jYpxeZ34bTAxxAmNmGL8FShAC1D68qe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC402F80256;
	Thu, 21 Jul 2022 14:15:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CFA0F8016D; Thu, 21 Jul 2022 14:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C608F80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 14:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C608F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="IKFaPwbl"
Received: from localhost (unknown [188.24.146.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 861BA6601AA7;
 Thu, 21 Jul 2022 13:15:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658405701;
 bh=vBTCRcHWGtDqiA4fxJOYlqI6XHGxo1rup1RqlhRSdD8=;
 h=From:To:Cc:Subject:Date:From;
 b=IKFaPwbl52WVwlaSmN54Nuw+s49PB1Zgk9vh8UoWwdTUNhU4w74QiBNIAS1n1DLIf
 KvV+fpoezwrTOfu07V3P9nIAd6Kx6yr/GxdMvARzLtEhw68kshrH4St6X3Ub45rdtz
 mOUsh0RtHzp52H7FyCr50FrYVVUrTXGxI8bp3piexc4JnLVPl282qP1xQlxWAOdgUK
 Y86bS6C63NAz/w+nV0z2HO8ukiueNjzCjziO+nDjl6CfOIsRA21F5r8m4EBJPE0ibr
 XHF0P6e8eOfrGK6rFqSd/cZVqI3kmesKAWp4aO5pzfsDWPAl7b6uS77Ae9fLaSTl00
 2W3G6PZO/wJYQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l41: Set the new legacy DAI naming flag
Date: Thu, 21 Jul 2022 15:14:54 +0300
Message-Id: <20220721121454.1378945-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
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

Unlike most CODEC drivers, the CS35L41 driver did not have the
non_legacy_dai_naming set, meaning it uses the legacy naming.

The recent migration to the new legacy DAI naming style has broken
driver functionality because it is now expected to set the new legacy
DAI naming flag in order to instruct the core subsystem to use the
legacy name format on DAI registration.

Let's fix this by setting the legacy_dai_naming flag accordingly.

Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/cs35l41.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index c223d83e02cf..b49f9a32abf2 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1028,6 +1028,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l41 = {
 	.set_sysclk = cs35l41_component_set_sysclk,

 	.endianness = 1,
+	.legacy_dai_naming = 1,
 };

 static int cs35l41_handle_pdata(struct device *dev, struct cs35l41_hw_cfg *hw_cfg)
--
2.37.1
