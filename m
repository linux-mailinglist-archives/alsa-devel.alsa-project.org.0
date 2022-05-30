Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 933F2537CA5
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40B2A1E09;
	Mon, 30 May 2022 15:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40B2A1E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917811;
	bh=+u2Yt/xw2sPo6EAVrtuFDGeht+dJf7/yaSqLvJi8jeA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dB+6kKz1B6CcPWOQ4u71LV+l+iaIixRnOWJKJHVL3yxRF59Y9uI1NeUw5a/CpMIms
	 OJep5xn3LsU3gLNB0v+aMOQ5OruGUDtboIR7WH5NW1dmrZuGcnPHJ9NBew/2Vqbk0Z
	 ABwgxmcRq/4XaFEIvrtDluiW51X1B6rMV7zPLeQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEFE1F800DE;
	Mon, 30 May 2022 15:36:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B3BBF804B4; Mon, 30 May 2022 15:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7B24F8019D;
 Mon, 30 May 2022 15:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B24F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="paH+0t5O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF9D360EC3;
 Mon, 30 May 2022 13:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6AFC3411A;
 Mon, 30 May 2022 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917750;
 bh=+u2Yt/xw2sPo6EAVrtuFDGeht+dJf7/yaSqLvJi8jeA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=paH+0t5OzOr9kuvXRaVwxHBvvA5XtZ8r2RuAwTD8Z4jMcJi1ql/jtZhaKAzVXXtfA
 gtlFFp9SooEIYwZeIo+6WMeR4T4hLD/9sbMN3frbTwjYXw4vJMWjbFmU1gOcBajt4+
 dQZrAaQjsajE9F2IhwHldE24WtLuWCbt5pq3J57UGw60zLNFzNdybJgQjworbOI/mu
 7aeaMkk8lnuNfh/m/JikQ9X19oWqk100vvNRwkUEIohWNX7cdR1NA5I7EGMa24Huqy
 Y3qI7gckBrCv1r7e3ve/jnTs93+d3YHoDSfOfYBeKqM4pNB7JCZ1SnvotmvuE9DLo/
 afTKsaI4EU7KA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 084/135] ASoC: SOF: amd: add missing
 platform_device_unregister in acp_pci_rn_probe
Date: Mon, 30 May 2022 09:30:42 -0400
Message-Id: <20220530133133.1931716-84-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 AjitKumar.Pandey@amd.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Zheng Bin <zhengbin13@huawei.com>,
 Mark Brown <broonie@kernel.org>, daniel.baluta@nxp.com,
 sound-open-firmware@alsa-project.org
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

From: Zheng Bin <zhengbin13@huawei.com>

[ Upstream commit cbcab8cd737c74c20195c31d647e19f7cb49c9b8 ]

acp_pci_rn_probe misses a call platform_device_unregister in error path,
this patch fixes that.

Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
Link: https://lore.kernel.org/r/20220512013728.4128903-1-zhengbin13@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/amd/pci-rn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 392ffbdf6417..d809d151a38c 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -93,6 +93,7 @@ static int acp_pci_rn_probe(struct pci_dev *pci, const struct pci_device_id *pci
 	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * ARRAY_SIZE(renoir_res), GFP_KERNEL);
 	if (!res) {
 		sof_pci_remove(pci);
+		platform_device_unregister(dmic_dev);
 		return -ENOMEM;
 	}
 
-- 
2.35.1

