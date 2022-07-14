Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B8F57434C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1113B189F;
	Thu, 14 Jul 2022 06:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1113B189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773164;
	bh=rqhL8OrV8SABgN6JQ5PPJnWbgDNaiCIY0WyzNHOKqC8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sB55dbHi9ZLIuXQUcvWbvxpyQX8B52RDM60C13OPrHhKdYLC24NguQNr0Gl1OBVIn
	 JCT+ksgRvOKcowLflZgn89l188VAYAiAWg/7nwebh+uc4jMXGrQ0d2c80ATxOkRcE6
	 0nblmvFfayvfRwiOLk6tisSY97J8o7sRsiYCV+mE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBDA7F80568;
	Thu, 14 Jul 2022 06:25:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75A99F80613; Thu, 14 Jul 2022 06:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D697F8055B
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D697F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m26BjIAn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED3D8B82372;
 Thu, 14 Jul 2022 04:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579A0C385A2;
 Thu, 14 Jul 2022 04:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772686;
 bh=rqhL8OrV8SABgN6JQ5PPJnWbgDNaiCIY0WyzNHOKqC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m26BjIAn2B7i/nRgtuJ2YfEDt4HLkvvK4IMdFIPP/+UA+kKZ1zbRMIxlvU1RfyZxL
 8bIG87FGxAaVjvfEunEY5c7rIPpA0iZArfxF4cPiEPdTbNtbESzijQDH0P29gDUJzn
 U6iEROj0kOQ3RsJRGhdbju84/9QPrN6O19Y5JXe6XNnEOjVMnTPJvz88x2z9saMxnG
 7VSACq6se8b5yF3n9Vdqojk/+7byIemVZ4JV68+2Neqa6LUXjMJVASInU7nTaZBkOZ
 ewAWsDANrIt3JA94U9KBmnO1+BP8A0X9QYjY9BR9sDO6296LdZFaeeDHV7aJR7BP/v
 8FH63FRGbjYFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 07/28] ASoC: rt7*-sdw: harden jack_detect_handler
Date: Thu, 14 Jul 2022 00:24:08 -0400
Message-Id: <20220714042429.281816-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 0484271ab0ce50649329fa9dc23c50853c5b26a4 ]

Realtek headset codec drivers typically check if the card is
instantiated before proceeding with the jack detection.

The rt700, rt711 and rt711-sdca are however missing a check on the
card pointer, which can lead to NULL dereferences encountered in
driver bind/unbind tests.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220606203752.144159-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt700.c      | 2 +-
 sound/soc/codecs/rt711-sdca.c | 2 +-
 sound/soc/codecs/rt711.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 921382724f9c..0c7416a5eb50 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -162,7 +162,7 @@ static void rt700_jack_detect_handler(struct work_struct *work)
 	if (!rt700->hs_jack)
 		return;
 
-	if (!rt700->component->card->instantiated)
+	if (!rt700->component->card || !rt700->component->card->instantiated)
 		return;
 
 	reg = RT700_VERB_GET_PIN_SENSE | RT700_HP_OUT;
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index f041e036b05f..e77a3b5ad63b 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -294,7 +294,7 @@ static void rt711_sdca_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card->instantiated)
+	if (!rt711->component->card || !rt711->component->card->instantiated)
 		return;
 
 	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 6f3a26bf53d0..eadcfb31b5e8 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -242,7 +242,7 @@ static void rt711_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card->instantiated)
+	if (!rt711->component->card || !rt711->component->card->instantiated)
 		return;
 
 	reg = RT711_VERB_GET_PIN_SENSE | RT711_HP_OUT;
-- 
2.35.1

