Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA124C0624
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:29:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665FA18F4;
	Wed, 23 Feb 2022 01:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665FA18F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645576173;
	bh=Fbgp1k4bhWlHzqWebihdD3XUYm1kKSLZ4d7xN+yVOTA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ADIpF5cxVVBxTR4IAlLq8gNuhEfrgMixE+CUhFr/wh+Ug9vRVQlukXiMmdkAtXrv1
	 44tkoHlPlGvw5nmfYESRmBlwnLWWtYAdmhUf8R4nfnndJBRbomA+DymPcV0RO3qSyx
	 lGgQEJHRTMfzzyq5Lf70ZhfQ2nRRga4ifRsDs1Lo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A7BF801F5;
	Wed, 23 Feb 2022 01:28:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF48EF800D1; Wed, 23 Feb 2022 01:28:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AC20F800D1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AC20F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fssMD4/k"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F29ABB81C44;
 Wed, 23 Feb 2022 00:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85038C340EB;
 Wed, 23 Feb 2022 00:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645576096;
 bh=Fbgp1k4bhWlHzqWebihdD3XUYm1kKSLZ4d7xN+yVOTA=;
 h=From:To:Cc:Subject:Date:From;
 b=fssMD4/kjSIADqfZVTC5ALxgE+N5lBUlDwFW+XgdOLe8loVcMwz1FGLXcLqCjaHdG
 ndQegaqYIeNFFYNlRWHhCM2WBVrqWtsw3sgM6WFHdcXFBj9gDvJMdtPbbaF90+pFEK
 OjJMcbk/6nQFo4tXr8sCWDnjUEF1yvoKnu8ZPrRq585H2VwOim3tIlCgN+03vaK0/H
 sKN9f5ShVDbkW0EDdxkKkWSiSZNCpuyy8uiTyNk+NWI/QSHIVnEoTZM7lJzUW/aQ1Z
 kM48uRCGtUN7dCJcUdJRbmB6jnqJxiQ3vYAcRYwpqy0Mvrwx9W6/p248qtmueKDjeF
 INI8UUTDgJyLQ==
From: Mark Brown <broonie@kernel.org>
To: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: tscs42xx: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:27:50 +0000
Message-Id: <20220223002751.1574345-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; h=from:subject;
 bh=Fbgp1k4bhWlHzqWebihdD3XUYm1kKSLZ4d7xN+yVOTA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFX9PwF8HPPN29vHCqh8vKpVdaEn1qzzvG+eXPFtX
 NBcI5cuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV/TwAKCRAk1otyXVSH0D+eB/
 0WiP/HHyV23YQVw4KonnvfyWnkDc++0Pma6TebGJPsk9baCG9C+L1IwG/XIoQ6+CXAM25ewkok7a0t
 5KnepsG1i47Iauy1PaWX7X6hTD9Fgu3QhhCCISkEtylOSTan/xrI/9nLTC9Z7Qu2G3ZIpxJ7az17e/
 pnU0zNM0sj8NHsQjw5stFzgRCtvddtXpQwcxZHhW42zZAUDCpzskn7+CYNYgmvJoWBZftNaa/Nbb+7
 g4/KpLuSv7hkCMKDtgQTAxTZio4X49gCKFSZuI7g8k0umdCKj6z4TsS4wLcQWZr5YeUEAg1o5plKQ2
 nlIqr6j0pHhFlRaOxk30vl7Zt220IG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the tscs42xx driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tscs42xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index fb861baf50e8..5b63e017a43b 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -1197,9 +1197,9 @@ static int tscs42xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
-	/* Slave mode not supported since it needs always-on frame clock */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	/* Consumer mode not supported since it needs always-on frame clock */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ret = snd_soc_component_update_bits(component,
 				R_AIC1, RM_AIC1_MS, RV_AIC1_MS_MASTER);
 		if (ret < 0) {
-- 
2.30.2

