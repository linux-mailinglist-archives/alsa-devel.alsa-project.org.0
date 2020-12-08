Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7092D31DD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 19:14:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B4D1686;
	Tue,  8 Dec 2020 19:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B4D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607451268;
	bh=3wNFl2GFpmpT/o2JBpv4l1tMgpnVJBzh5AHRlwQVtIY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=muk4KlQCCfTydFhfGnDYk7XDeiXFMTu87QpCAGQO02jDyoBv2f1d3ZrEOGMS7CYu+
	 5ryxUXJ/uCbSoT/jxXkxFIYe9myoDXQAPUZRJF0v71CFMMjusAp53/BM+WprhWEBaE
	 ypn5/ibOKWExDOSyxa6D1+Wxxr08HYkRySAPh/j0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35126F80218;
	Tue,  8 Dec 2020 19:12:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACCC3F80218; Tue,  8 Dec 2020 19:12:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBC91F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 19:12:44 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4930FA003E;
 Tue,  8 Dec 2020 19:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4930FA003E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607451164; bh=mgWCVFiv/ng6YwPFj3e6ps0KjX58lysDmP58RwOGLyE=;
 h=From:To:Cc:Subject:Date:From;
 b=ZJN+KcX9Y/XpQIdDNM1XO8IGgJqvdYrO4vRh7W9E5/g8Ma2at5dK49nN2ljq2MGFZ
 1yvifEk7JdKub0Mn9M4OUsG6B+SNkoJaGR8Xb9cjRU6ny6ptZ1V/SoSa24iTwBWDlz
 8PVWYbJN5KipnOwF/usYq71dEHEEZj1gA75y7v3g=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Dec 2020 19:12:38 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ASoC: AMD Raven/Renoir - fix the PCI probe (PCI revision)
Date: Tue,  8 Dec 2020 19:12:33 +0100
Message-Id: <20201208181233.2745726-1-perex@perex.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, stable@kernel.org
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

The Raven and Renoir ACP can be distinguished by the PCI revision.
Let's do the check very early, otherwise the wrong probe code
can be run.

Link: https://lore.kernel.org/alsa-devel/2e4587f8-f602-cf23-4845-fd27a32b1cfc@amd.com/
Cc: <stable@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/amd/raven/pci-acp3x.c     | 4 ++++
 sound/soc/amd/renoir/rn-pci-acp3x.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 31b797c8bfe6..77f2d9389606 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -118,6 +118,10 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	int ret, i;
 	u32 addr, val;
 
+	/* Raven device detection */
+	if (pci->revision != 0x00)
+		return -ENODEV;
+
 	if (pci_enable_device(pci)) {
 		dev_err(&pci->dev, "pci_enable_device failed\n");
 		return -ENODEV;
diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 60a3e2f442db..338b78c514ec 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -188,6 +188,10 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	int ret, index;
 	u32 addr;
 
+	/* Renoir device check */
+	if (pci->revision != 0x01)
+		return -ENODEV;
+
 	if (pci_enable_device(pci)) {
 		dev_err(&pci->dev, "pci_enable_device failed\n");
 		return -ENODEV;
-- 
2.26.2
