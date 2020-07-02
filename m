Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD50211805
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 03:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A43F167D;
	Thu,  2 Jul 2020 03:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A43F167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593653294;
	bh=b5jdvZDPD6ml204vSzGfDe6ECT0U8SxmPQJ9on/jplE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hd8cVWKk+jtifLtKEr6vsLWijY5nX5+xFv/wuJuA1eKywgDsZYhzu1ObFea3hmq9q
	 RjJ2cTa8HBX1QXSWLu0w3CcwiYiGesuOU97eGqYuWoeXjHJVjmDH756jhHk1O31JxL
	 u0MRvru9qS6Oo2uZZ3EWRRsM4+3jHjHbqAQm/Xlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F09BF802E3;
	Thu,  2 Jul 2020 03:25:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8CCCF8022B; Thu,  2 Jul 2020 03:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D0FF80245;
 Thu,  2 Jul 2020 03:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D0FF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lBIhyrsE"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B50C92145D;
 Thu,  2 Jul 2020 01:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593653138;
 bh=b5jdvZDPD6ml204vSzGfDe6ECT0U8SxmPQJ9on/jplE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lBIhyrsEUKvPOWJihOaye62fHEG6qGxcocCZbvbTbnEYFXQieOF4lgyoOQ9k3v90J
 RD+hST4d3ay5OFK8y562HCGAsXNTTqbSy54CtLlVpRwSKtVyxg51YuW9MrvruiO7fX
 DZlCLIVfP4Rf6bevFTNg+bOdE5khSs7Q6rrgmRF8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/40] ASoC: SOF: Intel: add PCI IDs for ICL-H and
 TGL-H
Date: Wed,  1 Jul 2020 21:23:32 -0400
Message-Id: <20200702012402.2701121-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012402.2701121-1-sashal@kernel.org>
References: <20200702012402.2701121-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, sound-open-firmware@alsa-project.org
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

[ Upstream commit c8d2e2bfaeffa0f914330e8b4e45b986c8d30b58 ]

Usually the DSP is not traditionally enabled on H skews but this might
be used moving forward.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20200617164755.18104-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 3f79cd03507c9..9e2ae6e62e7f9 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -410,8 +410,11 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&skl_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
-	{ PCI_DEVICE(0x8086, 0x34C8),
+	{ PCI_DEVICE(0x8086, 0x34C8), /* ICL-LP */
 		.driver_data = (unsigned long)&icl_desc},
+	{ PCI_DEVICE(0x8086, 0x3dc8), /* ICL-H */
+		.driver_data = (unsigned long)&icl_desc},
+
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
 	{ PCI_DEVICE(0x8086, 0x02c8),
@@ -424,8 +427,11 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&cml_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
-	{ PCI_DEVICE(0x8086, 0xa0c8),
+	{ PCI_DEVICE(0x8086, 0xa0c8), /* TGL-LP */
 		.driver_data = (unsigned long)&tgl_desc},
+	{ PCI_DEVICE(0x8086, 0x43c8), /* TGL-H */
+		.driver_data = (unsigned long)&tgl_desc},
+
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ELKHARTLAKE)
 	{ PCI_DEVICE(0x8086, 0x4b55),
-- 
2.25.1

