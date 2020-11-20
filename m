Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE8D2BB094
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D814950;
	Fri, 20 Nov 2020 17:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D814950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889880;
	bh=DS1nymrUd49e3536q4ErunpnmZeajDywtvhVRNThnTM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYcVhiactr8YGUniUIGuUeYha3nDf+RDlbtnrH/VPKcr9q3ZEK2pWFoR22ccLgOyJ
	 PfL8ByEm6Y5zZteE6Wfp7R5ldVjOuUZSMMTqfU8Fg540S0pmtINAjLM138Jzlp5gFh
	 K0Y5TXbvHnI6vRKAXkj7/sOwgYC3xRxehCo0A12w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61192F804C3;
	Fri, 20 Nov 2020 17:19:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03D1BF805CB; Fri, 20 Nov 2020 17:19:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B567AF804C3
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B567AF804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FWt/auyC"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A374E223BE;
 Fri, 20 Nov 2020 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889186;
 bh=DS1nymrUd49e3536q4ErunpnmZeajDywtvhVRNThnTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FWt/auyCYm37V+iCdWDzUDspvxKLit5Fv1AI3iRwpPU+Ix91ErfGOR3agGY4QvOG3
 TdwDRqFzDOYHzM2+SMMZbFGcV1rGkZfWrF9P8gGhsp4KBjTAQIPxRjtBKuC790i2+l
 V6b1QiDDOpSnnf2Agtguy7qB3ha65+iTFN3P9vbo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 32/38] ASoC: es7134: mark OF related data as maybe unused
Date: Fri, 20 Nov 2020 17:16:46 +0100
Message-Id: <20201120161653.445521-32-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/es7134.c:264:33: warning: ‘es7154_chip’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/es7134.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index 00518406eb2b..e2b79879354b 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -183,7 +183,7 @@ static const struct snd_soc_dapm_route es7134_extra_routes[] = {
 	{ "Playback", NULL, "VDD", }
 };
 
-static const struct es7134_chip es7134_chip = {
+static const struct es7134_chip es7134_chip __maybe_unused = {
 	.dai_drv = &es7134_dai,
 	.modes = es7134_modes,
 	.mode_num = ARRAY_SIZE(es7134_modes),
@@ -261,7 +261,7 @@ static const struct snd_soc_dapm_route es7154_extra_routes[] = {
 	{ "Playback", NULL, "PVDD", }
 };
 
-static const struct es7134_chip es7154_chip = {
+static const struct es7134_chip es7154_chip __maybe_unused = {
 	.dai_drv = &es7154_dai,
 	.modes = es7154_modes,
 	.mode_num = ARRAY_SIZE(es7154_modes),
-- 
2.25.1

