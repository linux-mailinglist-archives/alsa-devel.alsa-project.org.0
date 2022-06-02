Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFBD53BA28
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:55:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0D3117B4;
	Thu,  2 Jun 2022 15:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0D3117B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178113;
	bh=YKduSDen7FbKin2FCfE2CERL5rrvj0A2hBUTj0YQTRA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iF5Xbt5uI6aF44nI+te1DSLoT8erskDOj2D6L7g2ip/p+C5dtZSAE6DcMVnA54eYf
	 mwX49vENQ7bjLj657aQ1tsWlsm2yvJABTSVgMrC9i7mbZ3Szoo6BPwtJgeAA+GX6ku
	 FVmqFsaOI4VrNX/5aLgk2CKfRipzTW1xZezwFEZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB66F80533;
	Thu,  2 Jun 2022 15:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 240EDF80529; Thu,  2 Jun 2022 15:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AEAEF80089
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AEAEF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fuHrsqW3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45924617D7;
 Thu,  2 Jun 2022 13:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62291C385A5;
 Thu,  2 Jun 2022 13:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178006;
 bh=YKduSDen7FbKin2FCfE2CERL5rrvj0A2hBUTj0YQTRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fuHrsqW3KhIT3edEXDQhvowRzn2heVjlNjOo0SsBmUYCwxiM9I+RFJNW89FQPBkg4
 oUazbjMeKjYU36Ba9DgkEbjgIkvuWY0q2sLiRg0XXx5DYQOt3X2k5KNhDCZmzZz/El
 MhOxetkdGtpwpAlLhRBuwUjXRWzlDEbHdWEqWBuL5WhCbpaS3CCChBHbuS9+9UndgK
 Tu5jqSNH3dbz9JuGjv7azXD4HtXlsTlUwYP0bqdlhmy+KzxDMUkqm4Am4KQsX9C9h8
 4ILcVcnBqQy01kIe35Ksa2yHFxZ729tmPHpriNNLrv919YyxfqXdmjmyMEfvkIPr/Z
 b9TsqiqTEOSTQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 03/20] ASoC: rk3328: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:52:59 +0200
Message-Id: <20220602135316.3554400-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; h=from:subject;
 bh=YKduSDen7FbKin2FCfE2CERL5rrvj0A2hBUTj0YQTRA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCQsAMBo2+J+HUgUcjNQUQqAt/GmAmcLnTOQSRo
 HTPBWECJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAkAAKCRAk1otyXVSH0CZ6B/
 9JR0xcwXxLMaiwMr4fB4A8LrBBwpQ8W4YgmNHXMCNf/K1agj5J6ky9JAS2MMyGu9nAzLgVypd5Rfqu
 HffCagZDHWqVd+JP4CgnsfIW0aS4KQMDTDXzFkg25y5NaofeTEI5SQzxD1YpSHGXguQ0/nAhYLsrYY
 vU6WE8ThYAOi00ChJiRxfWeSZdj/fsWkea2Zu0HFijg7/ppj8XS0vE8oarCKU/e0hijQU1nn5J8CeY
 DlV489MrSh4GjCP+JPDmkobe/EDAKPmTOc4AI9eZd3TOe9Z5uvjOqAB1EoO+Z8+bd/ll3WT/H+OtLq
 wwykv+t1+y4/OC82OY7qfSLLvJrAI+
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
the rk3328 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rk3328_codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 86b679cf7aef..1d523bfd9d84 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -69,11 +69,11 @@ static int rk3328_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		snd_soc_component_get_drvdata(dai->component);
 	unsigned int val;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		val = PIN_DIRECTION_IN | DAC_I2S_MODE_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		val = PIN_DIRECTION_OUT | DAC_I2S_MODE_MASTER;
 		break;
 	default:
-- 
2.30.2

