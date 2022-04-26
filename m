Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ABC51085A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1BA81841;
	Tue, 26 Apr 2022 21:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1BA81841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650999951;
	bh=9XMsbr7G05OYiESgCjRkznWz6gPpP4Kr/uPZBwsXf4c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qIQQEMKQ+Q8KnRguTVItAOdxJ0XSnXLc/bZjmw7Rv5ZxJkcfb9kdyfMr2YTpU6DLF
	 s9Q+n5rO9Na+Dguk1/RFBd0zEpnc4tfYVXTnc9YfgB/eyQCDPK8zijNVz82bO5fK/n
	 3ygFGSKa1yBrYrbEj82Qk0v87dXUKkfSLvZR91x8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40AA0F80552;
	Tue, 26 Apr 2022 21:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1EA7F80552; Tue, 26 Apr 2022 21:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC71F80171
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC71F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cYXIvjXG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15B8AB8224A;
 Tue, 26 Apr 2022 19:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19020C385AD;
 Tue, 26 Apr 2022 19:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650999753;
 bh=9XMsbr7G05OYiESgCjRkznWz6gPpP4Kr/uPZBwsXf4c=;
 h=From:To:Cc:Subject:Date:From;
 b=cYXIvjXGAD2y8VCzdcheYykyk+CziCpxjhQjwHdY+Xww7LUOM1XewFQG1rioVycG9
 gRKCfwRZEMT1ahzhP+WcJlEYjGbuD6aAZGf3s4bjwTGLUWQSjLsCBXNCdEv3x2Djca
 3DOAZ1pw/PBwOPqdLvu6VegZ88abrFHnOkJdlhmWnsbrT7tj2E8jlQxzzjm6R0QFPt
 nVOtSkl/SNMcTn/J0N9GVsb9CVNVJjejyPk20wQOyxvfWu0nn4RxjoPDmH3xkB4yh5
 XZ/yUJ14DH53dif0/rb9nA/+7uf869SK1BOIlTbrSxRDTN/HXQkaKpHunVALWlTEuZ
 sYaOfN1YbJbfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/9] ASoC: Intel: soc-acpi: correct device
 endpoints for max98373
Date: Tue, 26 Apr 2022 15:02:22 -0400
Message-Id: <20220426190232.2351606-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, balamurugan.c@intel.com,
 cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 peter.ujfalusi@linux.intel.com, tiwai@suse.com, yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 gongjun.song@intel.com, liam.r.girdwood@linux.intel.com,
 Chao Song <chao.song@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com, brent.lu@intel.com
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

From: Chao Song <chao.song@linux.intel.com>

[ Upstream commit 97326be14df7bacc6ba5c62c0556298c27ea0432 ]

The left speaker of max98373 uses spk_r_endpoint, and right
speaker uses spk_l_endpoint, this is obviously wrong.

This patch corrects the endpoints for max98373 codec.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220406192341.271465-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 9f243e60b95c..15d862cdcd2f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -126,13 +126,13 @@ static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
 	{
 		.adr = 0x000123019F837300,
 		.num_endpoints = 1,
-		.endpoints = &spk_l_endpoint,
+		.endpoints = &spk_r_endpoint,
 		.name_prefix = "Right"
 	},
 	{
 		.adr = 0x000127019F837300,
 		.num_endpoints = 1,
-		.endpoints = &spk_r_endpoint,
+		.endpoints = &spk_l_endpoint,
 		.name_prefix = "Left"
 	}
 };
-- 
2.35.1

