Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D60521F95
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB7E1924;
	Tue, 10 May 2022 17:46:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB7E1924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652197635;
	bh=omJeBGX28SkPxdoJonDoRUB1KOVyZzromm7NoJwczQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PyaVOEOTMGUcVJ47bptPGDd6sqguCkHGJuf7Ez3qTWr7fYNiXEnWhrq1nLgFyIisd
	 JOort93iGd6V5YYX+FEym+BdBvovjD2TjhF4kKev9k4BJj4esM4aPId3J+7/wHrfI0
	 ppePvwn7VfrbqX3fhMHQN5y/1OlBTlSmBFGlxyVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA6F4F80538;
	Tue, 10 May 2022 17:44:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E8F8F8051A; Tue, 10 May 2022 17:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C705EF80534;
 Tue, 10 May 2022 17:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C705EF80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X+vLc2Sn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C07161414;
 Tue, 10 May 2022 15:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166FBC385C2;
 Tue, 10 May 2022 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197485;
 bh=omJeBGX28SkPxdoJonDoRUB1KOVyZzromm7NoJwczQ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+vLc2SnRJ9/PlweEuVBgJ8bVaVAIS3/+Pn2pJ2dCdVru/VPNmcxHOXoBIM+boCSy
 mfmsZAXjmsWj+I0FuDtpcLS9ztg9i9FGKcs5nthhwfs2G/YBnLstDWIRdx9dn8bHvX
 6cFA/RFJyYzbJ118mfh1KLleu2KaA4c6x8AoKv4QuZ7R2VQyYRsToYYIKbs6mSdoYo
 RlYr2jvXDTYpfyl2imKLuyGMeeo79oI6clKgXgiBM4uHSS312Fg9uZOUwt4ZJ+b4Qn
 +xzyPFyggUKrNjhyMhk+nBO+zlQZPKBMaRVcN6X2MOp0j8kj1ULUzrXL6mEi8mtQf0
 bkp9MQ1j96OjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/19] ASoC: SOF: Fix NULL pointer exception in
 sof_pci_probe callback
Date: Tue, 10 May 2022 11:44:18 -0400
Message-Id: <20220510154429.153677-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510154429.153677-1-sashal@kernel.org>
References: <20220510154429.153677-1-sashal@kernel.org>
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
index bc9e70765678..b773289c928d 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -129,6 +129,11 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
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

