Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4762D31CB
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 19:12:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4A916E3;
	Tue,  8 Dec 2020 19:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4A916E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607451144;
	bh=jtoRVfSnTR6uvkCkevRlv1GFLRt6Do4me7pk+woPeAA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DRiFuuvibT02oMFDfIMwXpnMo1pGtQOnX1x5Isdrp75lIq1KLEOfy3fQPPZyuVgwo
	 0Y4GGU3V8Uaj/yLdMYmMoYPUD3+xfawuhUCdPUYdyBaQTLgm8O7KDEmUtslMQUKm/7
	 f8imQqDfiXPBVhrfZ9uny8+Twltn8fS5LaCvEICg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31823F80218;
	Tue,  8 Dec 2020 19:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3AF5F8019D; Tue,  8 Dec 2020 19:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1E6FF8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 19:10:41 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C50BCA003E;
 Tue,  8 Dec 2020 19:10:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C50BCA003E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607451040; bh=lP24/kVk08TtUPodXu+hHcP/J6uDrkuoevZ4U3U14K8=;
 h=From:To:Cc:Subject:Date:From;
 b=rdg5R31ySlRLAvSuSdBoAw6PgCdiIHjwiEg/nVi1NpdDdcz81hl5sddRVLzC1RcgE
 txrIUqn2N0wQzE4UYTuO/3wHQPbstBEikrKeePRtoeV0fU8/9z5k83R676DF8Er2bk
 1GAVFjsYqsOSbC6K8Bmp72lNPNcIf/IQxhwK2KmE=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  8 Dec 2020 19:10:37 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: AMD Raven/Renoir - fix the PCI probe (PCI revision)
Date: Tue,  8 Dec 2020 19:10:33 +0100
Message-Id: <20201208181033.2745563-1-perex@perex.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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
