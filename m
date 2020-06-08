Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2866B1F2487
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 01:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA0A1655;
	Tue,  9 Jun 2020 01:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA0A1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591658554;
	bh=/FtmSA/ghE/J10oWvCHUZzoYJTnDNGFfpHIAFLpEmy4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RGVJ0ywbLXP6pYD1XfqT9KqfgDsvG2FCmdbAufi5F5oDW3wz8p0lV7YLFppRI0FD+
	 n27wSn5rxeTJNk9JvlZseaLVIrCIZFip16kXIvlAdAL3Y3uqCsfKMJ79L6KnMIF4XG
	 mrOedWajQ8NYdNG5OTYyvOjRIA8I5sPugw+k/H8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD12F80334;
	Tue,  9 Jun 2020 01:15:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4A4AF80305; Tue,  9 Jun 2020 01:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7D26F802EA
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 01:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7D26F802EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CNmXSKKR"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A170421501;
 Mon,  8 Jun 2020 23:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658105;
 bh=/FtmSA/ghE/J10oWvCHUZzoYJTnDNGFfpHIAFLpEmy4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CNmXSKKRP57cq1a9fHA4krWTBlWHGeLMvnvPqm545iPm7PlNnVetYene/dlv59cW7
 EeONBbjckE2deSzgmrWSCqtLkJCygf08iz/zLSxn66Fvj/l6PJTywqK2tyh3HHudXg
 roJ+UjhUZm3ljiGubwWi6mDqn4iSL2Gmdkm8pS4c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 145/606] ALSA: hda/realtek - Fix silent output on
 Gigabyte X570 Aorus Xtreme
Date: Mon,  8 Jun 2020 19:04:30 -0400
Message-Id: <20200608231211.3363633-145-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Christian Lachner <gladiac@gmail.com>,
 alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

From: Christian Lachner <gladiac@gmail.com>

commit d9e8fe0cffbfdd18de96fa68ee2a8b667a0b046e upstream.

The Gigabyte X570 Aorus Xtreme motherboard with ALC1220 codec
requires a similar workaround for Clevo laptops to enforce the
DAC/mixer connection path. Set up a quirk entry for that.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205275
Signed-off-by: Christian Lachner <gladiac@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20200518053844.42743-2-gladiac@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dc2302171a71..23315b69ac38 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2457,6 +2457,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1458, 0xa002, "Gigabyte EP45-DS3/Z87X-UD3H", ALC889_FIXUP_FRONT_HP_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1458, 0xa0ce, "Gigabyte X570 Aorus Xtreme", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1275, "MSI-GL63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1276, "MSI-GL73", ALC1220_FIXUP_CLEVO_P950),
-- 
2.25.1

