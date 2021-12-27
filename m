Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F44803BF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 20:05:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59FFD1702;
	Mon, 27 Dec 2021 20:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59FFD1702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640631915;
	bh=/kSEnqtez9OT93Y5Sy+PlkKcCvRC+O6KWnWnGa+Hdhw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rar3+Z5qa/xV+xBc1UP3EMap+zmHDMiAKHIaYwJ0cnubZhX844wskdU+ANw2MOgwL
	 a6qcjHWi1gQl9kUSYGj2NgvpUT3CNv/Q1DAYCKc3QDU+/yRKLv3t/lNuFwb3AA/iZN
	 9LeXc4YWFlUPSy/UeH8KT+7lXJJSCDP7CphmwAjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B4B1F800F5;
	Mon, 27 Dec 2021 20:04:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BDD9F80161; Mon, 27 Dec 2021 20:04:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76B47F800D3;
 Mon, 27 Dec 2021 20:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76B47F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R3n1EALR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 611E961129;
 Mon, 27 Dec 2021 19:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1B2C36AEC;
 Mon, 27 Dec 2021 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640631833;
 bh=/kSEnqtez9OT93Y5Sy+PlkKcCvRC+O6KWnWnGa+Hdhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R3n1EALRcdGh61grHfjJnkVVXpKXOCQ1tyOcl7H5dQeUgrn6vxAQPIuWR68jZHMzO
 yf8JDCjNT0uCmJT4LaQXJea0Zt2U2XvPdApZd4nz23FchV+sLzV6xE0Qv/1iTIyPUJ
 8JBU6a4h8K2InqU0WXq4OnsliiU/M3X9zo9Xs9jrRYVusdU/COy8WST3dGtkjiuM7q
 vSB5YKFDpLCHI05J4XNGtTtRRmULwvDHcAWzgknonvt3+FNuAljW+QJYOPhvn1AjfR
 kQTpvXiTHegOduETJ8e8JJsHJNJiEgXZXeclf73sbz/cbIgDn0NEkr1VL+hlecv09P
 L0s3SBuPq/tkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 04/26] ASoC: SOF: Intel: pci-tgl: add ADL-N
 support
Date: Mon, 27 Dec 2021 14:03:05 -0500
Message-Id: <20211227190327.1042326-4-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227190327.1042326-1-sashal@kernel.org>
References: <20211227190327.1042326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, libin.yang@intel.com,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, sathya.prakash.m.r@intel.com,
 daniel.baluta@nxp.com, bard.liao@intel.com,
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit cd57eb3c403cb864e5558874ecd57dd954a5a7f7 ]

Add PCI DID for Intel AlderLake-N.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20211203171542.1021399-1-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/pci-tgl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index d04ce84fe7cc2..665add8a3029b 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -119,6 +119,8 @@ static const struct pci_device_id sof_pci_ids[] = {
 		.driver_data = (unsigned long)&adl_desc},
 	{ PCI_DEVICE(0x8086, 0x51cc), /* ADL-M */
 		.driver_data = (unsigned long)&adl_desc},
+	{ PCI_DEVICE(0x8086, 0x54c8), /* ADL-N */
+		.driver_data = (unsigned long)&adl_desc},
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
-- 
2.34.1

