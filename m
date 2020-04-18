Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D70A1AEFA3
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:47:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A983167B;
	Sat, 18 Apr 2020 16:46:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A983167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221227;
	bh=mB2qUxOwz7H7+t2VXUIz0ESIb9S4rCzBsqKWNvGsaTU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jn4W/egItvYsWfgVeUST06jaJWs/IPMG7Kvf6iDROX2MbW+SQNQ90CZzztObd4bri
	 Wl0xKC8o+CcYHVtG1nCJAVEQnNuF1jKwUPD5ypf+DWRdWGSlKzTnRug3Nxj2DYK3bU
	 XKoRPEZ3OoJLWDlWmY7ubcww7cww9bVw+dxlaDyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F2D7F802FB;
	Sat, 18 Apr 2020 16:41:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EDD3F802EA; Sat, 18 Apr 2020 16:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C5E5F802EA
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C5E5F802EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dxib1z5C"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27FC921D82;
 Sat, 18 Apr 2020 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220908;
 bh=mB2qUxOwz7H7+t2VXUIz0ESIb9S4rCzBsqKWNvGsaTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dxib1z5CMdrdb3b5xIj6YLx4Rnmc9H6o/oLx+vzcN/3Hqxj/M5RdsGIRd+69WAiIY
 Fb2FBOUNcoO87IWToT0p99j5Z8fmBR5rIakajQ1gM9RMFhD/o2fq8UI7AOGx+1gbs1
 ribk3u8BkvdyP1u7dbWIOrsuDus0h4CsHhxHeX2o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 48/78] ALSA: hda: Add driver blacklist
Date: Sat, 18 Apr 2020 10:40:17 -0400
Message-Id: <20200418144047.9013-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144047.9013-1-sashal@kernel.org>
References: <20200418144047.9013-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 3c6fd1f07ed03a04debbb9a9d782205f1ef5e2ab ]

The recent AMD platform exposes an HD-audio bus but without any actual
codecs, which is internally tied with a USB-audio device, supposedly.
It results in "no codecs" error of HD-audio bus driver, and it's
nothing but a waste of resources.

This patch introduces a static blacklist table for skipping such a
known bogus PCI SSID entry.  As of writing this patch, the known SSIDs
are:
* 1043:874f - ASUS ROG Zenith II / Strix
* 1462:cb59 - MSI TRX40 Creator
* 1462:cb60 - MSI TRX40

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206543
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20200408140449.22319-2-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_intel.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 85beb172d8108..1db9d0579c72a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2024,6 +2024,17 @@ static void pcm_mmap_prepare(struct snd_pcm_substream *substream,
 #endif
 }
 
+/* Blacklist for skipping the whole probe:
+ * some HD-audio PCI entries are exposed without any codecs, and such devices
+ * should be ignored from the beginning.
+ */
+static const struct snd_pci_quirk driver_blacklist[] = {
+	SND_PCI_QUIRK(0x1043, 0x874f, "ASUS ROG Zenith II / Strix", 0),
+	SND_PCI_QUIRK(0x1462, 0xcb59, "MSI TRX40 Creator", 0),
+	SND_PCI_QUIRK(0x1462, 0xcb60, "MSI TRX40", 0),
+	{}
+};
+
 static const struct hda_controller_ops pci_hda_ops = {
 	.disable_msi_reset_irq = disable_msi_reset_irq,
 	.pcm_mmap_prepare = pcm_mmap_prepare,
@@ -2059,6 +2070,11 @@ static int azx_probe(struct pci_dev *pci,
 	bool schedule_probe;
 	int err;
 
+	if (snd_pci_quirk_lookup(pci, driver_blacklist)) {
+		dev_info(&pci->dev, "Skipping the blacklisted device\n");
+		return -ENODEV;
+	}
+
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
 	if (!enable[dev]) {
-- 
2.20.1

