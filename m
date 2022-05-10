Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF024521F7E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EBA3192C;
	Tue, 10 May 2022 17:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EBA3192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652197562;
	bh=ZO5qsyXdW8wuKjQ+Ebr8/toVqnfcSnecFh2EH4y2c9E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sS1azZbCJQ/LM/GhcNXaPDtDanj8jpyG42dDFWu/5632DCbi9R7xdMH2Frx0DDSlr
	 3QYejNEHxLWPIPzcXyXfECfuz0uIUZncE007eOnD3l7J/RV1FXfvwM5rpOUPJu5Lhs
	 /GaienXMwjYaaihOVnHBky1lSHOtcEhpigpyxJzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93EE2F80528;
	Tue, 10 May 2022 17:44:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1E76F80527; Tue, 10 May 2022 17:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EC42F80517;
 Tue, 10 May 2022 17:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC42F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M5rfVX8s"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A69F8614E8;
 Tue, 10 May 2022 15:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C452C385A6;
 Tue, 10 May 2022 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197440;
 bh=ZO5qsyXdW8wuKjQ+Ebr8/toVqnfcSnecFh2EH4y2c9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M5rfVX8sKnlg4XeIVXEZoPlLw2QbyvGMwGOs7PsbRMYx1+MEc+ALQh3G+qZXbYJb8
 5+esoIRZXIEpLkd6vAJ8mRiSZUIigqKDuEQ+8qGE3xD32dkkzftluKHduLXlgSc6WB
 J2eScZ6GQ6E8PlNPOltfjjK5+6xH1MV7v7r2QhO8w3ZCYzkCr5dZzWJ0tyabpvYx3Q
 Zo1pqZ+2T5HUYVfZUIAJpkqOp51SA6oBPAQOPwDSK1/NGuNykIUv1JelFjXp+yF/kJ
 MLC+sImt5ZfvCu5QaLUI3qGzfyBk4PDUMYAvzBuc+izfAfbY7V7/Mh+0GNPuxpTfwU
 b4RGqDNKy5ztA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 09/21] ASoC: SOF: Fix NULL pointer exception in
 sof_pci_probe callback
Date: Tue, 10 May 2022 11:43:28 -0400
Message-Id: <20220510154340.153400-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510154340.153400-1-sashal@kernel.org>
References: <20220510154340.153400-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

[ Upstream commit c61711c1c95791850be48dd65a1d72eb34ba719f ]

We are accessing "desc->ops" in sof_pci_probe without checking "desc"
pointer. This results in NULL pointer exception if pci_id->driver_data
i.e desc pointer isn't defined in sof device probe:

BUG: kernel NULL pointer dereference, address: 0000000000000060
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
RIP: 0010:sof_pci_probe+0x1e/0x17f [snd_sof_pci]
Code: Unable to access opcode bytes at RIP 0xffffffffc043dff4.
RSP: 0018:ffffac4b03b9b8d8 EFLAGS: 00010246

Add NULL pointer check for sof_dev_desc pointer to avoid such exception.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220426183357.102155-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/sof-pci-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 20c6ca37dbc4..53e97abbe6e3 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -130,6 +130,11 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	dev_dbg(&pci->dev, "PCI DSP detected");
 
+	if (!desc) {
+		dev_err(dev, "error: no matching PCI descriptor\n");
+		return -ENODEV;
+	}
+
 	if (!desc->ops) {
 		dev_err(dev, "error: no matching PCI descriptor ops\n");
 		return -ENODEV;
-- 
2.35.1

